class_name Trinket extends Object

var _identifier
var picture
var name
var assignedBird

func _init(index : int):
	_identifier = index
	var json = load("res://data/trinkets.json")
	var data = json.data.trinkets[index]
	
	picture = load("res://" + data.source)
	name = data.name
	assignedBird = data.assignedBird
