extends VehicleBody3D

var wheels: Array = [];

@export
var engine_max: float = 150
@export
var steering_max_deg: float = 10
@export
var brake_force: float = 50

var is_main = true

var wasd
var isbreak

@export
var angular_correction_amount: float = 1

var timer:Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	for i in range(0,4):
		wheels.append(get_node("./Wheel_"+str(i+1)))
		print(wheels[i])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if is_main:
		wasd = Input.get_vector("Left", "Right","Backwards","Forwards")
		isbreak = Input.is_action_just_pressed("Flip")
	engine_force = wasd.y*engine_max
	steering = deg_to_rad(wasd.x*steering_max_deg* -1)
	if Input.is_action_pressed("Break"):
		brake = brake_force
	else:
		brake = 0
	print(str(rotation.x) + " and " + str(rotation.z))
	#rotation.x = (rotation.x * angular_correction_amount)
	#rotation.z = (rotation.z * angular_correction_amount)
	print(str(rotation.x) + " and " + str(rotation.z))

	if isbreak:
		rotation.x = 0
		rotation.z = 0
	
	pass

func _physics_process(delta):
	$"Camera Controller/Camera3D".fov =  linear_velocity.length()*2 + 50
