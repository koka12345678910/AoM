extends CharacterBody2D

enum {
	MOVE
}

var state = MOVE
var run_speed = 1
var oldman_position = Vector2(2800, 975)

const SPEED = 200.0

@onready var animOldman = $AnimationPlayer
@onready var anim = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	match state:
		MOVE:
			move_state()
	
	move_and_slide()
	
func move_state():
	var direction = Input.get_axis("left", "right")
	
	if direction != 0:
		velocity.x = direction * SPEED * run_speed
		animOldman.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animOldman.play("Idle")
	
	if direction < 0:
		if not anim.flip_h: # Проверяем, не установлено ли уже flip_h в true	
			anim.flip_h = true
	elif direction > 0:
		if anim.flip_h: # Проверяем, не установлено ли уже flip_h в false
			anim.flip_h = false
