extends Node2D

@export var type: String = "weapon"
@export var damage: int  
@export var active: bool = false

var hitbox_node
var sprite_anim_node
var damage_timer_node

# Called when the node enters the scene tree for the first time.
func _ready():
	hitbox_node = $Hitbox
	sprite_anim_node = $Spriteanim
	damage_timer_node = $DamageTimer

func _process(delta):
	self.position.x += 600 * delta


