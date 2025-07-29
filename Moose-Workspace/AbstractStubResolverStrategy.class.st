"
I am an abstract strategy used to resolve stubs entity and find their corresponding defined entity.

I am used by the `MooseWorkspace` which takes an instance of one of my subclasses as instance variable, and calls their method `slot: aFMRelationSlot read: anObject` when inter-model protocol is used.
"
Class {
	#name : 'AbstractStubResolverStrategy',
	#superclass : 'Object',
	#category : 'Moose-Workspace-Resolving strategies',
	#package : 'Moose-Workspace',
	#tag : 'Resolving strategies'
}

{ #category : 'meta-object-protocol' }
AbstractStubResolverStrategy >> slot: aFMRelationSlot read: anObject [

	self subclassResponsibility 
]
