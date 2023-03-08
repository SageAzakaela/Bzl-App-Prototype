extends GridContainer


@export_node_path("Container") var container_path: NodePath

var container : Container

@onready var buzz_scene := preload("res://buzzes/Buzz.tscn")


func _ready():
	container = get_node_or_null(container_path)
	
	if container != null:
		container.connect("resized", _on_margin_container_resized)


func display(buzzes: Array[BuzzData]):
	for child in get_children():
		child.hide()
		child.queue_free()
	
	for buzz in buzzes:
		buzz = buzz as BuzzData
		
		var instance := buzz_scene.instantiate() as Buzz
		instance.buzz_data = buzz
		
		add_child(instance)


#------< helper >------#
func calculate_columns():
	if container == null:
		return
	
	var x = container.get_rect().size.x
	var number_of_columns = clamp(floor(x / 358), 1, INF)
	
	columns = number_of_columns


#------< signals >------#
func _on_margin_container_resized():
	calculate_columns()
