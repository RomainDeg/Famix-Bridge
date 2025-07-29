"
I am a strategy used to resolve stubs entity and find their corresponding defined entity.

I try to resolve an entity only if the result of the regular call to IndexedSlot>>read:anObject returns nil or an empty collection as a result.
If it returns a result, the FMRelationSlot>>read:anObject will return that result, even if anObject is a stub entity.
"
Class {
	#name : 'ResolveOnNoResultStrategy',
	#superclass : 'AbstractStubResolverStrategy',
	#category : 'Moose-Workspace-Resolving strategies',
	#package : 'Moose-Workspace',
	#tag : 'Resolving strategies'
}

{ #category : 'meta-object-protocol' }
ResolveOnNoResultStrategy >> slot: aFMRelationSlot read: anObject [

	^ aFMRelationSlot readAndResolveOnNoResult: anObject 
]
