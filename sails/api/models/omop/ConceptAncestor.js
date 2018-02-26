// omop/ConceptAncestor.js

module.exports = {
	
	attributes: {

		// CREATE TABLE concept_ancestor (
		//   ancestor_concept_id		INTEGER		NOT NULL,
		//   descendant_concept_id		INTEGER		NOT NULL,
		//   min_levels_of_separation	INTEGER		NOT NULL,
		//   max_levels_of_separation	INTEGER		NOT NULL
		// )
		
		ancestorConceptId: {
			field: 'ancestor_concept_id',
			type: Sequelize.INTEGER,
			required: true
		},
		
		descendantConceptId: {
			field: 'descendant_concept_id',
			type: Sequelize.INTEGER,
			required: true
		},
		
		minLevelsOfSeparation: {
			field: 'min_levels_of_separation',
			type: Sequelize.INTEGER,
			required: true
		},
		
		maxLevelsOfSeparation: {
			field: 'max_levels_of_separation',
			type: Sequelize.INTEGER,
			required: true
		}
		
	},
	
	associations: function() {
	
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'concept_ancestor',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
