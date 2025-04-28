extends Node2D

var player_in_zone = false

@onready var anim = $AnimationPlayer
@onready var label = $Control

func _ready():
	label.hide()

func _process(_delta):
	if player_in_zone and Input.is_action_just_pressed("use"):
		get_tree().change_scene_to_file("res://Level/kitchen.tscn")


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in_zone = true
		label.show()
		anim.play("label")
		await anim.animation_finished


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_in_zone = false
		label.hide()
