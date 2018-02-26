// CytochromeB5.js

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: true,
			defaultValue: 0
		}

	},
	
	associations: function() {
		
		CytochromeB5.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		CytochromeB5.hasMany(Experiment, {
			as: 'experiments',
			foreignKey: {
				name: 'cytochromeB5Id',
				field: 'cytochrome_b5_id',
				allowNull: true
			}
		});
		
	},
	
	options: {
		freezeTableName: true,
		tableName: 'cytochrome_b5',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		getterMethods: {},
		hooks: {}
	}
};