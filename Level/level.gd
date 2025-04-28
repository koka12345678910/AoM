extends Node2D

@onready var animScene = $AnimScene
@onready var animPL = $AnimationPlayer
@onready var animDL = $AnimationPlayer2
@onready var transition1 = $Area2D
@onready var soundsDoor = $DoorClose
@onready var kingCry = $Cry
@onready var thunderclaps = $Thunderclaps
@onready var light = $Light_Scene
@onready var bed = $StaticBody2D
@onready var control = $Control
@onready var anim_control = $AnimationPlayer3

func _ready():
	control.hide()
	animDL.play("lightening")
	await animDL.animation_finished
	control.show()
	anim_control.play("control_anim")
	await anim_control.animation_finished
	get_tree().create_timer(2).timeout
	anim_control.play("control_anim_1")
	await anim_control.animation_finished
	control.hide()

func _process(_delta):
	light_level()
	

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		animDL.play("blackout")
		soundsDoor.playing = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://Level/corridor/сorridor.tscn")

func _on_cry_finished():
	kingCry.playing = true

func _on_thunderclaps_finished():
	thunderclaps.playing = true
	
func light_level():
	light.energy = 0.75
	animScene.play("flashlight")
	animPL.play("flashlight_2")


func _on_dialogue_body_entered(body):
	if body.name == "Oldman":
		bed.show()
