extends RigidBody2D

var dir = Vector2(0,-1)
var gravity = 10
var max_speed = 250
var propulse = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _integrate_forces(state):
	apply_central_impulse( dir * gravity + dir*propulse )
	propulse *= 0.95
	if state.linear_velocity.length()>max_speed+propulse:
		state.linear_velocity=state.linear_velocity.normalized()*(max_speed+propulse)

func hit():
	if(modulate!=Color(1,1,1)): return
	get_node("/root/Game/UI").hit_lives()
	apply_central_impulse( -dir * 900 )
	$Tween.interpolate_property($Sprite,"modulate", Color(1,0,0),Color(1,1,1),1,Tween.TRANS_QUAD,Tween.EASE_OUT)
	$Tween.start()

func propulse():
	if(propulse<1): 
		propulse = 250
		$Tween.interpolate_property($Sprite,"modulate", Color(.5,.5,1),Color(1,1,1),3,Tween.TRANS_QUAD,Tween.EASE_OUT)
		$Tween.start()
