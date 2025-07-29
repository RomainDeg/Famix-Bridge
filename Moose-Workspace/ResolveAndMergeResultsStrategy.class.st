"
I am a strategy used to resolve stubs entity and find their corresponding defined entity.

I collect every version of an entity (the defined entity and every existing stubs), and use this to return the most complete information. 
In the case of :
	- a `FMOne>>read:anObject` call : The return value is the result of a `FMOne>>read:anObject` performed on the defined entity. That result is also resolved if it is a stub.
	- a `FMMany>>read:anObject` call : The return value is a collection containing the results of the call `FMMany>>read:anObject` performed on every version of the entity
	

"
Class {
	#name : 'ResolveAndMergeResultsStrategy',
	#superclass : 'AbstractStubResolverStrategy',
	#category : 'Moose-Workspace-Resolving strategies',
	#package : 'Moose-Workspace',
	#tag : 'Resolving strategies'
}

{ #category : 'meta-object-protocol' }
ResolveAndMergeResultsStrategy >> slot: aFMRelationSlot read: anObject [

	^ aFMRelationSlot readResolveAndMergeResults: anObject 
]
