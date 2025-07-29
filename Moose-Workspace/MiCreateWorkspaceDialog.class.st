Class {
	#name : 'MiCreateWorkspaceDialog',
	#superclass : 'MiPresenter',
	#instVars : [
		'mainModelChoice',
		'librariesChooser'
	],
	#category : 'Moose-Workspace-MooseIDE',
	#package : 'Moose-Workspace',
	#tag : 'MooseIDE'
}

{ #category : 'instance creation' }
MiCreateWorkspaceDialog class >> open [

	<script>
	^ self new
		  openDialog;
		  yourself
]

{ #category : 'specs' }
MiCreateWorkspaceDialog class >> title [ 

	^ 'Create a Moose Workspace'
]

{ #category : 'specs' }
MiCreateWorkspaceDialog class >> windowExtent [

	^ 900 @ 500
]

{ #category : 'specs' }
MiCreateWorkspaceDialog class >> windowSize [ 

	^ 600 @ 400
]

{ #category : 'layout' }
MiCreateWorkspaceDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: 'Main model:' expand: false;
				   spacing: 10;
				   add: mainModelChoice
				   yourself)
		  expand: false;
		  spacing: 15;
		  "add: 'Libraries models:' expand: false;"
		  add: librariesChooser;
		  yourself
]

{ #category : 'initialization' }
MiCreateWorkspaceDialog >> initializeDialogWindow: aDialog [

	| button |
	button := nil.
	aDialog initialExtent: self class windowExtent.
	button := aDialog
		          addButton: 'New workspace'
		          do: [ "todo" ].
	aDialog addButton: 'Cancel' do: [ :dialog | dialog close ]
]

{ #category : 'initialization' }
MiCreateWorkspaceDialog >> initializeLists [

	| displayBlock |
	displayBlock := [ :model |
	                String streamContents: [ :s |
		                s
			                nextPutAll: model name;
			                nextPutAll: ' (';
			                nextPutAll: model class name;
			                nextPut: $) ] ].
	mainModelChoice := self newDropList.
	librariesChooser := SpChooserPresenter new.

	mainModelChoice
		items: MooseModel root entities;
		display: displayBlock;
		whenSelectedItemChangedDo: [ :model |
			model ifNotNil: [
					librariesChooser sourceItems:
							(MooseModel root entities reject: [ :m | m = model ]) ] ];
		startWithoutSelection.

	librariesChooser
		displayBlock: displayBlock;
		sourceItems: MooseModel root entities;
		sourceLabel: 'Models';
		targetLabel: 'Selected libraries'
]

{ #category : 'initialization' }
MiCreateWorkspaceDialog >> initializePresenters [
	
	self initializeLists
]
