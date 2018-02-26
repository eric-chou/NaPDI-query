// StudySourceType.js

// what kind source the study data is coming from

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		}
		
	},
	
	associations: function() {

		StudySourceType.hasMany(Study, {
			as: 'studies',
			foreignKey: {
				name: 'studySourceTypeId',
				field: 'study_source_type_id',
				allowNull: false,
				defaultValue: 1
			}
		});

	},
	
	options: {
		freezeTableName: true,
		tableName: 'study_source_type',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
	
};
