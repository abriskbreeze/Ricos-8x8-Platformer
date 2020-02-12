extends Node

# auto-loaded as "dir" in the project settings so anything
# can access it! woo!

const CENTER = 0
const LEFT = -1
const RIGHT = 1
const UP = -1
const DOWN = 1

# create random movement function
func rand():
	var d = randi() % 2 +1
	match d:
		1:
			return LEFT
		2:
			return RIGHT
#		3:
#			print("up")
#			return UP
#		4:
#			print("down")
#			return DOWN
		
