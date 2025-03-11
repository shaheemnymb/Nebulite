extends Node

@export var drag_block : Node2D
@export var block_button : Button
var button_pressed := false
var offset : Vector2

func _ready() -> void:
	block_button.button_down.connect(button_down)
	block_button.button_up.connect(button_up)

func button_down():
	button_pressed = true
	offset = drag_block.global_position - drag_block.get_global_mouse_position()

func button_up():
	button_pressed = false

func _process(delta: float) -> void:
	if button_pressed:
		drag_block.global_position = offset +  drag_block.get_global_mouse_position()
		
