extends Node2D

@onready var oldman_1 = $Oldman
@onready var corridor = $"."
@onready var animDL = $AnimationPlayer
@onready var torch = $AudioStreamPlayer2D

func _ready():
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/corridor/corridor_1.tscn")

func _on_area_2d_2_body_entered(body):
	if body.name == "Oldman":
		animDL.play("blackout")
		await animDL.animation_finished
		get_tree().change_scene_to_file("res://Level/meeting_1.tscn")


func _on_audio_stream_player_2d_finished():
	torch.playing = true
