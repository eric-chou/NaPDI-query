// omop/Vocabulary.js

module.exports = {
	
	attributes: {

		// CREATE TABLE vocabulary (
		//   vocabulary_id			VARCHAR(20)		NOT NULL,
		//   vocabulary_name		VARCHAR(255)	NOT NULL,
		//   vocabulary_reference	VARCHAR(255)	NULL,
		//   vocabulary_version	VARCHAR(255)	NULL,
		//   vocabulary_concept_id	INTEGER			NOT NULL
		// )
		
		vocabularyId: {
			field: 'vocabulary_id',
			type: Sequelize.STRING(20),
			primaryKey: true
		},
		
		vocabularyName: {
			field: 'vocabulary_name',
			type: Sequelize.STRING,
			required: true
		},
		
		vocabularyReference: {
			field: 'vocabulary_reference',
			type: Sequelize.STRING,
			required: false
		},
		
		vocabularyVersion: {
			field: 'vocabulary_version',
			type: Sequelize.STRING,
			required: false
		}
		
	},
	
	associations: function() {
		
		Vocabulary.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'vocabularyConceptId',
				field: 'vocabulary_concept_id',
				allowNull: false
			}
		});
		
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'vocabulary',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
