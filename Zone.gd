extends Sprite2D

var over_zone:bool = false;
var data:Dictionary = {};

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
	pass
