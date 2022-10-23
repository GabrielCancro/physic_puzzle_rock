extends CanvasLayer

var lives = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hit_lives():
	lives -= 1
	if lives<3: $life3.modulate = Color(.1,.1,.1)
	if lives<2: $life2.modulate = Color(.1,.1,.1)
	if lives<1: $life1.modulate = Color(.1,.1,.1)
	if lives<0: 
		get_tree().paused = true
		$LOST.visible = true
		yield(get_tree().create_timer(2.5),"timeout")
		get_tree().quit(0)
