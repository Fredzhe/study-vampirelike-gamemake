extends Node2D

const MAX_RADIOUS = 100

@onready var hitbox_component = $HitboxComponent

# var base_rotation = Vector2.RIGHT #让斧头初始角度随机
var base_rotation = Vector2.RIGHT
var mirror = false

func _ready():
	#base_rotation = Vector2.RIGHT.rotated(randf_range(0, TAU)) #让斧头初始角度随机
	var tween = create_tween()
	tween.tween_method(tween_method, 0.0, 2.0, 3)
	tween.tween_callback(queue_free)

func tween_method(rotations: float):
	if mirror:
		base_rotation = Vector2.LEFT

	var percent = rotations / 2
	var current_radius = (percent)* MAX_RADIOUS
	var current_direction = base_rotation.rotated(rotations * TAU)
	#var current_direction = base_rotation.rotated(rotations * TAU) #让斧头初始角度随机
	
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	
	global_position = player.global_position + (current_direction * current_radius)
