extends Node2D

@onready var titol: Node2D = $"."
@onready var game: Node2D = %Game
@onready var button_sounds: AudioStreamPlayer2D = %ButtonSounds


func _on_button_pressed() -> void:
	button_sounds.play()
	titol.visible = false
	game.visible = true
