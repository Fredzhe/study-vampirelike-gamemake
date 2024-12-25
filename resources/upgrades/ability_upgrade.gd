extends Resource
class_name AbilityUpgrade

@export var id: String
@export var max_quantity: int
@export var rarity: String
@export var name: String
@export_multiline var description: String

func get_weight():
	var weight = 0
	match rarity:
		"传说":
			weight = 10
		"史诗":
			weight = 20
		"稀有":
			weight = 40
			
	return weight
