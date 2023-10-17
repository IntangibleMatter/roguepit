extends Node

var world_grids : Array[GameBoard]

func get_game_board() -> GameBoard:
	return world_grids[-1]
