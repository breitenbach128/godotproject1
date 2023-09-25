extends Camera2D

var mouse_start_pos
var screen_start_position
var cam_rotate:Tween

var dragging = false



func _input(event):
	if event.is_action("Drag"):
		if event.is_pressed():
			mouse_start_pos = event.position
			screen_start_position = position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		position = zoom * (mouse_start_pos - event.position) + screen_start_position
		
	if event.is_action_released("camera_ccw"):
		if(cam_rotate):
			cam_rotate.kill();
			
		cam_rotate = create_tween();
		cam_rotate.tween_property(self,"rotation_degrees",snapped(rotation_degrees-45,45),0.75);
		
		
	if event.is_action_released("camera_cw"):
		if(cam_rotate):
			cam_rotate.kill();
			
		cam_rotate = create_tween();
		cam_rotate.tween_property(self,"rotation_degrees",snapped(rotation_degrees+45,45),0.75);
		#self.get_parent().rotation_degrees+=15;

