extends Position3D

onready var left_text = get_node("../GUI/LeftInfo")
onready var right_text = get_node("../GUI/RightInfo")
onready var fps = get_node("../GUI/FPSCounter")
onready var controller = Input.get_connected_joypads()[0]
onready var left_thumb = Vector3(0,0,0)
onready var right_thumb = Vector3(0,0,0)



func _ready():
	pass

func _process(delta):
	
	left_text.text = "Left: " + str($LeftCircle/Thumb.translation)
	right_text.text = "Right: " + str($RightCircle/Thumb.translation)
	fps.text = "FPS: " + str(Performance.get_monitor(0))


func _input(event):
	
	left_thumb = Vector3(Input.get_joy_axis(controller,0) * 0.55,0,Input.get_joy_axis(controller,1) * 0.55)
	right_thumb = Vector3(Input.get_joy_axis(controller,2) * 0.55,0,Input.get_joy_axis(controller,3) * 0.55)
	
	$LeftCircle/Thumb.translation = left_thumb
	$RightCircle/Thumb.translation = right_thumb
