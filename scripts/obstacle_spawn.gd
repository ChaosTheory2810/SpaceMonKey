extends Node2D

signal obstacle_created(obs)

onready var timer = $Timer

var obstacle_asset = preload("res://scenes/obstacle_asset.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var obstacle = obstacle_asset.instance()
	add_child(obstacle)
	#get a random number between 150 and 550
	obstacle.position.y = randi()%400 + 150
	emit_signal("obstacle_created", obstacle)

func start():
	timer.start()

func stop():
	timer.stop()
