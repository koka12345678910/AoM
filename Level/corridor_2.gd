extends Node2D

@onready var oldman = $"Сorridor/Oldman"
@onready var healers = $"Сorridor/Healers"
@onready var lightening = $AnimationPlayer

func _ready():
	lightening.play("lightening")

func _process(_delta):
	if oldman.velocity.x < 0:
		healers.velocity.x += -0.4
		healers.animH.play("Walk")
	elif oldman.velocity.x >= 0:
		healers.velocity.x = 0
		healers.animH.play("Idle")

func _on_area_2d_3_body_entered(body):
	if body.name == "Oldman":
		lightening.play("blackout")
		await lightening.animation_finished
		get_tree().change_scene_to_file("res://Level/level_1.tscn")
