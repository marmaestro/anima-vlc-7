class_name Trinket extends Object

var _identifier
var picture
var name
var description
var assignedBird

func _init(index : int):
	_identifier = index
	var json = load("res://databases/trinkets.json")
	var data = json.data.trinkets[index]
	
	
	picture = load("res://" + data.source)
	name = tr(data.name)
	description = tr(data.description)
	assignedBird = data.assigned_bird
	
