extends Node2D

onready var BALL = get_node("/root/Game/Ball")

func _ready():
	connect("body_entered",self,"onBodyEntered")

func onBodyEntered(body):
	if(body==BALL):
		get_node("/root/Game/UI/WIN").visible = true
		get_tree().paused = true 
		yield(get_tree().create_timer(2.5),"timeout")
		get_tree().quit(1)
