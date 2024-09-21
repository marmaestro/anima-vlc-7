extends Area2D

@onready var cards: Node2D = %Cards
@onready var letter_animator: AnimationPlayer = $letterAnimator
@onready var next: Button = $Letter/Next
@onready var card: Area2D = $"../Cards/Card"
@onready var card_2: Area2D = $"../Cards/Card2"
@onready var card_3: Area2D = $"../Cards/Card3"

var _trinket
@onready var _name: RichTextLabel = $Letter/Container2/Name
@onready var _description: RichTextLabel = $Letter/Container/Description
@onready var _sprite: Sprite2D = $Letter/Object


var success : int = 0
@onready var points: RichTextLabel = $Points

func _ready() -> void:
	points.text = str(success)
	generateLetter()

func _process(delta: float) -> void:
	pass

func _on_next_pressed() -> void:
	letter_animator.play("getSmaller")
	card.generateNewBird()
	card_2.generateNewBird()
	card_3.generateNewBird()
	card.animationSmall()
	card_2.animationSmall()
	card_3.animationSmall()


func generateLetter() -> void:
	var i : int = randi_range(0,9)
	if (!cards.isTrinketInList(i)):
		_trinket = Trinket.new(i)
		_setLetter()
	else: generateLetter()
	
	letter_animator.play("big")
	cardsInvisible()
	
func cardsVisible() -> void:
	cards.visible=true
	next.visible = false	

func cardsInvisible() -> void:
	cards.visible=false
	next.visible = true	


func _on_select_button1_pressed() -> void:
	if(card.name == _trinket.assignedBird): addSuccess()
	cards.clearBirdList()
	generateLetter()

func _on_select_button2_pressed() -> void:
	if(card_2.name == _trinket.assignedBird): addSuccess()
	cards.clearBirdList()
	generateLetter()

func _on_select_button3_pressed() -> void:
	if(card_3.name == _trinket.assignedBird): addSuccess()
	cards.clearBirdList()
	generateLetter()

func addSuccess()->void:
	success += 1
	points.text = str(success)

func _setLetter() -> void:	
	_name.clear()
	_name.push_bold()
	_name.add_text(_trinket.name)
	
	_description.clear()
	_description.add_text(_trinket.description)
	
	_sprite.texture = _trinket.picture
	_sprite.scale = _trinket.scale
