Class {
	#name : 'ResolveAndMergeResultsStrategyTest',
	#superclass : 'AbstractStubResolverStrategyTest',
	#category : 'Moose-Workspace-Tests',
	#package : 'Moose-Workspace-Tests'
}

{ #category : 'running' }
ResolveAndMergeResultsStrategyTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	workspace stubResolverStrategy: ResolveAndMergeResultsStrategy new
]

{ #category : 'tests' }
ResolveAndMergeResultsStrategyTest >> testHierarchyQuery [

	self testHierarchyQueryExpecting: modelResources superclassInLibraryProject 
]

{ #category : 'tests' }
ResolveAndMergeResultsStrategyTest >> testInterfaceImplementingClassesQuery [
	
	self testInterfaceImplementingClassesQueryExpecting: {
			modelResources interfaceImplementorInMainProject.
			modelResources interfaceImplementorInLibraryProject }.
]

{ #category : 'tests' }
ResolveAndMergeResultsStrategyTest >> testSlotRead [
"only here for the test button on the subclass method"
	super testSlotRead
	
		
	
]

{ #category : 'tests' }
ResolveAndMergeResultsStrategyTest >> testSuperclassMethods [

	| expectedResults |
	expectedResults := OrderedCollection new.
	expectedResults addAll: modelResources stubSuperclassInMainProject methods.
	expectedResults addAll: modelResources superclassInLibraryProject methods.

	self testSuperclassMethodsExpecting: expectedResults 
]
