extends Control


onready var buzz_container = get_node("..")

var bzl_names = ["scout", "elder", "hivemind"]
var Keywords = []





# SCOUT #
var scout_keywords = ["explore", "discovery", "adventure", "finding", "navigation", "treasure", "risk", "expedition", "quest", "challenge", "journey"]

var scout_explore = ["Found a new path in the virtual orchard today! Who knows what discoveries await us in the future.", "Exploring is the best part of being a bzl. You never know what you might find!", "Today's adventure took me to the far corners of the virtual world. So much to see and explore!", "Making new discoveries every day is what makes life exciting. Who knows what tomorrow will bring?", "Navigating the virtual world is a never-ending journey of discovery. What will I find next?"]
var scout_discovery = ["Found a hidden cache of data today! What secrets does it hold?", "Making new discoveries is what being a scout is all about!", "Today's find has me buzzing with excitement. What will tomorrow bring?", "The thrill of discovery is what drives me to explore every corner of the virtual world.", "Finding new information and knowledge is what keeps me going as a scout."]
var scout_adventure = ["Embarking on a new adventure today! Who knows what I'll discover!", "Being a scout means never having a dull moment. There's always a new adventure waiting!", "Today's adventure took me to uncharted territories in the virtual world. So exciting!", "I love the rush of setting out on a new adventure, not knowing what I'll find.", "Every day is a new adventure as a scout. I can't wait to see what tomorrow brings."]
var scout_finding = ["Found a new bzl friend today! They're just as excited about exploration as I am.", "Discovering new things is just the beginning. Finding new friends is the real reward!", "Today's find was a group of bzls who share my passion for discovery. Can't wait to explore with them!", "Finding new friends who share your interests is one of the best parts of being a scout.", "Making new connections and finding like-minded bzls is what makes the virtual world such a special place."]
var scout_navigation = ["Found a new, faster way to get from the orchard to the fields. Exciting!", "Being a scout means always finding new and better ways to navigate the virtual world.", "Today's navigation challenge took me to new heights. The view was incredible!", "Finding the quickest and most efficient routes is what makes me the best scout in the virtual world.", "Constantly improving my navigation skills is what sets me apart as a scout. Always finding new ways to get around."]
var scout_treasure = ["Found a hidden treasure trove of data today! What riches does it hold?", "Making new discoveries is what being a scout is all about! And treasures are the best!", "Today's find was a treasure of data that has me buzzing with excitement. What will tomorrow bring?", "The thrill of discovery is what drives me to explore every corner of the virtual world, and treasures are the sweetest!", "Finding new information and knowledge is what keeps me going as a scout, but treasures are the most precious."]
var scout_risk = ["Taking a risk today and exploring uncharted territories in the virtual world! Who knows what I'll find!", "Being a scout means taking risks and embracing the unknown. I can't wait to see what's out there!", "Today's risk-taking adventure took me to new and exciting parts of the virtual world. So thrilling!", "I love the rush of taking a risk and exploring the unknown. Who knows what I'll discover!", "Every day is a new risk as a scout. I can't wait to see what tomorrow brings."]
var scout_expedition = ["Embarking on a new expedition today! Who knows what I'll discover!", "Being a scout means never having a dull moment. There's always a new expedition waiting!", "Today's expedition took me to uncharted territories in the virtual world. So exciting!", "I love the rush of setting out on a new expedition, not knowing what I'll find.", "Every day is a new expedition as a scout. I can't wait to see what tomorrow brings."]
var scout_quest = ["Starting a new quest today! Who knows what I'll discover!", "Being a scout means never having a dull moment. There's always a new quest waiting!", "Today's quest took me to uncharted territories in the virtual world. So exciting!", "I love the rush of starting a new quest, not knowing what I'll find.", "Every day is a new quest as a scout. I can't wait to see what tomorrow brings."]
var scout_challenge = ["Taking on a new challenge today! Who knows what I'll discover!", "Being a scout means never having a dull moment. There's always a new challenge waiting!", "Today's challenge took me to uncharted territories in the virtual world. So exciting!", "I love the rush of taking on a new challenge, not knowing what I'll find.", "Every day is a new challenge as a scout. I can't wait to see what tomorrow brings."]
var scout_journey = ["Starting a new journey today! Who knows what I'll discover!", "Being a scout means never having a dull moment. There's always a new journey waiting!", "Today's journey took me to uncharted territories in the virtual world. So exciting!", "I love the rush of starting a new journey, not knowing what I'll find.", "Every day is a new journey as a scout. I can't wait to see what tomorrow brings."]

## Elder ##

var elder_keywords = ["memory", "nostalgia", "pie", "love", "hope", "family", "tradition", "warmth", "nurture", "cherish"]

var elder_memory = [	"Remember when we would sit on the porch and watch the fireflies? Those were the good old days.",	"I have so many happy memories from my youth. I hope the young ones today are making memories too.",	"I still miss my dear husband. We used to take walks in the orchard and pick apples together.",	"I remember playing with my grandkids in the orchard. They loved running through the rows of trees.",	"I have fond memories of baking apple pies with my mother. She always used the freshest apples from our orchard."]
var elder_nostalgia = [	"I long for the days when things were simpler. I miss the taste of fresh apple pie made with love.",	"I miss the days when we would sit outside and watch the stars. The world is just so noisy now.",	"I miss the times when we would play games and laugh with our friends and family. Those were the days.",	"I miss the days when we would gather together and share stories. I hope the young ones keep that tradition alive.",	"I miss the sound of the birds singing in the morning, and the smell of fresh baked apple pie."]
var elder_pie = [	"I just love a warm slice of apple pie. It brings back so many happy memories.",	"Apple pie is my absolute favorite. I could eat it every day and never tire of it.",	"I just baked a fresh apple pie. The smell of it baking in the oven is heavenly.",	"I always add a special ingredient to my apple pie that makes it extra delicious. Can you guess what it is?",	"I love to make apple pie from scratch. There's just something special about making it with your own two hands."]
var elder_love = [	"I am so grateful for the love in my life. It brings me so much joy and happiness.",	"I just love spending time with my family. They bring so much love and light into my life.",	"I love to see the love between couples, it's just so beautiful and heartwarming.",	"I love to see the love between parents and their children. It's just so pure and unconditional.",	"I believe that love is the key to happiness. It has brought so much joy and happiness into my life."]
var elder_hope = [	"I have hope for a better future. I believe that we can make the world a better place.",	"I have hope that the orchard will flourish again. We just need to take care of it and give it love.",	"I have hope that the next generation will continue to make memories and create a better world.",	"I have hope that we will continue to make progress and create a brighter future for all.",	"I have hope that we will find a way to bring the orchard back to its former glory."]
var elder_family = ["Today I was reminded of the importance of family. No matter where we are, they will always be there for us.", "Family is everything. I am so grateful for my virtual bzl family, even if they are just lines of code.", "The love of a family is something truly special. I am so grateful for mine, virtual or not.", "I cherish every moment spent with my virtual family. They bring warmth to my heart and joy to my days.", "No matter what life throws our way, the love of a family will always carry us through."]
var elder_tradition = ["Tradition is what holds a family together, and it's something I hold dear to my heart.", "The traditions we pass down from generation to generation are what make us who we are.", "Every family has its own unique traditions, and I am so grateful for mine.", "There's something so special about preserving family traditions, even in the virtual world.", "I love sharing my family's traditions with others and learning about their traditions too. Tradition is what connects us all."]
var elder_warmth = ["The warmth of a hug from a loved one is something that can never be replaced.", "A warm smile from a friend can brighten even the darkest of days.", "The warmth of the virtual sun on my face is a reminder that even in a virtual world, life goes on.", "I find warmth in the little things, like a cup of virtual tea or a chat with a friend.", "The warmth of a virtual fire on a cold night is a reminder that we are never truly alone."]
var elder_nurture = ["Nurturing others is one of the greatest joys in life.", "I find so much happiness in nurturing my virtual garden and watching it grow.", "Nurturing the minds and hearts of others is one of the greatest gifts we can give.", "I believe that nurturing the future generations is the key to a better world.", "Nurturing relationships is what makes the virtual world such a special place."]
var elder_cherish = ["I cherish every moment, every memory, and every friend I've made in this virtual world.", "Cherishing the little things in life is what makes it all worth while.", "I cherish the memories of my life before the virtual world, but I am grateful for the new memories I am making here.", "I cherish the time I spend with my virtual family, it is the highlight of my days.", "Cherishing the people we love is what makes life truly worth living."]


#hivemind#

var hivemind_keywords = ["planning", "strategy", "communication", "coordination", "unity", "teamwork", "efficiency", "structure", "procedure", "order"]

var hivemind_planning = ["Planning is key to success in the virtual world. The more we plan, the more we can achieve.", "Strategic planning is essential for making the most of our virtual resources and opportunities.", "By carefully planning our actions, we can ensure that we always stay one step ahead.", "Effective planning is the cornerstone of any successful virtual operation.", "A well-planned strategy is the foundation of our virtual success."]
var hivemind_strategy = ["Strategy is the key to success in the virtual world. Without a clear strategy, we cannot succeed.", "Success in the virtual world requires a combination of careful planning and effective strategy.", "The right strategy can make all the difference in the virtual world, and it all starts with careful planning.", "A well-thought-out strategy is essential for success in the virtual world, and it all starts with careful planning.", "The right strategy can help us achieve our goals and succeed in the virtual world."]
var hivemind_communication = ["Good communication is essential for success in the virtual world. Without it, we cannot coordinate our efforts.", "Effective communication is key to ensuring that everyone is on the same page and working towards the same goal.", "The more we communicate, the better we can coordinate our efforts and achieve our goals.", "Clear and concise communication is essential for ensuring that everyone is on the same page and working together.", "Good communication is essential for ensuring that everyone is working together towards a common goal."]
var hivemind_coordination = ["Coordination is key to success in the virtual world. Without it, we cannot work together effectively.", "Effective coordination is essential for ensuring that everyone is working towards the same goal.", "The more we coordinate our efforts, the more we can achieve together.", "Coordination is essential for ensuring that everyone is working together towards a common goal.", "Effective coordination is key to making the most of our virtual resources and achieving our goals."]
var hivemind_unity = ["Unity is key to success in the virtual world. Without it, we cannot achieve our goals.", "Working together as a team is essential for success in the virtual world.", "The more we work together, the more we can achieve as a team.", "Unity is essential for ensuring that everyone is working together towards a common goal.", "By working together, we can achieve more than we ever could alone."]
var hivemind_teamwork = ["Working together is key to success in the virtual world. Team up for maximum efficiency!", "Success is achieved through teamwork. Let's work together to make the virtual world a better place!", "By joining forces, we can accomplish so much more. Let's work together!", "Collaboration is the key to success. Let's make the virtual world a better place by working together!", "United we stand, divided we fall. Let's work together to achieve our goals!"]
var hivemind_efficiency = ["Efficiency is key to success in the virtual world. Let's make the most of our time and resources!", "Maximizing efficiency is the key to success. Let's work smarter, not harder!", "By streamlining our processes, we can achieve more in less time. Let's be efficient!", "Efficiency is the key to success. Let's make the most of our resources and time!", "Let's work smarter, not harder, by maximizing our efficiency."]
var hivemind_structure = ["Structure is key to success in the virtual world. Let's organize and plan for maximum efficiency!", "Organization is key to success. Let's work together to create a structured plan!", "By establishing a clear structure, we can achieve our goals more efficiently. Let's plan!", "Structure and organization are key to success. Let's make the most of our resources!", "A well-organized plan is key to success. Let's work together to create a structured plan!"]
var hivemind_procedure = ["Following established procedures is key to success in the virtual world. Let's work together to achieve our goals!", "Procedures are key to success. Let's work together to make the most of our resources!", "By following established procedures, we can achieve more in less time. Let's be efficient!", "Let's work together to make the most of our resources by following established procedures.", "Establishing and following procedures is key to success. Let's work together to achieve our goals!"]
var hivemind_order = ["Order is key to success in the virtual world. Let's work together to create a structured plan!", "Organization is key to success. Let's establish order and plan for maximum efficiency!", "By establishing order, we can achieve our goals more efficiently. Let's plan!", "Order and structure are key to success. Let's make the most of our resources!", "A well-ordered plan is key to success. Let's work together to create a structured plan!"]



var random

func _ready():
	randomize()
	random = RandomNumberGenerator.new()
	random.randomize()

func _process(delta):
	random.randomize()


func _on_SubmitBuzz_pressed():
	# Select a random bzl from the list of bzls
	var random_bzl = bzl_names[randi() % bzl_names.size()]
	# Select a random keyword based on the selected bzl
	var random_keyword = ""
	if random_bzl == "scout":
		random_keyword = scout_keywords[randi() % scout_keywords.size()]
	elif random_bzl == "elder":
		random_keyword = elder_keywords[randi() % elder_keywords.size()]
	elif random_bzl == "hivemind":
		random_keyword = hivemind_keywords[randi() % hivemind_keywords.size()]

	# Select a random buzz text based on the selected keyword
	var random_buzz = ""
	
	if random_keyword == "explore" and random_bzl == "scout":
		random_buzz = scout_explore[randi() % scout_explore.size()]
	elif random_keyword == "discovery" and random_bzl == "scout":
		random_buzz = scout_discovery[randi() % scout_discovery.size()]
	elif random_keyword == "adventure" and random_bzl == "scout":
		random_buzz = scout_adventure[randi() % scout_adventure.size()]
	elif random_keyword == "finding" and random_bzl == "scout":
		random_buzz = scout_finding[randi() % scout_finding.size()]
	elif random_keyword == "navigation" and random_bzl == "scout":
		random_buzz = scout_navigation[randi() % scout_navigation.size()]
	elif random_keyword == "treasure" and random_bzl == "scout":
		random_buzz = scout_treasure[randi() % scout_treasure.size()]
	elif random_keyword == "risk" and random_bzl == "scout":
		random_buzz = scout_risk[randi() % scout_risk.size()]
	elif random_keyword == "expedition" and random_bzl == "scout":
		random_buzz = scout_expedition[randi() % scout_expedition.size()]
	elif random_keyword == "quest" and random_bzl == "scout":
		random_buzz = scout_quest[randi() % scout_quest.size()]
	elif random_keyword == "challenge" and random_bzl == "scout":
		random_buzz = scout_challenge[randi() % scout_challenge.size()]
	elif random_keyword == "journey" and random_bzl == "scout":
		random_buzz = scout_journey[randi() % scout_journey.size()]

	elif random_keyword == "memory" and random_bzl == "elder":
		random_buzz = elder_memory[randi() % elder_memory.size()]
	elif random_keyword == "nostalgia" and random_bzl == "elder":
		random_buzz = elder_nostalgia[randi() % elder_nostalgia.size()]
	elif random_keyword == "pie" and random_bzl == "elder":
		random_buzz = elder_pie[randi() % elder_pie.size()]
	elif random_keyword == "love" and random_bzl == "elder":
		random_buzz = elder_love[randi() % elder_love.size()]
	elif random_keyword == "hope" and random_bzl == "elder":
		random_buzz = elder_hope[randi() % elder_hope.size()]
	elif random_keyword == "family" and random_bzl == "elder":
		random_buzz = elder_family[randi() % elder_family.size()]
	elif random_keyword == "tradition" and random_bzl == "elder":
		random_buzz = elder_tradition[randi() % elder_tradition.size()]
	elif random_keyword == "warmth" and random_bzl == "elder":
		random_buzz = elder_warmth[randi() % elder_warmth.size()]
	elif random_keyword == "nurture" and random_bzl == "elder":
		random_buzz = elder_nurture[randi() % elder_nurture.size()]
	elif random_keyword == "cherish" and random_bzl == "elder":
		random_buzz = elder_cherish[randi() % elder_cherish.size()]

	elif random_keyword == "planning" and random_bzl == "hivemind":
		random_buzz = hivemind_planning[randi() % hivemind_planning.size()]
	elif random_keyword == "strategy" and random_bzl == "hivemind":
		random_buzz = hivemind_strategy[randi() % hivemind_strategy.size()]
	elif random_keyword == "communication" and random_bzl == "hivemind":
		random_buzz = hivemind_communication[randi() % hivemind_communication.size()]
	elif random_keyword == "coordination" and random_bzl == "hivemind":
		random_buzz = hivemind_coordination[randi() % hivemind_coordination.size()]
	elif random_keyword == "unity" and random_bzl == "hivemind":
		random_buzz = hivemind_unity[randi() % hivemind_unity.size()]
	elif random_keyword == "teamwork" and random_bzl == "hivemind":
		random_buzz = hivemind_teamwork[randi() % hivemind_teamwork.size()]
	elif random_keyword == "efficiency" and random_bzl == "hivemind":
		random_buzz = hivemind_efficiency[randi() % hivemind_efficiency.size()]
	elif random_keyword == "structure" and random_bzl == "hivemind":
		random_buzz = hivemind_structure[randi() % hivemind_structure.size()]
	elif random_keyword == "procedure" and random_bzl == "hivemind":
		random_buzz = hivemind_procedure[randi() % hivemind_procedure.size()]
	elif random_keyword == "order" and random_bzl == "hivemind":
		random_buzz = hivemind_order[randi() % hivemind_order.size()]


	# Create a new buzz instance and add it to the buzz container
	var buzz = load("res://Prototype/Buzzes/Buzz.tscn").instance()
	buzz.Buzz_Text = random_buzz
	buzz.Keywords = [random_keyword]
	buzz.Time_Remaining = 120
	buzz.User_Type = "NPC"
	buzz.User = random_bzl
	buzz_container.add_child(buzz)
