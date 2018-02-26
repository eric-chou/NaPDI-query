// MeasurementTypeCategory.js

module.exports = {
	
	attributes: {

		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false,
			validate: {
				isIn: [[
					'Cell System', 
					'Cell Fraction', 
					'Recombinant Expression System', 
					'Transfected/siRNA Knock-out/Injected Cells'
				]]
			}
		},
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: false,
			defaultValue: 0
		},
		
		// true for Recombinant Expression System
		requiresCytochromeB5: {
			field: 'requires_cytochrome_b5',
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: false
		}
		
	},
	
	associations: function() {
		
		TestSystemCategory.hasMany(TestSystem, {
			as: 'testSystems',
			foreignKey: {
				name: 'categoryId',
				field: 'category_id'
			}
		}); 

	},
	
	options: {
		freezeTableName: true,
		tableName: 'test_system_category',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
