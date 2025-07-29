"
I am representing a set of Moose models forming a full software configuration, including a main project and the libraries it depends on.

I can run inter model queries using the method `interModelModeDuring:aBlock`. This method sets my instance as value of the `DynamicVariable` named `ActiveMooseWorkspace`, which ensures that the queries in the block given as parameter will be able to navigate through different models if necessary. 
I can use different resolution strategies during my inter model mode, which I store in the instance variable `stubResolverStrategy`. It must have as a value a subclass of `AbstractStubResolverStrategy`.

API:

- `addLibraryModel: aMooseModel`
- `removeLibraryModel: aMooseModel`
- `mainModel: aMooseModel`
- `stubResolverStrategy: anObject`
- `interModelModeDuring: aBlock`
"
Class {
	#name : 'MooseWorkspace',
	#superclass : 'MooseObject',
	#instVars : [
		'librariesModels',
		'mainModel',
		'stubResolverStrategy'
	],
	#category : 'Moose-Workspace-Core',
	#package : 'Moose-Workspace',
	#tag : 'Core'
}

{ #category : 'adding - removing' }
MooseWorkspace >> addLibraryModel: aMooseModel [

	librariesModels add: aMooseModel 
]

{ #category : 'adding - removing' }
MooseWorkspace >> clearLibrairiesModel [

	librariesModels := Set new
]

{ #category : 'initialization' }
MooseWorkspace >> defaultStubResolverStrategy [

	^ ResolveIfCalledByStubStrategy new
]

{ #category : 'initialization' }
MooseWorkspace >> initialize [ 
	super initialize.
	
	stubResolverStrategy := self defaultStubResolverStrategy.
	librariesModels := Set new.
]

{ #category : 'inter-model protocol' }
MooseWorkspace >> interModelModeDuring: aBlock [
	"compiles the method activating inter-model protocol and runs the block given as parameter
deletes the method once the block is evaluated, or if an exception occurs"
	^ ActiveMooseWorkspace
		value: self
		during: [ aBlock value ]
]

{ #category : 'accessing' }
MooseWorkspace >> librariesModels [

	^ librariesModels
]

{ #category : 'accessing' }
MooseWorkspace >> librariesModels: anObject [

	librariesModels := anObject
]

{ #category : 'accessing' }
MooseWorkspace >> mainModel [

	^ mainModel
]

{ #category : 'accessing' }
MooseWorkspace >> mainModel: anObject [

	mainModel := anObject
]

{ #category : 'adding - removing' }
MooseWorkspace >> removeLibraryModel: aMooseModel [

	librariesModels remove: aMooseModel 
]

{ #category : 'meta-object-protocol' }
MooseWorkspace >> slot: aFMRelationSlot read: anObject [

	^ stubResolverStrategy slot: aFMRelationSlot read: anObject 
]

{ #category : 'accessing' }
MooseWorkspace >> stubResolverStrategy [

	^ stubResolverStrategy
]

{ #category : 'accessing' }
MooseWorkspace >> stubResolverStrategy: anObject [

	stubResolverStrategy := anObject
]
