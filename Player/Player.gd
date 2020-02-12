extends Entity

func _physics_process(delta: float) -> void:
	# input/move/render loop
	controls_loop()
	apply_gravity()
	movement_loop()
	spritedir_loop()
	animate()

	
func controls_loop():
	var left_press	= Input.is_action_pressed("ui_left")
	var right_press	= Input.is_action_pressed("ui_right")
	var jump	        = Input.is_action_just_pressed("ui_up")
	
	# when left arrow key pressed boolean becomes integer
	# then set it negative OR postive OR balance it out to 0
	moveDir = -int(left_press) + int(right_press)
	
	var grounded = is_on_floor()
	
	if grounded and jump:
		velo.y = -jump_speed
	if grounded and velo.y  >= 5:
		velo.y  = 5
	if velo.y  > max_fall_speed:
		velo.y  = max_fall_speed
