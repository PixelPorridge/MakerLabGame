extends Node

const URL = "http://127.0.0.1:5000"

const TAG_ID = "_id"

func parse(data):
	for key in data:
		if key != TAG_ID:
			data[key] = int(data[key])

	return data
