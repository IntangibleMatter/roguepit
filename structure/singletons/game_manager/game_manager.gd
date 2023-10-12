extends Node

var world_grids : Array[GameGrid]

func get_game_board() -> GameGrid:
	return world_grids[-1]
