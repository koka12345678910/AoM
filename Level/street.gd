extends Node2D

var player_in_zone = false

@onready var animBird = $AnimationPlayer

func _ready():
	animBird.play("fly_bird")

func _process(_delta):
	if player_in_zone and Input.is_action_just_pressed("use"):
		get_tree().change_scene_to_file("res://Level/barn.tscn")

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in_zone = true


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Level/forest.tscn")


func _on_area_2d_body_exited(body):
	player_in_zone = false
