extends Node2D

@onready var panel_oldman = $Oldman/Control
@onready var panel_healers = $Healers/Control
@onready var panel_bed = $StaticBody2D/Control
@onready var label = $Oldman/Control/Panel/Label
@onready var label_healers = $Healers/Control/Panel/Label
@onready var label_bed = $StaticBody2D/Control/Panel/Label
@onready var animDL = $AnimationPlayer

func _ready():
	
	animDL.play("lightning")
	await animDL.animation_finished
	panel_oldman.hide()
	panel_bed.hide()
	panel_healers.hide()
	
	panel_oldman.show()
	label.text = "Они пришли мой король."
	await get_tree().create_timer(2).timeout
	panel_oldman.hide()
	
	panel_healers.show()
	label_healers.text = "Мы пришли по вашей просьбе."
	await get_tree().create_timer(2).timeout
	panel_healers.hide()
	
	panel_bed.show()
	label_bed.text = "Я прошу вас, помогите ей. Я все отдам!"
	await get_tree().create_timer(2).timeout
	panel_bed.hide()
	
	panel_healers.show()
	label_healers.text = "Мы ценим вашу щедрость, но нам не нужно все. 
	Нам нужна лишь одна вещь которая для вас ничего не стоит"
	await get_tree().create_timer(5).timeout
	panel_healers.hide()
		
	panel_bed.show()
	label_bed.text = "Что же!?"
	await get_tree().create_timer(2).timeout
	panel_bed.hide()
	
	panel_healers.show()
	label_healers.text = "Артифакт.
	Который вы забрали при вторжении в королевство Саузфилд"
	await get_tree().create_timer(3).timeout
	panel_healers.hide()
	
	panel_bed.show()
	label_bed.text = "Хорошо. Принеси его!"
	await get_tree().create_timer(2).timeout
	panel_bed.hide()
	
	panel_oldman.show()
	label.text = "Хорошо мой король"
	await get_tree().create_timer(2).timeout
	panel_oldman.hide()
	
	animDL.play("blackout")
	await animDL.animation_finished
	get_tree().change_scene_to_file("res://Level/corridor_3.tscn")

func _process(_delta):
	pass
