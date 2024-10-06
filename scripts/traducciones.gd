extends Node2D

@onready var titol: Node2D = %Titol
@onready var traducciones: Node2D = $"."
@onready var button_sounds: AudioStreamPlayer2D = %ButtonSounds
@onready var letter: Area2D = %Letter
@onready var music: AudioStreamPlayer2D = %Music



func _on_valencia_pressed() -> void:
	button_sounds.play()
	music.play()
	TranslationServer.set_locale("ca")
	traducciones.visible=false
	titol.visible =true
	letter.generateLetter()
	
func _on_castellano_pressed() -> void:
	music.play()
	button_sounds.play()
	TranslationServer.set_locale("es")
	traducciones.visible=false
	titol.visible =true
	letter.generateLetter()
