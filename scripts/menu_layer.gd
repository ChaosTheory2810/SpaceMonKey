extends CanvasLayer

signal start_game

onready var start_message = $start_menu/start_message
onready var tween = $Tween
onready var score_label = $game_over_menu/VBoxContainer/score_label
onready var high_score_label = $game_over_menu/VBoxContainer/high_score_label
onready var game_over_menu = $game_over_menu

var game_started = false

func _input(event):
	if event.is_action_pressed("flying") && !game_started:
		emit_signal("start_game")
		tween.interpolate_property(start_message, "modulate:a", 1, 0, 0.5)
		tween.start()
		game_started = true

func init_game_over_menu(score, highscore):
	score_label.text = "SCORE: " + str(score)
	high_score_label.text = "BEST: " + str(highscore)
	game_over_menu.visible = true

func _on_restart_button_pressed():
	get_tree().reload_current_scene()
