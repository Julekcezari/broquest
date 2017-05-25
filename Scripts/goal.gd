extends Node2D

var score = 0

func gol():
	print("Score!")

func _on_goal_body_enter( body ):
	print(body.get_name())
	if (body.get_name() == "ball"):
		gol()
	else:
		print("fuck off")
