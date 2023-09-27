extends Node

const ID = "_id"
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

const CHAMPION_STATS = {
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
			ID: null,
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
			ID: null,
			CHAMPION: champion,
			LEVEL: 1,
			EXPERIENCE: 0,
			STRENGTH: CHAMPION_STATS[champion][STRENGTH],
			DEFENCE: CHAMPION_STATS[champion][DEFENCE],
			SPEED: CHAMPION_STATS[champion][SPEED],
			DEXTERITY: CHAMPION_STATS[champion][DEXTERITY],
			VITALITY: CHAMPION_STATS[champion][VITALITY],
			WISDOM: CHAMPION_STATS[champion][WISDOM],
		}