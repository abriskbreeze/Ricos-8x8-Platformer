extends Entity

export var stomp_impulse = 120.0 # the bounce effect when killing enemies



# did we get the enemy? if so we gon' hop up a lil
func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse) 



# DID WE GET TOUCHED N DIE!?
func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	queue_free()



func _physics_process(delta: float) -> void:
	# checks how high we're trying to jump then calculates movement velocity
	var is_jump_interrupted := Input.is_action_just_released("ui_up") and _velocity.y < 0.0
	var direction := get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	
	# and actually move the entity and animate sprites!
	_velocity = move_and_slide(_velocity, upIsUp)
	animate()



func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		-1.0 if Input.is_action_just_pressed("ui_up") and is_on_floor() else 1.0
	)



func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	
	# set return value as Vector2
	var output := linear_velocity
	output.x = speed.x * direction.x
	output.y += gravity * get_physics_process_delta_time() # time between frames
	
	if direction.y == -1.0:
		output.y = speed.y * direction.y
	
	if is_jump_interrupted:
		output.y = 0.0
	
	return output



func calculate_stomp_velocity (linear_velocity: Vector2, impulse: float) -> Vector2:
	var out = linear_velocity
	out.y = -impulse
	return out


