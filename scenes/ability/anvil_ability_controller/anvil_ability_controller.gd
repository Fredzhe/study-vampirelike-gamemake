extends Node

@export var anvil_ability_scene: PackedScene

@onready var timer = $Timer
@onready var delay_timer = $DelayTimer

const MAX_RANGE = 150
const BASE_DAMAGE = 30
var additional_damage_percent = 1

var anvil_count = 0

var base_wait_time

func _ready():
	base_wait_time = timer.wait_time
	timer.timeout.connect(on_timer_timeout)
	GameEvent.ability_upgrade_added.connect(on_ability_upgrade_added)

func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	for i in 1 + anvil_count:
		var random_direction = Vector2.RIGHT.rotated(randf_range(0,TAU))
		var spawn_position = player.global_position + (random_direction * randf_range(0,MAX_RANGE))
	
		var query_paramaters = PhysicsRayQueryParameters2D.create(player.global_position, spawn_position, 1 << 0)
		var result = get_tree().root.world_2d.direct_space_state.intersect_ray(query_paramaters)
			
		if !result.is_empty():
			spawn_position = result["position"]
	
		var anvil_ability = anvil_ability_scene.instantiate()
		get_tree().get_first_node_in_group("foreground_layer").add_child(anvil_ability)
		anvil_ability.global_position = spawn_position
		anvil_ability.hitbox_component.damage = BASE_DAMAGE * additional_damage_percent

		
func on_ability_upgrade_added(upgrade: AbilityUpgrade, current_upgrades: Dictionary):
	if upgrade.id == "anvil_count":
		anvil_count = current_upgrades["anvil_count"]["quantity"]

