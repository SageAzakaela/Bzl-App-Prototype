# extremely complicated script which handles an unknown amount of search boxes :)

extends HBoxContainer


signal search_entered(keywords: Array[String])

var keywords: Array[String]
var search_boxes: Array[SearchBox]

@onready var search_box_references: Array = get_children()


func _ready():
	for i in range(0, search_box_references.size()):
		keywords.append("")
		
		var box := SearchBox.new(i, search_box_references[i])
		box.on_search_entered.connect(_on_search_entered)
		
		search_boxes.append(box)


func _on_search_entered(id: int, text: String):
	if not id in range(0, search_boxes.size()):
		return
		
	keywords[id] = text
	
	search_entered.emit(keywords)


class SearchBox:
	signal on_search_entered(id: int, text: String)
	
	var id: int
	var search_box_reference: LineEdit
	
	func _init(p_id: int, p_search_box_reference: LineEdit):
		id = p_id
		search_box_reference = p_search_box_reference
		search_box_reference.connect("text_changed", _on_text_changed)

	func _on_text_changed(text: String):
		on_search_entered.emit(id, text)
