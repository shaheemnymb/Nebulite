extends Node2D

func get_clicked_sprite():
	var raycast := $RayCast2D
	raycast.target_position = Vector2(0, 0)
	raycast.global_position = get_global_mouse_position()
	
	raycast.exclude_parent = false
	raycast.hit_from_inside = true
	raycast.collide_with_areas = true
	raycast.force_raycast_update()
	print(raycast.get_collider())


func _process(delta: float) -> void:
	await get_tree().create_timer(1).timeout
	get_clicked_sprite()
