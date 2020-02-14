extends KinematicBody2D
class_name Entity

#Sets the scene for gravity
const upIsUp = Vector2(0, -1)

# individual speeds settable in scene and velocity
export var speed := Vector2(85.0, 150.0)
export var gravity := 640.0

# define necessary variables
# the _ leading the variable name represents that it's a private variable
# and should only meant to be used inside that script/class
var _velocity := Vector2.ZERO
var _spriteDir := "right"

# sets sprite direction for animation
func set_spriteDir(sDir: String):
	_spriteDir = sDir

## ya'll like animated sprites!? Function to  play the animations
func play_anim(anim_name):
	var newAnim = str(anim_name, _spriteDir)
	if $anim.current_animation != newAnim:
		$anim.play(newAnim)
#
# which animation are we playing? then PLAY IT
func animate():
#	sets the direction of the sprite depending on movement
	if _velocity.x > 0:
		set_spriteDir("right")
	elif _velocity.x < 0:
		set_spriteDir("left")
		
#	play the corresponding animations
	if !is_on_floor():
		play_anim("jump")
	elif _spriteDir == "left" and _velocity.x < 0  or _spriteDir == "right" and _velocity.x > 0:
		play_anim("walk")
	else:
		play_anim("idle")
