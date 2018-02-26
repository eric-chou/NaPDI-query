// ExperimentAnswer.js
/*
http://stackoverflow.com/questions/31678813/is-it-possible-to-filter-a-query-by-the-attributes-in-the-association-table-with
https://github.com/sequelize/sequelize/issues/5378
*/

module.exports = {
	
	attributes: {
		
		text: {
			type: Sequelize.TEXT,
			allowNull: true // if null then will have this.answerId
		}
		
	},
	
	associations: function() {
		
		ExperimentAnswer.belongsTo(Experiment, { 
			as: 'experiment',
			foreignKey: {
				name: 'experimentId',
				field: 'experiment_id',
				allowNull: false
			},
			onDelete: 'CASCADE',
			hooks: true
		});
		
		ExperimentAnswer.belongsTo(Question, { 
			as: 'question',
			foreignKey: {
				name: 'questionId',
				field: 'question_id',
				allowNull: false
			}
		});
		
		ExperimentAnswer.belongsTo(Answer, { 
			as: 'answer',
			foreignKey: {
				name: 'answerId',
				field: 'answer_id',
				allowNull: true // if null then will have this.text
			}
		});
	
	},
	
	options: {
		freezeTableName: true,
		tableName: 'experiment_question_answer', // _xref_payload
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {},
		indexes: [
			{
				name: 'uq_experiment_question_answer',
				type: 'unique', // can have multiple answers to a question
				fields: [ 'experiment_id', 'question_id', 'answer_id' ]
			}
		]
	}
};
