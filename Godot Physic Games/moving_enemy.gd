extends Path2D

enum ANIMATION_TYPE {
	LOOP,
	BOUNCE
}

@export var animation_type : ANIMATION_TYPE
@onready var animationPlayer = $animationPlayer


func _ready():
	match animation_type:
		ANIMATION_TYPE.LOOP: animationPlayer.play("move along path")
		ANIMATION_TYPE.BOUNCE: animationPlayer.play("move along path bounce")
