extends Control

var gold = 0
var strength = 0

@onready var lbl_gold = get_node("%lbl_gold")
@onready var lbl_strength = get_node("%lbl_strength")

var player_file = "user://save.dat"

func _ready():
	# update gold and strength labels to 
	load_file()
	lbl_gold.text = str(gold)
	lbl_strength.text = str(strength)

func save_file():
	var file = FileAccess.open(player_file,FileAccess.WRITE)
	var player_data = create_player_data()
	file.store_var(player_data)

func load_file():
	var file = FileAccess.open(player_file, FileAccess.READ)
	if file.file_exists(player_file):
		var loaded_player_data = file.get_var()
		gold = loaded_player_data.GOLD
		strength = loaded_player_data.STRENGTH
		
		lbl_gold.text = str(gold)
		lbl_strength.text = str(strength)

func create_player_data():
	var player_dict = {
		"GOLD" : gold,
		"STRENGTH": strength,
	}
	return player_dict

func _on_btn_add_gold_pressed():
	gold += 1
	# we want to update gold label after changing value
	lbl_gold.text = str(gold)

func _on_btn_add_strength_pressed():
	strength += 1
	lbl_strength.text = str(strength)

func _on_btn_reset_pressed():
	gold = 0
	strength = 0
	lbl_gold.text = str(gold)
	lbl_strength.text = str(strength)

func _on_btn_save_pressed():
	save_file()

func _on_btn_load_pressed():
	load_file()
