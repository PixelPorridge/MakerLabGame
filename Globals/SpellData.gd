extends Node

const SPELL = "spell"

const BERSERK = 0
const FIREBALL = 1
const COUNTER = 2
const SPLIT = 3

const NAMES = {
	BERSERK: "Berserk",
	FIREBALL: "Fireball",
	COUNTER: "Counter",
	SPLIT: "Split",
}


func get_defaults(spell = -1):
	if spell == -1:
		return {
			ServerData.TAG_ID: null,
			SPELL: null,
		}
	else:
		return {
			ServerData.TAG_ID: null,
			SPELL: spell,
		}
