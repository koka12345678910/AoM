extends Node

@onready var pause_menu = $Control
@onready var player = $"."

var game_paused: bool = false
var save_path = "user://savegame.save"

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	
	if game_paused == true:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()
