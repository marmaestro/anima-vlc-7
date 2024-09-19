extends Node2D

const TOTAL_BIRDS : int = 10
var _birds : Array[Bird]
var birdList : Array[int]
var _trinkets : Array[Trinket]
var trinketList : Array[int]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in TOTAL_BIRDS:
		_birds.append(Bird.new(i))
		_trinkets.append(Trinket.new(i))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func isBirdInList(birdIndex : int) -> bool:
	for bird in birdList:
		if(bird == birdIndex): return true
	birdList.append(birdIndex)
	return false

func clearBirdList() -> void:
	birdList = []

func isTrinketInList(trinketIndex : int) -> bool:
	for trinket in trinketList:
		if(trinket == trinketIndex):return true
	trinketList.append(trinketIndex)
	return false
