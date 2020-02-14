extends Entity

func _ready():
	speed.x = 35.0
	_velocity.x = -speed.x

# if this boy gets stepped on by the player, using collision nodes
func _on_stompDetector_body_entered(body: PhysicsBody2D) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
#	get_node("CollisionShape2D").disabled = true # outdated?
	set_deferred("disabled", true)
	queue_free()


func _physics_process(delta: float) -> void:
	# applies gravity?
	_velocity.y += gravity * delta
	
	#turn around if it hits a wall
	if is_on_wall():
		_velocity.x *= -1.0
	
	#then move and animate!
	_velocity.y = move_and_slide(_velocity, upIsUp).y
	animate()
