extends Node2D

@onready var anim = $AnimationPlayer
@onready var animFL = $AnimationPlayer2
@onready var control_bed = $StaticBody2D/Control
@onready var label_bed = $StaticBody2D/Control/Panel/Label
@onready var control_oldman = $AnimatedSprite2D/Control
@onready var label_oldman = $AnimatedSprite2D/Control/Panel/Label
@onready var control_healers = $Healers/Control
@onready var label_healers = $Healers/Control/Panel/Label

func _ready():
	anim.play("lightening")
	await anim.animation_finished
	
	label_bed.hide()
	control_oldman.hide()
	control_healers.hide()
	
	control_oldman.show()
	label_oldman.text = "Вот, артифакт."
	await get_tree().create_timer(3).timeout
	control_oldman.hide()
	
	control_healers.show()
	label_healers.text = "Спасибо."
	await get_tree().create_timer(3).timeout
	control_healers.hide()
	
	control_oldman.show()
	label_oldman.text = "Вы же вылечите её?"
	await get_tree().create_timer(3).timeout
	control_oldman.hide()
	
	control_healers.show()
	label_healers.text = "Конечно, только есть одно но"
	await get_tree().create_timer(3).timeout
	control_healers.hide()
	
	control_oldman.show()
	label_oldman.text = "Что?!"
	await get_tree().create_timer(3).timeout
	control_oldman.hide()
	
	control_healers.show()
	label_healers.text = "Оставь надежду, всяк сюда входящий"
	await get_tree().create_timer(2).timeout
	control_healers.hide()
	
	anim.play("blackout")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://Level/tornado.tscn")

func _process(_delta):
	pass
