extends Node2D

onready var hud = $hud
onready var obstacle_spawn = $obstacle_spawn
onready var ground = $ground
onready var particles = $player
onready var background = $background_anim
onready var menu_layer = $menu_layer

const SAVE_FILE_PATH = "user://savedata.save"

var score = 0 setget set_score
var highscore = 0

func _ready():
	#create a method for obstacle created
	obstacle_spawn.connect("obstacle_created", self, "_on_obstacle_created")
	load_highscore()

func new_game():
	self.score = 0
	obstacle_spawn.start()

#update new obstacle method score by one
func player_score():
	self.score += 1

#display new updated score in hud
func set_score(new_score):
	score = new_score
	hud.update_score(score)

#update score for the obstacle method
func _on_obstacle_created(obs):
	obs.connect("score", self, "player_score")

#player dies when falling to the ground
func _on_death_zone_body_entered(body):
	if body is player:
		if body.has_method("die"):
			body.die()

func _on_player_died():
	game_over()

func game_over():
	obstacle_spawn.stop()
	background.stop()
	ground.get_node("ground_anim").stop()
	get_tree().call_group("obstacles", "set_physics_process", false)
	if score > highscore:
		highscore = score
		save_highscore()
	menu_layer.init_game_over_menu(score, highscore)

func _on_menu_layer_start_game():
	new_game()

func save_highscore():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(highscore)
	save_data.close()

func load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		highscore = save_data.get_var()
		save_data.close()
