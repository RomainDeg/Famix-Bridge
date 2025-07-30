Class {
	#name : 'NullMooseWorkspace',
	#superclass : 'MooseObject',
	#traits : 'MooseTWorkspace',
	#classTraits : 'MooseTWorkspace classTrait',
	#category : 'Moose-Workspace-Core',
	#package : 'Moose-Workspace',
	#tag : 'Core'
}

{ #category : 'initialization' }
NullMooseWorkspace >> initialize [ 
	super initialize.
	
	"just in case"
	interModelModeActive := false.
]

{ #category : 'accessing' }
NullMooseWorkspace >> interModelModeActive [
	
	^ false 
]

{ #category : 'accessing' }
NullMooseWorkspace >> interModelModeActive: aBoolean [

	"nothing to do, this slot won't be used"
]
