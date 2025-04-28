extends Control

@onready var inv: Inv = preload("res://inventory/oldman_inv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func _ready():
	close()

func _process(_delta):
	if Input.is_action_just_pressed("inv"):
		if is_open:
			close()
		else:
			self.visible = true
			is_open = true

func close():
	visible = false
	is_open = false
