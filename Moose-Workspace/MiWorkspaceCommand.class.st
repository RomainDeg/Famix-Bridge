Class {
	#name : 'MiWorkspaceCommand',
	#superclass : 'MiCommand',
	#category : 'Moose-Workspace-MooseIDE',
	#package : 'Moose-Workspace',
	#tag : 'MooseIDE'
}

{ #category : 'default' }
MiWorkspaceCommand class >> defaultDescription [ 

	^ 'Select a workspace to work on'
]

{ #category : 'default' }
MiWorkspaceCommand class >> defaultName [

	^ 'Workspace'
]
