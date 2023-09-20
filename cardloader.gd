extends Node


var itemData = {}

var data_file_path = "res://Data/cards.json"

func _ready():
	itemData = load_json_file(data_file_path)

func load_json_file(filePath : String):
	if FileAccess.file_exists(filePath):
		var json = JSON.new()
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		
		#print("dataRead",dataFile.get_as_text())
		var parsedResult = json.parse_string(dataFile.get_as_text())
		#print("ParsedResult",parsedResult, " class ", typeof(parsedResult))
		if parsedResult is Array:
			print("Result was an Array")
#			for i in parsedResult:
#				print("arrayItems ",i.Title)
			return parsedResult
		else:
			print("Error Reading JSON File: ",json.get_error_message()," in line:",json.get_error_line())
			
	else:
		print("Error JSON file Missing")
		

