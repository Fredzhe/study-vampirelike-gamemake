extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var visuals = $Visuals
@onready var velocity_component = $VelocityComponent
@onready var animation_player = $AnimationPlayer

func _ready():
		$HurtboxComponent.hit.connect(on_hit)


func _process(delta):
	velocity_component.accelerate_to_player()
	velocity_component.move(self)
	
	var move_sign = sign(velocity.x)
	if move_sign != 0 :
		visuals.scale = Vector2(-move_sign, 1)
	
	if velocity.x !=0 || velocity.y != 0:
		animation_player.play("walk")
	else:
		animation_player.play("RESET")


func on_hit():
	$HitRandomAudioPlayerComponent.play_random()
