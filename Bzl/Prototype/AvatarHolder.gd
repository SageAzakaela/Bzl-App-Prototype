extends PanelContainer


var avatar_colors: Array = [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0.5, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.25, 0.25, 0.25), Color(0.6, 0.4, 0.2)]
var avatar_eye_colors: Array = [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.3, 0, 0.5), Color(1, 0, 1), Color(0, 0, 0), Color(0.2, 0.2, 0.2), Color(0.6, 0.3, 0.1)]
var avatar_wing_colors: Array = [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]
var avatar_stripe_colors: Array = [Color(1, 1, 1), Color(1, 0, 0), Color(1, 0.5, 0), Color(1, 1, 0), Color(0, 1, 0), Color(0, 1, 1), Color(0, 0, 1), Color(0.29, 0, 0.51), Color(1, 0, 1), Color(0, 0, 0), Color(0.5, 0.5, 0.5), Color(0.55, 0.27, 0.07)]


func _ready():
	var error
	error = CurrentLogIn.connect("avatar_color_changed", self, "on_avatar_color_changed")
	error = CurrentLogIn.connect("avatar_eyes_changed", self, "on_avatar_eyes_changed")
	error = CurrentLogIn.connect("avatar_eye_color_changed", self, "on_avatar_color_changed")
	error = CurrentLogIn.connect("avatar_wing_color_changed", self, "on_avatar_wing_color_changed")
	error = CurrentLogIn.connect("avatar_stripe_changed", self, "on_avatar_stripe_changed")
	error = CurrentLogIn.connect("avatar_stripe_color_changed", self, "on_avatar_stripe_color_changed")
	error = CurrentLogIn.connect("avatar_antennae_changed", self, "on_avatar_antennae_changed")
	error = CurrentLogIn.connect("avatar_stinger_changed", self, "on_avatar_stinger_changed")
	
	if error != OK:
		push_warning("One or more 'avatar changed' signals could not connect.")


func on_avatar_color_changed():
	if CurrentLogIn.avatar_color >= 0 and CurrentLogIn.avatar_color <= avatar_colors.size():
		$Base.modulate = avatar_colors[CurrentLogIn.avatar_color]


func on_avatar_eyes_changed():
	if CurrentLogIn.avatar_eyes == 0:
		$Eyes/Eyes.visible = true
		$Eyes/Eyes2.visible = false
		$Eyes/Eyes3.visible = false
		$Eyes/Eyes4.visible = false
		$Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes == 1:
		$Eyes/Eyes.visible = false
		$Eyes/Eyes2.visible = true
		$Eyes/Eyes3.visible = false
		$Eyes/Eyes4.visible = false
		$Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes == 2:
		$Eyes/Eyes.visible = false
		$Eyes/Eyes2.visible = false
		$Eyes/Eyes3.visible = true
		$Eyes/Eyes4.visible = false
		$Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes == 3:
		$Eyes/Eyes.visible = false
		$Eyes/Eyes2.visible = false
		$Eyes/Eyes3.visible = false
		$Eyes/Eyes4.visible = true
		$Eyes/Eyes5.visible = false
	elif CurrentLogIn.avatar_eyes >= 4:
		$Eyes/Eyes.visible = false
		$Eyes/Eyes2.visible = false
		$Eyes/Eyes3.visible = false
		$Eyes/Eyes4.visible = false
		$Eyes/Eyes5.visible = true


func on_avatar_eye_color_changed():
	if CurrentLogIn.avatar_eye_color >= 0 and CurrentLogIn.avatar_eye_color <= avatar_eye_colors.size():
		$Eyes.modulate = avatar_eye_colors[CurrentLogIn.avatar_eye_color]
	
	
func on_avatar_wing_color_changed():
	if CurrentLogIn.avatar_wing_color >= 0 and CurrentLogIn.avatar_wing_color <= avatar_wing_colors.size():
		$Wings.modulate = avatar_wing_colors[CurrentLogIn.avatar_wing_color]
	

func on_avatar_stripe_changed():
	if CurrentLogIn.avatar_stripe == 0:
		$Stripes/Stripes1.visible = true
		$Stripes/Stripes2.visible = false
		$Stripes/Stripes3.visible = false
		$Stripes/Stripes4.visible = false
		$Stripes/Stripes5.visible = false
		$Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 1:
		$Stripes/Stripes1.visible = false
		$Stripes/Stripes2.visible = true
		$Stripes/Stripes3.visible = false
		$Stripes/Stripes4.visible = false
		$Stripes/Stripes5.visible = false
		$Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 2:
		$Stripes/Stripes1.visible = false
		$Stripes/Stripes2.visible = false
		$Stripes/Stripes3.visible = true
		$Stripes/Stripes4.visible = false
		$Stripes/Stripes5.visible = false
		$Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 3:
		$Stripes/Stripes1.visible = false
		$Stripes/Stripes2.visible = false
		$Stripes/Stripes3.visible = false
		$Stripes/Stripes4.visible = true
		$Stripes/Stripes5.visible = false
		$Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe == 4:
		$Stripes/Stripes1.visible = false
		$Stripes/Stripes2.visible = false
		$Stripes/Stripes3.visible = false
		$Stripes/Stripes4.visible = false
		$Stripes/Stripes5.visible = true
		$Stripes/Stripes6.visible = false
	elif CurrentLogIn.avatar_stripe >= 5:
		$Stripes/Stripes1.visible = false
		$Stripes/Stripes2.visible = false
		$Stripes/Stripes3.visible = false
		$Stripes/Stripes4.visible = false
		$Stripes/Stripes5.visible = false
		$Stripes/Stripes6.visible = true
	
	
func on_avatar_stripe_color_changed():
	if CurrentLogIn.avatar_stripe_color >= 0 and CurrentLogIn.avatar_stripe_color <= avatar_stripe_colors.size():
		$Wings.modulate = avatar_stripe_colors[CurrentLogIn.avatar_stripe_color]
	

func on_avatar_antennae_changed():
	if CurrentLogIn.avatar_antennae == 0:
		$Antannae/Antannae1.visible = true
		$Antannae/Antannae2.visible = false
		$Antannae/Antannae3.visible = false
		$Antannae/Antannae4.visible = false
		$Antannae/Antannae5.visible = false
		$Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 1:
		$Antannae/Antannae1.visible = false
		$Antannae/Antannae2.visible = true
		$Antannae/Antannae3.visible = false
		$Antannae/Antannae4.visible = false
		$Antannae/Antannae5.visible = false
		$Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 2:
		$Antannae/Antannae1.visible = false
		$Antannae/Antannae2.visible = false
		$Antannae/Antannae3.visible = true
		$Antannae/Antannae4.visible = false
		$Antannae/Antannae5.visible = false
		$Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 3:
		$Antannae/Antannae1.visible = false
		$Antannae/Antannae2.visible = false
		$Antannae/Antannae3.visible = false
		$Antannae/Antannae4.visible = true
		$Antannae/Antannae5.visible = false
		$Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 4:
		$Antannae/Antannae1.visible = false
		$Antannae/Antannae2.visible = false
		$Antannae/Antannae3.visible = false
		$Antannae/Antannae4.visible = false
		$Antannae/Antannae5.visible = true
		$Antannae/Antannae6.visible = false

	elif CurrentLogIn.avatar_antennae == 5:
		$Antannae/Antannae1.visible = false
		$Antannae/Antannae2.visible = false
		$Antannae/Antannae3.visible = false
		$Antannae/Antannae4.visible = false
		$Antannae/Antannae5.visible = false
		$Antannae/Antannae6.visible = true


func on_avatar_stinger_changed():
	if CurrentLogIn.avatar_stinger == 0:
		$Stinger/Stinger1.visible = true
		$Stinger/Stinger2.visible = false
		$Stinger/Stinger3.visible = false
		$Stinger/Stinger4.visible = false
	elif CurrentLogIn.avatar_stinger == 1:
		$Stinger/Stinger1.visible = false
		$Stinger/Stinger2.visible = true
		$Stinger/Stinger3.visible = false
		$Stinger/Stinger4.visible = false
	elif CurrentLogIn.avatar_stinger == 2:
		$Stinger/Stinger1.visible = false
		$Stinger/Stinger2.visible = false
		$Stinger/Stinger3.visible = true
		$Stinger/Stinger4.visible = false
	elif CurrentLogIn.avatar_stinger == 3:
		$Stinger/Stinger1.visible = false
		$Stinger/Stinger2.visible = false
		$Stinger/Stinger3.visible = false
		$Stinger/Stinger4.visible = true
