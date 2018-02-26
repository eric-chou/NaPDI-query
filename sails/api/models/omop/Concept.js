// omop/Concept.js

module.exports = {
	
	attributes: {

		// CREATE TABLE concept (
		//   concept_id			INTEGER			NOT NULL,
		//   concept_name			VARCHAR(255)	NOT NULL,
		//   domain_id				VARCHAR(20)		NOT NULL,
		//   vocabulary_id			VARCHAR(20)		NOT NULL,
		//   concept_class_id		VARCHAR(20)		NOT NULL,
		//   standard_concept		VARCHAR(1)		NULL,
		//   concept_code			VARCHAR(50)		NOT NULL,
		//   valid_start_date		DATE			NOT NULL,
		//   valid_end_date		DATE			NOT NULL,
		//   invalid_reason		VARCHAR(1)		NULL
		// )
		
		conceptId: {
			field: 'concept_id',
			type: Sequelize.INTEGER,
			primaryKey: true,
			autoIncrement: false
		},
		
		conceptName: {
			field: 'concept_name',
			type: Sequelize.STRING,
			required: true
		},
		
		domainId: {
			field: 'domain_id',
			type: Sequelize.STRING(20),
			required: true
		},
		
		vocabularyId: {
			field: 'vocabulary_id',
			type: Sequelize.STRING(20),
			required: true
		},
		
		conceptClassId: {
			field: 'concept_class_id',
			type: Sequelize.STRING(20),
			required: true
		},
		
		standardConcept: {
			field: 'standard_concept',
			type: Sequelize.STRING(1),
			required: false
		},
		
		conceptCode: {
			field: 'concept_code',
			type: Sequelize.STRING(50),
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
		
		// associations to omop tables
		Concept.hasMany(ConceptClass, {
			as: 'conceptClasses',
			foreignKey: {
				name: 'conceptClassConceptId',
				field: 'concept_class_concept_id',
				allowNull: false
			}
		});
		
		Concept.hasMany(Domain, {
			as: 'domains',
			foreignKey: {
				name: 'domainConceptId',
				field: 'domain_concept_id',
				allowNull: false
			}
		});
		
		Concept.hasMany(Relationship, {
			as: 'relationships',
			foreignKey: {
				name: 'relationshipConceptId',
				field: 'relationship_concept_id',
				allowNull: false
			}
		});
		
		Concept.hasMany(Vocabulary, {
			as: 'vocabularies',
			foreignKey: {
				name: 'vocabularyConceptId',
				field: 'vocabulary_concept_id',
				allowNull: false
			}
		});
		
		// associations to napdi tables
		Concept.hasMany(NaturalProduct, { 
			as: 'naturalProduct',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Concept.hasMany(Compound, { 
			as: 'compounds',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'concept',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
