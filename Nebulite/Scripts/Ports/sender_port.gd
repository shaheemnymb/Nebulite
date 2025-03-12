extends Node2D

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


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Left mouse clicked"):
		get_clicked_sprite()
