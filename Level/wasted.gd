extends Control

var forest_scene = preload("res://Level/forest.tscn")

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/forest.tscn")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
