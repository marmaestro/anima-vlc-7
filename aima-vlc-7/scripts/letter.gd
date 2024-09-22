extends Area2D

@onready var letter = %Letter
@onready var cards: Node2D = %Cards
@onready var letter_animator: AnimationPlayer = $letterAnimator
@onready var next: Button = $Letter/Next
@onready var card: Area2D = $"../Cards/Card"
@onready var card_2: Area2D = $"../Cards/Card2"
@onready var card_3: Area2D = $"../Cards/Card3"

var _trinket : Trinket
@onready var _name: RichTextLabel = $Letter/Container2/Name
@onready var _description: RichTextLabel = $Letter/Container/Description
@onready var _sprite: Sprite2D = $Letter/Object

@onready var _graph: Graph = $"../Graph"

var success : int = 0
@onready var points: RichTextLabel = $Points


@onready var sound_buttons: AudioStreamPlayer2D = $SoundButtons

func _ready() -> void:
	generateLetter()

func _process(delta: float) :
	pass

func _on_next_pressed() :
	sound_buttons.play()
	letter_animator.play("getSmaller")
	card.generateBird(_trinket.birdIds[0])
	card_2.generateBird(_trinket.birdIds[1])
	card_3.generateBird(_trinket.birdIds[2])
	card.animationSmall()
	card_2.animationSmall()
	card_3.animationSmall()


func generateLetter() :
	if (!_graph.size >= globals.PLAY_ITERATIONS) :
		var i : int = randi_range(0, globals.TOTAL_BIRDS - 1)
		if (!_graph.checkTrinket(i)):
			_trinket = Trinket.new(i)
			_setLetter()
		else:
			generateLetter()
	else:
		hideCards()
		_graph.showGraph()
	
	letter_animator.play("big")
	cardsInvisible()
	
func cardsVisible() :
	cards.visible = true
	next.visible = false	

func cardsInvisible() -> void:
	cards.visible = false
	next.visible = true	

func _on_select_button1_pressed() :
	sound_buttons.play()
	if(card.bird.id == _trinket.id): addSuccess()
	_graph.updateGraph(_trinket.id, card.bird)
	generateLetter()

func _on_select_button2_pressed() :
	sound_buttons.play()
	if(card_2.bird.id == _trinket.id): addSuccess()
	_graph.updateGraph(_trinket.id, card_2.bird)
	generateLetter()

func _on_select_button3_pressed() :
	sound_buttons.play()
	if(card_3.bird.id == _trinket.id): addSuccess()
	_graph.updateGraph(_trinket.id, card_3.bird)
	generateLetter()

func addSuccess() :
	success += 1

func _setLetter() :	
	_name.clear()
	_name.push_bold()
	_name.add_text(_trinket.name)
	
	_description.clear()
	_description.add_text(_trinket.description)
	
	_sprite.texture = _trinket.picture
	_sprite.scale = _trinket.scale

func hideCards() :
	letter.visible = false
	cards.visible = false
	
