class_name Graph extends Node

var graph : Array[Pick]
var trinketList : Array[bool]
var size : int

@onready var birds = [$Urraca,$Gaviota,$Pato,$Gorrion,$Colirrojo,$Verdecillo,$Tortola,$Paloma,$Abubilla,$Lavandera]

func _init() :
	graph = []
	size = 0
	trinketList.resize(globals.TOTAL_BIRDS)
	trinketList.fill(false)
	
func checkTrinket(trinket : int) -> bool :
	return trinketList[trinket]

func updateGraph(trinket: int, bird: Bird) :
	if !trinketList[trinket] :
		trinketList[trinket] = true
		graph.append(Pick.new(trinket, bird))
		size += 1
		
	else:
		for pick in graph:
			if pick.trinket == trinket:
				pick.addBird(bird)
				break

func showGraph() :
	var vectors : Array[Vector2]
	for pick in graph:
		for bird in pick.birds:
			if !birds[bird].visible:
				birds[bird].show()
				vectors.append(birds[bird].transform.position)
	_draw(vectors)
	
func _draw(vectors):
	pass
