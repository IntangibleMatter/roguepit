extends Node

const SAVE_PATH := "user://save{}.pit"

var save_index : int = 0

var settings := {
	"turn_time": 0.1,
}

var sd := {
	"books": []
} #: get = d_get

#func d_set(item: String, value: Variant) -> void:
#	var true_item_path := item.split(".")
#
func d_get(key) -> Variant:
	if not sd.has(key):
		return 0
	return sd[key]

func save_game(run_data: Array[Node]) -> void:
	var cfg := ConfigFile.new()
	for dat in sd:
		cfg.set_value("save", dat, sd[dat])
	
	for run in run_data.size():
		cfg.set_value("run", str(run), run_data[run])
	
	cfg.save(SAVE_PATH.format(save_index))
