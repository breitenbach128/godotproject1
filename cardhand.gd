extends MarginContainer

var maxHandSize = 5
var rSep = 180/maxHandSize/3

# Called when the node enters the scene tree for the first time.
func _ready():
	organize_hand()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_card_release():
	print("Card released")
	organize_hand()

func add_card(card):
	add_child(card)
	card.connect("mouse_released", _on_card_release)
	organize_hand()
	#Append Node
	
	#Make visible
	
func organize_hand():
	#Get all children, then order them in a semi circle
	#180/5 to get 5 positions = 36 deg.
	#Start at first 36 deg increment and continue around the arc of radius card height.
	var hand = self.get_children()
	var cardCount = hand.size()
		
	if(hand):
		#Get positioning helper info
		var leftOffset = ((hand[0].get_node("CardTexture").texture.get_size().x * cardCount)/2)
		var cardht = hand[0].get_node("CardTexture").texture.get_size().x;
		var cardWd = hand[0].get_node("CardTexture").texture.get_size().y;
		for i in cardCount:
			var cCard = hand[i];
			cCard.z_index = get_parent().z_index+i;
			var cTexture = hand[i].get_node("CardTexture").texture;
			var newDeg = floor(cardCount/2)*-rSep + (rSep*i);
			#Set Card positions based on angle. I had to offset because of the anchor.
			cCard.position.x = self.get_parent().size.x/2 + (cardht*2.5*cos(deg_to_rad(newDeg-90)));
			cCard.position.y = self.get_parent().size.y + (cardht*2*sin(deg_to_rad(newDeg-90)))+cardht;
			cCard.rotation_degrees = newDeg;
			
			
