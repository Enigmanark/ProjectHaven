extends Node2D

func _ready():
	update_player_hud();

func update_player_hud():
	var player = get_node("/root/PlayerStats").player;
	var playerCurrentHP = player["CurrentHP"];
	var playerHP = player["MaxHP"];
	var playerCurrentMP = player["CurrentMP"];
	var playerMP = player["MaxMP"];
	var playerCurrentSP = player["CurrentSP"];
	var playerSP = player["MaxSP"];
	var playerXP = player["Experience"];
	var playerXPToLevel = player["ExperienceToLevelUp"];
	var hpp = (float(playerCurrentHP) / float(playerHP)) * float(100);
	var spp = 0;
	if(playerSP != 0):
		spp = (float(playerCurrentSP) / float(playerSP)) * float(100);
	var mpp = 0;
	if(playerMP != 0):
		mpp = (float(playerCurrentMP) / float(playerMP)) * float(100);
	var xpp = (float(playerXP) / float(playerXPToLevel)) * float(100);
	get_node("Stats/NameBackground/Name").text = player["Name"];
	get_node("Stats/PlayerHPBar").value = hpp;
	get_node("Stats/PlayerSPBar").value = spp;
	get_node("Stats/PlayerMPBar").value = mpp;
	get_node("Stats/PlayerXPBar").value = xpp;
	get_node("Stats/PlayerHPBar/HPText").text = str(playerCurrentHP) + "/" + str(playerHP);
	get_node("Stats/PlayerSPBar/SPText").text = str(playerCurrentSP) + "/" + str(playerSP);
	get_node("Stats/PlayerMPBar/MPText").text = str(playerCurrentMP) + "/" + str(playerMP);
	get_node("Stats/PlayerXPBar/XPText").text = str(playerXP) + "/" + str(playerXPToLevel);
	