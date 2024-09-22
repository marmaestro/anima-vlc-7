class_name Pick extends Object

var trinket : int
var birds : Array[int]    

func _init(trink : int, bird : int) :
	trinket = trink
	birds = [bird]
	
func addBird(bird : Bird) :
	birds.append(bird.id)
