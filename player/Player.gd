extends Area2D
signal hit

export var speed = 200  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	# hide()

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		velocity.y += 1
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x > 0
	if velocity.y < 0:
		$AnimatedSprite.animation = "back"
	if velocity.y > 0:
		$AnimatedSprite.animation = "forward"

func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
