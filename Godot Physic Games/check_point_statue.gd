extends Area2D

@onready var flag_animation = $yeee
var sound_played = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	flag_animation.play("mati")


func _on_body_entered(body):
	
	#SoundPlayer.play_sound(SoundPlayer.CHECK)
	CheckPoint2.last_position = global_position
	flag_animation.play("nyala")
	
	if not sound_played :
		SoundPlayer.play_sound(SoundPlayer.CHECK)
		sound_played = true
	
