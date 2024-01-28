extends Node2D

signal score

onready var point = $point

#wall scroll speed
const SPEED = 275

func _physics_process(delta):
	#move wall along the x axis from right to left
	#using delta so it will always be the same speed for all framerates
	position.x += -SPEED * delta
	#when wall scrolls beyond 200 pixels from the edge of the screen
	if global_position.x <= -200:
		#reposition it to the right side of the screen
		queue_free()

#player loses if wall body is touched
func _on_wall_body_entered(body):
	if body is player:
		if body.has_method("die"):
			body.die()

#emit signal to update score every time player exits score area
func _on_score_area_body_exited(body):
	if body is player:
		point.play()
		emit_signal("score")
