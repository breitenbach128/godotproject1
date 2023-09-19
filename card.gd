extends Node2D

signal mouse_released
signal picked_up_change(picked)

var picked_up:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked_up:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("M1"):
		print("M1 Released")
		mouse_released.emit()


func _on_mouse_region_pressed():
	print("Mouse Region Pressed")
	picked_up = true
	await mouse_released
	picked_up = false
	position = Vector2.ZERO
	
