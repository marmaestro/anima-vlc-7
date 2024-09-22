class_name Bird extends Object

var id : int
var picture : Texture2D
var common_name : String
var scientific_name : String
var traits : String

func _init(index : int):
	id = index
	var json = load("res://databases/birds.json")
	var data = json.data.birds[index]
	
	picture = load("res://" + data.source)
	common_name = tr(data.common_name)
	scientific_name = data.scientific_name
	traits = tr(data.traits.trait_1) + "\n" + tr(data.traits.trait_2) + "\n" + tr(data.traits.trait_3)
	

	
	
	
