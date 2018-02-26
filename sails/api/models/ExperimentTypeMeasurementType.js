// ExperimentTypeMeasurementType.js

module.exports = {
	
	attributes: {
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: false,
			defaultValue: 0
		},
		
		nonControlOnly: {
			field: 'non_control_only',
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: false
		}
		
	},
	
	associations: function () {
		
		ExperimentTypeMeasurementType.belongsTo(MeasurementTypeCategory, {
			as: 'category',
			foreignKey: {
				name: 'categoryId',
				field: 'category_id'
			}
		});
		
	},
		
	defaultScope: function () {
		return {
			include: [
				{ model: MeasurementTypeCategory, as: 'category' }
			]
		};
	},
	
	options: {
		freezeTableName: true,
		tableName: 'experiment_type_measurement_type_xref', // _xref_payload
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
