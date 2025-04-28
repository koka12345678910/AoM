extends Node2D

@onready var oldman = $"Сorridor/Oldman"

func _ready():
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/level_2.tscn")

func _on_area_2d_2_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/meeting_3.tscn")
