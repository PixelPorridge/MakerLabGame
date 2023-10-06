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

var data


func render():
	for texture in champion_textures:
		texture.visible = false
	
	if data:
		champion_textures[data[ChampionData.CHAMPION]].visible = true
		champion_label.text = "Level " + str(data[ChampionData.LEVEL]) + "\n" + ChampionData.NAMES[data[ChampionData.CHAMPION]]

		# === Player Data ===
		var champion = data[ChampionData.CHAMPION]
		
		var strength = data[ChampionData.STRENGTH]
		var defence = data[ChampionData.DEFENCE]
		var speed = data[ChampionData.SPEED]
		var dexterity = data[ChampionData.DEXTERITY]
		var vitality = data[ChampionData.VITALITY]
		var wisdom = data[ChampionData.WISDOM]
		
		# === Default Champion Data ===
		var default_strength = ChampionData.STATS[champion][ChampionData.STRENGTH]
		var default_defence = ChampionData.STATS[champion][ChampionData.DEFENCE]
		var default_speed = ChampionData.STATS[champion][ChampionData.SPEED]
		var default_dexterity = ChampionData.STATS[champion][ChampionData.DEXTERITY]
		var default_vitality = ChampionData.STATS[champion][ChampionData.VITALITY]
		var default_wisdom = ChampionData.STATS[champion][ChampionData.WISDOM]
		
		strength_label.text = str(data[ChampionData.STRENGTH])
		defence_label.text = str(data[ChampionData.DEFENCE])
		speed_label.text = str(data[ChampionData.SPEED])
		dexterity_label.text = str(data[ChampionData.DEXTERITY])
		vitality_label.text = str(data[ChampionData.VITALITY])
		wisdom_label.text = str(data[ChampionData.WISDOM])

		if strength != default_strength:
			strength_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			strength_label.add_theme_color_override("font_color", Color.WHITE)
		
		if defence != default_defence:
			defence_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			defence_label.add_theme_color_override("font_color", Color.WHITE)
		
		if speed != default_speed:
			speed_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			speed_label.add_theme_color_override("font_color", Color.WHITE)
		
		if dexterity != default_dexterity:
			dexterity_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			dexterity_label.add_theme_color_override("font_color", Color.WHITE)
		
		if vitality != default_vitality:
			vitality_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			vitality_label.add_theme_color_override("font_color", Color.WHITE)
		
		if wisdom != default_wisdom:
			wisdom_label.add_theme_color_override("font_color", PlayerData.yellow)
		else:
			wisdom_label.add_theme_color_override("font_color", Color.WHITE)
