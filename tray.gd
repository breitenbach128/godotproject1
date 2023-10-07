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

func add_card_to_tray(c):
	c.clear_hand_index();
	var leftStack = $VBoxContainer/CardStackLeft/StackContainer
	var rightStack = $VBoxContainer/CardStackRight/StackContainer
	print("Card added to tray: ", c.data.Title)
	c.get_parent().remove_child(c);
	leftStack.add_child(c)
	fear_stack.append(c)
	c.position.x = 0;
	c.position.y = fear_stack.size()*32;#32 is the spacing

