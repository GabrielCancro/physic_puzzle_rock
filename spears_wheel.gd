extends Area2D

onready var BALL = get_node("/root/Game/Ball")

func _ready():
	connect("body_entered",self,"onBodyEntered")

func _process(delta):
	rotation_degrees += 3
	
func onBodyEntered(body):
	print(body.name)
	if(body==BALL): body.hit(self)
