extends Panel

@export var tween_intensity: float
@export var tween_duration: float

@onready var tocadiscos: Button = $reproctordemusica
@onready var table: Button = $table
@onready var glow_tocadiscos: Sprite2D = $GlowMusic
@onready var glow_table: Sprite2D = $GlowTable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	glow_tocadiscos.visible = false
	if tocadiscos.is_hovered():
		buttonHovered(tocadiscos, glow_tocadiscos)
	else:
		buttonHovered(tocadiscos, glow_tocadiscos)
	if table.is_hovered():
		buttonHovered(table, glow_table)
	else:
		buttonHovered(table, glow_table)

func startTween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)

func buttonHovered(button: Button, sprite2d: Sprite2D):
	button.pivot_offset = button.size / 2
	sprite2d.visible = false
	if button == table:
		if button.is_hovered():
			sprite2d.visible = true
			startTween(button, "scale", Vector2.ONE * tween_intensity, tween_duration)
			startTween(sprite2d, "scale", Vector2.ONE * tween_intensity, tween_duration)

		else:
			sprite2d.visible = false
			startTween(button, "scale", Vector2.ONE, tween_duration)
			startTween(sprite2d, "scale", Vector2.ONE * tween_intensity, tween_duration)
	else:
		if button.is_hovered():
			sprite2d.visible = true
			startTween(sprite2d, "scale", Vector2.ONE * 0.4, tween_duration)

		else:
			sprite2d.visible = false
			startTween(sprite2d, "scale", Vector2.ONE * 0.4, tween_duration)

func callMemory():
	get_tree().change_scene_to_file("res://tile_map.tscn")
