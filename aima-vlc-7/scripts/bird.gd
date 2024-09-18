class_name Bird extends Object

var _identifier
var picture
var common_name
var scientific_name
var traits

func _init(index : int):
	_identifier = index
	var json = load("res://data/birds.json")
	var data = json.data.birds[index]
	
	picture = load("res://" + data.source)
	common_name = data.common_name
	scientific_name = data.scientific_name
	traits = data.traits.trait_1 + data.traits.trait_2 + data.traits.trait_3
	

	
	
	
