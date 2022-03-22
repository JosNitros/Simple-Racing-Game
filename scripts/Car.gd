#res://scripts/Car.gd

extends KinematicBody2D

#Josh: Script for potential car

onready var TweenNode = get_node("Tween")

#Josh: Variable to keep track of angle
var carRotation = 0
var speed = 10000


#Josh: Checks button presses
func get_direction():
	var axis = Vector2()
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis
	
#Josh: Gives movement vector based upon angle of rotation and y axis movement
func get_movement_vector(rotationAngle, yAxis):
		return Vector2(-sin((carRotation) *(PI / 180)) * yAxis * speed, cos((carRotation) * (PI / 180)) * yAxis * speed)


func _physics_process(delta):	
	
	var axis = get_direction()
	
	if axis.y != 0:
		move_and_slide(get_movement_vector(carRotation, axis.y))
	
#Josh: If else statements rotate car BASED on button presses
	
	if Input.is_action_pressed("ui_right") == true && axis.y == 1:
		TweenNode.interpolate_property(self, "rotation_degrees", carRotation, (carRotation - 3), .25)
		TweenNode.start()
		carRotation -= 3
	
	elif Input.is_action_pressed("ui_right") == true && axis.y == -1:
		TweenNode.interpolate_property(self, "rotation_degrees", carRotation, (carRotation + 3), .25)
		TweenNode.start()
		carRotation += 3
	
	if Input.is_action_pressed("ui_left") == true && axis.y == 1:
		#look_at(get_global_mouse_position())
		TweenNode.interpolate_property(self, "rotation_degrees", carRotation, (carRotation + 3), .25)
		TweenNode.start()
		carRotation += 3
		
	elif Input.is_action_pressed("ui_left") == true && axis.y == -1:
		#look_at(get_global_mouse_position())
		TweenNode.interpolate_property(self, "rotation_degrees", carRotation, (carRotation - 3), .25)
		TweenNode.start()
		carRotation -= 3

		
	if carRotation == 360 || carRotation == -360:
		carRotation = 0
		
