extends Node2D

@onready var titol: Node2D = %Titol
@onready var traducciones: Node2D = $"."
@onready var button_sounds: AudioStreamPlayer2D = %ButtonSounds
@onready var letter: Area2D = %Letter



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_valencia_pressed() -> void:
	button_sounds.play()
	TranslationServer.set_locale("ca")
	traducciones.visible=false
	titol.visible =true
	letter.generateLetter()
	
func _on_castellano_pressed() -> void:
	button_sounds.play()
	TranslationServer.set_locale("es")
	traducciones.visible=false
	titol.visible =true
	letter.generateLetter()
