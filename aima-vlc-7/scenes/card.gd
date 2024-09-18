extends Area2D


var _name : String = "pollo"
var _spriteRoute : String = "res://sprites/birds/"
@onready var sprite: Sprite2D = $CardImage/Sprite
var _description : String = "esta to guapo el pollo ese la verda"
@onready var description: RichTextLabel = $CardImage/Container/Description
var _neededObject : String = "palo" 
@onready var size_animator: AnimationPlayer = $sizeAnimator
var isBig : bool = false
@onready var exit_button: Button = $ExitButton

var _birds : Array = ["ànec collverd", "cotxa fumada", "gavià de potes grogues", "teuladí", "gafarró", "garsa comuna"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_button.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var space = Input.is_action_pressed("Space")
	if(space): generateNewBird()
		
func generateNewBird()-> void:
	_name = _birds[randi_range(0,5)] 
	sprite.texture = load(_spriteRoute+_name+".png")
	_description = "esta to guapo el "+_name+" la verda"
	description.text=_description
			


func _on_mouse_shape_entered(shape_idx: int) -> void:
	if(!isBig):
		isBig=true
		exit_button.visible = true
		size_animator.play("getBigger")


func _on_exit_button_pressed() -> void:
	isBig=false
	exit_button.visible = false
	size_animator.play("getSmaller")
