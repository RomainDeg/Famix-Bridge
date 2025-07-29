Class {
	#name : 'MiWorkspaceBrowser',
	#superclass : 'MiAbstractBrowser',
	#instVars : [
		'toolbar',
		'workspaceList'
	],
	#category : 'Moose-Workspace-MooseIDE',
	#package : 'Moose-Workspace',
	#tag : 'MooseIDE'
}

{ #category : 'instance creation' }
MiWorkspaceBrowser class >> open [
	<script>
	^ super open
]

{ #category : 'specs' }
MiWorkspaceBrowser class >> title [ 

	^ 'Workspace browser'
]

{ #category : 'specs' }
MiWorkspaceBrowser class >> windowSize [ 

	^ 600 @ 400
]

{ #category : 'testing' }
MiWorkspaceBrowser >> canFollowEntity: anObject [

	"whether the browser accepts to deal with anObject"
	^ false
]

{ #category : 'testing' }
MiWorkspaceBrowser >> canTagEntities [
	"manipulates workspaces, not entities"
	^ false
]

{ #category : 'layout' }
MiWorkspaceBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: toolbar expand: false;
		  add: workspaceList;
		  yourself
]

{ #category : 'testing' }
MiWorkspaceBrowser >> followEntity: anEntity [

	"Nothing to do"
]

{ #category : 'initialization' }
MiWorkspaceBrowser >> initializeList [

	workspaceList := self newTable.
	
	workspaceList addColumn: (SpStringTableColumn new
				 title: 'Name';
				 sortFunction: #name ascending;
				 evaluated: [ :ws | ws name ] yourself);
				addColumn: (SpStringTableColumn new
				 title: 'Main project';
				 sortFunction: [ :a :b | a mainModel name < b mainModel name ];
				 evaluated: [ :ws | ws mainModel name ] yourself);
				addColumn: (SpStringTableColumn new
				 title: 'Number of libraries';
				 sortFunction: [ :a :b | a librariesModels size < b librariesModels size ];
				 evaluated: [ :ws | ws librariesModels size ] yourself)
	
]

{ #category : 'initialization' }
MiWorkspaceBrowser >> initializePresenters [

	self initializeToolbar.
	self initializeList
]

{ #category : 'initialization' }
MiWorkspaceBrowser >> initializeToolbar [

	toolbar := self newToolbar
					  addItem: self newWorkspaceButton;
		           "beIcons;"
		           yourself
]

{ #category : 'initialization' }
MiWorkspaceBrowser >> newWorkspaceButton [

	^ SpToolbarButtonPresenter new
		  icon: (self iconNamed: #smallAdd);
		  label: 'Create';
		  help: 'Create workspace';
		  action: [ "boop" ];
		  yourself
]
