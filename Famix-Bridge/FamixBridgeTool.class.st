"
I am a tool helping to build queries that are navigating from one model to another through stubs.
This class uses a singleton design pattern.

API : 
- findResource: stub >> Returns, if found, a defined entity matching the given stub
- findStubsOf: resource >> Returns, if found, a list of stubs representing the given defined entity
"
Class {
	#name : 'FamixBridgeTool',
	#superclass : 'Object',
	#instVars : [
		'sourceModel',
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'Famix-Bridge',
	#package : 'Famix-Bridge'
}

{ #category : 'accessing' }
FamixBridgeTool class >> instance [

	instance ifNil: [ instance := super new ].
	^ instance
]

{ #category : 'instance creation' }
FamixBridgeTool class >> new [
	self error: 'Singleton class. Use the message #instance to get the bridge tool.'
]

{ #category : 'initialization' }
FamixBridgeTool class >> onModel: sourceModel [

	^ self instance
		  sourceModel: sourceModel;
		  yourself
]

{ #category : 'selecting models' }
FamixBridgeTool >> allModelsButSourceModel [

	^ MooseModel root entities reject: [ :m | m = sourceModel ]
]

{ #category : 'selecting models' }
FamixBridgeTool >> allWorkspaceModelsButSourceModel [

	| workspace |
	"this method is only called when there is an active workspace, so no checks are done"
	workspace := ActiveMooseWorkspace value.

	^ workspace models reject: [ :m | m = sourceModel ]
]

{ #category : 'cache management' }
FamixBridgeTool >> disableCache [ 

	cache disable
]

{ #category : 'cache management' }
FamixBridgeTool >> enableCache [ 

	cache enable
]

{ #category : 'searching resources' }
FamixBridgeTool >> findResource: stub [

	sourceModel := stub mooseModel.

	^ ActiveMooseWorkspace value
		  ifNotNil: [ self findResourceWithinWorkspace: stub ]
		  ifNil: [ self findResourceLookingThroughAllModels: stub ]
]

{ #category : 'searching resources' }
FamixBridgeTool >> findResource: stub inModel: resourceModel [

	^ (cache definedEntity: stub inModel: resourceModel)
		  ifNotNil: [ :entity | entity ]
		  ifNil: [ self searchResource: stub inModel: resourceModel ]
]

{ #category : 'searching resources' }
FamixBridgeTool >> findResource: stub withinModels: modelsToSearch [
"TODO : consider the possibility of results in several models and modify as needed"
	modelsToSearch do: [ :m |
		| searchResult |
		searchResult := self findResource: stub inModel: m.
		searchResult ifNotNil: [ ^ searchResult ] ].

	^ nil
]

{ #category : 'searching resources' }
FamixBridgeTool >> findResourceLookingThroughAllModels: stub [
	"TODO : consider the possibility of results in several models and modify as needed"

	^ self findResource: stub withinModels: self allModelsButSourceModel
]

{ #category : 'searching resources' }
FamixBridgeTool >> findResourceWithinWorkspace: stub [
		
	^ self findResource: stub withinModels: self allWorkspaceModelsButSourceModel
]

{ #category : 'searching stubs' }
FamixBridgeTool >> findStub: entity inModel: resourceModel [

	^ (cache stubEntity: entity inModel: resourceModel)
		  ifNotNil: [ :stub | stub ]
		  ifNil: [ self searchStub: entity inModel: resourceModel ]
]

{ #category : 'searching stubs' }
FamixBridgeTool >> findStubs: stub withinModels: modelsToSearch [

	| stubList |
	stubList := OrderedCollection new.
	
	modelsToSearch do: [ :m |
		| searchResult |
		searchResult := self findStub: stub inModel: m.
		searchResult ifNotNil: [ stubList add: searchResult ] ].

	^ stubList 
]

{ #category : 'searching stubs' }
FamixBridgeTool >> findStubsLookingThroughAllModels: entity [
	"TODO : consider the possibility of results in several models and modify as needed"

	^ self findStubs: entity withinModels: self allModelsButSourceModel
]

{ #category : 'searching stubs' }
FamixBridgeTool >> findStubsOf: entity [
	"TODO : consider the possibility of results in several models and modify as needed"
	sourceModel := entity mooseModel.

	^ ActiveMooseWorkspace value
		  ifNotNil: [ self findStubsWithinWorkspace: entity ]
		  ifNil: [ self findStubsLookingThroughAllModels: entity ]
]

{ #category : 'searching stubs' }
FamixBridgeTool >> findStubsWithinWorkspace: entity [
		
	^ self findStubs: entity withinModels: self allWorkspaceModelsButSourceModel
]

{ #category : 'initialization' }
FamixBridgeTool >> initialize [ 

	cache := BridgeCache new
]

{ #category : 'cache management' }
FamixBridgeTool >> isCacheEnabled [

	^ cache enabled
]

{ #category : 'searching resources' }
FamixBridgeTool >> searchResource: stub inModel: resourceModel [

	^ resourceModel
		  entityNamed: stub mooseName
		  ifAbsent: [ nil ]
		  ifPresent: [ :resource |
			  (resource isStub not and: [ resource class = stub class ])
				  ifTrue: [
					  cache addDefinedEntity: resource.
					  resource ]
				  ifFalse: [ nil ] ]
]

{ #category : 'searching stubs' }
FamixBridgeTool >> searchStub: entity inModel: resourceModel [

	^ resourceModel
		  entityNamed: entity mooseName
		  ifAbsent: [ nil ]
		  ifPresent: [ :stub |
			  (stub isStub and: [ stub class = entity class ])
				  ifTrue: [
					  cache addStubEntity: stub.
					  stub ]
				  ifFalse: [ nil ] ]
]

{ #category : 'accessing' }
FamixBridgeTool >> sourceModel [

	^ sourceModel
]

{ #category : 'accessing' }
FamixBridgeTool >> sourceModel: anObject [

	sourceModel := anObject
]
