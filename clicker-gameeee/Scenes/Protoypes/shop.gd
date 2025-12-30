extends Control

var ivans = Global.ivans
var miziplush : bool = Global.miziplush 
var tillplush : bool = Global.tillplush
var lukaplush : bool = Global.lukaplush
var hyunaplush : bool = Global.hyunaplush
var suaplush : bool = Global.suaplush
var dietcoke : bool = Global.dietcoke
var guitar : bool = Global.guitar
var multiplier : bool = Global.multiplierbool
var mimohatbool : bool = Global.mimohatbool
var lookatmyfit : bool = Global.lookatmyfit

@onready var mizibutton = $"Mizi plush"
@onready var tillbutton = $"till plush"
@onready var suabutton = $"Sua plush"
@onready var lukabutton = $"luka plush"
@onready var hyunabutton = $"Hyuna plush"
@onready var outfitchange = $outfit
@onready var getaguitar = $guitar
@onready var dietcokee = $"diet coke"
@onready var multipliier = $"mimo hat"
@onready var mimohat = $"mimo hat"

	
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")



func _on_mizi_plush_pressed() -> void:
	if ivans >= 80: 
		miziplush = true
	else:
		mizibutton.text = "Not enough!! try again later!"
		await get_tree().create_timer(2.0).timeout
		mizibutton.text = "Mizi plush"
		
		

		
func _on_till_plush_pressed() -> void:
	if ivans >= 80:
		tillplush = true
		suaplush = false
		miziplush = false
		lukaplush = false
		hyunaplush = false
	else:
		tillbutton.text = "Not enough!! Try harder lol"
		await get_tree().create_timer(2.0).timeout
		tillbutton.text = "Till plush"
		
func _on_sua_plush_pressed() -> void:
	if ivans >= 80:
		suaplush = true
	else: 
		suabutton.text = "Not enough, Skill issue lol"
		await get_tree().create_timer(2.0).timeout
		suabutton.text = "Sua plush"


func _on_luka_plush_pressed() -> void:
	if ivans >= 80:
		lukaplush = true
	


func _on_hyuna_plush_pressed() -> void:
	pass # Replace with function body.


func _on_outfit_pressed() -> void:
	pass # Replace with function body.


func _on_guitar_pressed() -> void:
	pass # Replace with function body.


func _on_diet_coke_pressed() -> void:
	pass # Replace with function body.


func _on_multiplier_pressed() -> void:
	pass # Replace with function body.


func _on_mimo_hat_pressed() -> void:
	pass # Replace with function body.
