extends Node2D

@onready var game_board: GameBoard = $GameBoard

func setup() -> void:
	game_board.tilemap = $TileMap
	
