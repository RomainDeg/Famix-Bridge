Extension { #name : 'FMMany' }

{ #category : '*Moose-Workspace' }
FMMany >> checkForNoResult: readReturnValue [
"returns true if read: anObject call return value is nil or empty, false otherwise"
	^ readReturnValue isEmpty
]

{ #category : '*Moose-Workspace' }
FMMany >> findVersionsOfEntity: anObject [
	
	^ anObject findAllVersionsOfEntity 
]

{ #category : '*Moose-Workspace' }
FMMany >> resolveResult: aCollection [
	"returns the resolved entity if it is found, returns the stub entity otherwise"

	aCollection ifEmpty: [ ^ aCollection ].

	^ aCollection collect: [ :stub |
		  | resolvedEntity |
		  resolvedEntity := stub resolveStub.
		  resolvedEntity
			  ifNotNil: [
			  resolvedEntity "stub was resolved, store resolved entity" ]
			  ifNil: [ stub "stub was not resolved, store stub entity" ] ]
]
