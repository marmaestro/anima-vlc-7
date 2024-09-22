extends Node2D

@onready var titol: Node2D = %Titol
@onready var traducciones: Node2D = $"."
@onready var sound_buttons: AudioStreamPlayer2D = %SoundButtons



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_valencia_pressed() -> void:
	sound_buttons.play()
	TranslationServer.set_locale("ca")
	traducciones.visible=false
	titol.visible =true

func _on_castellano_pressed() -> void:
	sound_buttons.play()
	TranslationServer.set_locale("es")
	traducciones.visible=false
	titol.visible =true
