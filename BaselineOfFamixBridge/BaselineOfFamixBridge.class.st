Class {
	#name : 'BaselineOfFamixBridge',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixBridge',
	#package : 'BaselineOfFamixBridge'
}

{ #category : 'baselines' }
BaselineOfFamixBridge >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec package: 'Famix-Bridge'.
		spec package: 'Moose-Workspace' ]
]
