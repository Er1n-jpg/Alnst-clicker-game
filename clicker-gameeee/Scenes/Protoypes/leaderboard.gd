extends Control
@onready var my_popup = $Popup
@onready var line_edit: LineEdit = $Popup/LineEdit
@onready var label1: Label = $Popup/Label
@onready var Scrollcontainer = $VBoxContainer/ScrollContainer
@onready var playerrank = $VBoxContainer/ScrollContainer/VBoxContainer/Playerscores
@onready var playername = $VBoxContainer/ScrollContainer/VBoxContainer/Playerscores/Playername
@onready var playerscore = $VBoxContainer/ScrollContainer/VBoxContainer/Playerscores/Playerscore
@onready var playerscorecontainer = $VBoxContainer/Playerscores
@onready var noscores = $Label2
const SWLogger = preload("res://addons/silent_wolf/utils/SWLogger.gd")
const ScoreItem = preload("res://Scenes/Protoypes/scorepanel.tscn")
var list_index = 0
var ld_name = "main"
var max_scores = 10



func _ready() :
	line_edit.text_submitted.connect(_on_LineEdit_text_entered)
	
	
	playerscorecontainer.hide()
	

func _on_LineEdit_text_entered(playername: String) -> void:
	label1.text = "Your name is " + playername


	my_popup.visible = false
	
	loadscores()
	


func loadscores():

	for child in Scrollcontainer.get_children():
		child.queue_free()
	for child in playerscorecontainer.get_parent().get_children():
		if child != playerscorecontainer:
			child.queue_free()

	SilentWolf.Scores.get_scores(10).sw_get_scores_complete.connect(scoresrecived)
func scoresrecived(scores: Array):
	print ("yay this function works")
	var parentcontainer = playerscorecontainer.get_parent()
	for child in parentcontainer.get_children():
		if child != playerscorecontainer:
			child.queue_free()
		
	if scores.size() == 0:
		noscores.show()
			
	for i in range(scores.size()):
		var score_entry: Dictionary = scores[i]
		
		var playername = score_entry.get("playername", "N/A")
		var player_score = score_entry.get("ivans", 0)
		
		var entry = newlbentry (i+1, playername, player_score)
		
		parentcontainer.add_child(entry)

func newlbentry(rank: int, playername: String, score_data: Dictionary,) -> HBoxContainer:
	var entry = HBoxContainer.new()
	entry.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	var rank_label = Label.new()
	rank_label.text = str(rank) + ":"
	rank_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	var name_label = Label.new()
	name_label.text = playername
	name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	
	var score_label = Label.new()
	score_label.text = score_data["player_name"]
	score_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	entry.add_child(rank_label)
	entry.add_child(name_label)
	entry.add_child(score_label)
	return entry
	
func handle_enter_pressed():
	print("Handling enter press!")
	
func loadingfailed(error):
	label1.text = "failed to load, come back later"
	


func _on_closebutton_pressed() -> void:
	var scene_name = SilentWolf.scores_config.open_scene_on_close
	SWLogger.info("Closing SilentWolf leaderboard, switching to scene: " + str(scene_name))
	get_tree().change_scene_to_file("res://Scenes/Protoypes/Clicker/clicker.tscn")
