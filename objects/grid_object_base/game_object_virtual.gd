class_name GameObjectVirtual
extends Sprite2D

@export var type: GameObjectResource.ACTOR_TYPE

var controller: GameObject

func animate(animation: String) -> void:
	pass

func move(target: Vector2i, params: Dictionary = {}) -> void:
	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	if params.has("anim"):
		animate(params.animation)
	tween.tween_property(self,
		"global_position",
		Vector2(target) * controller._grid.tile_size + controller._grid.tile_size / 2,
		Save.settings.turn_time
	)
	await tween.finished
	if params.has("anim_end"):
		animate(params.anim_end)
