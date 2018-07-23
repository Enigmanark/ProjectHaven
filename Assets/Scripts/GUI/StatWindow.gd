extends Node2D

var open = false;

func _ready():
	update_stats();
	
func _on_Button_pressed():
	var statwindow = get_parent().get_node("StatWindow");
	if(open):
		statwindow.visible = false;
		open = false;
	else:
		update_stats();
		statwindow.visible = true;
		open = true;
		
func update_stats():
	var stats = get_node("/root/PlayerStats");
	#Update name and level and gold
	get_node("Background/Line1/NameLabel").text = stats.player["Name"];
	get_node("Background/Line1/Level").text = "Level " + str(stats.player["Level"]);
	get_node("Background/Line11/Training").text = "Training " + str(stats.player["TrainingPoints"]);
	get_node("Background/Line2/Gold").text = "Gold " + str(stats.player["Gold"]);
	
	#Update defenses
	get_node("Background/Line4/Melee").text = "Melee " + str(stats.player["MeleeDef"]);
	get_node("Background/Line5/Ranged").text = "Ranged " + str(stats.player["RangedDef"]);
	get_node("Background/Line6/Spell").text = "Spell " + str(stats.player["SpellDef"]);
	
	#Update stats
	get_node("Background/Line7/Strength").text = "Strength " + str(stats.get_strength());
	get_node("Background/Line8/Dexterity").text = "Dexterity " + str(stats.get_dexterity());
	get_node("Background/Line9/Endurance").text = "Endurance " + str(stats.get_endurance());
	get_node("Background/Line12/Intelligence").text = "Intellect " + str(stats.get_intelligence());
	get_node("Background/Line10/Willpower").text = "Willpower " + str(stats.get_willpower());
	get_node("Background/Line11/Agility").text = "Agility " + str(stats.get_agility());
	
	#Update elements
	get_node("Background/Line2/Earth").text = "Earth " + str(stats.player["Earth"] * 100);
	get_node("Background/Line3/Water").text = "Water " + str(stats.player["Water"] * 100);
	get_node("Background/Line4/Air").text = "Air " + str(stats.player["Air"] * 100);
	get_node("Background/Line5/Fire").text = "Fire " + str(stats.player["Fire"] * 100);
	get_node("Background/Line6/Ice").text = "Ice " + str(stats.player["Ice"] * 100);
	get_node("Background/Line7/Thunder").text = "Thunder " + str(stats.player["Thunder"] * 100);
	get_node("Background/Line8/Light").text = "Light " + str(stats.player["Light"] * 100);
	get_node("Background/Line9/Dark").text = "Dark " + str(stats.player["Dark"] * 100);