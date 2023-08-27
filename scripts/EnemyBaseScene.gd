extends CharacterBody2D

@export var type: String = "enemy"

@export_category("Stats")

@export var max_health: int
@export var damage: int


const SPEED = 300.0


func _physics_process(delta):
	
	
	var direction = Vector2(0, 0)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
