extends Area2D

@export(String, "*.tscn") var target_level_path 





func _on_body_entered(body):
	if not body is Player: return
	get().change_scene(target_level_path)
