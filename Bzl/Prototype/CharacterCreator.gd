extends VBoxContainer



var random = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize the RandomNumberGenerator
	random.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Check the value of the `color` variable
	if CurrentLogIn.avatar_color <= 0:
		# Set the color of the `Base` node to white
		$Collums/AvatarHolder/Base.modulate = Color(1, 1, 1)
	elif CurrentLogIn.avatar_color == 1:
		# Set the color of the `Base` node to red
		$Collums/AvatarHolder/Base.modulate = Color(1, 0, 0)
	elif CurrentLogIn.avatar_color == 2:
		# Set the color of the `Base` node to orange
		$Collums/AvatarHolder/Base.modulate = Color(1, 0.5, 0)
	elif CurrentLogIn.avatar_color == 3:
		# Set the color of the `Base` node to yellow
		$Collums/AvatarHolder/Base.modulate = Color(1, 1, 0)
	elif CurrentLogIn.avatar_color == 4:
		# Set the color of the `Base` node to green
		$Collums/AvatarHolder/Base.modulate = Color(0, 1, 0)
	elif CurrentLogIn.avatar_color == 5:
		# Set the color of the `Base` node to teal
		$Collums/AvatarHolder/Base.modulate = Color(0, 1, 1)
	elif CurrentLogIn.avatar_color == 6:
		# Set the color of the `Base` node to cyan
		$Collums/AvatarHolder/Base.modulate = Color(0, 0.5, 1)
	elif CurrentLogIn.avatar_color == 7:
		# Set the color of the `Base` node to blue
		$Collums/AvatarHolder/Base.modulate = Color(0, 0, 1)
	elif CurrentLogIn.avatar_color == 8:
		# Set the color of the `Base` node to indigo
		$Collums/AvatarHolder/Base.modulate = Color(0.29, 0, 0.51)
	elif CurrentLogIn.avatar_color == 9:
		# Set the color of the `Base` node to magenta
		$Collums/AvatarHolder/Base.modulate = Color(1, 0, 1)
	elif CurrentLogIn.avatar_color == 10:
		# Set the color of the `Base` node to black
		$Collums/AvatarHolder/Base.modulate = Color(0, 0, 0)
	elif CurrentLogIn.avatar_color == 11:
		# Set the color of the `Base` node to dark grey
		$Collums/AvatarHolder/Base.modulate = Color(0.25, 0.25, 0.25)
	elif CurrentLogIn.avatar_color >= 12:
		# Set the color of the `Base` node to brown
		$Collums/AvatarHolder/Base.modulate = Color(0.6, 0.4, 0.2)
		CurrentLogIn.avatar_color = 12
		
	if CurrentLogIn.avatar_eyes == 0:
		$Collums/AvatarHolder/Eyes/Eyes.visible = true
		$Collums/AvatarHolder/Eyes/Eyes2.visible = false
		$Collums/AvatarHolder/Eyes/Eyes3.visible = false
		$Collums/AvatarHolder/Eyes/Eyes4.visible = false
		$Collums/AvatarHolder/Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes == 1:
		$Collums/AvatarHolder/Eyes/Eyes.visible = false
		$Collums/AvatarHolder/Eyes/Eyes2.visible = true
		$Collums/AvatarHolder/Eyes/Eyes3.visible = false
		$Collums/AvatarHolder/Eyes/Eyes4.visible = false
		$Collums/AvatarHolder/Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes == 2:
		$Collums/AvatarHolder/Eyes/Eyes.visible = false
		$Collums/AvatarHolder/Eyes/Eyes2.visible = false
		$Collums/AvatarHolder/Eyes/Eyes3.visible = true
		$Collums/AvatarHolder/Eyes/Eyes4.visible = false
		$Collums/AvatarHolder/Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes == 3:
		$Collums/AvatarHolder/Eyes/Eyes.visible = false
		$Collums/AvatarHolder/Eyes/Eyes2.visible = false
		$Collums/AvatarHolder/Eyes/Eyes3.visible = false
		$Collums/AvatarHolder/Eyes/Eyes4.visible = true
		$Collums/AvatarHolder/Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes >= 4:
		$Collums/AvatarHolder/Eyes/Eyes.visible = false
		$Collums/AvatarHolder/Eyes/Eyes2.visible = false
		$Collums/AvatarHolder/Eyes/Eyes3.visible = false
		$Collums/AvatarHolder/Eyes/Eyes4.visible = false
		$Collums/AvatarHolder/Eyes/Eyes5.visible = true
		CurrentLogIn.avatar_eyes = 4

	if CurrentLogIn.avatar_eye_color == 0:
		$Collums/AvatarHolder/Eyes.modulate = Color(1, 1, 1)
	elif CurrentLogIn.avatar_eye_color == 1:
		$Collums/AvatarHolder/Eyes.modulate = Color(1, 0, 0)
	elif CurrentLogIn.avatar_eye_color == 2:
		$Collums/AvatarHolder/Eyes.modulate = Color(1, 0.5, 0)
	elif CurrentLogIn.avatar_eye_color == 3:
		$Collums/AvatarHolder/Eyes.modulate = Color(1, 1, 0)
	elif CurrentLogIn.avatar_eye_color == 4:
		$Collums/AvatarHolder/Eyes.modulate = Color(0, 1, 0)
	elif CurrentLogIn.avatar_eye_color == 5:
		$Collums/AvatarHolder/Eyes.modulate = Color(0, 1, 1)
	elif CurrentLogIn.avatar_eye_color == 6:
		$Collums/AvatarHolder/Eyes.modulate = Color(0, 0, 1)
	elif CurrentLogIn.avatar_eye_color == 7:
		$Collums/AvatarHolder/Eyes.modulate = Color(0.3, 0, 0.5)
	elif CurrentLogIn.avatar_eye_color == 8:
		$Collums/AvatarHolder/Eyes.modulate = Color(1, 0, 1)
	elif CurrentLogIn.avatar_eye_color == 9:
		$Collums/AvatarHolder/Eyes.modulate = Color(0, 0, 0)
	elif CurrentLogIn.avatar_eye_color == 10:
		$Collums/AvatarHolder/Eyes.modulate = Color(0.2, 0.2, 0.2)
	elif CurrentLogIn.avatar_eye_color == 11:
		$Collums/AvatarHolder/Eyes.modulate = Color(0.6, 0.3, 0.1)
		CurrentLogIn.avatar_eye_color = 11
	
	
	if CurrentLogIn.avatar_wing_color == 0:
		$Collums/AvatarHolder/Wings.modulate = Color(1, 1, 1)
	elif CurrentLogIn.avatar_wing_color == 1:
		$Collums/AvatarHolder/Wings.modulate = Color(1, 0, 0)
	elif CurrentLogIn.avatar_wing_color == 2:
		$Collums/AvatarHolder/Wings.modulate = Color(1, 0.5, 0)
	elif CurrentLogIn.avatar_wing_color == 3:
		$Collums/AvatarHolder/Wings.modulate = Color(1, 1, 0)
	elif CurrentLogIn.avatar_wing_color == 4:
		$Collums/AvatarHolder/Wings.modulate = Color(0, 1, 0)
	elif CurrentLogIn.avatar_wing_color == 5:
		$Collums/AvatarHolder/Wings.modulate = Color(0, 1, 1)
	elif CurrentLogIn.avatar_wing_color == 6:
		$Collums/AvatarHolder/Wings.modulate = Color(0, 0, 1)
	elif CurrentLogIn.avatar_wing_color == 7:
		$Collums/AvatarHolder/Wings.modulate = Color(0.29, 0, 0.51)
	elif CurrentLogIn.avatar_wing_color == 8:
		$Collums/AvatarHolder/Wings.modulate = Color(1, 0, 1)
	elif CurrentLogIn.avatar_wing_color == 9:
		$Collums/AvatarHolder/Wings.modulate = Color(0, 0, 0)
	elif CurrentLogIn.avatar_wing_color == 10:
		$Collums/AvatarHolder/Wings.modulate = Color(0.5, 0.5, 0.5)
	elif CurrentLogIn.avatar_wing_color == 11:
		$Collums/AvatarHolder/Wings.modulate = Color(0.55, 0.27, 0.07)
		CurrentLogIn.avatar_wing_color = 11
		
	
	if CurrentLogIn.avatar_stripe == 0:
		$Collums/AvatarHolder/Stripes/Stripes1.visible = true
		$Collums/AvatarHolder/Stripes/Stripes2.visible = false
		$Collums/AvatarHolder/Stripes/Stripes3.visible = false
		$Collums/AvatarHolder/Stripes/Stripes4.visible = false
		$Collums/AvatarHolder/Stripes/Stripes5.visible = false
		$Collums/AvatarHolder/Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 1:
		$Collums/AvatarHolder/Stripes/Stripes1.visible = false
		$Collums/AvatarHolder/Stripes/Stripes2.visible = true
		$Collums/AvatarHolder/Stripes/Stripes3.visible = false
		$Collums/AvatarHolder/Stripes/Stripes4.visible = false
		$Collums/AvatarHolder/Stripes/Stripes5.visible = false
		$Collums/AvatarHolder/Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 2:
		$Collums/AvatarHolder/Stripes/Stripes1.visible = false
		$Collums/AvatarHolder/Stripes/Stripes2.visible = false
		$Collums/AvatarHolder/Stripes/Stripes3.visible = true
		$Collums/AvatarHolder/Stripes/Stripes4.visible = false
		$Collums/AvatarHolder/Stripes/Stripes5.visible = false
		$Collums/AvatarHolder/Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 3:
		$Collums/AvatarHolder/Stripes/Stripes1.visible = false
		$Collums/AvatarHolder/Stripes/Stripes2.visible = false
		$Collums/AvatarHolder/Stripes/Stripes3.visible = false
		$Collums/AvatarHolder/Stripes/Stripes4.visible = true
		$Collums/AvatarHolder/Stripes/Stripes5.visible = false
		$Collums/AvatarHolder/Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 4:
		$Collums/AvatarHolder/Stripes/Stripes1.visible = false
		$Collums/AvatarHolder/Stripes/Stripes2.visible = false
		$Collums/AvatarHolder/Stripes/Stripes3.visible = false
		$Collums/AvatarHolder/Stripes/Stripes4.visible = false
		$Collums/AvatarHolder/Stripes/Stripes5.visible = true
		$Collums/AvatarHolder/Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe >= 5:
		$Collums/AvatarHolder/Stripes/Stripes1.visible = false
		$Collums/AvatarHolder/Stripes/Stripes2.visible = false
		$Collums/AvatarHolder/Stripes/Stripes3.visible = false
		$Collums/AvatarHolder/Stripes/Stripes4.visible = false
		$Collums/AvatarHolder/Stripes/Stripes5.visible = false
		$Collums/AvatarHolder/Stripes/Stripes6.visible = true
		CurrentLogIn.avatar_stripe = 5
			
	if CurrentLogIn.avatar_stripe_color == 0:
		$Collums/AvatarHolder/Stripes.modulate = Color(1, 1, 1)
	elif CurrentLogIn.avatar_stripe_color == 1:
		$Collums/AvatarHolder/Stripes.modulate = Color(1, 0, 0)
	elif CurrentLogIn.avatar_stripe_color == 2:
		$Collums/AvatarHolder/Stripes.modulate = Color(1, 0.5, 0)
	elif CurrentLogIn.avatar_stripe_color == 3:
		$Collums/AvatarHolder/Stripes.modulate = Color(1, 1, 0)
	elif CurrentLogIn.avatar_stripe_color == 4:
		$Collums/AvatarHolder/Stripes.modulate = Color(0, 1, 0)
	elif CurrentLogIn.avatar_stripe_color == 5:
		$Collums/AvatarHolder/Stripes.modulate = Color(0, 1, 1)
	elif CurrentLogIn.avatar_stripe_color == 6:
		$Collums/AvatarHolder/Stripes.modulate = Color(0, 0, 1)
	elif CurrentLogIn.avatar_stripe_color == 7:
		$Collums/AvatarHolder/Stripes.modulate = Color(0.29, 0, 0.51)
	elif CurrentLogIn.avatar_stripe_color == 8:
		$Collums/AvatarHolder/Stripes.modulate = Color(1, 0, 1)
	elif CurrentLogIn.avatar_stripe_color == 9:
		$Collums/AvatarHolder/Stripes.modulate = Color(0, 0, 0)
	elif CurrentLogIn.avatar_stripe_color == 10:
		$Collums/AvatarHolder/Stripes.modulate = Color(0.5, 0.5, 0.5)
	elif CurrentLogIn.avatar_stripe_color >= 11:
		$Collums/AvatarHolder/Stripes.modulate = Color(0.55, 0.27, 0.07)
		CurrentLogIn.avatar_stripe_color = 11
	
	if CurrentLogIn.avatar_antennae == 0:
		$Collums/AvatarHolder/Antannae/Antannae1.visible = true
		$Collums/AvatarHolder/Antannae/Antannae2.visible = false
		$Collums/AvatarHolder/Antannae/Antannae3.visible = false
		$Collums/AvatarHolder/Antannae/Antannae4.visible = false
		$Collums/AvatarHolder/Antannae/Antannae5.visible = false
		$Collums/AvatarHolder/Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 1:
		$Collums/AvatarHolder/Antannae/Antannae1.visible = false
		$Collums/AvatarHolder/Antannae/Antannae2.visible = true
		$Collums/AvatarHolder/Antannae/Antannae3.visible = false
		$Collums/AvatarHolder/Antannae/Antannae4.visible = false
		$Collums/AvatarHolder/Antannae/Antannae5.visible = false
		$Collums/AvatarHolder/Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 2:
		$Collums/AvatarHolder/Antannae/Antannae1.visible = false
		$Collums/AvatarHolder/Antannae/Antannae2.visible = false
		$Collums/AvatarHolder/Antannae/Antannae3.visible = true
		$Collums/AvatarHolder/Antannae/Antannae4.visible = false
		$Collums/AvatarHolder/Antannae/Antannae5.visible = false
		$Collums/AvatarHolder/Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 3:
		$Collums/AvatarHolder/Antannae/Antannae1.visible = false
		$Collums/AvatarHolder/Antannae/Antannae2.visible = false
		$Collums/AvatarHolder/Antannae/Antannae3.visible = false
		$Collums/AvatarHolder/Antannae/Antannae4.visible = true
		$Collums/AvatarHolder/Antannae/Antannae5.visible = false
		$Collums/AvatarHolder/Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 4:
		$Collums/AvatarHolder/Antannae/Antannae1.visible = false
		$Collums/AvatarHolder/Antannae/Antannae2.visible = false
		$Collums/AvatarHolder/Antannae/Antannae3.visible = false
		$Collums/AvatarHolder/Antannae/Antannae4.visible = false
		$Collums/AvatarHolder/Antannae/Antannae5.visible = true
		$Collums/AvatarHolder/Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 5:
		$Collums/AvatarHolder/Antannae/Antannae1.visible = false
		$Collums/AvatarHolder/Antannae/Antannae2.visible = false
		$Collums/AvatarHolder/Antannae/Antannae3.visible = false
		$Collums/AvatarHolder/Antannae/Antannae4.visible = false
		$Collums/AvatarHolder/Antannae/Antannae5.visible = false
		$Collums/AvatarHolder/Antannae/Antannae6.visible = true
		CurrentLogIn.avatar_antennae = 5
		
	if CurrentLogIn.avatar_stinger == 0:
		$Collums/AvatarHolder/Stinger/Stinger1.visible = true
		$Collums/AvatarHolder/Stinger/Stinger2.visible = false
		$Collums/AvatarHolder/Stinger/Stinger3.visible = false
		$Collums/AvatarHolder/Stinger/Stinger4.visible = false
	elif CurrentLogIn.avatar_stinger == 1:
		$Collums/AvatarHolder/Stinger/Stinger1.visible = false
		$Collums/AvatarHolder/Stinger/Stinger2.visible = true
		$Collums/AvatarHolder/Stinger/Stinger3.visible = false
		$Collums/AvatarHolder/Stinger/Stinger4.visible = false
	elif CurrentLogIn.avatar_stinger == 2:
		$Collums/AvatarHolder/Stinger/Stinger1.visible = false
		$Collums/AvatarHolder/Stinger/Stinger2.visible = false
		$Collums/AvatarHolder/Stinger/Stinger3.visible = true
		$Collums/AvatarHolder/Stinger/Stinger4.visible = false
	elif CurrentLogIn.avatar_stinger == 3:
		$Collums/AvatarHolder/Stinger/Stinger1.visible = false
		$Collums/AvatarHolder/Stinger/Stinger2.visible = false
		$Collums/AvatarHolder/Stinger/Stinger3.visible = false
		$Collums/AvatarHolder/Stinger/Stinger4.visible = true
		CurrentLogIn.avatar_stinger = 3

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

