extends Node2D

@onready var titol: Node2D = $"."
@onready var game: Node2D = %Game
@onready var sound_buttons: AudioStreamPlayer2D = %SoundButtons

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	sound_buttons.play()
	titol.visible=false
	game.visible = true
	
