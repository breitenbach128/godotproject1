extends TextureRect

var cardScene = preload("res://card.tscn")
var handCount = 0;
var deck = [];
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	if(Cardloader.carddeck.size() > 0):
		load_deck(Cardloader.carddeck)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func load_deck(newdeck):
	deck = newdeck;
	for d in deck:
		#print("Load_deck data: ", d.cuid)
		var newCard = cardScene.instantiate();
		newCard.set_card_values(d)
		newCard.set_position(Vector2(-200,0))
		self.add_child(newCard)

func draw_card():	
	var children  = get_children()
	var hand = get_parent().get_node("CardHand")
	if(hand.get_children().size() < 5):
		#Grab Random Card from Deck, remove from deck and add to hand
		var r = rng.randi_range(0,get_child_count()-1)
		if(r):
			var sCard = children[r]
			self.remove_child(sCard)
			hand.add_card(sCard)
		



func _on_button_pressed():
	draw_card()
