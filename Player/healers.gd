extends CharacterBody2D

enum {
	IDLE,
	MOVE
}

var state: int = 0:
	set(value):
		state = value
		match state:
			IDLE:
				pass
			MOVE:
				pass

@onready var animH = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
		# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	move_and_slide()

func idle_state():
	animH.play("Idle")
	state = IDLE
