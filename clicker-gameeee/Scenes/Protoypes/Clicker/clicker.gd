class_name ProtoypeClicker
extends Control
var save_path = "user://variablesave"
@export var label = Label
var start_time: int = 0
@onready var playlabel = $"Now playing"



var ivans: int = Global.ivans
var lastvar: int = 0

func _ready() -> void:
	Global.update_value(ivans)
	load_data()
	update_label_text()
	start_time = Time.get_ticks_msec()
	$AudioStreamPlayer.play()
	
func _process(delta):
	var currentime = Time.get_ticks_msec()	
	var elapsedtime = currentime - start_time
	var elapsedtimeseconds = elapsedtime/1000
	if elapsedtimeseconds/10 == 0:
		save()
	manualrefresh()
	Global.update_value(ivans)
	
func create_ivans() -> void:
	ivans += 1
	lastvar = ivans
	update_label_text()
	print ($AudioStreamPlayer.stream.resource_path)
	if Global.mimohatbool == true:
		ivans * 2
	else:
		pass
	
	

func update_label_text() -> void:
	label.text = "Ivans count: %s" %ivans
	
func _on_button_pressed() -> void:
	create_ivans()
	
func _on_save_pressed() -> void:
	save()



func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(ivans)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		ivans = file.get_var(ivans)
	else:
		print("no loaded data")
		
		
func delete_save_data():
	ivans = 0
	
func _on_button_2_pressed() -> void:
	delete_save_data()
	
func get_audio_file() -> String:
	if $AudioStreamPlayer.stream:
		return $AudioStreamPlayer.stream.resource_path
	else:
		return "No audio loaded"
	

func _on_s_hop_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Protoypes/shop.tscn')

func manualrefresh():
	if lastvar != Global.ivans:
		lastvar = Global.ivans

func sortaudiofiles():
	var audiofile = get_audio_file()
	if audiofile == "res://Scenes/Protoypes/Clicker/clicker.tscn::AudioStreamPlaylist_b6l8n":
		playlabel.text = "Blink gone instrumental"
	#elif audiofile == 
