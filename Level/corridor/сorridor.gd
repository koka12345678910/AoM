extends Node2D

@onready var oldman = $Oldman
@onready var kingCry = $KingCry
@onready var animScene = $AnimationPlayer
@onready var tourch = $tourch_sound

func _ready():
	animScene.play("lightning")

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/level.tscn")

func sound_reduction():
	if oldman.velocity.x > 0:
		kingCry.volume_db += 2

func _on_king_cry_finished():
	kingCry.playing = true

func _on_area_2d_2_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/meeting.tscn")


func _on_tourch_sound_finished():
	tourch.playing = true
