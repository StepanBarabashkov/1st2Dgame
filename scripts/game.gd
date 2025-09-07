extends Node2D

@onready var spawn_point: Marker2D = $SpawnPoint
var player_scene: PackedScene = preload("res://scenes/player.tscn") # путь к игроку

func _ready():
	spawn_player(spawn_point.position)
	
func spawn_player(pos: Vector2) -> void:
	
	var player = player_scene.instantiate()
	player.position = pos
	get_tree().current_scene.add_child(player)
