extends CanvasLayer

@onready var map = $TextureRect

func _ready():
	map.hide()

func _process(_delta):
	if Input.is_action_just_pressed("map"):
		map.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("use"):
		map.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
