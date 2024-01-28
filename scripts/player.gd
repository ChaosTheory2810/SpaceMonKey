extends RigidBody2D
class_name player

signal died
#velocity of upwards force on click
export var FLAP_FORCE = -340
#maximum nose rotation upwards
const MAX_ROTATION_DEGREES = -30

onready var animator = $AnimationPlayer
onready var exhaust = $exhaust
onready var hit = $hit
onready var fly = $fly

var started = false
var alive = true

func _physics_process(_delta):
	#flying term from project input settings
	if Input.is_action_just_pressed("flying") && alive:
		if !started:
			start()
		flap()
		#set upwards maximum rotation
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
	#once player is not flapping, send into nosedive
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			#how quickly must player take dive
			angular_velocity = 2
		else:
			#on first click return
			angular_velocity = 0
		

func start():
	if started: return
	started = true
	gravity_scale = 10
	#player fly term from player scene animationplayer anim
	animator.play("player_fly")
	exhaust.play("exhaust")

func flap():
	#how much each flap takes player upwards on y
	linear_velocity.y = FLAP_FORCE
	#the speed in which player changes from upwards max rotation, to downwards max rotation
	angular_velocity = -8
	fly.play()

func die():
	if !alive: return
	alive = false
	animator.stop()
	hit.play()
	emit_signal("died")
