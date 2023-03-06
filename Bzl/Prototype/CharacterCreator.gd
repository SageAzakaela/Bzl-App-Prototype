extends VBoxContainer


var random = RandomNumberGenerator.new()

var avatar_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0.5, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.25, 0.25, 0.25), Color(0.6, 0.4, 0.2)]
var avatar_eye_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.3, 0, 0.5), Color(1, 0, 1), Color(0, 0, 0), Color(0.2, 0.2, 0.2), Color(0.6, 0.3, 0.1)]
var avatar_wing_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]
var avatar_stripe_colors := [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]

@onready var avatar_eye_types := [$Collums/AvatarHolder/Eyes/Eyes, $Collums/AvatarHolder/Eyes/Eyes2, $Collums/AvatarHolder/Eyes/Eyes3, $Collums/AvatarHolder/Eyes/Eyes4, $Collums/AvatarHolder/Eyes/Eyes5]
@onready var avatar_stripe_types := [$Collums/AvatarHolder/Stripes/Stripes1, $Collums/AvatarHolder/Stripes/Stripes2, $Collums/AvatarHolder/Stripes/Stripes3, $Collums/AvatarHolder/Stripes/Stripes4, $Collums/AvatarHolder/Stripes/Stripes5, $Collums/AvatarHolder/Stripes/Stripes6]
@onready var avatar_antennar_types := [$Collums/AvatarHolder/Antannae/Antannae1, $Collums/AvatarHolder/Antannae/Antannae2, $Collums/AvatarHolder/Antannae/Antannae3, $Collums/AvatarHolder/Antannae/Antannae4, $Collums/AvatarHolder/Antannae/Antannae5, $Collums/AvatarHolder/Antannae/Antannae6]
@onready var avatar_stinger_types := [$Collums/AvatarHolder/Stinger/Stinger1, $Collums/AvatarHolder/Stinger/Stinger2, $Collums/AvatarHolder/Stinger/Stinger3, $Collums/AvatarHolder/Stinger/Stinger4]


func _ready():
	# Initialize the RandomNumberGenerator
	random.randomize()
	
	var error
	error = CurrentLogIn.connect("avatar_color_changed",Callable(self,"on_avatar_color_changed"))
	error = CurrentLogIn.connect("avatar_eyes_changed",Callable(self,"on_avatar_eyes_changed"))
	error = CurrentLogIn.connect("avatar_eye_color_changed",Callable(self,"on_avatar_color_changed"))
	error = CurrentLogIn.connect("avatar_wing_color_changed",Callable(self,"on_avatar_wing_color_changed"))
	error = CurrentLogIn.connect("avatar_stripe_changed",Callable(self,"on_avatar_stripe_changed"))
	error = CurrentLogIn.connect("avatar_stripe_color_changed",Callable(self,"on_avatar_stripe_color_changed"))
	error = CurrentLogIn.connect("avatar_antennae_changed",Callable(self,"on_avatar_antennae_changed"))
	error = CurrentLogIn.connect("avatar_stinger_changed",Callable(self,"on_avatar_stinger_changed"))
	
	if error != OK:
		push_warning("One or more 'avatar changed' signals could not connect.")


func on_avatar_color_changed():
	change_color(CurrentLogIn.avatar_color, avatar_colors, $Collums/AvatarHolder/Base)


func on_avatar_eyes_changed():
	change_type(CurrentLogIn.avatar_eyes, avatar_eye_types)


func on_avatar_eye_color_changed():
	change_color(CurrentLogIn.avatar_eye_color, avatar_eye_colors, $Collums/AvatarHolder/Eyes)
	
	
func on_avatar_wing_color_changed():
	change_color(CurrentLogIn.avatar_wing_color, avatar_wing_colors, $Collums/AvatarHolder/Wings)
	

func on_avatar_stripe_changed():
	change_type(CurrentLogIn.avatar_stripe, avatar_stripe_types)
	
	
func on_avatar_stripe_color_changed():
	change_color(CurrentLogIn.avatar_stripe_color, avatar_stripe_colors, $Collums/AvatarHolder/Stripes)
	

func on_avatar_antennae_changed():
	change_type(CurrentLogIn.avatar_antennae, avatar_antennar_types)


func on_avatar_stinger_changed():
	change_type(CurrentLogIn.avatar_stinger, avatar_stinger_types)


# Usage example -> change_color(CurrentLogIn.avatar_stripe_color, avatar_stripe_colors, $Stripes)
func change_color(index, color_references, node):
	if index >= 0 and index < color_references.size():
		node.modulate = color_references[index]


# Usage example -> change_type(CurrentLogIn.avatar_stinger, avatar_stinger_types)
func change_type(index, type_references):
	if index >= 0 and index < type_references.size():
		for i in range(0, type_references.size()-1):
			type_references[i].visible = true if index == i else false


func _on_BackColor_pressed():
	if CurrentLogIn.avatar_color > 0:
		CurrentLogIn.avatar_color -= 1

func _on_BackEyes_pressed():
	if CurrentLogIn.avatar_eyes > 0:
		CurrentLogIn.avatar_eyes -= 1

func _on_BackEyeColor_pressed():
	if CurrentLogIn.avatar_eye_color > 0:
		CurrentLogIn.avatar_eye_color -= 1

func _on_BackWingColor_pressed():
	if CurrentLogIn.avatar_wing_color > 0:
		CurrentLogIn.avatar_wing_color -= 1

func _on_BackStripes_pressed():
	if CurrentLogIn.avatar_stripe > 0:
		CurrentLogIn.avatar_stripe -= 1

func _on_BackStripesColor_pressed():
	if CurrentLogIn.avatar_stripe_color > 0:
		CurrentLogIn.avatar_stripe_color -= 1

func _on_BackAntennae_pressed():
	if CurrentLogIn.avatar_antennae > 0:
		CurrentLogIn.avatar_antennae -= 1

func _on_BackStinger_pressed():
	if CurrentLogIn.avatar_stinger > 0:
		CurrentLogIn.avatar_stinger -= 1

func _on_ForwardColor_pressed():
	CurrentLogIn.avatar_color += 1

func _on_ForwardEyes_pressed():
	CurrentLogIn.avatar_eyes += 1

func _on_ForwardEyeColor_pressed():
	CurrentLogIn.avatar_eye_color += 1

func _on_ForwardWingColor_pressed():
	CurrentLogIn.avatar_wing_color += 1

func _on_ForwardStripes_pressed():
	CurrentLogIn.avatar_stripe += 1

func _on_ForwardStripesColor_pressed():
	CurrentLogIn.avatar_stripe_color += 1

func _on_ForwardAntennae_pressed():
	CurrentLogIn.avatar_antennae += 1

func _on_ForwardStinger_pressed():
	CurrentLogIn.avatar_stinger += 1


func _on_Randomize_pressed():
	CurrentLogIn.avatar_color = random.randi_range(0, 12)
	CurrentLogIn.avatar_eyes = random.randi_range(0, 4)
	CurrentLogIn.avatar_eye_color = random.randi_range(0, 11)
	CurrentLogIn.avatar_wing_color = random.randi_range(0, 11)
	CurrentLogIn.avatar_stripe = random.randi_range(0, 5)
	CurrentLogIn.avatar_stripe_color = random.randi_range(0, 11)
	CurrentLogIn.avatar_antennae = random.randi_range(0, 5)
	CurrentLogIn.avatar_stinger = random.randi_range(0, 3)



func _on_SaveButton_pressed():

	# Save the updated information to the UserData dictionary
	UserData.users[CurrentLogIn.logged_in_username]["avatar_color"] = CurrentLogIn.avatar_color
	UserData.users[CurrentLogIn.logged_in_username]["avatar_eyes"] = CurrentLogIn.avatar_eyes
	UserData.users[CurrentLogIn.logged_in_username]["avatar_eye_color"] = CurrentLogIn.avatar_eye_color
	UserData.users[CurrentLogIn.logged_in_username]["avatar_wing_color"] = CurrentLogIn.avatar_wing_color
	UserData.users[CurrentLogIn.logged_in_username]["avatar_stripe"] = CurrentLogIn.avatar_stripe
	UserData.users[CurrentLogIn.logged_in_username]["avatar_stripe_color"] = CurrentLogIn.avatar_stripe_color
	UserData.users[CurrentLogIn.logged_in_username]["avatar_antennae"] = CurrentLogIn.avatar_antennae
	UserData.users[CurrentLogIn.logged_in_username]["avatar_stinger"] = CurrentLogIn.avatar_stinger

	# Save the updated dictionary to the JSON file
	UserData.save_to_file()

