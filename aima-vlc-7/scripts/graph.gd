class_name Graph extends Node

var graph : Array[Pick]
var trinketList : Array[bool]

func _init() :
	graph = []
	trinketList.resize(globals.TOTAL_BIRDS)
	trinketList.fill(false)
	
func checkTrinket(trinket : int) -> bool :
	return trinketList[trinket]
	
func addTrinket(trinket: int) :
	trinketList[trinket] = true

func updateGraph(trinket: int, bird: Bird) :
	if !trinketList[trinket]:
		trinketList[trinket] = true
		graph.append(Pick.new(trinket, bird.id))

	else:
		for pick in graph:
			if pick.trinket == trinket:
				pick.addBird(bird)
				break

func showGraph() -> Array[Pick]:
	printGraph()
	return graph

func printGraph():
	for item in graph:
		print_debug(item.trinket, item.birds)
