class_name control extends Control


@onready var coffe_couter: Label = $container/coffe_container/coffe_couter

func _ready() -> void:
	coffe_couter.text = str("%04d" % Globals.coffe)


func _process(delta: float) -> void:
	coffe_couter.text = str("%04d" % Globals.coffe)
