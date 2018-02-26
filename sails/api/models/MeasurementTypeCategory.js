// MeasurementTypeCategory.js

module.exports = {
	
	attributes: {

		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		sort_order: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: false,
			defaultValue: 0
		}
		
	},
	
	associations: function() {
		
		MeasurementTypeCategory.hasMany(ExperimentTypeMeasurementType, {
			as: 'experimentMeasurementType',
			foreignKey: {
				name: 'categoryId',
				field: 'category_id'
			}
		});
		
	},
	
	options: {
		freezeTableName: true,
		tableName: 'measurement_type_category',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
