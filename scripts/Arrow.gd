extends StaticBody2D

# Josh: I attached this to an arrow because I initially thought we could have an arrow move around to show you where to go
# but I didnt make it move (maybe in the future depending on how we want to show the path)

# Josh: Boolean variables to keep track of each marker being passed

var first_passed = false
var second_passed = false
var third_passed = false
var fourth_passed = false
var fifth_passed = false
var sixth_passed = false
var seventh_passed = false
var eighth_passed = false



var laps_done = 0

# Josh: All these functions are signal functions that keep track of where the car went;
# the first one I set to be the "start" so it checks all the boolean variables to see if you did the full lap

func _on_1_body_exited(body):
	
	var complete_lap = [first_passed, second_passed, third_passed, fourth_passed, fifth_passed, sixth_passed, seventh_passed, eighth_passed]
	
	first_passed = true
	var count = 0
	for marks in complete_lap:
		if marks == true:
			count += 1
	if count == 8:
		laps_done += 1
		second_passed = false
		third_passed = false
		fourth_passed = false
		fifth_passed = false
		sixth_passed = false
		seventh_passed = false
		eighth_passed = false
	print(laps_done)
		
func _on_2_body_exited(body):
	if first_passed == true:
		second_passed = true

func _on_3_body_exited(body):
	if second_passed == true: 
		third_passed = true

func _on_4_body_exited(body):
	if third_passed == true: 
		fourth_passed = true

func _on_5_body_exited(body):
	if fourth_passed == true:
		fifth_passed = true

func _on_6_body_exited(body):
	if fifth_passed == true:
		sixth_passed = true

func _on_7_body_exited(body):
	if sixth_passed == true:
		seventh_passed = true

func _on_8_body_exited(body):
	if  seventh_passed == true:
		eighth_passed = true
