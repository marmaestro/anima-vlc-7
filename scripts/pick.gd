class_name Pick extends Object

var trinket : int
var birds : Array[int]    

func _init(trink : int, bird : Bird) :
	trinket = trink
	birds = [bird.id]
	
func addBird(bird : Bird) :
	birds.append(bird.id)
