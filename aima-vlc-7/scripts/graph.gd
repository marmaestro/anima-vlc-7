class_name Graph extends Node2D

var graph : Array[Pick]
var trinketList : Array[bool]
var size : int
var vectors : Array[Vector2]

@onready var background = $Background
@onready var birds = [$Urraca,$Gaviota,$Pato,$Gorrion,$Colirrojo,$Verdecillo,$Tortola,$Paloma,$Abubilla,$Lavandera]
@onready var game = $".."

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
	for pick in graph:
		for bird in pick.birds:
			vectors.append(birds[bird].position)
			if !birds[bird].visible:
				birds[bird].show()
				
	queue_redraw()
	background.show()
	
func _draw():
	
	var i = 0
	var j = 1
	while (i < vectors.size() && j < vectors.size()):
		draw_line(vectors[i], vectors[j], Color.BLACK, 5.0)
		i = j
		j += 1
