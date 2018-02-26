// Question.js

module.exports = {
	
	attributes: {
		
		text: {
			type: Sequelize.STRING,
			// unique: true,
			allowNull: false
		},
		
		required: {
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: false
		},
		
		// text answer if null
		maxAnswers: {
			field: 'max_answers',
			type: Sequelize.INTEGER,
			allowNull: true,
			defaultValue: 1,
			min: 1
		},
		
		// choice/<select> will be null
		type: {
			type: Sequelize.STRING,
			validate: { 
				isIn: [[ null, 'STRING', 'TEXT', 'NUMBER', 'INTEGER' ]]
			}
		}
		
	},
	
	associations: function() {
		
		Question.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Question.hasMany(Answer, {
			as: 'answers',
			foreignKey: {
				name: 'questionId',
				field: 'question_id',
				allowNull: false
			}
		});
		
		Question.belongsToMany(ExperimentType, { 
			as: 'experimentTypes',
			to: 'questions',
			through: ExperimentTypeQuestion,
			foreignKey: {
				name: 'questionId',
				field: 'question_id'
			}
		});
		
		Question.belongsToMany(MeasurementType, { 
			as: 'measurementTypes',
			to: 'questions',
			through: 'measurement_type_question_xref', 
			foreignKey: {
				name: 'questionId',
				field: 'question_id'
			},
			timestamps: false
		});
		
		Question.hasMany(ExperimentAnswer, { 
			as: 'experimentAnswers',
			foreignKey: {
				name: 'questionId',
				field: 'question_id',
				allowNull: false
			}
		});
		
		Question.hasMany(MeasurementAnswer, { 
			as: 'measurementAnswers',
			foreignKey: {
				name: 'questionId',
				field: 'question_id',
				allowNull: false
			}
		});
		
	},
	
	defaultScope: function () {
		return {
			include: [
				{ model: Answer, as: 'answers' }
			]
		};
	},
	
	options: {
		// any indexes???
		freezeTableName: true,
		tableName: 'question',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {},
		getterMethods: {
			
			// if this question is part of an collection with ExperimentTypeQuestion
			// then use that relationships sortOrder
			// could add join model MeasurementQuestion with sort and parrot through here but not neccessary
			sortOrder: function () {
				return (this.ExperimentTypeQuestion) ? this.ExperimentTypeQuestion.sortOrder : 0;
			},
			
			categoryId: function () {
				return (this.ExperimentTypeQuestion) ? this.ExperimentTypeQuestion.categoryId : null;
			}
			
		},
		hooks: {}
	}
};
