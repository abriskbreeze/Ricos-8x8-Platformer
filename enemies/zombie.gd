extends Entity

# this man just wanders randomly
var movetimer_length = 30
var movetimer = 0

func _ready():
#	$anim.play("idleleft")
	moveDir = dir.rand()



func _physics_process(delta: float) -> void:
	apply_gravity()
	movement_loop()
	spritedir_loop()
	animate()

	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0:
		moveDir = dir.rand()
		movetimer = movetimer_length
		
#		if moveDir == -1:
#			print("left")
#		elif moveDir == 1:
#			print("right")
