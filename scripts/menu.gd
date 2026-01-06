extends Panel

@export var tween_intensity: float
@export var tween_duration: float

@onready var house: Button = $House
@onready var bakery: Button = $Bakery
@onready var park: Button = $Park
@onready var exit: Button = $Exit
@onready var glow_house: Sprite2D = $GlowHouse
@onready var glow_bakery: Sprite2D = $GlowBakery
@onready var glow_park: Sprite2D = $GlowPark
@onready var fantasma: Sprite2D = $Fantasma

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	glow_house.visible = false
	glow_bakery.visible = false
	glow_park.visible = false
	if house.is_hovered():
		buttonHovered(house, glow_house)
	else:
		buttonHovered(house, glow_house)
	if bakery.is_hovered():
		buttonHovered(bakery, glow_bakery)
	else:
		buttonHovered(bakery, glow_bakery)
	if park.is_hovered():
		buttonHovered(park, glow_park)
	else:
		buttonHovered(park, glow_park)
	if exit.is_hovered():
		buttonHovered(exit, fantasma)
	else:
		buttonHovered(exit, fantasma)

func startTween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)

func buttonHovered(button: Button, sprite2d: Sprite2D):
	button.pivot_offset = button.size / 2
	sprite2d.visible = false
	if button.is_hovered():
		sprite2d.visible = true
		startTween(button, "scale", Vector2.ONE * tween_intensity, tween_duration)
		startTween(sprite2d, "scale", Vector2.ONE * tween_intensity, tween_duration)

	else:
		sprite2d.visible = false
		startTween(button, "scale", Vector2.ONE, tween_duration)
		startTween(sprite2d, "scale", Vector2.ONE * tween_intensity, tween_duration)
