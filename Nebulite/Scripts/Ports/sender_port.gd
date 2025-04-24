extends Node2D


var button_pressed = false
var line_2d : Line2D

func get_clicked_sprite():
	var raycast := RayCast2D.new()
	add_child(raycast)
	raycast.target_position = Vector2(0, 0)
	raycast.global_position = get_global_mouse_position()
	
	raycast.exclude_parent = false
	raycast.hit_from_inside = true
	raycast.collide_with_areas = true
	raycast.force_raycast_update()
	return raycast.get_collider()
	raycast.queue_free()


func _process(_delta: float) -> void:
	if button_pressed:
		line_2d.clear_points()
		line_2d.add_point(global_position)
		line_2d.add_point(get_global_mouse_position())


func _on_button_button_down() -> void:
	print("Button down")
	button_pressed = true
	line_2d = Line2D.new()
	add_child(line_2d)


func _on_button_button_up() -> void:
	print("Button up")
	button_pressed = false
	line_2d.queue_free()
