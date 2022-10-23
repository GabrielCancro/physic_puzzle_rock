extends Camera2D

var rotate_vel = 1
onready var BALL = get_node("/root/Game/Ball")

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= rotate_vel
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += rotate_vel
	if Input.is_action_pressed("ui_up"):
		BALL.propulse()
	
	position = BALL.position
	BALL.dir = Vector2( cos(rotation+PI/2), sin(rotation+PI/2) )
	$TextureRect.rect_position = -$TextureRect.rect_size*.5 + BALL.position * .5
