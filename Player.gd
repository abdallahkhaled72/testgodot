extends Area2D

const MOVE_SPEED = 300

var _ball_dir
var _up
var _down

onready var _screen_size_y = get_viewport_rect().size.y

func _ready():
	var n = String(name).to_lower()
	_up = n + "_move_up"
	_down = n + "_move_down"
	if n == "left":
		_ball_dir = 1
	else: 
		_ball_dir = -1


func _process(delta):
	var input = Input.get_action_strength(_down) - Input.get_action_strength(_up)
	position.y = clamp(position.y + input * MOVE_SPEED * delta, 20, _screen_size_y - 20)

func _on_area_entered(area):
	if area.name == "Ball":
		area.direction = Vector2(_ball_dir, randf()).normalized()
