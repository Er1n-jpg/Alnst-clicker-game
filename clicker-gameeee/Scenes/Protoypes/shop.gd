extends Control


var miziplush : bool = Global.miziplush 
var tillplush : bool = Global.tillplush
var lukaplush : bool = Global.lukaplush
var hyunaplush : bool = Global.hyunaplush
var suaplush : bool = Global.suaplush
var dietcoke : bool = Global.dietcoke
var guitar : bool = Global.guitar
var multiplierbool : bool = Global.multiplierbool
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
@onready var multipliier = $multiplier
@onready var mimohat = $"mimo hat"

var ivans = Global.ivans

func _process(delta):
		var ivans = Global.ivans
		print (ivans)
		Global.update_value(ivans)
		
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")



func _on_mizi_plush_pressed() -> void:
	if ivans >= 80: 
		miziplush = true
		suaplush = false
		tillplush = false
		lukaplush = false
		hyunaplush = false
		
	else:
		mizibutton.text = "Not enough, Mizi dissaproves"
		await get_tree().create_timer(2.0).timeout
		mizibutton.text = "Mizi plush"
		
		

		
func _on_till_plush_pressed() -> void:
	if ivans >= 80:
		tillplush = true
		suaplush = false
		miziplush = false
		lukaplush = false
		hyunaplush = false
		ivans =- 80
	else:
		tillbutton.text = "Not enough, till dissaproves"
		await get_tree().create_timer(2.0).timeout
		tillbutton.text = "Till plush"
		
func _on_sua_plush_pressed() -> void:
	if ivans >= 80:
		suaplush = true
		ivans =- 80
	else: 
		suabutton.text = "Not enough, sua dissaproves"
		await get_tree().create_timer(2.0).timeout
		suabutton.text = "Sua plush"


func _on_luka_plush_pressed() -> void:
	if ivans >= 80:
		lukaplush = true
		tillplush = false
		suaplush = false
		miziplush = false
		hyunaplush = false
		ivans =- 80
	else:
		lukabutton.text = "Not enough, luka dissaproves"
		await get_tree().create_timer(2.0).timeout
		lukabutton.text = "Luka plush"
	


func _on_hyuna_plush_pressed() -> void:
	if ivans >= 80:
		lukaplush = true
		tillplush = false
		suaplush = false
		miziplush = false
		hyunaplush = false
		ivans = ivans - 80
	else: 
		hyunabutton.text = "Not enough, hyuna dissaproves"
		await get_tree().create_timer(2.0).timeout
		hyunabutton.text = "Hyuna button"


func _on_outfit_pressed() -> void:
	if ivans >= 120:
		lookatmyfit = true
		ivans = ivans - 120
	else: 
		outfitchange.text = "Not enough :("
		await get_tree().create_timer(2.0).timeout
		outfitchange.text = "ivan gets a new outfit"
		

func _on_guitar_pressed() -> void:
	if ivans >= 200:
		guitar = true
		ivans = ivans - 200
	else:
		getaguitar.text = "Not enough :("
		await get_tree().create_timer(2.0).timeout
		getaguitar.text = "Guitar???(swag option)"

func _on_diet_coke_pressed() -> void:
	if ivans >= 250:
		dietcoke = true
		ivans = ivans -250
	else:
		dietcokee.text = "No diet coke for you"
		await get_tree().create_timer(2.0).timeout
		dietcokee.text = "Ivan gets a diet coke"
		
		

func _on_multiplier_pressed() -> void:
	if ivans >= 400:
		multiplierbool = true
		multipliier.text = "sold!"
		ivans = ivans - 400
		Global.update_value(ivans)
	else:
		multipliier.text = "not enough lol"
		


func _on_mimo_hat_pressed() -> void:
	if ivans >= 350: 
		mimohatbool = true
		ivans = ivans -350
		Global.update_value(ivans)
		
	else:
		mimohat.text = "no swag for you"
		await get_tree().create_timer(2.0).timeout
		mimohat.text = "Ivan gets a mimo hat"
