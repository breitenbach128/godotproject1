class_name Terror extends Node2D

var items_held = []
var data:Dictionary = {}

#Background images
var card_graphic = [preload("res://artwork/terror_vampire.jpg"),
preload("res://artwork/terror_vampire.jpg"),preload("res://artwork/terror_vampire.jpg"),
preload("res://artwork/terror_vampire.jpg"),preload("res://artwork/terror_vampire.jpg"),
preload("res://artwork/terror_vampire.jpg"),preload("res://artwork/terror_vampire.jpg")]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_card_display():
	get_node("CardTexture/MarginContainer/VBoxContainer/Title").text = data.Name;
	get_node("CardTexture/MarginContainer/HealthIcon/HealthValue").text = data.Health;
	get_node("CardTexture/MarginContainer/VBoxContainer/Advantage").text = data.Bonuses;
	get_node("CardTexture/MarginContainer/VBoxContainer/Penalty").text = data.Negatives;
