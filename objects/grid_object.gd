class_name GridObject
extends Node2D

var game_board : GameInfo

func get_grid_position() -> Vector2:
	return floor(global_position / game_board.tile_size)
