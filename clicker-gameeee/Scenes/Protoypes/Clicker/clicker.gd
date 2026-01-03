class_name ProtoypeClicker
extends Control
@export var label = Label
var ivans: int = Global.ivans
var lastvar: int = 0

@onready var miziplushimg = $Button/Miziplush
@onready var tillplushimg = $"Button/till plush"
@onready var suaplushimg = $"Button/sua plush"
@onready var lukaplushimg = $"Button/luka plush"
@onready var hyunaplushimg = $"Button/hyuna plush"
@onready var guitarimg = $Button/guitar
@onready var dietcokeimg =$"Button/diet coke"
@onready var mimohatimg = $"Button/mimo hat"

func _ready() -> void:
	Global.update_value(ivans)
	Global.load_data()
	update_label_text()
	$AudioStreamPlayer.play()
	miziplushimg.hide()
	tillplushimg.hide()
	lukaplushimg.hide()
	hyunaplushimg.hide()
	guitarimg.hide()
	dietcokeimg.hide()
	mimohatimg.hide()
	suaplushimg.hide()
	
		

func _process(delta):
	Global.update_value(ivans)	
	if Global.miziplush == true:
		miziplushimg.show()
	elif Global.tillplush == true:
		tillplushimg.visible = true
	elif Global.suaplush == true:
		suaplushimg.visible = true
	elif Global.lukaplush == true:
		lukaplushimg.visible = true
	elif Global.hyunaplush == true:
		hyunaplushimg.visible = true
		
	
	if Global.guitar == true:
		guitarimg.visible = true
	
	if Global.dietcoke == true:
		dietcokeimg.visible = true
	
	if Global.mimohatbool == true:
		mimohatimg.visible = true
		
func create_ivans() -> void:
	ivans += 1 * Global.multiplier
	lastvar = ivans
	update_label_text()

		
	
	

func update_label_text() -> void:
	label.text = "Ivans count: %s" %ivans
	
func _on_button_pressed() -> void:
	create_ivans()

	
func _on_button_2_pressed() -> void:
	Global.sunkencostfallacy()
	Global.update_value(ivans)	

func _on_s_hop_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Protoypes/shop.tscn')

func manualrefresh():
	if lastvar != Global.ivans:
		lastvar = Global.ivans




func _on_letter_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Protoypes/letter.tscn')
