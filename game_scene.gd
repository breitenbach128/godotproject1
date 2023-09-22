extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var cl = Cardloader
	print("item 0 from cards ", cl.itemData[0].Title," ",cl.itemData[0].Count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
