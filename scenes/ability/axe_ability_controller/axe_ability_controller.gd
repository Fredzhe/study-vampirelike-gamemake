extends Node

@export var axe_ability_scene: PackedScene

var base_damage = 10
var additional_damage_percent = 1
var double_sign = false

func _ready():
	$Timer.timeout.connect(on_timer_timeout)
	GameEvent.ability_upgrade_added.connect(on_ability_upgrade_added)
	
func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
		
	var foreground = get_tree().get_first_node_in_group("foreground_layer") as Node2D
	if foreground == null:
		return
	
	var axe_instance = axe_ability_scene.instantiate() as Node2D
	foreground.add_child(axe_instance)
	axe_instance.global_position = player.global_position
	axe_instance.hitbox_component.damage = base_damage * additional_damage_percent
	
	if double_sign:
		var axe_instance_2 = axe_ability_scene.instantiate() as Node2D
		foreground.add_child(axe_instance_2)
		print("down")
		axe_instance_2.mirror = true
		axe_instance_2.global_position = player.global_position
		axe_instance_2.hitbox_component.damage = base_damage * additional_damage_percent
	
	
func on_ability_upgrade_added(upgrade: AbilityUpgrade, current_upgrades: Dictionary):
	if upgrade.id == "axe_damage":
		additional_damage_percent = 1 + (current_upgrades["axe_damage"]["quantity"] * .10)
	if upgrade.id == "axe_double":
		double_sign = true
