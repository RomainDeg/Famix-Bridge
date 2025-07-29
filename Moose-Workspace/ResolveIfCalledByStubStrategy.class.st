"
I am a strategy used to resolve stubs entity and find their corresponding defined entity.

I try to resolve an entity if it is a stub. It will check if the entity is a stub before a call `super read: anObject` and try to resolve it first.

If a real entity representing the stub is found, the slot will call `super read: realEntity`. Otherwise, it will call `super read: stubEntity`.
"
Class {
	#name : 'ResolveIfCalledByStubStrategy',
	#superclass : 'AbstractStubResolverStrategy',
	#category : 'Moose-Workspace-Resolving strategies',
	#package : 'Moose-Workspace',
	#tag : 'Resolving strategies'
}

{ #category : 'meta-object-protocol' }
ResolveIfCalledByStubStrategy >> slot: aFMRelationSlot read: anObject [

	^ aFMRelationSlot readAndResolveIfCalledForStub: anObject 
]
