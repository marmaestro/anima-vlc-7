extends Area2D

var bird
@onready var _name : RichTextLabel = $CardImage/Container3/Name
@onready var _scientific : RichTextLabel = $CardImage/Container2/Scientific

@onready var sprite : Sprite2D = $CardImage/Sprite
@onready var _description : RichTextLabel = $CardImage/Container/Description

@onready var size_animator : AnimationPlayer = $sizeAnimator
var isBig : bool = false
@onready var exit_button : Button = $ExitButton
@onready var select_button : Button = $SelectButton
@onready var cards : Node2D = %Cards
	
func _ready():
	size_animator.play("small")
	exit_button.visible = false

func _process(delta: float):
	pass

#func _physics_process(delta: float) -> void:
	#var space = Input.is_action_pressed("Space")
	#if(space): generateNewBird()
		
#func generateNewBird() -> void:
	#var i : int = randi_range(0,GLOBALS.TOTAL_BIRDS)
	#if (!cards.isBirdInList(i)):
		#bird = Bird.new(i)
		#_setBird()
	#else: generateNewBird()
	
func generateBird(id : int):
	bird = Bird.new(id)
	_setBird()

func _on_mouse_shape_entered(shape_idx: int):
	if(!isBig):
		isBig = true
		exit_button.visible = true
		size_animator.play("getBigger")


func _on_exit_button_pressed():
	print("exit")
	animationSmall()

func animationSmall():
	isBig = false
	exit_button.visible = false
	size_animator.play("getSmaller")
	
func _setBird():
	_name.clear()
	_name.push_bold()
	_name.add_text(bird.common_name)
	
	_scientific.clear()
	_scientific.push_bold_italics()
	_scientific.add_text(bird.scientific_name)
	
	_description.clear()
	_description.add_text(bird.traits)

	sprite.texture = bird.picture
