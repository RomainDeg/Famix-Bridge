"
A ResolveResultStrategyTest is a test class for testing the behavior of ResolveResultStrategy
"
Class {
	#name : 'ResolveResultStrategyTest',
	#superclass : 'AbstractStubResolverStrategyTest',
	#category : 'Moose-Workspace-Tests',
	#package : 'Moose-Workspace-Tests'
}

{ #category : 'running' }
ResolveResultStrategyTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	workspace stubResolverStrategy: ResolveResultStrategy new
]

{ #category : 'tests' }
ResolveResultStrategyTest >> testHierarchyQuery [

	self testHierarchyQueryExpecting: modelResources superclassInLibraryProject 
]

{ #category : 'tests' }
ResolveResultStrategyTest >> testInterfaceImplementingClassesQuery [

	self testInterfaceImplementingClassesQueryExpecting:
		{ modelResources interfaceImplementorInLibraryProject }
]

{ #category : 'tests' }
ResolveResultStrategyTest >> testSlotRead [

	super testSlotRead 
]

{ #category : 'tests' }
ResolveResultStrategyTest >> testSuperclassMethods [

	self testSuperclassMethodsExpecting: modelResources superclassInLibraryProject methods
]
