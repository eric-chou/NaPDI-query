// NaturalProduct.js
// Will contain one or more compounds

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		itis: {
			type: Sequelize.INTEGER,
			unique: true
		}
		
	},
	
	associations: function() {
	
		NaturalProduct.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		NaturalProduct.belongsToMany(Compound, { 
			as: 'compounds',
			to: 'naturalProducts',
			through: 'natural_product_compound_xref', 
			foreignKey: {
				name: 'naturalProductId',
				field: 'natural_product_id'
			},
			timestamps: false
		});
		
		NaturalProduct.hasMany(Study, {
			as: 'studies',
			foreignKey: {
				name: 'naturalProductId',
				field: 'natural_product_id',
				allowNull: false
			}
		});

	},
	
	options: {
		freezeTableName: true,
		tableName: 'natural_product',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
	
};
