extends Sprite2D

var _name : String = "pollo"
var _spriteRoute : String = "res://sprites/birds/"
@onready var sprite: Sprite2D = $Sprite #load(ruta)
var _description : String = "esta to guapo el pollo ese la verda"
@onready var description: RichTextLabel = $Container/Description
var _neededObject : String = "palo" 

var _birds : Array = ["AnadeAzulon", "ColirrojoTizon", "GaviotaPatiamarilla", "GorrionComun", "SerinVerdecillo", "UrracaComun"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var space = Input.is_action_pressed("Space")
	if(space): generateNewBird()
		
func generateNewBird()-> void:
	_name = _birds[randi_range(0,5)] 
	sprite.texture = load(_spriteRoute+_name+".png")
	_description = "esta to guapo el "+_name+"la verda"
	description.text=_description
	
