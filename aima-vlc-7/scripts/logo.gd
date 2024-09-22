extends Node2D
@onready var traducciones: Node2D = %Traducciones
@onready var logo: Node2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func animacionLogo():
	traducciones.visible=true
	logo.visible=false
