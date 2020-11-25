extends Node

onready var fxPlayer = $FxPlayer
onready var bgPlayer = $BgPlayer
onready var fxEnemy = $FxEnemy
onready var music = load("res://sounds/BackgroundMusic.ogg")
onready var explosion = load("res://sounds/Explosion.ogg")
onready var grappHook = load("res://sounds/GrapplingHook.ogg")
onready var tackle = load("res://sounds/Tackle.ogg")
onready var missile_explosion = load("res://sounds/explosion_missile.ogg")
onready var missile = load("res://sounds/missile.ogg")
onready var portalG = load("res://sounds/portalGonza.ogg")

var bgSoundsMap = {}
var fxSoundsMap = {}
var fxEnemySoundsMap = {}

func _ready():
	fxSoundsMap[0] = null
	fxSoundsMap[1] = explosion
	fxSoundsMap[2] = grappHook
	fxSoundsMap[3] = tackle
	fxSoundsMap[6] = portalG
	
	fxEnemySoundsMap[0] = null
	fxEnemySoundsMap[1] = missile_explosion
	fxEnemySoundsMap[2] = missile

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

func _on_EnemyFloor2_sound_missile(value):
	fxEnemy.stream = fxEnemySoundsMap[value]
	fxEnemy.play()

func _on_EnemyFloor3_sound_missile(value):
	fxEnemy.stream = fxEnemySoundsMap[value]
	fxEnemy.play()

func _on_EnemyFloor5_sound_missile(value):
	fxEnemy.stream = fxEnemySoundsMap[value]
	fxEnemy.play()

func _on_EnemyFloor7_sound_missile(value):
	fxEnemy.stream = fxEnemySoundsMap[value]
	fxEnemy.play()

func _on_EnemyFloor9_sound_missile(value):
	fxEnemy.stream = fxEnemySoundsMap[value]
	fxEnemy.play()
