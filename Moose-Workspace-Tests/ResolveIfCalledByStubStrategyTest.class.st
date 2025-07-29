"
A ResolveIfCalledByStubStrategyTest is a test class for testing the behavior of ResolveIfCalledByStubStrategy
"
Class {
	#name : 'ResolveIfCalledByStubStrategyTest',
	#superclass : 'AbstractStubResolverStrategyTest',
	#category : 'Moose-Workspace-Tests',
	#package : 'Moose-Workspace-Tests'
}

{ #category : 'running' }
ResolveIfCalledByStubStrategyTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	workspace stubResolverStrategy: ResolveIfCalledByStubStrategy new
]

{ #category : 'tests' }
ResolveIfCalledByStubStrategyTest >> testHierarchyQuery [

	self testHierarchyQueryExpecting: modelResources stubSuperclassInMainProject
]

{ #category : 'tests' }
ResolveIfCalledByStubStrategyTest >> testInterfaceImplementingClassesQuery [
	
	self testInterfaceImplementingClassesQueryExpecting:
	{ modelResources interfaceImplementorInLibraryProject }
]

{ #category : 'tests' }
ResolveIfCalledByStubStrategyTest >> testSlotRead [
"only here for the test button on the subclass method"
	super testSlotRead 
]

{ #category : 'tests' }
ResolveIfCalledByStubStrategyTest >> testSuperclassMethods [

	self testSuperclassMethodsExpecting: modelResources superclassInLibraryProject methods
]
