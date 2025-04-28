extends Node2D

@onready var anim = $AnimatedSprite2D
@onready var animL = $AnimationPlayer
@onready var play = $AudioStreamPlayer2D

func _ready():
	anim.play("room")
	await anim.animation_finished
	animL.play("blackout")
	await animL.animation_finished
	play.playing = true
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Level/player_and_room.tscn")
