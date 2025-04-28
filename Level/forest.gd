extends Node2D

var player_in_zone = false

var city_scene = preload("res://Level/city.tscn")

@onready var sound_walk = $Player/AudioStreamPlayer2D
@onready var player = $Player
@onready var anim_bird = $ParallaxBackground2/ParallaxLayer3/AnimatedSprite2D
@onready var anim = $AnimationPlayer
@onready var panel = $Control/Panel
@onready var wasted = $Player/Wasted

func _ready():
	anim.play("label")
	wasted.hide()

func _process(_delta):
	pass

func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file(city_scene)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		wasted.show()
		set_physics_process(false)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		wasted.hide()
		set_physics_process(true)
