class_name Money extends Area2D  

# Velocidade de queda do objeto
var speed: float = 100
@onready var dindin: Sprite2D = $Dindin
@onready var dindin_2: Sprite2D = $Dindin2


var scree_size: Vector2 = Vector2.ZERO

# Chamado para iniciar a queda aleatória  
func _ready() -> void:  
	# Define uma posição aleatória para a pasta na largura da tela  
	position.x = randf_range(35, get_viewport().size.x-35)  
	position.y = 28  # Começa do topo da tela  

func _physics_process(delta: float) -> void:  
	scree_size = get_viewport().size
	var velocity = speed * Vector2.DOWN * delta
	
	dindin.position += velocity
	dindin_2.position += velocity
	
	if dindin.position.y > scree_size.y:
		dindin.position.y = dindin_2.position.y - scree_size.y
		

	if dindin_2.position.y > scree_size.y:
		dindin_2.position.y = dindin.position.y - scree_size.y

#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:  
	# Remove o objeto da cena quando sai da tela  
	#queue_free()


func _on_area_entered(area: Area2D) -> void:
	#Se o jogador colidir com o objeto, vai para a cena de game over
	if area.name == "Jogador": 
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
