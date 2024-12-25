extends CanvasLayer

@export var upgrades: Array[MetaUpgrade] = []

@onready var grid_container = %GridContainer
@onready var back_button = %BackButton
@onready var test_button = %TestButton

var meta_upgrade_card_sence = preload("res://scenes/UI/meta_upgrade_card.tscn")

func _ready():
	back_button.pressed.connect(on_back_pressed)
	test_button.pressed.connect(on_test_pressed)
	
	for child in grid_container.get_children():
		child.queue_free()
	
	for upgrade in upgrades:
		var meta_upgrade_card_instance = meta_upgrade_card_sence.instantiate()
		grid_container.add_child(meta_upgrade_card_instance)
		meta_upgrade_card_instance.set_meta_upgrade(upgrade)

func on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/main_menu.tscn")

func on_test_pressed():
	print(MetaProgression.save_data)
