// Unit.js

module.exports = {
	
	attributes: {
		
		// all measurements with unit = % or -fold will have optional P value
		
		// TODO: should we have a null unit so all Measurements will be realated to a unit?
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		}
	},
	
	associations: function() {
		
		Unit.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Unit.belongsToMany(MeasurementType, { 
			as: 'measurementTypes',
			to: 'units',
			through: 'measurement_type_unit_xref', 
			foreignKey: {
				name: 'unitId',
				field: 'unit_id'
			},
			timestamps: false
		});

		Unit.hasMany(Measurement, { 
			as: 'measurements',
			foreignKey: {
				name: 'unitId',
				field: 'unit_id',
				allowNull: false //required: true???
			}
		});
	
	},
	
	options: {
		freezeTableName: true,
		tableName: 'unit',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
