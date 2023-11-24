Class {
	#name : #BaselineOfGtExperiments,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtExperiments
}

{ #category : #loading }
BaselineOfGtExperiments class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gtexperiments' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtExperiments >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtExperiments'
		]
]
