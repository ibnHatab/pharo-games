"
Game
"
Class {
	#name : #LOCEll,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction'
	],
	#category : #'PBE-LightsOut'
}

{ #category : #initialization }
LOCEll >> initialize [
	"initialize me"

	super initialize.
	self label: ''.
	self borderWidth: 2.
	bounds := 0 @ 0 corner: 16 @ 16.
	offColor := Color paleYellow.
	onColor := Color paleBlue darker.
	self useSquareCorners.
	self turnOff
]

{ #category : #accessing }
LOCEll >> mouseAction: aBlock [
	mouseAction := aBlock 
]

{ #category : #'event handling' }
LOCEll >> mouseUp: anEvent [
	mouseAction value
]
