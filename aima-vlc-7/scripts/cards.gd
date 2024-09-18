extends Node2D

var birdList : Array = Array([])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func isBirdInList(bird : String) -> bool:
	for birbs in birdList:
		if(birbs == bird): return true
	birdList.append(bird)
	return false

func clearBirdList() -> void:
	birdList = []
