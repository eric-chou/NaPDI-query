// MeasurementType.js

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		}
		
	},
	
	associations: function () {
		
		MeasurementType.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		MeasurementType.hasMany(Measurement, {
			as: 'measurements',
			foreignKey: {
				name: 'measurementTypeId',
				field: 'measurement_type_id',
				allowNull: false
			}
		});
	
		// possible units for this measurement type
		MeasurementType.belongsToMany(Unit, { 
			as: 'units',
			to: 'measurementTypes',
			through: 'measurement_type_unit_xref',
			foreignKey: {
				name: 'measurementTypeId',
				field: 'measurement_type_id'
			},
			timestamps: false
		});
		
		// experiment types that can have this measurement type
		MeasurementType.belongsToMany(ExperimentType, { 
			as: 'experimentTypes',
			to: 'measurementTypes',
			through: ExperimentTypeMeasurementType, 
			foreignKey: {
				name: 'measurementTypeId',
				field: 'measurement_type_id'
			}
		});
		
		MeasurementType.belongsToMany(Question, { 
			as: 'questions',
			ro: 'measurementTypes',
			through: 'measurement_type_question_xref', 
			foreignKey: {
				name: 'measurementTypeId',
				field: 'measurement_type_id'
			},
			timestamps: false
		});

	},
	
	options: {
		freezeTableName: true,
		tableName: 'measurement_type',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		getterMethods: {
			
			// use the sortOrder defined in the current ExperimentTypeMeasurementType relationship context if available
			sortOrder: function () {
				return (this.ExperimentTypeMeasurementType) ? this.ExperimentTypeMeasurementType.sortOrder : 0;
			},
			
			nonControlOnly: function () {
				return (this.ExperimentTypeMeasurementType) ? this.ExperimentTypeMeasurementType.nonControlOnly : false;
			},
			
			categoryId: function () {
				return (this.ExperimentTypeMeasurementType) ? this.ExperimentTypeMeasurementType.categoryId : null;
			}
			
		},
		hooks: {}
	}
};

