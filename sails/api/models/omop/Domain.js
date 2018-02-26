// omop/Domain.js

module.exports = {
	
	attributes: {

		// CREATE TABLE domain (
		//   domain_id			VARCHAR(20)		NOT NULL,
		//   domain_name		VARCHAR(255)	NOT NULL,
		//   domain_concept_id	INTEGER			NOT NULL
		// )
		
		domainId: {
			field: 'domain_id',
			type: Sequelize.STRING(20),
		    primaryKey: true
		},
		
		domainName: {
			field: 'domain_name',
			type: Sequelize.STRING,
			required: true
		}
		
	},
	
	associations: function() {
		
		Domain.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'domainConceptId',
				field: 'domain_concept_id',
				allowNull: false
			}
		});
	
	},
	
	options: {
		schema: 'omop',
		freezeTableName: true,
		tableName: 'domain',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
