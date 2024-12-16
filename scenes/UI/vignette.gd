extends CanvasLayer



func _ready():
	GameEvent.player_damaged.connect(on_player_damaged)
	
	
func on_player_damaged():
	$AnimationPlayer.play("hit")
