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
	pass

func attack():
	hitbox_node.monitorable = true
	self.visible = true
	sprite_anim_node.play("attack")
	active = true
	damage_timer_node.start()

func _on_damage_timer_timeout():
	hitbox_node.monitorable = false
	self.visible = false
	active = false
	sprite_anim_node.play("idle")
