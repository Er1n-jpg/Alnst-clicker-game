extends Node

var ivans: int = 0
var multiplier: int = 1
var miziplush : bool = false
var tillplush : bool = false
var lukaplush : bool = false
var hyunaplush : bool = false
var suaplush : bool = false
var dietcoke : bool = false
var guitar : bool = false
var multiplierbool : bool = false 
var mimohatbool : bool = false
var lookatmyfit : bool = false

var start_time: int = 0
var save_path = "user://variablesave"

func update_value(newivans):
		ivans = newivans

func update_accessoryvalue(newmizis, newsuas, newtills, newhyunas, newlukas):
	miziplush = newmizis
	suaplush = newsuas
	tillplush = newtills
	hyunaplush = newhyunas
	lukaplush = newlukas

func _ready():
	var start_time = Time.get_ticks_msec()
	load_data()

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(ivans)
	file.store_var(miziplush)
	file.store_var(suaplush)
	file.store_var(lukaplush)
	file.store_var(hyunaplush)
	file.store_var(tillplush)
	file.store_var(dietcoke)
	file.store_var(guitar)
	file.store_var(multiplier)
	file.store_var(mimohatbool)
	file.store_var(lookatmyfit)
	file.close()
func _process(delta):
	save()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		ivans = file.get_var(ivans)
		miziplush = file.get_var()
		suaplush = file.get_var()
		lukaplush = file.get_var()
		hyunaplush = file.get_var()
		tillplush = file.get_var()
		dietcoke = file.get_var()
		guitar = file.get_var()
		multiplier = file.get_var()
		mimohatbool = file.get_var()
		lookatmyfit = file.get_var()
		
		
	else:
		print("no loaded data")

func reset():
	ivans = 0

func guitarupdate(leob2pguitar):
	guitar = leob2pguitar

func mimoupdate(miiimohat):
	mimohatbool = miiimohat

func outfitupdates(newoutfit):
	lookatmyfit = newoutfit

func sunkencostfallacy():
	ivans = 0
	miziplush = false
	tillplush = false
	suaplush = false
	lukaplush = false
	hyunaplush = false
	guitar = false
	dietcoke = false
	multiplier = 1
	lookatmyfit = false
	mimohatbool = false

		
