extends Node
export(int) var maxhp;
var currentHP;
export(int) var maxsp;
var currentSP;
export(int) var maxmp;
var currentMP;

func _ready():
	currentHP = maxhp;
	currentSP = maxsp;
	currentMP = maxmp;
