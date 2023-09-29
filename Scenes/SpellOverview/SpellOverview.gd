class_name SpellOverview extends Control

@export var spell_label : Label
@export var spell_textures : Array[TextureRect]

var data = null

func _process(_delta):
	for texture in spell_textures:
		texture.visible = false
	
	if data:
		spell_textures[data[Spell.SPELL]].visible = true
		spell_label.text = Spell.NAMES[data[Spell.SPELL]]
