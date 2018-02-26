// ExperimentTypeQuestion.js
/*
http://stackoverflow.com/questions/31678813/is-it-possible-to-filter-a-query-by-the-attributes-in-the-association-table-with
https://github.com/sequelize/sequelize/issues/5378
*/

module.exports = {
	
	attributes: {
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: false,
			defaultValue: 0
		}
		
	},
	
	associations: function() {
		
		ExperimentTypeQuestion.belongsTo(QuestionCategory, {
			as: 'category',
			foreignKey: {
				name: 'categoryId',
				field: 'category_id',
				allowNull: false
			}
		});
		
	},
		
	// defaultScope: function () {
	// 	return {
	// 		include: [
	// 			{ model: QuestionCategory, as: 'category' }
	// 		]
	// 	};
	// },
	
	options: {
		freezeTableName: true,
		tableName: 'experiment_type_question_xref', //_xref_payload
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {}
	}
};
