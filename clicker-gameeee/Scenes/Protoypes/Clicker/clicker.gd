class_name ProtoypeClicker
extends Control
var save_path = "user://variablesave"
@export var label = Label

var ivans: int = 0

func _ready() -> void:
	update_label_text()
	print(get_path())

	
func create_ivans() -> void:
	ivans += 1
	print(ivans)
	update_label_text()

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
