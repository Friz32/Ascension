class_name Player
extends KinematicBody

const MOUSE_SENSITIVITY = 0.1

export var deceleration := 0.1
export var gravity := Vector3(0, -1, 0)
export var mass := 2.0
export var move_speed := 2.0
export var jump_strength := 50.0

onready var camera := $Camera
onready var raycast := $Camera/RayCast

var velocity := Vector3()
var up_direction := Vector3.UP

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion && Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		camera.rotation_degrees.y -= event.relative.x * MOUSE_SENSITIVITY
		camera.rotation_degrees.x -= event.relative.y * MOUSE_SENSITIVITY
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -89, 89)

func _physics_process(delta):
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var vector = camera.global_transform.basis.xform(Vector3(input.x, 0, input.y))
	vector.y = 0
	vector = vector.normalized()
	
	velocity += vector * move_speed
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y += jump_strength
	
	var gravity_resistance = get_floor_normal() if is_on_floor() else Vector3.UP
	velocity += -gravity_resistance * mass
	
	velocity = move_and_slide(velocity, up_direction)
	
	velocity = velocity.linear_interpolate(Vector3.ZERO, deceleration)
