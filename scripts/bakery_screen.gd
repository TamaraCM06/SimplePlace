extends Panel

@export var tween_intensity: float
@export var tween_duration: float

var punto_actual 

@onready var go_back: Button = $GoBack
@onready var notebook: Button = $Notebook
@onready var glow_notebook: Sprite2D = $GlowNotebook
@onready var exclamation: Sprite2D = $ExclamationNotebook

#Notebook open
@onready var open_notebook: Sprite2D = $Notebookopen
@onready var close_notebook: Button = $CloseNotebook
@onready var word_croissant: Button = $Croissant
@onready var word_cinnamonrolls: Button = $CinnamonRoll
@onready var word_pretzel: Button = $Pretzel
@onready var croissant_recipe: Sprite2D = $CroissantRecipe
@onready var cinnamonrolls_recipe: Sprite2D = $CinnamonrollsRecipe
@onready var pretzel_recipe: Sprite2D = $PretzelsRecipe
@onready var bake: Button = $Bake

#Ingredients
@onready var exclamationIngredients: Sprite2D = $ExclamationIngredients
@onready var ingredients: Button = $Ingredients
@onready var glow_ingredients: Sprite2D = $GlowIngredients

@onready var ingredients_BG: Sprite2D = $IngredientsBg
@onready var next: Button = $Next
@onready var bowl: Sprite2D = $InsideBowl
@onready var bowl1: Sprite2D = $InsideBowl1
@onready var bowl2: Sprite2D = $InsideBowl2
@onready var bowl3: Sprite2D = $InsideBowl3
@onready var bowl_batido: Sprite2D = $InsideBowlbatido
@onready var batidor: CharacterBody2D = $Batidor

@onready var flour: TextureButton = $Flour
@onready var milk: TextureButton = $Milk
@onready var salt: TextureButton = $Sal
@onready var sugar: TextureButton = $Azucar
@onready var yeast: TextureButton = $Yeast
@onready var water: TextureButton = $Water
@onready var butter: TextureButton = $Butter
@onready var twoeggs: TextureButton = $Eggs
@onready var egg: TextureButton = $Egg
@onready var brown_sugar: TextureButton = $AzucarCafe
@onready var cinnamon: TextureButton = $Canela
@onready var baking_soda: TextureButton = $BakingSoda

@onready var masa: Sprite2D = $Masa
@onready var rodillo: Button = $Rodillo
@onready var tabla: Sprite2D = $Tabla
@onready var masa_aplanada: Sprite2D = $MasaAplanada
@onready var masa_aplanada_cinn: Sprite2D = $MasaAplanadaCinn
@onready var cortadora: Button = $Cortadora
@onready var masa_cortada_croissant: Sprite2D = $MasaCortadaCroissant
@onready var masa_cortada_cinn: Sprite2D = $MasaCortadaCinn
@onready var roll: Button = $Roll
@onready var masa_cortada_pretzel: Sprite2D = $MasaCortadaPretzel
@onready var form: Button = $Form
@onready var masa_filler: Button = $MasaFiller

@onready var oven: Button = $Oven
@onready var masa_croissant: Sprite2D = $MasaCroissant
@onready var masa_cinnamonrolls: Sprite2D = $MasaCinnamonRolls
@onready var masa_pretzel: Sprite2D = $MasaPretzel
@onready var ovenOn: Sprite2D = $OvenOn
@onready var ovenOff: Sprite2D = $OvenOff
@onready var done: Button = $Done

@export var food: String 
@export var food_selected: bool = false
@export var next_ingredients: bool = false
@export var total_ingredients: int
@export var actual_ingredients: int = 0
@export var filler_to_appear: bool = false

@onready var batidor_script = get_node("Batidor")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	glow_notebook.visible = false
	glow_ingredients.visible = false
	if notebook.is_hovered():
		buttonHovered(notebook, glow_notebook)
	else:
		buttonHovered(notebook, glow_notebook)
	if food_selected and next_ingredients:
		if ingredients.is_hovered():
			buttonHovered(ingredients, glow_ingredients)
		else:
			buttonHovered(ingredients, glow_ingredients)
	if batidor:
		if batidor.tiempo_total_segundos > 5.00:
			if not next.visible: # Solo para no ejecutarlo mil veces
				next.visible = true
				bowl3.visible = false
				bowl_batido.visible = true
				print("HEREEEE")


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

func callNotebook():
	open_notebook.visible = true
	close_notebook.visible = true
	word_croissant.visible = true
	word_cinnamonrolls.visible = true
	word_pretzel.visible = true
	go_back.visible = false
	notebook.visible = false
	exclamation.visible = false

func callCloseNotebook():
	open_notebook.visible = false
	close_notebook.visible = false
	word_croissant.visible = false
	word_cinnamonrolls.visible = false
	word_pretzel.visible = false
	croissant_recipe.visible = false
	cinnamonrolls_recipe.visible = false
	pretzel_recipe.visible = false
	bake.visible = false
	go_back.visible = true
	notebook.visible = true
	exclamation.visible = true

func callSelectCroissantRecipe():
	food = "Croissant"
	croissant_recipe.visible = true
	cinnamonrolls_recipe.visible = false
	pretzel_recipe.visible = false
	bake.visible = true

func callSelectCinnamonrollsRecipe():
	food = "Cinnamon Rolls"
	croissant_recipe.visible = false
	cinnamonrolls_recipe.visible = true
	pretzel_recipe.visible = false
	bake.visible = true

func callSelectPretzelRecipe():
	food = "Pretzel"
	croissant_recipe.visible = false
	cinnamonrolls_recipe.visible = false
	pretzel_recipe.visible = true
	bake.visible = true

func callBake():
	food_selected = true
	next_ingredients = true
	open_notebook.visible = false
	close_notebook.visible = false
	word_croissant.visible = false
	word_cinnamonrolls.visible = false
	word_pretzel.visible = false
	croissant_recipe.visible = false
	cinnamonrolls_recipe.visible = false
	pretzel_recipe.visible = false
	bake.visible = false
	go_back.visible = true
	notebook.visible = true
	exclamation.visible = false
	exclamationIngredients.visible = true

func callIngredients():	
	if food_selected:
		exclamationIngredients.visible = false
		notebook.visible = false
		go_back.visible = false
		ingredients.visible = false
		glow_ingredients.visible = false
		ingredients_BG.visible = true
		bowl.visible = true
		if food == "Croissant":
			total_ingredients = 7
			flour.visible = true
			milk.visible = true
			salt.visible = true
			sugar.visible = true
			yeast.visible = true
			water.visible = true
			butter.visible = true
		if food == "Cinnamon Rolls":
			food = "Filler"
			total_ingredients = 6
			flour.visible = true
			sugar.visible = true
			milk.visible = true
			yeast.visible = true
			salt.visible = true
			twoeggs.visible = true
		if food == "Pretzel":
			total_ingredients = 9
			water.visible = true
			milk.visible = true
			butter.visible = true
			yeast.visible = true
			sugar.visible = true
			flour.visible = true
			salt.visible = true
			baking_soda.visible = true
			twoeggs.visible = true
	
func callPutFlour():
	flour.visible = false
	actual_ingredients += 1
	print(actual_ingredients)
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutSal():
	salt.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutMilk():
	milk.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutAzucar():
	sugar.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutYeast():
	yeast.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutWater():
	water.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutButter():
	butter.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutEggs():
	twoeggs.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutEgg():
	egg.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutAzucarcafe():
	brown_sugar.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutCanela():
	cinnamon.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true
func callPutBakingsoda():
	baking_soda.visible = false
	actual_ingredients += 1
	if actual_ingredients >= 2:
		bowl.visible = false
		bowl1.visible = true
	if actual_ingredients >= 4:
		bowl1.visible = false
		bowl2.visible = true
	if actual_ingredients == total_ingredients:
		bowl2.visible = false
		bowl3.visible = true
		batidor.visible = true

func callNext():
	if food == "Filler":
		total_ingredients = 4
		actual_ingredients = 0
		food = "Cinnamon Rolls"
		batidor.visible = false
		bowl_batido.visible = false
		bowl.visible = true
		next.visible = false
		butter.visible = true
		brown_sugar.visible = true
		cinnamon.visible = true
		egg.visible = true
	else:
		bowl_batido.visible = false
		batidor.visible = false
		next.visible = false
		masa.visible = true
		tabla.visible = true
		rodillo.visible = true

func callMasaFiller():
	masa_aplanada_cinn.visible = true
	rodillo.visible = false
	cortadora.visible = true

func callRodillo():
	if food == "Cinnamon Rolls":
		masa_filler.visible = true
		masa_aplanada.visible = true
		rodillo.visible = false
	else:
		masa.visible = false
		masa_aplanada.visible = true
		rodillo.visible = false
		cortadora.visible = true
	
func callCut():
	if food == "Croissant":
		masa_aplanada.visible = false
		cortadora.visible = false
		masa_cortada_croissant.visible = true
		roll.visible = true
	if food == "Cinnamon Rolls":
		masa_aplanada_cinn.visible = false
		cortadora.visible = false
		masa_cortada_cinn.visible = true
		roll.visible = true
	if food == "Pretzel":
		masa_aplanada.visible = false
		cortadora.visible = false
		masa_cortada_pretzel.visible = true
		form.visible = true

func callRoll():
	if food == "Croissant":
		masa_cortada_croissant.visible = false
		roll.visible = false
		masa_croissant.visible = true
		oven.visible = true
	if food == "Cinnamon Rolls":
		masa_cortada_cinn.visible = false
		roll.visible = false
		masa_cinnamonrolls.visible = true
		oven.visible = true


func callForm():
	masa_cortada_pretzel.visible = false
	form.visible = false
	masa_pretzel.visible = true
	oven.visible = true
	
func callOven():
	ingredients_BG.visible = false
	masa_cortada_croissant.visible = false
	roll.visible = false
	masa_croissant.visible = false
	oven.visible = false
	masa_cortada_cinn.visible = false
	masa_cinnamonrolls.visible = false
	masa_cortada_pretzel.visible = false
	form.visible = false
	masa_pretzel.visible = false
	ovenOn.visible = true
	await self.get_tree().create_timer(3).timeout
	ovenOff.visible = true
	done.visible = true

func callDone():
	ovenOff.visible = false
	ovenOn.visible = false
	oven.visible = false
	done.visible = false
	exclamationIngredients.visible = true
	notebook.visible = true
	go_back.visible = true
	ingredients.visible = true

func callGoBack():
	get_tree().change_scene_to_file("res://menu.tscn")
