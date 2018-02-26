// MeasurementAnswer.js
/*
http://stackoverflow.com/questions/31678813/is-it-possible-to-filter-a-query-by-the-attributes-in-the-association-table-with
https://github.com/sequelize/sequelize/issues/5378
*/

module.exports = {
	
	attributes: {
		
		text: {
			type: Sequelize.STRING,
			allowNull: true // if null then will have this.answerId
		}
		
	},
	
	associations: function() {
		
		MeasurementAnswer.belongsTo(Measurement, { 
			as: 'measurement',
			foreignKey: {
				name: 'measurementId',
				field: 'measurement_id',
				allowNull: false
			},
			onDelete: 'CASCADE',
			hooks: true
		});
		
		MeasurementAnswer.belongsTo(Question, { 
			as: 'question',
			foreignKey: {
				name: 'questionId',
				field: 'question_id',
				allowNull: false
			}
		});
		
		MeasurementAnswer.belongsTo(Answer, { 
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
		tableName: 'measurement_question_answer', // _xref_payload
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		hooks: {},
		indexes: [
			{
				name: 'uq_measurement_question_answer',
				type: 'unique', // can have multiple answers to a question
				fields: [ 'measurement_id', 'question_id', 'answer_id' ]
			}
		]
	}
};
