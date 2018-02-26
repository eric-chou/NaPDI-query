// ValueType.js

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		format: {
			type: Sequelize.INTEGER,
			allowNull: false,
			validate: {
				min: 1,
				max: 8
				// see Enums.ValueTypeFormat
			}
		}
		
	},
	
	associations: function() {
		
		ValueType.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		ValueType.hasMany(Measurement, {
			as: 'measurements',
			foreignKey: {
				name: 'valueTypeId',
				field: 'value_type_id',
				allowNull: false
			}
		});
		
	},
	
	options: {
		freezeTableName: true,
		tableName: 'value_type',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
