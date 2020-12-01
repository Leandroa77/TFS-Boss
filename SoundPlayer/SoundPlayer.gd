extends Node

onready var fxPlayer = $FxPlayer
onready var fxPlayer2 = $FxPlayer2
onready var bgPlayer = $BgPlayer
onready var fxEnemy = $FxEnemy
onready var music = load("res://sounds/BackgroundMusic.ogg")
onready var explosion = load("res://sounds/Explosion.ogg")
onready var grappHook = load("res://sounds/GrapplingHook.ogg")
onready var tackle = load("res://sounds/Tackle.ogg")
onready var portalG = load("res://sounds/portalGonza.ogg")
onready var expPared = load("res://sounds/explosionPared.ogg")

var bgSoundsMap = {}
var fxSoundsMap = {}
var fxSoundsMap2 = {}
var fxEnemySoundsMap = {}

func _ready():
	fxSoundsMap[0] = null
	fxSoundsMap[1] = explosion
	fxSoundsMap[2] = grappHook
	fxSoundsMap[3] = tackle
	fxSoundsMap[6] = portalG
	
	fxSoundsMap2[0] = null
	fxSoundsMap2[1] = expPared
	
	fxEnemySoundsMap[0] = null

	bgSoundsMap[0] = null
	bgSoundsMap[1] = music

func _on_Stage1_backgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_Character_sound(value):
	fxPlayer.stream = fxSoundsMap[value]
	fxPlayer.play()

func _on_Level1_backgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_Level2_backgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_Level3_backgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_EnemyFloor_sound_missile(value):
	fxPlayer.stream = fxSoundsMap[value]
	fxPlayer.play()

func _on_StageGonza_playBackgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_PortalParticula_playFx(value):
	fxPlayer.stream = fxSoundsMap[value]
	fxPlayer.play()

func _on_PortalParticula2_playFx(value):
	fxPlayer.stream = fxSoundsMap[value]
	fxPlayer.play()

func _on_PortalParticula3_playFx(value):
	fxPlayer.stream = fxSoundsMap[value]
	fxPlayer.play()

func _on_Stage2_backgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_Tutorial_backgroundMusic(value):
	bgPlayer.stream = bgSoundsMap[value]
	bgPlayer.play()

func _on_ParedMadera1_detonate(value):
	fxPlayer2.stream = fxSoundsMap2[value]
	fxPlayer2.play()

func _on_ParedMadera2_detonate(value):
	fxPlayer2.stream = fxSoundsMap2[value]
	fxPlayer2.play()

func _on_ParedMadera3_detonate(value):
	fxPlayer2.stream = fxSoundsMap2[value]
	fxPlayer2.play()
