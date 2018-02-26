// Enzyme.js

module.exports = {
	
	attributes: {
		
		name: {
		   type: Sequelize.STRING,
		   unique: true,
		   allowNull: false
		}
	},
	
	associations: function() {
		
		Enzyme.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Enzyme.belongsToMany(Experiment, { 
			as: 'experiments',
			to: 'enzymes',
			through: 'experiment_enzyme_xref', 
			foreignKey: {
				name: 'enzymeId',
				field: 'enzyme_id'
			},
			timestamps: false
		});
		
	},
	
	options: {
		freezeTableName: true,
		tableName: 'enzyme',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
	
};
