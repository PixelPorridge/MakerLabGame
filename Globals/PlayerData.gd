extends Node

var p1_colour := Color(1, 0.302, 0.302)
var	p2_colour := Color(0.302, 0.302, 1)
var yellow := Color(1, 0.918, 0.302)


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


# === Results ===

var winner: int
var loser: int

var winner_champion
var loser_champion


func reset():
	p1_champion = ChampionData.get_defaults()
	p1_spell = SpellData.get_defaults()
	p2_champion = ChampionData.get_defaults()
	p2_spell = SpellData.get_defaults()
