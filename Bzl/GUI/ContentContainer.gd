extends GridContainer


@export_node_path("Container") var container_path: NodePath

var container : Container


func _ready():
	container = get_node_or_null(container_path)


func calculate_columns():
	if container == null:
		return
	
	var x = container.get_rect().size.x
	var number_of_columns = clamp(floor(x / 358), 1, INF)
	
	columns = number_of_columns


func _on_margin_container_resized():
	calculate_columns()
