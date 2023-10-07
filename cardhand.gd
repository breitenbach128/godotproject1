extends MarginContainer

var maxHandSize = 5
@warning_ignore("integer_division")
var rSep = 180/maxHandSize/3

var cl = Cardloader

# Called when the node enters the scene tree for the first time.
func _ready():
	organize_hand()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_card_release(c):
	print("Card released ", c.data.Title)
	#Am I over any zones?
	var zones = $"../../../Board".get_children();
	var discard_pile = $"../Discard";
	for z in zones:
		if(z.over_zone && c.picked_up):
			#I'm over this zone!
			print("Over Zone when dropped :", z.name," " ,c.data.Title)
			#Add card to tray slot matching player id.
			for tray in z.player_trays:
				if(tray.player_assigned == cl.player_id-1):
					tray.add_card_to_tray(c)
			
			#remove from parent (cardhand)
			#c.discard();
			#print("connected? ",c.mouse_released.get_connections())
			print("connected? ", c.mouse_released.is_connected(_on_card_release))
			if(c.mouse_released.is_connected(_on_card_release)):
				c.mouse_released.disconnect(_on_card_release)
			print("connected? ", c.mouse_released.is_connected(_on_card_release))
	
	#Remove card from hand and add to proper zone area. Scale down for space.
	
	organize_hand()

func add_card(card):
	add_child(card)
	card.connect("mouse_released", _on_card_release.bind(card))
	organize_hand()
	#Append Node
	
	#Make visible
	
func organize_hand():
	#Get all children, then order them in a semi circle
	#180/5 to get 5 positions = 36 deg.
	#Start at first 36 deg increment and continue around the arc of radius card height.
	var hand = self.get_children()
	var cardCount = hand.size()
		
	if(cardCount > 0):
		#Get positioning helper info
		#var leftOffset = ((hand[0].get_node("CardTexture").texture.get_size().x * cardCount)/2)
		var cardht = hand[0].get_node("CardTexture").texture.get_size().x;
		#var cardWd = hand[0].get_node("CardTexture").texture.get_size().y;
		for i in cardCount:
			var cCard = hand[i];
			cCard.z_index = get_parent().z_index+i;
			#var cTexture = hand[i].get_node("CardTexture").texture;
			@warning_ignore("integer_division")
			var newDeg = floor(cardCount/2)*-rSep + (rSep*i);
			#Set Card positions based on angle. I had to offset because of the anchor.
			cCard.position.x = self.get_parent().size.x/2 + (cardht*2.5*cos(deg_to_rad(newDeg-90)));
			cCard.position.y = self.get_parent().size.y + (cardht*2*sin(deg_to_rad(newDeg-90)))+cardht;
			cCard.rotation_degrees = newDeg;
			cCard.set_hand_position(i);
			
			
