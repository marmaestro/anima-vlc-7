class_name Bird extends Object

var id : int
var picture : Texture2D
var common_name : String
var scientific_name : String
var traits : String
var sound : AudioStream

func _init(index : int):
	id = index
	var json = load("res://databases/birds.json")
	var data = json.data.birds[index]
	
	picture = load("res://" + data.source)
	common_name = tr(data.common_name)
	scientific_name = data.scientific_name
	traits = tr(data.traits[0]) + "\n" + tr(data.traits[1]) + "\n" + tr(data.traits[2])
	sound = load("res://sounds/"+data.sound)

	
	
	
