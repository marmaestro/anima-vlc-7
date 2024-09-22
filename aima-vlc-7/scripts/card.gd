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

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var button_sounds: AudioStreamPlayer2D = %"ButtonSounds"
	
func _ready():
	size_animator.play("small")
	exit_button.visible = false

func _process(delta: float):
	pass
	
func generateBird(id : int):
	bird = Bird.new(id)
	_setBird()

func _on_mouse_shape_entered(shape_idx: int):
	if(!isBig):
		isBig = true
		exit_button.visible = true
		size_animator.play("getBigger")
		audio_stream_player_2d.play()


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
	audio_stream_player_2d.stream = bird.sound
