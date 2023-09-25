extends Node2D

signal mouse_released
signal picked_up_change(picked)

var picked_up:bool = false
var unflipped:bool = true;
var hand_position:Vector2 = Vector2(0,0)
var prev_z = 0;
var hand_index = -1;#index in the hand from left ot right, max handsize of 5 cards

var hand_slide_tween#Controls the visual slideout tween

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
func _process(_delta):
	if picked_up:
		global_position = get_global_mouse_position()
		
#	if Input.is_action_just_released("M1"):
#		print("M1 released on card ", data.Title)
#		mouse_released.emit()


func _on_mouse_region_pressed():	
	picked_up = true
	hand_slide_tween.kill();
	reset_child_index();
	self.z_index = 99;
	self.rotation_degrees = 0;
	await mouse_released
	picked_up = false
	#position = Vector2.ZERO

func _on_mouse_region_button_up():
		print("M1 released on card ", data.Title)
		mouse_released.emit()
	
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
		

func flip_card(state):
	unflipped = state;
	for c in self.get_node("CardTexture").get_children():
		c.visible = state;
		
	

func set_hand_position(index):
	hand_position = self.position;
	hand_index = index;

# Move to the front child index to stop from entering mouse
# region of controls visually behind the current one.
func move_card_control_to_front():
	var cCount = self.get_parent().get_child_count();
	self.get_parent().move_child(self, cCount-1)
	print("Card to Front: ", cCount-1, " from ", hand_index);

# Resets to the original hand index 
func reset_child_index():
	self.get_parent().move_child(self, hand_index)
	print("Card back to origin: ", hand_index)

func _on_mouse_region_mouse_entered():
	#move child may be what I need, but it will be complicated to put in.
	print("card reg entered")
	prev_z = z_index;
	z_index = 99;
	if(hand_slide_tween):
		if(hand_slide_tween.is_running() == true):
			hand_slide_tween.kill();
	if(picked_up == false):
		hand_slide_tween = create_tween()
		hand_slide_tween.tween_property(self,"position",Vector2(hand_position.x,hand_position.y-50),0.75).set_trans(Tween.EASE_OUT  )
		move_card_control_to_front();
			
	

func _on_mouse_region_mouse_exited():
	print("card reg exited")
	z_index = prev_z;
	if(hand_slide_tween):
		if(hand_slide_tween.is_running() == true):
			hand_slide_tween.kill();
	if(picked_up == false):
		hand_slide_tween = create_tween()
		hand_slide_tween.tween_property(self,"position",Vector2(hand_position.x,hand_position.y),0.75).set_trans(Tween.EASE_OUT  )
		reset_child_index();
	
