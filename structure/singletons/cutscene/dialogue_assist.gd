extends Node

var randomized_label_index : int
var randomized_label_string : String

func _ready() -> void:
	randomize()

func randomize_label(min: int, max: int) -> void:
	randomized_label_index = randi_range(min, max)

func randomize_label_in_string(values: Array, check_sd: String = "") -> void:
	if check_sd != "":
		values.shuffle()
		for v in values:
			if not Save.sd[check_sd].has(v):
				randomized_label_string = v
				return
		randomized_label_string = ""
	else:
		values.shuffle()
		randomized_label_string = str(values.pop_front())
