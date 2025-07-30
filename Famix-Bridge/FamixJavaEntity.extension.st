Extension { #name : 'FamixJavaEntity' }

{ #category : '*Famix-Bridge' }
FamixJavaEntity >> mooseName [
	| result |
	ActiveMooseWorkspace value interModelModeActive ifFalse: [ ^ super mooseName ].
	
	ActiveMooseWorkspace value interModelModeActive: false.
	result := super mooseName.
	ActiveMooseWorkspace value interModelModeActive: true.
	
	^ result
]
