extends Node2D

@onready var animL = $AnimationPlayer

func _ready(): 
	animL.play("enlightment")


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Level/room_2.tscn")
