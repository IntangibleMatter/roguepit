extends Node

var world_grids : Array[GameInfo]

func get_game_board() -> GameInfo:
	return world_grids[-1]
