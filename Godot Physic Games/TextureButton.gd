extends TextureButton

var label: String 
var scene = preload("res://dragPreview.gd")
var dropped_on_target: bool = false 

func _ready():
	add_to_group("draggable")
	pass
	
func _get_drag_data(at_position: Vector2):
	var slot =  get_parent().get_name()
	
	var data = {}
	data["origin_node"] = self
	data["origin_slot"] = slot
	data["origin_texture_normal"] = texture_normal
	data["origin_texture_pressed"] = texture_pressed
	
	var dragPreview = scene
	dragPreview.texture = texture_normal
	add_child(dragPreview)
	
	return data 

func _can_drop_data(at_position, data):
	var target_slot = get_parent().get_name()
	data ["target_texture_normal"] = texture_normal
	data ["target_texture_pressed"] = texture_pressed
	
	return true 
	
	
func _drop_data(at_position, data):
	data["original_node"].texture_normal = data["target_texture_normal"]
	data["original_node"].texture_pressed = data["target_texture_pressed"]
	
	texture_normal = data["original_node"]
	texture_pressed = data["pressed_node"]
	
