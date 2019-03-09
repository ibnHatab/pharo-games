"
Runner
"
Class {
	#name : #LOGame,
	#superclass : #BorderedMorph,
	#traits : 'TAutor',
	#classTraits : 'TAutor classTrait',
	#instVars : [
		'cells'
	],
	#category : #'PBE-LightsOut'
}

{ #category : #accesing }
LOGame >> cellsPerSide [
	"The number of cells along each side"

	^ 10
]

{ #category : #initialization }
LOGame >> initialize [
	| sampleCell width height n |
	super initialize.
	n := self cellsPerSide.
	sampleCell := LOCEll new.
	width := sampleCell width.
	height := sampleCell height .
	self bounds: (5@5 extent: (width * n) @ (height * n) + (2 * self borderWidth )).
	cells := Matrix new: n tabulate: [ :i :j | self newCellAt: i at: j] 
]

{ #category : #'instance creation' }
LOGame >> newCellAt: i at: j [
	"create a cell in possition i,j"

	| c origin |
	c := LOCEll new.
	origin := self innerBounds origin.
	self addMorph: c.
	c position: ((i - 1) * c width) @ ((j - 1) * c height) + origin.
	c mouseAction: [ self toggleNeigboursOfCellAt: i at: j ].
	^c
]

{ #category : #'game logic' }
LOGame >> toggleNeigboursOfCellAt: i at: j [
	"toggle surrounding cells"
	
	i > 1
		ifTrue: [ (cells at: i -1 at: j) toggleState ].
	i < self cellsPerSide 
		ifTrue: [ (cells at: i +1 at: j) toggleState ].
	j > 1 
		ifTrue: [ (cells at: i at: j -1) toggleState ].
	j < self cellsPerSide 
		ifTrue: [ (cells at: i at: j + 1) toggleState ].
		
]
