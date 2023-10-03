class_name Tray extends Control

var terror_assigned: Terror
var beleiver_stack = []
var fear_stack = []
var player_assigned = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func assign_player(player_number):
	player_assigned = player_number
	get_node("Label").text = str(player_number+1)


