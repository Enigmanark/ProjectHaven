extends Node2D

func _ready():
	pass

func update_player_hud(playerStats):
	var playerCurrentHP = playerStats.currentHP;
	var playerHP = playerStats.maxhp;
	var playerCurrentMP = playerStats.currentMP;
	var playerMP = playerStats.maxmp;
	var playerCurrentSP = playerStats.currentSP;
	var playerSP = playerStats.maxsp;
	var hpp = (float(playerCurrentHP) / float(playerHP)) * float(100);
	var spp = (float(playerCurrentSP) / float(playerSP)) * float(100);
	var mpp = (float(playerCurrentMP) / float(playerMP)) * float(100);
	get_node("PlayerHPBar").value = hpp;
	get_node("PlayerSPBar").value = spp;
	get_node("PlayerMPBar").value = mpp;
	get_node("PlayerHPBar/HPText").text = str(playerCurrentHP) + "/" + str(playerHP);
	get_node("PlayerSPBar/SPText").text = str(playerCurrentSP) + "/" + str(playerSP);
	get_node("PlayerMPBar/MPText").text = str(playerCurrentMP) + "/" + str(playerMP);