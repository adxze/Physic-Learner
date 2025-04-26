extends Area2D



func _on_hitbox_body_entered(body):
		#if body.name == "player": body.queque_free() \\ bad using string 
	if body is Player : 
		body.player_die()
		

