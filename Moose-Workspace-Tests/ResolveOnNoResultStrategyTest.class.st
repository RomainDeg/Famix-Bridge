"
A ResolveOnNoResultStrategyTest is a test class for testing the behavior of ResolveOnNoResultStrategy
"
Class {
	#name : 'ResolveOnNoResultStrategyTest',
	#superclass : 'AbstractStubResolverStrategyTest',
	#category : 'Moose-Workspace-Tests',
	#package : 'Moose-Workspace-Tests'
}

{ #category : 'running' }
ResolveOnNoResultStrategyTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	workspace stubResolverStrategy: ResolveOnNoResultStrategy new
]

{ #category : 'tests' }
ResolveOnNoResultStrategyTest >> testHierarchyQuery [

	self testHierarchyQueryExpecting: modelResources stubSuperclassInMainProject
]

{ #category : 'tests' }
ResolveOnNoResultStrategyTest >> testInterfaceImplementingClassesQuery [

	self testInterfaceImplementingClassesQueryExpecting:
		{ modelResources interfaceImplementorInLibraryProject }
]

{ #category : 'tests' }
ResolveOnNoResultStrategyTest >> testSlotRead [
"only here for the test button on the subclass method"
	super testSlotRead
]

{ #category : 'tests' }
ResolveOnNoResultStrategyTest >> testSuperclassMethods [

	self testSuperclassMethodsExpecting: modelResources superclassInLibraryProject methods
]
