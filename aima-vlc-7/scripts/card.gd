extends Area2D

var _bird
@onready var _name : RichTextLabel = $CardImage/Container3/Name
@onready var _scientific : RichTextLabel = $CardImage/Container2/Scientific

@onready var sprite : Sprite2D = $CardImage/Sprite
@onready var _description : RichTextLabel = $CardImage/Container/Description
var _neededObject

@onready var size_animator : AnimationPlayer = $sizeAnimator
var isBig : bool = false
@onready var exit_button : Button = $ExitButton
@onready var select_button : Button = $SelectButton
@onready var cards : Node2D = %Cards
	

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
	var i : int = randi_range(0,9)
	if (!cards.isBirdInList(i)):
		_bird = Bird.new(i)
		_setNames()
		sprite.texture = _bird.picture
	else: generateNewBird()


func _on_mouse_shape_entered(shape_idx: int) -> void:
	if(!isBig):
		isBig = true
		exit_button.visible = true
		size_animator.play("getBigger")


func _on_exit_button_pressed() -> void:
	print("exit")
	animationSmall()

func animationSmall() -> void:
	isBig = false
	exit_button.visible = false
	size_animator.play("getSmaller")
	
func _setNames() -> void:
	
	_name.clear()
	_name.push_bold()
	_name.pop()
	_name.add_text(_bird.common_name)
	
	_scientific.clear()
	_scientific.push_bold_italics()
	_scientific.pop()
	_scientific.add_text(_bird.scientific_name)
	
	_description.clear()
	_description.add_text(_bird.traits)
