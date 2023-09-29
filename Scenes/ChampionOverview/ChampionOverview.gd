class_name ChampionOverview extends Control

@export var champion_label : Label
@export var champion_textures : Array[TextureRect]
@export var strength_label : Label
@export var defence_label : Label
@export var speed_label : Label
@export var dexterity_label : Label
@export var vitality_label : Label
@export var wisdom_label : Label

var data = null

func _process(_delta):
	for texture in champion_textures:
		texture.visible = false
	
	if data:
		champion_textures[data[Champion.CHAMPION]].visible = true
		champion_label.text = "Level " + str(data[Champion.LEVEL]) + "\n" + Champion.NAMES[data[Champion.CHAMPION]]

		strength_label.text = str(data[Champion.STRENGTH])
		defence_label.text = str(data[Champion.DEFENCE])
		speed_label.text = str(data[Champion.SPEED])
		dexterity_label.text = str(data[Champion.DEXTERITY])
		vitality_label.text = str(data[Champion.VITALITY])
		wisdom_label.text = str(data[Champion.WISDOM])
