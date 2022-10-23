extends CanvasLayer

var lives = 3
var segs = 120

func _ready():
	$Timer.connect("timeout",self,"onTimeTick")
	onTimeTick(0)
	yield(get_tree().create_timer(.1),"timeout")
	$START.visible = true
	get_tree().paused = true
	for i in $START.get_children(): i.modulate.a = 0
	yield(get_tree().create_timer(1),"timeout")
	for i in $START.get_children(): 
		$Tween.interpolate_property(i,"modulate",Color(1,1,1,0),Color(1,1,1,1),.5,Tween.TRANS_QUAD,Tween.EASE_OUT,i.get_index()*1)
	$Tween.start()

func onTimeTick(ticks = 1):
	segs -= ticks
	var m = floor(segs/60)
	$lb_time.text = "%d:%02d" % [m, segs-m*60]
	if(segs == 0):
		lives = 0
		hit_lives()

func _process(delta):
	if $START.visible && $START/Label4.modulate.a == 1 && Input.is_action_just_pressed("ui_accept"):
		$Tween.interpolate_property($START,"modulate",Color(1,1,1,1),Color(1,1,1,0),1,Tween.TRANS_QUAD,Tween.EASE_IN)
		$Tween.start()
		yield(get_tree().create_timer(1.5),"timeout")
		$START.visible = false
		get_tree().paused = false
		$Timer.start()
	if Input.is_action_just_pressed("ui_end"): get_tree().quit(0)
	
func hit_lives():
	lives -= 1
	if lives<3: $life3.modulate = Color(.1,.1,.1)
	if lives<2: $life2.modulate = Color(.1,.1,.1)
	if lives<1: $life1.modulate = Color(.1,.1,.1)
	if lives<0: 
		get_tree().paused = true
		$LOST.visible = true
		$Timer.stop()
		yield(get_tree().create_timer(2.5),"timeout")
		get_tree().quit(2)
