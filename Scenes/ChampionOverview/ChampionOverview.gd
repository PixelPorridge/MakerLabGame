class_name ChampionOverview
extends Control

@export var champion_label: Label
@export var champion_textures: Array[TextureRect]
@export var strength_label: Label
@export var defence_label: Label
@export var speed_label: Label
@export var dexterity_label: Label
@export var vitality_label: Label
@export var wisdom_label: Label

var data = null


func _process(_delta):
	for texture in champion_textures:
		texture.visible = false
	
	if data:
		champion_textures[data[ChampionData.CHAMPION]].visible = true
		champion_label.text = "Level " + str(data[ChampionData.LEVEL]) + "\n" + ChampionData.NAMES[data[ChampionData.CHAMPION]]

		strength_label.text = str(data[ChampionData.STRENGTH])
		defence_label.text = str(data[ChampionData.DEFENCE])
		speed_label.text = str(data[ChampionData.SPEED])
		dexterity_label.text = str(data[ChampionData.DEXTERITY])
		vitality_label.text = str(data[ChampionData.VITALITY])
		wisdom_label.text = str(data[ChampionData.WISDOM])
