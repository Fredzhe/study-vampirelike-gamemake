extends Resource
class_name MetaUpgrade

@export var id: String
@export var max_quantity: int = 1
@export var cost: int = 10
@export var name: String
@export_multiline var description: String
@export var level_description: Array[String]

func current_level_description():
	return level_description[MetaProgression.get_upgrade_count(id)]
