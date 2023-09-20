extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("item 0 from cards ", Cardloader.itemData[0].Title)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
