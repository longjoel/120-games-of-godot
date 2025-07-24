"""
This is the first game. I am very excited to write it. I can't wait to see where this goes. Pure imagination man.


"""
extends Node


func MoveBall(push:Vector3):
	
	$RollyBall.apply_torque_impulse(push.normalized())
	
	pass

# let's try to push it wth the mouse.
# How fast did we move?
var enterVertex:Vector2 = Vector2.ZERO
var enterTime:=0.0

var exitVertex:Vector2 = Vector2.ZERO
var exitTime:=0.0

# keep track of total elapsed gametime.
var gameTime:=0.0

func _physics_process(delta: float) -> void:
	
	gameTime += delta
	
	# let's do camera tracking.
	
	$TrackingCamera.position.y = $RollyBall.position.y+5
	$TrackingCamera.position.x = $RollyBall.position.x+5
	$TrackingCamera.position.z = $RollyBall.position.z+5
	
	$TrackingCamera.look_at($RollyBall.position)
	
	$RollyBall/N.position = $RollyBall.position
	$RollyBall/N.position.z -= 2
	
	pass


# need to figure out the x and y position when the cursor leaves and enters the mouse.
# It needs to be relative to the camera.

func _on_rolly_ball_mouse_entered() -> void:
	enterTime = gameTime
	enterVertex = DisplayServer.mouse_get_position()
	pass # Replace with function body.


func _on_rolly_ball_mouse_exited() -> void:
	exitTime = gameTime
	exitVertex = DisplayServer.mouse_get_position()
	var dt = exitTime-enterTime
	
	var dxdy = exitVertex-enterVertex
	
	# Holy crap. I can't believe this worked.
	
	var push = Vector3(dxdy.y/dt, 0, -dxdy.x/dt)
	
	$RollyBall.apply_torque_impulse(push.normalized())
	
	enterVertex = Vector2.ZERO
	enterTime=0.0

	exitVertex = Vector2.ZERO
	exitTime=0.0
	
	pass # Replace with function body.
