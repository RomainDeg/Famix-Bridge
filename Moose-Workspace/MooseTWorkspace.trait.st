Trait {
	#name : 'MooseTWorkspace',
	#instVars : [
		'interModelModeActive'
	],
	#category : 'Moose-Workspace-Core',
	#package : 'Moose-Workspace',
	#tag : 'Core'
}

{ #category : 'accessing' }
MooseTWorkspace >> interModelModeActive [
	
	^ interModelModeActive 
]

{ #category : 'accessing' }
MooseTWorkspace >> interModelModeActive: aBoolean [

	interModelModeActive := aBoolean 
]
