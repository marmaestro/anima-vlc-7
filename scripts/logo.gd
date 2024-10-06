extends Node2D
@onready var traducciones: Node2D = %Traducciones
@onready var logo: Node2D = $"."


func animacionLogo():
	traducciones.visible = true
	logo.visible = false
