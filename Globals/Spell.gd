extends Node

const ID = "_id"
const SPELL = "spell"

const BERSERK = 0
const FIREBALL = 1
const COUNTER = 2
const SPLIT = 3

func get_defaults(spell: int) -> Dictionary:
	return {
		ID: null,
		SPELL: spell
	}