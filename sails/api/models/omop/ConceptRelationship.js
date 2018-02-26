// omop/ConceptRelationship.js

module.exports = {
	
	attributes: {

		// CREATE TABLE concept_relationship (
		//   concept_id_1			INTEGER			NOT NULL,
		//   concept_id_2			INTEGER			NOT NULL,
		//   relationship_id		VARCHAR(20)		NOT NULL,
		//   valid_start_date		DATE			NOT NULL,
		//   valid_end_date		DATE			NOT NULL,
		//   invalid_reason		VARCHAR(1)		NULL
		// )
		
		conceptId1: {
			field: 'concept_id_1',
			type: Sequelize.INTEGER,
			required: true
		},
		
		conceptId2: {
			field: 'concept_id_2',
			type: Sequelize.INTEGER,
			required: true
		},
		
		relationshipId: {
			field: 'relationship_id',
			type: Sequelize.STRING(20),
			required: true
		},
		
		vocabularyId: {
			field: 'vocabulary_id',
			type: Sequelize.STRING(20),
			required: true
		},
		
		validStartDate: {
			field: 'valid_start_date',
			type: Sequelize.DATE,
			required: true
		},
		
		validEndDate: {
			field: 'valid_end_date',
			type: Sequelize.DATE,
			required: true
		},
		
		invalid_reason: {
			field: 'invalid_reason',
			type: Sequelize.STRING(1),
			required: false
		}
		
	},
	
	associations: function() {
	
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'concept_relationship',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
