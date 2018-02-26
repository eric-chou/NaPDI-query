// Answer.js

module.exports = {
	
	attributes: {
		
		text: {
			type: Sequelize.STRING,
			unique: false, // this text + question id needs to be uq
			allowNull: false
		},
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: true,
			min: 1
		}
		
	},
	
	associations: function() {
		
		Answer.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Answer.belongsTo(Question, { 
			as: 'question',
			foreignKey: {
				name: 'questionId',
				field: 'question_id',
				allowNull: false
			}
		});
		
		Answer.hasMany(ExperimentAnswer, { 
			as: 'experimentAnswers',
			foreignKey: {
				name: 'answerId',
				field: 'answer_id',
				allowNull: true
			}
		});
		
		Answer.hasMany(MeasurementAnswer, { 
			as: 'measurementAnswers',
			foreignKey: {
				name: 'answerId',
				field: 'answer_id',
				allowNull: true
			}
		});
	
	},
	
	options: {
		freezeTableName: true,
		tableName: 'answer',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {},
		indexes: [
			{
				name: 'uq_answer',
				type: 'unique',
				fields: [ 'question_id', 'text' ]
			}
		]
	}
};
