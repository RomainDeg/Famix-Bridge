"
I am a strategy used to resolve stubs entity and find their corresponding defined entity.

I try to resolve the results of the `super read: anObject` call. 
It will not try to resolve the `anObject` parameter, even if the `super read: anObject` call returns no results.
"
Class {
	#name : 'ResolveResultStrategy',
	#superclass : 'AbstractStubResolverStrategy',
	#category : 'Moose-Workspace-Resolving strategies',
	#package : 'Moose-Workspace',
	#tag : 'Resolving strategies'
}

{ #category : 'meta-object-protocol' }
ResolveResultStrategy >> slot: aFMRelationSlot read: anObject [

	^ aFMRelationSlot readAndResolveIfStubResult: anObject
]
