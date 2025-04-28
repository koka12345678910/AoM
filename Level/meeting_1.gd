extends Node2D

@onready var healers = $Healers
@onready var oldman = $Oldman
@onready var animDL = $AnimationPlayer
@onready var torch = $AudioStreamPlayer2D

func _ready():
	animDL.play("lightening")
	await animDL.animation_finished
	animDL.play("typing")
	await animDL.animation_finished
	animDL.play("untyping")
	await animDL.animation_finished

func _process(_delta):
	if oldman.velocity.x < 0:
		healers.velocity.x += -1
	elif oldman.velocity.x >= 0:
		healers.velocity.x = 0
		

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		animDL.play("blackout")
		await animDL.animation_finished
		get_tree().change_scene_to_file("res://Level/corridor_2.tscn")




func _on_audio_stream_player_2d_finished():
	torch.playing = true
