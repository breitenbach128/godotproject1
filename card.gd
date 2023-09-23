extends Node2D

signal mouse_released
signal picked_up_change(picked)

var picked_up:bool = false

var data:Dictionary = {}

#Preloaded Textures
var card_icon_fear = preload("res://artwork/fear.jpg")
var card_icon_beleiver = preload("res://artwork/beleiver.png")
var card_icon_hope = preload("res://artwork/hope.png")
var card_icon_item = preload("res://artwork/item.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked_up:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("M1"):
		mouse_released.emit()


func _on_mouse_region_pressed():	
	picked_up = true
	self.z_index = 99;
	self.rotation_degrees = 0;
	await mouse_released
	picked_up = false
	#position = Vector2.ZERO
	
func set_card_values(newdata):
	data = newdata;
	#print("New Card Data Set: ", data)
	update_card_display();
	
func update_card_display():
	get_node("CardTexture/MarginContainer/VBoxContainer/Title").text = data.Title;
	get_node("CardTexture/MarginContainer/VBoxContainer/CardGraphic/FearIcon/FearCost").text = data.FearCost;
	get_node("CardTexture/MarginContainer/InfluenceIcon/InfluenceValue").text = data.InfluenceValue;
	get_node("CardTexture/MarginContainer/VBoxContainer/Desc").text = data.Effect;
	get_node("CardTexture/MarginContainer/VBoxContainer/Tags").text = data.Tags;
	#Handle Types of Cards
	if(data.Type == "Fear"):
		get_node("CardTexture/MarginContainer/TypeIcon").set_texture(card_icon_fear)	
	if(data.Type == "Hope"):
		get_node("CardTexture/MarginContainer/TypeIcon").set_texture(card_icon_hope)		
	if(data.Type == "Item"):
		get_node("CardTexture/MarginContainer/TypeIcon").set_texture(card_icon_item)	
	if(data.Type == "Beleiver"):
		get_node("CardTexture/MarginContainer/TypeIcon").set_texture(card_icon_beleiver)	
