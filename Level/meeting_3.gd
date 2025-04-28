extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/corridor_4.tscn")
