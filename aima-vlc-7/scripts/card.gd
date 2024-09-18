extends Area2D

var _bird
var _name
var _spriteRoute
@onready var sprite: Sprite2D = $CardImage/Sprite
var _description
@onready var description: RichTextLabel = $CardImage/Container/Description
var _neededObject

@onready var size_animator: AnimationPlayer = $sizeAnimator
var isBig : bool = false
@onready var exit_button: Button = $ExitButton
@onready var select_button: Button = $SelectButton
@onready var cards: Node2D = %Cards

#var _birds : Array = ["ànec collverd", "cotxa fumada", "gavià de potes grogues", "teuladí", "gafarró", "garsa comuna"]

	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	size_animator.play("small")
	exit_button.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var space = Input.is_action_pressed("Space")
	if(space): generateNewBird()
		
func generateNewBird() -> void:
	var i : int = randi_range(0,5)
	if (!cards.isBirdInList(i)):
		_bird = Bird.new(i)
		_name = _bird.common_name
		sprite.texture = _bird.picture
		_description = _bird.traits
		description.text = _description
	else: generateNewBird()


func _on_mouse_shape_entered(shape_idx: int) -> void:
	if(!isBig):
		isBig = true
		exit_button.visible = true
		size_animator.play("getBigger")


func _on_exit_button_pressed() -> void:
	print("exit")
	isBig = false
	exit_button.visible = false
	size_animator.play("getSmaller")


func _on_select_button_pressed() -> void:
	pass # Replace with function body.
