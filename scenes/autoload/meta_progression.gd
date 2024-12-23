extends Node

const SAVE_FILE_PATH = "user://game.save"

var save_data: Dictionary = {
	"win_count": 0,
	"loss_count": 0,
	"upgrade_currency": 0,
	"meta_upgrades": { }
	}



func _ready():
	GameEvent.experience_vial_collected.connect(on_experience_collected)
	load_save_file()
	
func load_save_file():
	if !FileAccess.file_exists(SAVE_FILE_PATH):
		return
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	save_data = file.get_var()
	
	
func save():
	var file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	file.store_var(save_data)
	
func add_meta_upgrade(upgrade: MetaUpgrade):
	if !save_data["meta_upgrades"].has(upgrade.id):
		save_data["meta_upgrades"][upgrade.id] = {
			"quantity": 0
		}
	
	save_data["meta_upgrades"][upgrade.id]["quantity"] =+ 1


func on_experience_collected(number: float):
	save_data["upgrade_currency"] += number
	
