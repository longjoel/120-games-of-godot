extends Node2D

var enterVertex:Vector2 = Vector2.ZERO
var enterTime:=0.0

var exitVertex:Vector2 = Vector2.ZERO
var exitTime:=0.0

# keep track of total elapsed gametime.
var gameTime:=0.0


func _physics_process(delta: float) -> void:
	
	gameTime += delta
	
	pass

func _on_area_2d_mouse_entered() -> void:
	enterTime = gameTime
	enterVertex = DisplayServer.mouse_get_position()
	pass # Replace with function body.


func _on_area_2d_mouse_exited() -> void:
	exitTime = gameTime
	exitVertex = DisplayServer.mouse_get_position()
	var dt = exitTime-enterTime
	
	var dxdy = exitVertex-enterVertex
	
	# Holy crap. I can't believe this worked.
	
	var push = Vector3(dxdy.y/dt, 0, -dxdy.x/dt)
	
	$SubViewportContainer/SubViewport/root.MoveBall(push)
	
	enterVertex = Vector2.ZERO
	enterTime=0.0

	exitVertex = Vector2.ZERO
	exitTime=0.0
	pass # Replace with function body.
