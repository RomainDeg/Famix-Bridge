"
I am a `DynamicVariable` holding the value of the active `MooseWorkspace` during inter model mode.
"
Class {
	#name : 'ActiveMooseWorkspace',
	#superclass : 'DynamicVariable',
	#instVars : [
		'defaultValue'
	],
	#category : 'Moose-Workspace-Core',
	#package : 'Moose-Workspace',
	#tag : 'Core'
}

{ #category : 'accessing' }
ActiveMooseWorkspace >> default [ 

	^ defaultValue ifNil: [ defaultValue := NullMooseWorkspace new ] 
]
