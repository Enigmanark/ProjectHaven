extends Node2D

var open = false;

func _ready():
	update_stats();
	
func _on_StatButton_pressed():
	var statwindow = get_parent().get_node("EnemyStatWindow");
	if(open):
		statwindow.visible = false;
		open = false;
	else:
		update_stats();
		statwindow.visible = true;
		open = true;
		
func update_stats():
	var stats = get_node("/root/CurrentBattle");
	#Update name and level and gold
	get_node("Background/Line1/NameLabel").text = stats._name;
	get_node("Background/Line1/Level").text = "Level " + str(stats.level);
	get_node("Background/Line2/Gold").text = "Gold " + str(stats.gold);
	
	#Update defenses
	get_node("Background/Line4/Melee").text = "Melee " + str(stats.meleeDef);
	get_node("Background/Line5/Ranged").text = "Ranged " + str(stats.rangedDef);
	get_node("Background/Line6/Spell").text = "Spell " + str(stats.spellDef);
	
	#Update stats
	get_node("Background/Line7/Strength").text = "Strength " + str(stats.get_strength());
	get_node("Background/Line8/Dexterity").text = "Dexterity " + str(stats.get_dexterity());
	get_node("Background/Line9/Endurance").text = "Endurance " + str(stats.get_endurance());
	get_node("Background/Line12/Intelligence").text = "Intellect " + str(stats.get_intelligence());
	get_node("Background/Line10/Willpower").text = "Willpower " + str(stats.get_willpower());
	get_node("Background/Line11/Cunning").text = "Cunning " + str(stats.get_cunning());
	
	#Update elements
	get_node("Background/Line2/Earth").text = "Earth " + str(stats.earth * 100);
	get_node("Background/Line3/Water").text = "Water " + str(stats.water * 100);
	get_node("Background/Line4/Air").text = "Air " + str(stats.air * 100);
	get_node("Background/Line5/Fire").text = "Fire " + str(stats.fire * 100);
	get_node("Background/Line6/Ice").text = "Ice " + str(stats.ice * 100);
	get_node("Background/Line7/Thunder").text = "Thunder " + str(stats.thunder * 100);
	get_node("Background/Line8/Light").text = "Light " + str(stats.light * 100);
	get_node("Background/Line9/Dark").text = "Dark " + str(stats.dark * 100);
