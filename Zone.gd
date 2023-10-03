extends Sprite2D

var over_zone:bool = false;
var data:Dictionary = {};
var trayScene = preload("res://tray.tscn")
var player_trays = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	attach_player_trays();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	over_zone = true;
func _on_area_2d_mouse_exited():
	over_zone = false;

func attach_player_trays():
	for i in 4:
	
		var new_tray = trayScene.instantiate()
		var new_rotation = deg_to_rad(i*90)
		new_tray.rotation = new_rotation

		var x_ang = cos(new_rotation+(PI/2))*225
		var y_ang = sin(new_rotation+(PI/2))*225
		var n_x:int = x_ang
		if(n_x == 0):
			n_x = cos(new_rotation+(PI))*225
		var n_y:int = y_ang
		if(n_y == 0):
			n_y = sin(new_rotation+(PI))*225
		print("creating new trays for zone x:",n_x," y:", n_y, " at deg ", new_tray.rotation_degrees)
		new_tray.position.x = n_x-75;
		new_tray.position.y = n_y;
		self.add_child(new_tray)
		new_tray.assign_player(i)
		player_trays.append(new_tray)
