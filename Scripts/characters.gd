extends RigidBody2D
#default properties
var acceleration = 1000
var max_speed = 200
var jump_force = 600

#movement vars
var direction_force = Vector2()
const DIRECTION = {
	NONE = Vector2(0,0),
	LEFT = Vector2(-1,0),
	RIGHT = Vector2(1,0),
	UP = Vector2(0,-1),
	DOWN = Vector2(0,1)
}

func _integrate_forces(state):
	#final force
	var final_force = Vector2()
	
	#not moving
	direction_force = DIRECTION.NONE
	
	#applying force
	force(state)

	final_force = state.get_linear_velocity() + (acceleration * direction_force)
	
	#speed limit
	final_force.x = clamp(final_force.x, -max_speed, max_speed)
	#jump force
	final_force.y = clamp(final_force.y, -jump_force, jump_force )

	state.set_linear_velocity(final_force)
#this is replaced by the player or npc
func force(state):
	pass