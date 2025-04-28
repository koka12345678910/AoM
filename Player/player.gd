extends CharacterBody2D

enum {
	MOVE,
	ATTACK,
	SLIDE,
	DEATH,
	USE
}

@onready var anim = $AnimatedSprite2D
@onready var animPlayer = $AnimationPlayer
@onready var soundWalk = $Walk_sound
@onready var pause_menu = $CanvasLayer/TextureRect
@export var climb_speed = 100.0

var game_paused: bool = false
var has_died = false
var state = MOVE
var run_speed = 0.5

const SPEED = 600.0
const JUMP_VELOCITY = -500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pause_menu.hide()

func _physics_process(delta):
	if not has_died:
		if not is_on_floor():
			velocity.y += gravity * delta
	
	
	if global_position.y > 1000:  # Условие для падения в пропасть, замените значение на нужное
			die()
	
	match state:
		MOVE:
			move_state()
		ATTACK:
			pass
		SLIDE:
			pass
		DEATH:
			pass
		USE:
			pass
	
	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("back"):
		game_paused = !game_paused
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if game_paused:
		set_physics_process(false)
		pause_menu.show()
	else:
		set_physics_process(true)
		pause_menu.hide()
	
func move_state():
	var direction_x = Input.get_axis("left", "right")
	var running = Input.is_action_pressed("run")

	# Если игрок на земле, включаем возможность бега
	if is_on_floor() and running:
		run_speed = 1.5  # Увеличенная скорость при беге на земле
	else:
		run_speed = 1.0  # Обычная скорость при ходьбе или в воздухе

	if direction_x != 0:
		velocity.x = direction_x * SPEED * run_speed
		if run_speed > 1.0:
			animPlayer.play("Run")
		else:
			animPlayer.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animPlayer.play("Idle")

	# Отражение персонажа в зависимости от направления
	if direction_x < 0:
		anim.flip_h = true
	elif direction_x > 0:
		anim.flip_h = false

	# Прыжок без потери скорости, только если на земле
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func die():
	has_died = true

func _on_resume_pressed():
	game_paused = !game_paused
	pause_menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
