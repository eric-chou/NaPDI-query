// omop/Concept.js

module.exports = {
	
	attributes: {

		// CREATE TABLE relationship (
		//   relationship_id			VARCHAR(20)		NOT NULL,
		//   relationship_name			VARCHAR(255)	NOT NULL,
		//   is_hierarchical			VARCHAR(1)		NOT NULL,
		//   defines_ancestry			VARCHAR(1)		NOT NULL,
		//   reverse_relationship_id	VARCHAR(20)		NOT NULL,
		//   relationship_concept_id	INTEGER			NOT NULL
		// )
		
		relationshipId: {
			field: 'relationship_id',
			type: Sequelize.STRING(20),
			required: true
		},
		
		relationshipName: {
			field: 'relationship_name',
			type: Sequelize.STRING(),
			required: true
		},
		
		isHierarchical: {
			field: 'is_hierarchical',
			type: Sequelize.STRING(1),
			required: true
		},
		
		definesAncestry: {
			field: 'defines_ancestry',
			type: Sequelize.STRING(1),
			required: true
		},
		
		reverseRelationshipId: {
			field: 'reverse_relationship_id',
			type: Sequelize.STRING(20),
			required: true
		}
		
	},
	
	associations: function() {
		
		Relationship.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'relationshipConceptId',
				field: 'relationship_concept_id',
				allowNull: false
			}
		});
		
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'relationship',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
