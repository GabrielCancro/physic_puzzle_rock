extends Node2D

onready var BALL = get_node("/root/Game/Ball")


# Called when the node enters the scene tree for the first time.
func _ready():
	for t in get_children(): t.connect("body_entered",self,"onBodyEntered",[t])

func onBodyEntered(body,trap):
	print(body.name)
	if(body==BALL): body.hit(trap)
