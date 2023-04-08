extends CharacterBody2D


@export var max_speed = 200.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * max_speed
	move_and_slide()


func get_movement_vector():
	var move_right_strength = Input.get_action_strength("move_right") 
	var move_left_strength = Input.get_action_strength("move_left") 
	var move_down_strength = Input.get_action_strength("move_down") 
	var move_up_strength = Input.get_action_strength("move_up") 
	var x_movement: float = move_right_strength - move_left_strength
	var y_movement: float = move_down_strength - move_up_strength
	return Vector2(x_movement, y_movement)
