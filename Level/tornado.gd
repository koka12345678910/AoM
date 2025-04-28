extends Node2D

@onready var anim = $AnimatedSprite2D
@onready var animBO = $AnimationPlayer

func _ready():
	anim.play("tornado")
	await anim.animation_finished
	animBO.play("blackout")
	await animBO.animation_finished
	get_tree().change_scene_to_file("res://Level/room_2.tscn")
