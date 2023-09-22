extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	organizeHand()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addCard(card):
	add_child(card)
	#Append Node
	
	#Make visible
	
func organizeHand():
	#Get all children, then order them in a semi circle
	#180/5 to get 5 positions = 36 deg.
	#Start at first 36 deg increment and continue around the arc of radius card height.
	var hand = self.get_children()
	var cardCount = hand.size()
	var centerOfContainer = Vector2(self.position.x + self.size.x /2,self.position.y + self.size.y /2)	
	
	if(hand):
		var leftOffset = ((hand[0].get_node("CardTexture").texture.get_size().x * cardCount)/2)
		var rotationSep = 180/cardCount
		print("Card Rotation Sep: ", rotationSep)
		
		for i in cardCount:
			var cCard = hand[i];
			var cTexture = hand[i].get_node("CardTexture").texture;
			cCard.position.x = centerOfContainer.x + leftOffset + (i*cTexture.get_size().x);
			cCard.position.y = self.position.y;
			cCard.rotation_degrees = rotationSep + (rotationSep*i);
			
			
