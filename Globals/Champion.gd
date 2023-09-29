extends Node

const CHAMPION = "champion"

const LEVEL = "level"
const EXPERIENCE = "experience"

const STRENGTH = "strength"
const DEFENCE = "defence"
const SPEED = "speed"
const DEXTERITY = "dexterity"
const VITALITY = "vitality"
const WISDOM = "wisdom"

const KNIGHT = 0
const WIZARD = 1
const ROGUE = 2
const ARCHER = 3

const NAMES = {
	KNIGHT: "Knight",
	WIZARD: "Wizard",
	ROGUE: "Rogue",
	ARCHER: "Archer",
}

const STATS = {
	KNIGHT: {
		STRENGTH: 3,
		DEFENCE: 5,
		SPEED: 1,
		DEXTERITY: 2,
		VITALITY: 5,
		WISDOM: 2
	},

	WIZARD: {
		STRENGTH: 5,
	 	DEFENCE: 1,
	 	SPEED: 3,
	 	DEXTERITY: 2,
	 	VITALITY: 2,
	 	WISDOM: 5
	},

	ROGUE: {
		STRENGTH: 3,
	 	DEFENCE: 2,
	 	SPEED: 5,
	 	DEXTERITY: 5,
	 	VITALITY: 2,
	 	WISDOM: 1
	},

	ARCHER: {
		STRENGTH: 5,
	 	DEFENCE: 2,
	 	SPEED: 2,
	 	DEXTERITY: 5,
	 	VITALITY: 1,
	 	WISDOM: 3
	}
}

func get_defaults(champion: int = -1) -> Dictionary:
	if champion == -1:
		return {
			Server.TAG_ID: null,
			CHAMPION: null,
			LEVEL: 1,
			EXPERIENCE: 0,
			STRENGTH: 1,
			DEFENCE: 1,
			SPEED: 1,
			DEXTERITY: 1,
			VITALITY: 1,
			WISDOM: 1,
		}
	else:
		return {
			Server.TAG_ID: null,
			CHAMPION: champion,
			LEVEL: 1,
			EXPERIENCE: 0,
			STRENGTH: STATS[champion][STRENGTH],
			DEFENCE: STATS[champion][DEFENCE],
			SPEED: STATS[champion][SPEED],
			DEXTERITY: STATS[champion][DEXTERITY],
			VITALITY: STATS[champion][VITALITY],
			WISDOM: STATS[champion][WISDOM],
		}
