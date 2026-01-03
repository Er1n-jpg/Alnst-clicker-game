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
		miziplush = Global.miziplush
		suaplush = Global.suaplush
		lukaplush = Global.lukaplush
		
		
		print (ivans)
		
		
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
	Global.save()

func _on_mizi_plush_pressed() -> void:
	if ivans >= 80: 
		miziplush = true
		ivans -= 80
		Global.update_value(ivans)
		Global.update_accessoryvalue(true, false,false,false,false)
	else:
		mizibutton.text = "Not enough, Mizi dissaproves"
		await get_tree().create_timer(2.0).timeout
		mizibutton.text = "Mizi plush"
		
		

		
func _on_till_plush_pressed() -> void:
	if ivans >= 80:
		tillplush = true
		ivans -= 80
		Global.update_value(ivans)
		Global.update_accessoryvalue(false, false, true, false, false )
		
	else:
		tillbutton.text = "Not enough, till dissaproves"
		await get_tree().create_timer(2.0).timeout
		tillbutton.text = "Till plush"
		
func _on_sua_plush_pressed() -> void:
	if ivans >= 80:
		suaplush = true
		ivans -= 80
		Global.update_value(ivans)
		Global.update_accessoryvalue(false,true,false,false,false)
	else: 
		suabutton.text = "Not enough, sua dissaproves"
		await get_tree().create_timer(2.0).timeout
		suabutton.text = "Sua plush"


func _on_luka_plush_pressed() -> void:
	if ivans >= 80:
		lukaplush = true
		ivans -= 80
		Global.update_value(ivans)
		Global.update_accessoryvalue(false, false ,false ,false, true)
	else:
		lukabutton.text = "Not enough, luka dissaproves"
		await get_tree().create_timer(2.0).timeout
		lukabutton.text = "Luka plush"
	


func _on_hyuna_plush_pressed() -> void:
	if ivans >= 80:
		hyunaplush = true
		ivans -= 80
		Global.update_value(ivans)
		Global.update_accessoryvalue(false, false, false, true, false)
	else: 
		hyunabutton.text = "Not enough, hyuna dissaproves"
		await get_tree().create_timer(2.0).timeout
		hyunabutton.text = "Hyuna button"


func _on_outfit_pressed() -> void:
	if ivans >= 120:
		lookatmyfit = true
		ivans -= 120
		Global.update_value(ivans)
	else: 
		outfitchange.text = "Not enough :("
		await get_tree().create_timer(2.0).timeout
		outfitchange.text = "ivan gets a new outfit"
		

func _on_guitar_pressed() -> void:
	if ivans >= 200:
		guitar = true
		ivans -= 200
		Global.update_value(ivans)
	else:
		getaguitar.text = "Not enough :("
		await get_tree().create_timer(2.0).timeout
		getaguitar.text = "Guitar???(swag option)"

func _on_diet_coke_pressed() -> void:
	if ivans >= 250:
		dietcoke = true
		ivans -= 250
		Global.update_value(ivans)
	else:
		dietcokee.text = "No diet coke for you"
		await get_tree().create_timer(2.0).timeout
		dietcokee.text = "Ivan gets a diet coke"
		
		

func _on_multiplier_pressed() -> void:
	if ivans >= 400:
		multiplierbool = true
		multipliier.text = "sold!"
		ivans -= 400
		Global.update_value(ivans)
		Global.multiplier += 2
	else:
		multipliier.text = "not enough lol"
		


func _on_mimo_hat_pressed() -> void:
	if ivans >= 350: 
		mimohatbool = true
		ivans -= 350
		Global.update_value(ivans)
		
	else:
		mimohat.text = "no swag for you"
		await get_tree().create_timer(2.0).timeout
		mimohat.text = "Ivan gets a mimo hat"
		
func _on_mizi_plush_mouse_entered() -> void:
	mizibutton.text = "80 ivans"

func _on_mizi_plush_mouse_exited() -> void:
	mizibutton.text = "mizi plush"


func _on_till_plush_mouse_entered() -> void:
	tillbutton.text = "80 ivans"



func _on_sua_plush_mouse_entered() -> void:
	suabutton.text = "80 ivans"


func _on_luka_plush_mouse_entered() -> void:
	lukabutton.text = "80 ivans"


func _on_hyuna_plush_mouse_entered() -> void:
	hyunabutton.text = "80 ivans"

func _on_guitar_mouse_entered() -> void:
	getaguitar.text = "200 ivans"


func _on_diet_coke_mouse_entered() -> void:
	dietcokee.text = "250 ivans"

func _on_multiplier_mouse_entered() -> void:
	multipliier.text = "400 ivans"


func _on_mimo_hat_mouse_entered() -> void:
	mimohat.text = "350 ivans"


func _on_till_plush_mouse_exited() -> void:
	tillbutton.text = "till plush"

func _on_sua_plush_mouse_exited() -> void:
	suabutton.text = "sua plush"

func _on_luka_plush_mouse_exited() -> void:
	lukabutton.text = "luka plush"
	

func _on_hyuna_plush_mouse_exited() -> void:
	hyunabutton.text = "hyuna plush"


func _on_outfit_mouse_entered() -> void:
	pass


func _on_outfit_mouse_exited() -> void:
	outfitchange.text = "omg new outfit"


func _on_guitar_mouse_exited() -> void:
	getaguitar.text = "Guitar???(Swag option)"


func _on_diet_coke_mouse_exited() -> void:
	dietcokee.text = "Ivan gets a diet coke"


func _on_multiplier_mouse_exited() -> void:
	multipliier.text = "Ivan multiplier (x2) can stack"


func _on_mimo_hat_mouse_exited() -> void:
	mimohat.text = "Ivan gets a mimo hat"
