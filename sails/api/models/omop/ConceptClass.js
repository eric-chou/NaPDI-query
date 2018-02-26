// omop/ConceptClass.js

module.exports = {
	
	attributes: {

		// CREATE TABLE concept_class (
		//   concept_class_id			VARCHAR(20)		NOT NULL,
		//   concept_class_name		VARCHAR(255)	NOT NULL,
		//   concept_class_concept_id	INTEGER			NOT NULL
		// )
		
		conceptClassId: {
			field: 'concept_class_id',
			type: Sequelize.STRING(20),
			primaryKey: true
		},
		
		conceptClassName: {
			field: 'concept_class_name',
			type: Sequelize.STRING,
			required: true
		}
		
	},
	
	associations: function() {
		
		ConceptClass.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptClassConceptId',
				field: 'concept_class_concept_id',
				allowNull: false
			}
		});
		
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'concept_class',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
