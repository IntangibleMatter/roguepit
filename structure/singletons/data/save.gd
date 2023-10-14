extends Node

const SAVE_PATH := "user://save{}.pit"

var save_index : int = 0

var settings := {
	"turn_time": 0.1,
}

var savedata := {
}

func save_game(run_data: Array[Node]) -> void:
	var cfg := ConfigFile.new()
	for dat in savedata:
		cfg.set_value("save", dat, savedata[dat])
	
	for run in run_data.size():
		cfg.set_value("run", str(run), run_data[run])
	
	cfg.save(SAVE_PATH.format(save_index))
