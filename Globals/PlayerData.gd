extends Node

var p1_colour := Color(1, 0.302, 0.302)
var	p2_colour := Color(0.302, 0.302, 1)
var yellow := Color(1, 0.918, 0.302)

"""
# === Player 1 ===

var p1_champion = {
	ServerData.TAG_ID: null,
	ChampionData.CHAMPION: null,
	ChampionData.LEVEL: null,
	ChampionData.EXPERIENCE: null,
	ChampionData.STRENGTH: null,
	ChampionData.DEFENCE: null,
	ChampionData.SPEED: null,
	ChampionData.DEXTERITY: null,
	ChampionData.VITALITY: null,
	ChampionData.WISDOM: null,
}

var p1_spell = {
	ServerData.TAG_ID: null,
	SpellData.SPELL: null,
}


# === Player 2 ===

var p2_champion = {
	ServerData.TAG_ID: null,
	ChampionData.CHAMPION: null,
	ChampionData.LEVEL: null,
	ChampionData.EXPERIENCE: null,
	ChampionData.STRENGTH: null,
	ChampionData.DEFENCE: null,
	ChampionData.SPEED: null,
	ChampionData.DEXTERITY: null,
	ChampionData.VITALITY: null,
	ChampionData.WISDOM: null,
}

var p2_spell = {
	ServerData.TAG_ID: null,
	SpellData.SPELL: null,
}
"""

# === Results ===

var winner: int
var loser: int

var winner_champion
var loser_champion


# === Player 1 ===

var p1_champion = {
	ServerData.TAG_ID: "04:E1:AA:FA:12:72:80",
	ChampionData.CHAMPION: 0,
	ChampionData.LEVEL: 1,
	ChampionData.EXPERIENCE: 0,
	ChampionData.STRENGTH: 3,
	ChampionData.DEFENCE: 5,
	ChampionData.SPEED: 1,
	ChampionData.DEXTERITY: 2,
	ChampionData.VITALITY: 5,
	ChampionData.WISDOM: 2,
}

var p1_spell = {
	ServerData.TAG_ID: "04:B2:3A:FA:3F:74:80",
	SpellData.SPELL: 0,
}


# === Player 2 ===

var p2_champion = {
	ServerData.TAG_ID: "04:BE:F1:FA:12:72:80",
	ChampionData.CHAMPION: 1,
	ChampionData.LEVEL: 1,
	ChampionData.EXPERIENCE: 0,
	ChampionData.STRENGTH: 5,
	ChampionData.DEFENCE: 1,
	ChampionData.SPEED: 3,
	ChampionData.DEXTERITY: 2,
	ChampionData.VITALITY: 2,
	ChampionData.WISDOM: 5,
}

var p2_spell = {
	ServerData.TAG_ID: "04:5E:C3:FA:3F:74:80",
	SpellData.SPELL: 1,
}


func reset():
	p1_champion = ChampionData.get_defaults()
	p1_spell = SpellData.get_defaults()
	p2_champion = ChampionData.get_defaults()
	p2_spell = SpellData.get_defaults()
