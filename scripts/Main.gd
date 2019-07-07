extends Node2D

export (PackedScene) var Wolf
var score

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
	
func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var wolf = Wolf.instance()
	add_child(wolf)
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	wolf.position = $MobPath/MobSpawnLocation.position
	direction += rand_range(- PI / 4, PI / 4)
	wolf.rotation = direction
	wolf.linear_velocity = Vector2(rand_range(wolf.min_speed, wolf.max_speed), 0)
	wolf.linear_velocity = wolf.linear_velocity.rotated(direction)