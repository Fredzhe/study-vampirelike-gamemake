extends PanelContainer


@onready var name_label: Label = $%NameLabel
@onready var description_label: Label = $%DescriptionLabel
@onready var purchase_button = %PurchaseButton
@onready var progress_bar = %ProgressBar
@onready var progress_label = %ProgressLabel
@onready var level_label = %LevelLabel
@onready var level_bar = %LevelBar

var upgrade: MetaUpgrade

func _ready():
	purchase_button.pressed.connect(on_purchase_button_pressed)


func set_meta_upgrade(upgrade: MetaUpgrade):
	self.upgrade = upgrade
	name_label.text = upgrade.name
	description_label.text = upgrade.description
	update_progress()


func update_progress():
	var current_quantity = 0
	if MetaProgression.save_data["meta_upgrades"].has(upgrade.id):
		current_quantity = MetaProgression.save_data["meta_upgrades"][upgrade.id]["quantity"]
		
	var is_maxed = current_quantity == upgrade.max_quantity
	var currency = MetaProgression.save_data["meta_upgrade_currency"]
	var purchase_percent = currency / upgrade.cost
	var level_percent = current_quantity / upgrade.max_quantity
	
	purchase_percent = min(purchase_percent, 1)
	progress_bar.value = purchase_percent
	
	level_percent = min(level_percent, 1)
	level_bar.value = level_percent
	
	purchase_button.disabled = purchase_percent < 1 || is_maxed
	if is_maxed:
		purchase_button.text = "已满级"
	progress_label.text = str(currency) + "/" + str(upgrade.cost)
	level_label.text = str(current_quantity) + "/" + str(upgrade.max_quantity)
	

func on_purchase_button_pressed():
	if upgrade == null:
		return
	MetaProgression.add_meta_upgrade(upgrade)
	MetaProgression.save_data["meta_upgrade_currency"] -= upgrade.cost
	MetaProgression.save()
	get_tree().call_group("meta_upgrade_card","update_progress")
	$AnimationPlayer.play("selected")


	
