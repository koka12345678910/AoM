extends Node2D

@onready var dl = $DirectionalLight2D
@onready var label = $Control/Panel/Label
@onready var anim = $AnimationPlayer
@onready var artifact = $Artifact

func _ready():
	label.hide()

func _process(_delta):
	dl.energy = 0.7

func _on_area_2d_body_entered(body):
	if body.name == "Oldman":
		artifact.queue_free()
		label.show()
		anim.play("typing")
		anim.animation_finished

func _on_area_2d_body_exited(body):
	if body.name == "Oldman":
		anim.play("untyping")
		await anim.animation_finished
		label.hide()
		$Area2D.disconnect("body_entered", Callable(self, "_on_area_2d_body_entered"))

func _on_area_2d_2_body_entered(body):
	if body.name == "Oldman":
		get_tree().change_scene_to_file("res://Level/meeting_3.tscn")
