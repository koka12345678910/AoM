extends Node2D

@onready var animMenu = $Animation_light/Bonfire_light
@onready var anim = $AnimatedSprite2D
@onready var play = $Play
@onready var music_sound = $Music_sound
@onready var forest_sound = $Forest_sound
@onready var bonfire_sound = $Bonfire_sound
@onready var mission = $Control
@onready var game_button = $GridContainer
@onready var sound_button = $Sound_button

func _ready():
	mission.hide()
	anim.play("bonfire_1")
	await get_tree().create_timer(1).timeout
	animMenu.play("pointed_light")

func _on_music_sound_finished():
	music_sound.playing = true

func _on_forest_sound_finished():
	forest_sound.playing = true

func _on_bonfire_sound_finished():
	bonfire_sound = true

func _on_quit_pressed():
	sound_button.playing = true
	animMenu.play("blackouy")
	await animMenu.animation_finished
	get_tree().quit()

func _on_play_pressed():
	sound_button.playing = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	animMenu.play("blackouy")
	await animMenu.animation_finished
	get_tree().change_scene_to_file("res://Level/level.tscn")


func _on_mission_pressed():
	sound_button.playing = true
	mission.show()
	game_button.hide()


func _on_button_pressed():
	sound_button.playing = true
	mission.hide()
	game_button.show()


func _on_prologue_pressed():
	sound_button.playing = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	animMenu.play("blackouy")
	await animMenu.animation_finished
	get_tree().change_scene_to_file("res://Level/level.tscn")


func _on_birth_pressed():
	sound_button.playing = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	animMenu.play("blackouy")
	await animMenu.animation_finished
	get_tree().change_scene_to_file("res://Level/room.tscn")
