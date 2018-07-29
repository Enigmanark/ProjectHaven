extends Node

var quest;
var questTracker = 0;
var crossRoadsMaxBattles = 5;

enum QUESTS {
	Crossroads_MtDoom,
	Crossroads_Beach,
	Crossroads_Sands,
	Crossroads_AshurForest,
	Crossroads_TenebraeForest,
	Crossroads_LavaPits,
	Crossroads_Glacier,
	Crossroads_BreadBasket
};

func _ready():
	get_node("/root/BattleSceneManager").connect("BattleVictory", self, "update_quest");
	
func update_quest():
	match(quest):
		Crossroads_AshurForest:
			questTracker += 1;
			update_crossroads("Forest");
		Crossroads_TenebraeForest:
			questTracker += 1;
			update_crossroads("Dark Forest");
		Crossroads_Sands:
			questTracker += 1;
			update_crossroads("Desert");
		Crossroads_MtDoom:
			questTracker += 1;
			update_crossroads("Mountains");
		Crossroads_Glacier:
			questTracker += 1;
			update_crossroads("Glacier");
		Crossroads_LavaPits:
			questTracker += 1;
			update_crossroads("Volcano");
		Crossroads_BreadBasket:
			questTracker += 1;
			update_crossroads("Plains");
		Crossroads_Beach:
			questTracker += 1;
			update_crossroads("Beach");

func update_crossroads(location):
	if(questTracker < crossRoadsMaxBattles):
		var manager = get_node("/root/BattleSceneManager");
		manager.get_battle_from_location(location);
		yield(manager, "got_battle");
		if(manager.timedOut):
			get_node("Screen").show_ok_message("Timed out");
		else:
			var battle = manager.battle;
			get_node("/root/BattleSceneManager").do_battle(battle, "res://Assets/Prefabs/Empty.tscn");
	else:
		get_node("/root/BattleSceneManager").get_treasure();
		
