extends CharacterBody2D

@export var speed = 150
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move-up"):
		velocity.y -= 1
	if Input.is_action_pressed("move-down"):
		velocity.y += 1
	if Input.is_action_pressed("move-right"):
		velocity.x += 1
	if Input.is_action_pressed("move-left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x < 0:
		$AnimatedSprite2D.animation = "walk-left"
	
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk-right"
	
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "walk-down"
	
	if velocity.y < 0:
		$AnimatedSprite2D.animation = "walk-up"
