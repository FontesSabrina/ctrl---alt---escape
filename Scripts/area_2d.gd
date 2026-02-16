class_name Pastas extends Area2D

#var FabObj = preload("res://Prefabs/FabObj.tscn")
var velocity = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#add_to_group(game.GRUPO_INIMIGO)
	randomize()
	set_process(true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(0, 1) * velocity * delta



func _on_area_2d_4_area_entered(area: Area2D) -> void:
	print("Área: ", area)  # Imprime a área que entrou em contato  
	if area.name == "Jogador":
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func spawn_Area2D():  
	var cafe_scene = preload("res://cafe.tscn")  
	var cafe = cafe_scene.instantiate()  
	cafe.position = Vector2(randf() * 800, randf() * 600)  # Ajuste conforme layout  
	add_child(cafe) 
