extends Area2D

#var _trinket : Trinket

@onready var cards: Node2D = %Cards
@onready var letter_animator: AnimationPlayer = $letterAnimator
@onready var next: Button = $Letter/Next
@onready var card: Area2D = $"../Cards/Card"
@onready var card_2: Area2D = $"../Cards/Card2"
@onready var card_3: Area2D = $"../Cards/Card3"
@onready var description: RichTextLabel = $Letter/Container/Description

var objects : Array = ["palo", "tomate", "lechuga", "moneda"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generateLetter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	description.text = objects[randi_range(0,3)]
	#_setText()
	
	letter_animator.play("big")
	cardsInvisible()
	
func cardsVisible() -> void:
	cards.visible=true
	next.visible = false	

func cardsInvisible() -> void:
	cards.visible=false
	next.visible = true	


func _on_select_button_pressed() -> void:
	cards.clearBirdList()
	generateLetter()

#func _setText() -> void:
	#_description.clear()
	#_description.push_bold()
	#_description.pop()
	#_description.add_text(_trinket.name)
	#
	#_description.clear()
	#_description.add_text(_trinket.description)
