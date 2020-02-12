extends KinematicBody2D
class_name Entity

#Sets the scene for gravity
const upIsUp = Vector2(0, -1)

# individual speeds settable in scene
export(int) var run_speed := 50.0
export(int) var jump_speed := 200.0
export(int) var gravity := 50.0
export(int) var max_fall_speed := 200.0
var velo := Vector2.ZERO

# other things
var moveDir := 0
var spriteDir := "right"

# sets sprite direction!
func spritedir_loop():
	# if moveDir is equal to left or right
	if moveDir == -1:
		spriteDir = "left"
	if moveDir == 1:
		spriteDir = "right"
	
# functions for things
func movement_loop():
	# the second vector sets the FLOOR to -1 
	# which means: the floor is down duMMY
# warning-ignore:return_value_discarded
	move_and_slide(Vector2(moveDir * run_speed, velo.y), upIsUp)	

# ya'll like animated sprites!?
func play_anim(anim_name):
	var newAnim = str(anim_name, spriteDir)
	if $anim.current_animation != newAnim:
		$anim.play(newAnim)

# are we playing the walk animation or nah?
func animate():	
	if !is_on_floor():
		play_anim("jump")
	elif moveDir != 0:
		play_anim("walk")
	else:
		play_anim("idle")

# called after controls
func apply_gravity():
	if !is_on_floor():
		velo.y += gravity
