extends "res://Scripts/characters.gd"

var in_ground = false
var can_jump = false
func _ready():
	#player custom properties
	acceleration = 1000
	max_speed = 200
	jump_force = 500

#moving
func force(state):
	if (in_ground == true):
		can_jump = true
	else:
		can_jump = false
	if (Input.is_action_pressed("ui_left")):
		direction_force += DIRECTION.LEFT
	if (Input.is_action_pressed("ui_right")):
		direction_force += DIRECTION.RIGHT
	if (Input.is_action_just_pressed("ui_up") && can_jump == true):
		direction_force += DIRECTION.UP
		can_jump == false


#checking if the player is on the ground
func _on_ground_detection_body_enter( body ):
	in_ground = true
func _on_ground_detection_body_exit( body ):
	in_ground = false
