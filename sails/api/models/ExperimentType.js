// ExperimentType.js

/*
In Vitro
	Enzyme Inhibition
	Enzyme Induction
	Enzyme Kinetics
	Enzyme Screen
	
	Transporter Inhibition
	Transporter Induction
	Transporter Kinetics

In Vivo
	PK  
	DDI

*/

module.exports = {
	
	attributes: {
	
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
 
		isInVitro: {
			field: 'is_invitro',
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: true
		},
		
		isTransporter: {
			field: 'is_transporter',
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: false
		},
		
		isEnzyme: {
			field: 'is_enzyme',
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: false
		}
		
	},
	
	associations: function () {
		
		ExperimentType.hasMany(Experiment, {
			as: 'experiments',
			foreignKey: {
				name: 'experimentTypeId',
				field: 'experiment_type_id',
				allowNull: false
			}
		});
		
		ExperimentType.belongsToMany(TestSystem, { 
			as: 'testSystems',
			to: 'experimentTypes',
			through: 'experiment_type_test_system_xref', 
			foreignKey: {
				name: 'experimentTypeId',
				field: 'experiment_type_id'
			},
			timestamps: false
		});
		
		ExperimentType.belongsToMany(MeasurementType, { 
			as: 'measurementTypes',
			to: 'experimentTypes',
			through: ExperimentTypeMeasurementType, 
			foreignKey: {
				name: 'experimentTypeId',
				field: 'experiment_type_id'
			}
		});
		
		ExperimentType.belongsToMany(Question, { 
			as: 'questions',
			to: 'experimentTypes',
			through: ExperimentTypeQuestion,
			foreignKey: {
				name: 'experimentTypeId',
				field: 'experiment_type_id'
			}
		});
		
	},
	
	options: {
		freezeTableName: true,
		tableName: 'experiment_type',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {
			
			getReadOnlyQuestionsWithAssociations: function(categories) {
				var questions = [];

				this.questions.forEach(question => {
					var category = _.find(categories, { id: question.categoryId });
					
					var questionClone = _.clone(question.dataValues);
					questionClone.category = _.clone(category.dataValues);
					questionClone.categoryId = question.categoryId;
					questionClone.sortOrder = question.sortOrder;

					// clean out unwanted stuff
					delete questionClone.ExperimentTypeQuestion;
					
					if (questionClone.answers) {
						questionClone.answers.forEach(answer => {
							delete answer.dataValues.QuestionId;
						});
					}
					
					questions.push(questionClone);
				});
				
				return questions;
			},
			
			getReadOnlyMeasurementTypesWithAssociations: function(categories) {
				
				var measurementTypes = [];
				
				this.measurementTypes.forEach(measurementType => {
					
					var category = null;
				
					if (measurementType.categoryId) {
						category = _.find(categories, { id: measurementType.categoryId });
					}
					
					var measurementTypeClone = _.clone(measurementType.dataValues);
					measurementTypeClone.category = (category) ? _.clone(category.dataValues) : null;
					measurementTypeClone.categoryId = measurementType.categoryId;
					measurementTypeClone.sortOrder = measurementType.sortOrder;
					measurementTypeClone.nonControlOnly = measurementType.nonControlOnly;
					
					// clean out unwanted stuff
					delete measurementTypeClone.ExperimentTypeMeasurementType;
					
					if (measurementType.units) {
						measurementType.units.forEach(unit => {
							delete unit.dataValues.measurementType_unit;
						});
					}
					
					if (measurementType.questions) {
						measurementType.questions.forEach(question => {
							delete question.dataValues.measurementType_question;
							
							if (question.answers) {
								question.answers.forEach(answer => {
									delete answer.dataValues.QuestionId;
								});
							}
						});
					}

					measurementTypes.push(measurementTypeClone);
				});
				return measurementTypes;
			},
			
			getOverallEffectName: function (value) {
				if (value != null) {
					return EnumService.ExperimentType.properties[this.id].overallEffectStrings[value];
				}
				return null;
			},
			
			getOverallEffectNameShort: function (value) {
				if (value != null) {
					return EnumService.ExperimentType.properties[this.id].overallEffectStringsShort[value];
				}
				return null;
			},
			
			getPossibleOverallEffectValues: function () {
				var ret = [];
				
				if (this.getHasOverallEffect() === true) ret.push(1);
				
				if (this.id != EnumService.ExperimentType.InVitroEnzymeKinetics) ret.push(0);
				
				if (this.getHasInverseOverallEffect() === true) ret.push(-1);
				
				return ret;
			},
			
			// true == required
			// null == optional
			// false == does not apply
			
			// if getHas() then required except for enzymes and transporters
			
			getHasObjectCompound: function () {
				return !(
					this.id == EnumService.ExperimentType.InVitroEnzymeInduction ||
					this.id == EnumService.ExperimentType.InVitroTransporterInduction ||
					this.id == EnumService.ExperimentType.InVivoPK
				);
			},
			
			getHasObjectMetaboliteCompound: function () {
				return this.getHasObjectCompound() && this.isEnzyme;
			},
			
			getHasPrecipitantCompound: function () {
				return !(
					this.id == EnumService.ExperimentType.InVitroEnzymeScreen ||
					this.id == EnumService.ExperimentType.InVitroEnzymeKinetics ||
					this.id == EnumService.ExperimentType.InVitroTransporterKinetics ||
					this.id == EnumService.ExperimentType.InVivoPK
				);
			},
			
			getHasControlData: function () {
				return this.isInVitro;
			},
			
			getControlDataExperimentTypeIds: function () {
				var ret = [];
				if (this.getHasControlData() === true) {
					ret.push(this.id);
					if (this.id == EnumService.ExperimentType.InVitroTransporterInhibition) {
						ret.push(EnumService.ExperimentType.InVitroTransporterKinetics);
					} else if (this.id == EnumService.ExperimentType.InVitroEnzymeInhibition) {
						ret.push(EnumService.ExperimentType.InVitroEnzymeKinetics);
					}
				}
				return ret;
			},
			
			getHasControlGroup: function () {
				return (
					this.id == EnumService.ExperimentType.InVitroTransporterInhibition ||
					this.id == EnumService.ExperimentType.InVivoDDI
				);
			},
			
			getHasOverallEffect: function () {
				return (this.id != EnumService.ExperimentType.InVivoPK);
			},
			
			getHasInverseOverallEffect: function () {
				return (
					this.id == EnumService.ExperimentType.InVitroEnzymeInduction ||
					this.id == EnumService.ExperimentType.InVitroTransporterInduction ||
					this.id == EnumService.ExperimentType.InVivoDDI
				);
			},
			
			// required when true
			getHasCroCutOff: function () {
				// true for all In vitro except Enzyme Screen & Kinetics
				return (
					this.id == EnumService.ExperimentType.InVitroEnzymeInhibition ||
					this.id == EnumService.ExperimentType.InVitroEnzymeInduction ||
					this.id == EnumService.ExperimentType.InVitroTransporterInhibition ||
					this.id == EnumService.ExperimentType.InVitroTransporterInduction ||
					this.id == EnumService.ExperimentType.InVitroTransporterKinetics
				);
			},
			
			getHasTestSystem: function () {
				return this.isInVitro;
			},
			
			getHasEnzymes: function () {
				return this.isEnzyme || this.getHasOptionalEnzymes();
			},
			
			getHasTransporters: function () {
				return this.isTransporter || this.getHasOptionalTransporters();
			},
			
			getHasOptionalEnzymes: function () {
				return this.id == EnumService.ExperimentType.InVivoDDI;
			},
			
			getHasOptionalTransporters: function () {
				return this.id == EnumService.ExperimentType.InVivoDDI;
			},
			
			getMeasurementHasNumberOfExperiments: function () {
				return this.isInVitro;
			}
			
		},
		getterMethods: {},
		hooks: {}
	}
};
