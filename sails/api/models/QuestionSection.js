// QuestionSection.js

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
			allowNull: false,
			defaultValue: 0
		}
		
	},
	
	associations: function() {
		
		QuestionSection.hasMany(QuestionCategory, {
			as: 'categories',
			foreignKey: {
				name: 'sectionId',
				field: 'section_id',
				allowNull: false
			}
		});
		
	},
	
	options: {
		freezeTableName: true,
		tableName: 'question_section',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
