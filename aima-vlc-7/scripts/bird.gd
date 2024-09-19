class_name Bird extends Object

var _identifier
var picture
var common_name
var scientific_name
var traits

func _init(index : int):
	_identifier = index
	var json = load("res://databases/birds.json")
	var data = json.data.birds[index]
	
	picture = load("res://" + data.source)
	common_name = tr(data.common_name)
	scientific_name = data.scientific_name
	traits = tr(data.traits.trait_1) + "\n" + tr(data.traits.trait_2) + "\n" + tr(data.traits.trait_3)
	

	
	
	
