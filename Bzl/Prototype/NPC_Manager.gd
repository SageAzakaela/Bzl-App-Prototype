extends Control


onready var buzz_container = get_node("..")

var bzl_names = ["scout", "elder", "hivemind", "dragonseeker"]
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

# dragon seeker

var dragonseeker_keywords = ["dragons", "mythology", "legends", "creatures", "fantasy", "folklore"]



var dragonseeker_dragons = [
"Did you know that dragons in ancient China were seen as symbols of power and good luck? They were often depicted with pearls and other precious stones to show their wealth.",
"In medieval Europe, dragons were depicted as fierce and dangerous creatures, often terrorizing villages and hoarding treasure. They were often depicted as being defeated by knights.",
"Dragons in various cultures were said to have the ability to breathe fire or poison, control the weather, and even possess the power to grant wishes.",
"The dragon is a common motif in many cultures, appearing in folklore and mythology from China, Europe, and even the Americas. They are often portrayed as powerful and mysterious creatures.",
"There is a famous dragon in Norse mythology named Jörmungandr, also known as the Midgard Serpent. It was said to be so large that it could encircle the world and grasp its own tail.",
"In some cultures, dragons were even seen as protectors, guarding sacred places and treasures. The dragon is often seen as a symbol of strength and courage, as well as a symbol of wisdom.",
"Did you know that in ancient Chinese mythology, dragons were revered as symbols of power and strength? They were also believed to control the elements and bring good luck.",
"The dragon is a popular symbol in many cultures around the world, from Europe to Asia. In Europe, they are often portrayed as fearsome beasts to be defeated, while in Asia they are seen as powerful but benevolent creatures.",
"Dragons come in many shapes and sizes, but the most common type is the European dragon, with its large wings, sharp claws, and fiery breath. These dragons were said to live in caves and hoard treasure.",
"In addition to their fearsome reputation, dragons have also been associated with wisdom and intelligence. They are often depicted as wise and all-knowing creatures, with the ability to solve problems and make good decisions.",
"Not all dragons are fearsome beasts. In some cultures, dragons are seen as protectors and bringers of good fortune. For example, in Japanese mythology, the dragon is often seen as a symbol of protection and is said to bring rain for a bountiful harvest."
]

var dragonseeker_mythology = [	"The ancient Greeks believed that the world was created from the remnants of the Titans' defeat by Zeus. ",	
"In Norse mythology, the god Thor was known for his strength and bravery. He was also the protector of humanity.",	
"In Hindu mythology, the god Vishnu is known as the preserver of the universe. He is often depicted holding a conch shell.",	
"In Chinese mythology, dragons are seen as powerful and benevolent creatures, representing strength, luck and good fortune.",	
"In Native American folklore, the Thunderbird is a powerful spirit that is said to bring the sound of thunder when it beats its wings.",	
"In African mythology, Anansi the Spider is a trickster god who is known for his cunning and wit.",	
"In Japanese mythology, the eight-headed serpent Yamata no Orochi was defeated by the god Susanoo, who then became the god of the sea.",	
"In Hawaiian mythology, Pele is the goddess of fire, lightning, wind and volcanoes. She is also known for her temper and jealousy.",	
"In Aztec mythology, the feathered serpent god Quetzalcoatl was considered the god of wind, wisdom and the arts.",	
"In Celtic mythology, the goddess Brigid was associated with fire, poetry, healing and the sun. She was also known as the goddess of the hearth."]

var dragonseeker_legends = [
"Did you know that in ancient Greece, the Chimera was a fearsome creature with the body of a lion, the head of a goat and the tail of a serpent? It was said to breathe fire and was defeated by the hero Bellerophon.",
"In Norse mythology, the dragon Fafnir hoarded a treasure and was eventually killed by the hero Siegfried. The treasure was said to have brought misfortune to all who possessed it.",
"The Chinese dragon is a symbol of good luck and is said to control the weather, especially rain. It is also said to have the power to grant wishes.",
"In Hindu mythology, the serpent goddess Manasa is worshiped as the goddess of snakes and fertility. She is said to have the power to cure snakebites and other illnesses.",
"The Welsh legend of Lludd and Llefelys tells of a dragon who terrorized Britain until Lludd, the King of Britain, trapped the dragon beneath a rock with the help of Llefelys.",
"In Native American folklore, the Horned Serpent is said to have the power to control the weather and bring rain. It is also a symbol of wisdom and is often depicted with antlers or horns.",
"In the epic of Beowulf, the title character battles and defeats a dragon who guards a treasure hoard. The battle is said to symbolize the triumph of good over evil.",
"In Japanese folklore, the Ryu is a dragon with the ability to shapeshift into a human form. It is said to bring good luck and is often depicted as a symbol of strength.",
"In African folklore, the Rainbow Serpent is said to control the weather and bring rain. It is also a symbol of fertility and is often depicted as a colorful, serpentine creature.",
"The legend of St. George and the Dragon tells of a knight who saves a princess by slaying a dragon. This story is said to symbolize the triumph of good over evil and has been retold in various forms all over the world."
]

var dragonseeker_creatures = [
"The Jersey Devil, a creature said to haunt the Pine Barrens of New Jersey, has been seen for over 260 years. Some describe it as having the body of a horse and the head of a goat.",
"In the folklore of the Pacific Northwest, Bigfoot is a large, hairy, bipedal humanoid, said to roam the forests of the region. Some believe Bigfoot is a missing link between apes and humans.",
"The Chupacabra, a blood-sucking creature said to inhabit parts of the Americas, is often described as a heavy, bipedal creature with spines or quills running down its back.",
"The Mothman is a creature said to have been seen in the Point Pleasant area of West Virginia from 1966 to 1967. It is described as a tall, man-like figure with wings and glowing red eyes.",
"The Yeti, also known as the Abominable Snowman, is said to inhabit the Himalayan region of Nepal and Tibet. It is described as a large, ape-like creature covered in fur.",
"The Kraken is a legendary sea monster of giant size, said to dwell off the coasts of Norway and Greenland. It is often depicted as a giant octopus with tentacles capable of dragging ships underwater.",
"The Bunyip is a legendary creature from Indigenous Australian mythology, said to live in swamps, billabongs, and creeks. It is described as a large, aquatic creature with a dog-like head and a horse-like tail.",
"The Thunderbird is a legendary bird from Indigenous American mythology, said to create thunder with the flapping of its wings. It is often depicted as an enormous bird with powerful talons and the ability to control the elements.",
"Big Foot, the mysterious and elusive creature known for its large footprints and elusive nature, is one of the most famous cryptids in the world. Despite numerous sightings and claims, there is still no concrete evidence of its existence.",
"The Loch Ness Monster, also known as Nessie, is a cryptid said to inhabit the waters of Loch Ness in Scotland. The first recorded sighting of the monster was in 565 AD, and since then there have been numerous accounts of its appearance and mysterious behavior."
]

var dragonseeker_fantasy = [
"In the world of Narnia, magical creatures like centaurs and fauns roam freely. They are ruled by the mighty lion Aslan, who protects Narnia from evil.",
"The land of Middle Earth, as imagined by J.R.R. Tolkien, is filled with fantastical beings like elves, dwarves, and hobbits. The evil Sauron seeks to conquer Middle Earth, but is ultimately defeated by a hobbit named Frodo.",
"The world of Westeros in George R.R. Martin's A Song of Ice and Fire series is home to dragons, ice zombies, and shadow assassins. The Seven Kingdoms of Westeros are constantly at war, with each house vying for control.",
"In the world of The Witcher, monsters like werewolves, vampires, and giant spiders roam the countryside. The witchers, a group of monster hunters, use their supernatural abilities to protect the people of the land.",
"In the world of The NeverEnding Story, a young boy named Bastian travels to a magical land filled with flying horses, talking animals, and evil sorcerers. He learns the importance of courage and friendship as he helps the people of Fantasia defeat the evil Nothing.",
"The world of Final Fantasy is filled with magic and monsters. Each game in the series takes place in a different world, but they all feature powerful magic-users and epic battles between good and evil.",
"In the world of Fullmetal Alchemist, alchemists use their knowledge of science and magic to perform incredible feats, like transmuting one element into another. The brothers Edward and Alphonse Elric search for a way to restore their bodies after a failed transmutation.",
"In the world of Discworld, magic and mythical creatures exist in a world that is similar to our own. The wizard Rincewind travels to strange and exotic places, encountering dragons, death, and other supernatural beings.",
"In the world of American Gods, gods and mythological creatures walk among us, often in disguise. The old gods, like Odin and Anubis, are being replaced by new gods, like Technology and Media. The main character, Shadow Moon, gets caught up in a war between the old and new gods.",
"In the world of The Dark Tower, a gunslinger named Roland travels through a world that is both fantastical and familiar. He encounters vampires, werewolves, and other supernatural beings as he searches for the Dark Tower, a mythical structure that holds the key to the universe."
]

var dragonseeker_folklore = [
"In Japanese folklore, the Kappa is a river creature known to play pranks on humans and animals alike. But, be careful, they have a weakness for cucumbers!",
"The Chupacabra, a legendary creature said to inhabit parts of the Americas, is said to attack and drink the blood of livestock. Despite many reported sightings, there is no concrete evidence of its existence.",
"The Mothman, a cryptid with large wings and glowing red eyes, is a popular folklore figure in West Virginia. It's said to be a harbinger of doom, appearing before disasters such as the collapse of the Silver Bridge in 1967.",
"The Yeti, also known as the Abominable Snowman, is a legendary creature said to inhabit the Himalayan region of Nepal, Bhutan, and Tibet. Descriptions vary, but it's often depicted as a large, hairy, ape-like creature.",
"In Irish folklore, the Leprechaun is a type of fairy said to be a mischievous shoemaker. They're known to hoard pots of gold and grant three wishes if caught.",
"The Jersey Devil is a legendary creature said to inhabit the Pine Barrens of New Jersey. It's described as a kangaroo-like creature with wings and a goat-like head.",
"The Australian Yowie is a cryptid said to inhabit the wilderness of Australia. It's described as a large, hairy, ape-like creature, similar to Bigfoot or the Yeti.",
"In Native American folklore, the Skin-Walker is a type of witch said to be able to shapeshift into animals. They're often depicted as evil, using their powers for evil deeds.",
"The Kraken is a legendary sea monster said to inhabit the waters of the North Atlantic. It's often depicted as a giant octopus with long tentacles that can drag ships and sailors under the water.",
"In Norse mythology, the Jötunn are a race of giants who inhabit the realm of Jötunheimr. They're often depicted as cruel and hostile, in contrast to the gods who inhabit Asgard."
	
]







var random

func _ready():
	randomize()
	random = RandomNumberGenerator.new()
	random.randomize()

func _process(_delta):
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
	elif random_bzl == "dragonseeker":
		random_keyword = dragonseeker_keywords[randi() % dragonseeker_keywords.size()]

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

	elif random_keyword == "dragons" and random_bzl == "dragonseeker":
		random_buzz = dragonseeker_dragons[randi() % dragonseeker_dragons.size()]
	elif random_keyword == "mythology" and random_bzl == "dragonseeker":
		random_buzz = dragonseeker_mythology[randi() % dragonseeker_mythology.size()]
	elif random_keyword == "legends" and random_bzl == "dragonseeker":
		random_buzz = dragonseeker_legends[randi() % dragonseeker_legends.size()]
	elif random_keyword == "creatures" and random_bzl == "dragonseeker":
		random_buzz = dragonseeker_creatures[randi() % dragonseeker_creatures.size()]
	elif random_keyword == "fantasy" and random_bzl == "dragonseeker":
		random_buzz = dragonseeker_fantasy[randi() % dragonseeker_fantasy.size()]
	elif random_keyword == "folklore" and random_bzl == "dragonseeker":
		random_buzz = dragonseeker_folklore[randi() % dragonseeker_folklore.size()]


	# Create a new buzz instance and add it to the buzz container
	var buzz = load("res://Prototype/Buzzes/NewBuzz.tscn").instance()
	buzz.Buzz_Text = random_buzz
	buzz.Keywords = [random_keyword]
	buzz.Time_Remaining = 120
	buzz.User_Type = "NPC"
	buzz.User = random_bzl
	buzz_container.add_child(buzz)
