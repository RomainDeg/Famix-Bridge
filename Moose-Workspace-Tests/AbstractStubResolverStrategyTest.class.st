Class {
	#name : 'AbstractStubResolverStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'workspace',
		'modelResources',
		'mustRestartCache'
	],
	#category : 'Moose-Workspace-Tests',
	#package : 'Moose-Workspace-Tests'
}

{ #category : 'testing' }
AbstractStubResolverStrategyTest class >> isAbstract [ 
	^ true
]

{ #category : 'initialization' }
AbstractStubResolverStrategyTest >> initialize [

	super initialize.
	
	"setting it in initialize method to only generate the model once if you run several tests"
	modelResources := TestJavaModelBuilder new 
]

{ #category : 'running' }
AbstractStubResolverStrategyTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	workspace := MooseWorkspace new.
	workspace mainModel: modelResources mainModel.
	workspace addLibraryModel: modelResources libraryModel.
	
	mustRestartCache := FamixBridgeTool instance isCacheEnabled.
	mustRestartCache ifTrue: [ FamixBridgeTool instance disableCache ]
]

{ #category : 'running' }
AbstractStubResolverStrategyTest >> tearDown [ 

	mustRestartCache ifTrue: [ FamixBridgeTool instance enableCache ]
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testHierarchyQuery [

	self subclassResponsibility
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testHierarchyQueryExpecting: expectedResults [

	| queryResults |
	queryResults := workspace interModelModeDuring: [
		           modelResources mainClassInMainProject 
			           superclass ].

	self assert: queryResults equals: expectedResults
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testInterfaceImplementingClassesQuery [
	
	self subclassResponsibility
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testInterfaceImplementingClassesQueryExpecting: expectedResults [

	| queryResults |
	queryResults := workspace interModelModeDuring: [
		           modelResources interfaceInLibraryProject
			           implementations collect: [ :imp | imp implementingClass ] ].

	self assert: queryResults size equals: expectedResults size.
	self assertCollection: queryResults includesAll: expectedResults
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testSlotRead [
	
	self testHierarchyQuery.
	self testInterfaceImplementingClassesQuery.
	self testSuperclassMethods 
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testSuperclassMethods [

	self subclassResponsibility
]

{ #category : 'tests' }
AbstractStubResolverStrategyTest >> testSuperclassMethodsExpecting: expectedResults [

	| queryResults |
	queryResults := workspace interModelModeDuring: [
		           modelResources mainClassInMainProject 
			           superclass methods ].

	self assert: queryResults size equals: expectedResults size.
	self assertCollection: queryResults includesAll: expectedResults
]
