class_name Trinket extends Object

var id : int
var birdIds : Array
var picture : Texture2D
var scale : Vector2
var name : String
var description : String

func _init(index : int):
	id = index
	var json = load("res://databases/trinkets.json")
	var data = json.data.trinkets[index]
	
	birdIds = data.bird_ids
	picture = load("res://" + data.source)
	scale = Vector2(data.scale, data.scale)
	name = tr(data.name)
	description = tr(data.description)
	
