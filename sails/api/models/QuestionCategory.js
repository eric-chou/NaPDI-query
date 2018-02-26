// QuestionCategory.js

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: false,
			allowNull: true
		},
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: false,
			defaultValue: 0
		}
		
	},
	
	associations: function() {
		
		QuestionCategory.hasMany(ExperimentTypeQuestion, {
			as: 'experimentQuestions',
			foreignKey: {
				name: 'categoryId',
				field: 'category_id',
				allowNull: false
			}
		});
		
		QuestionCategory.belongsTo(QuestionSection, {
			as: 'section',
			foreignKey: {
				name: 'sectionId',
				field: 'section_id',
				allowNull: false
			}
		});
		
	},
	
	defaultScope: function () {
		return {
			include: [
				{ model: QuestionSection, as: 'section' }
			]
		};
	},
	
	options: {
		freezeTableName: true,
		tableName: 'question_category',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {},
		indexes: [
			{
				name: 'uq_questionCategory',
				type: 'unique',
				fields: [ 'name', 'section_id' ]
			}
		]
	}
};
