Class {
	#name : 'BaselineOfFamixBridge',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixBridge',
	#package : 'BaselineOfFamixBridge'
}

{ #category : 'baselines' }
BaselineOfFamixBridge >> baseline: spec [

	<baseline>
	self mooseTestResourcesJavaModels: spec.

	spec for: #common do: [
		spec
			package: 'Famix-Bridge';
			package: 'Moose-Workspace';
			package: 'Famix-Bridge-Tests'
			with: [
				spec requires:
						#( 'Famix-Bridge' 'Moose-TestResources-JavaModels' ) ];
			package: 'Moose-Workspace-Tests' with: [
				spec requires:
						#( 'Moose-Workspace' 'Moose-TestResources-JavaModels' ) ] ]
]

{ #category : 'baselines' }
BaselineOfFamixBridge >> mooseTestResourcesJavaModels: spec [

	spec
		baseline: 'MooseTestResourcesJavaModels'
		with: [ 
		spec repository: 'github://RomainDeg/Moose-TestResources-JavaModels:main/src' ]
]
