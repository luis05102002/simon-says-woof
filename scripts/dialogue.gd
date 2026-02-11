extends Control # DIALOGUE

var current_order := ""

var ordenes = {
	"siéntate": "ui_down",
	"haz popo": "ui_accept",
	"salta": "ui_up",
	"ladra": "ui_left"
}

@onready var label = $Label
@onready var points_label = $PuntosLabel

func _ready():
	randomize()
	new_order()
	#actualizar_puntos()

func _process(delta):
	if current_order != "":
		var correct_action = ordenes[current_order]
		if Input.is_action_just_pressed(correct_action): # Falta enlazarlo. Si la acción es correcta
			#sumar_puntos(1)
			new_order()
			#actualizar_puntos()

func new_order():
	var claves = ordenes.keys()
	current_order = claves[randi() % claves.size()]
	label.text = "Simon dice: " + current_order
