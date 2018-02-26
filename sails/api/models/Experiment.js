// Experiment.js
// An individual experiment.

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING
		},
		
		// for isControlData always 0
		overallEffect: {
			field: 'overall_effect',
			type: Sequelize.INTEGER,
			allowNull: false,
			validate: { 
				isIn: [[ 1, 0, -1]]
			}
		},
		
		isControlData: {
			field: 'is_control_data',
			type: Sequelize.BOOLEAN,
			allowNull: false,
			defaultValue: false,
			comment: 'This is control to make sure exeriment is functioning correctly, not a control group.'
		},
		
		croCutoff: {
			field: 'cro_cutoff',
			type: Sequelize.TEXT
		},
		
		croIdentifier: {
			field: 'cro_identifier',
			type: Sequelize.STRING
		},
		
		comment: {
			type: Sequelize.TEXT
		},
		
		experimentalConditionsComment: {
			field: 'experimental_conditions_comment',
			type: Sequelize.TEXT
		},
		
		resultsComment: {
			field: 'results_comment',
			type: Sequelize.TEXT
		},
		
		internalComment: {
			field: 'internal_comment',
			type: Sequelize.TEXT
		}
		
	},
	
	
	associations: function () {
		
		Experiment.belongsTo(Study, {
			as: 'study',
			foreignKey: {
				name: 'studyId',
				field: 'study_id',
				allowNull: false
			}
		});
				
		Experiment.belongsTo(ExperimentType, {
			as: 'experimentType',
			foreignKey: {
				name: 'experimentTypeId',
				field: 'experiment_type_id',
				allowNull: false
			}
		});
		
		Experiment.belongsTo(Compound, {
			as: 'objectCompound',
			foreignKey: {
				name: 'objectCompoundId',
				field: 'object_id',
				allowNull: true
			}
		});
		
		Experiment.belongsTo(Compound, {
			as: 'objectMetaboliteCompound',
			foreignKey: {
				name: 'objectMetaboliteCompoundId',
				field: 'object_metabolite_id',
				allowNull: true
			}
		});
		
		Experiment.belongsTo(Compound, {
			as: 'precipitantCompound',
			foreignKey: {
				name: 'precipitantCompoundId',
				field: 'precipitant_id',
				allowNull: true
			}
		});
		
		Experiment.belongsTo(TestSystem, {
			as: 'testSystem',
			foreignKey: {
				name: 'testSystemId',
				field: 'test_system_id',
				allowNull: true
			}
		});
		
		Experiment.belongsTo(CytochromeB5, {
			as: 'cytochromeB5',
			foreignKey: {
				name: 'cytochromeB5Id',
				field: 'cytochrome_b5_id',
				allowNull: true
			}
		});
				
		Experiment.belongsToMany(Enzyme, { 
			as: 'enzymes', 
			to: 'experiments',
			through: 'experiment_enzyme_xref', 
			foreignKey: {
				name: 'experimentId',
				field: 'experiment_id'
			},
			timestamps: false
		});
		
		Experiment.belongsToMany(Transporter, { 
			as: 'transporters', 
			to: 'experiments',
			through: 'experiment_transporter_xref', 
			foreignKey: {
				name: 'experimentId',
				field: 'experiment_id'
			},
			timestamps: false
		});
		
		Experiment.belongsTo(Experiment, {
			as: 'controlDataExperiment',
			foreignKey: {
				name: 'controlDataExperimentId',
				field: 'control_data_experiment_id',
				allowNull: true
			}
		});
		
		Experiment.hasMany(Experiment, {
			as: 'controlDataForExperiments',
			foreignKey: {
				name: 'controlDataForExperimentId',
				field: 'control_data_experiment_id'
			}
		});
		
		Experiment.hasMany(Measurement, {
			as: 'measurements',
			foreignKey: {
				name: 'experimentId',
				field: 'experiment_id',
				allowNull: false
			},
			onDelete: 'CASCADE',
			hooks: true
		});
		
		Experiment.hasMany(ExperimentAnswer, { 
			as: 'experimentAnswers',
			foreignKey: {
				name: 'experimentId',
				field: 'experiment_id',
				allowNull: false
			}
		});

	},

	defaultScope: function () {
		return {
			include: [
				{ model: ExperimentType, as: 'experimentType' }, // needed for validation
				{ model: Compound, as: 'objectCompound' }, // needed for getName()
				{ model: Compound, as: 'precipitantCompound' }, // needed for getName()
				{ model: Compound, as: 'objectMetaboliteCompound' },
				{ model: Enzyme, as: 'enzymes' }, // needed for validation
				{ model: Transporter, as: 'transporters' } // needed for validation
			]
		};
	},
	
	options: {
		freezeTableName: true,
		tableName: 'experiment',
		underscored: true,
		timestamps: false,
		scopes: {
			// test: {
			// 	include: [
			// 		{ model: sails.models.ExperimentType, as: 'experimentType' }, // needed for getName()
			// 		{ model: sails.models.Compound, as: 'objectCompound' }, // needed for getName()
			// 		{ model: sails.models.Compound, as: 'precipitantCompound' } // needed for getName()
			// 	]
			// }
		}, // does this work
		classMethods: {},
		instanceMethods: {
			
			getReadOnlyMeasurementsWithAssociations: function (measurementTypeCategories) {
				
				var measurements = [];
				
				var measurementTypes = this.experimentType.getReadOnlyMeasurementTypesWithAssociations(measurementTypeCategories);
				
				this.measurements.forEach(measurement => {
					
					var measurementClone = _.clone(measurement.dataValues);
					
					if (measurementTypes) {
						measurementClone.measurementType = _.clone(measurementTypes.find(x => x.id == measurementClone.measurementTypeId));;
					}
					
					delete measurementClone.CompoundId;
					delete measurementClone.ExperimentId;
					delete measurementClone.MeasurementTypeId;
					delete measurementClone.UnitId;
					delete measurementClone.ValueTypeId;
					
					if (measurementClone.measurementAnswers) {
						measurementClone.measurementAnswers.forEach(measurementAnswer => {
							delete measurementAnswer.dataValues.AnswerId;
							delete measurementAnswer.dataValues.MeasurementId;
							delete measurementAnswer.dataValues.QuestionId;
						});
					}

					measurements.push(measurementClone);
				});
				
				return measurements;
			},
			
			getOverallEffectName: function () {
				return this.experimentType.getOverallEffectName(this.overallEffect);
			},
			
			getOverallEffectNameShort: function () {
				return this.experimentType.getOverallEffectNameShort(this.overallEffect);
			},
			
			getNameOld: function () {
				if (this.isNewRecord) return 'New ' + this.experimentType.name + ' experiment';
				
				var compounds = [];
				if (this.objectCompound) compounds.push(this.objectCompound.name);
				if (this.precipitantCompound) compounds.push(this.precipitantCompound.name);
				var name = compounds.join(' + ');
				if (this.experimentType.getHasOverallEffect()) name = this.getOverallEffectName() + ' &mdash; ' + name;
				return name;
			},
			
			getName: function () {
				if (this.isNewRecord) return 'New ' + this.experimentType.name + ' experiment';
				
				var experiment = this;
				var name = [];
				name.push('id: ' + experiment.id);
				if (experiment.isControlData) name.push('Control data');
		 		if (experiment.objectCompound) name.push('object: ' + experiment.objectCompound.name);
		 		if (experiment.objectMetaboliteCompound) name.push('object metabolite: ' + experiment.objectMetaboliteCompound.name);
		 		if (experiment.precipitantCompound) name.push('precipitant: ' + experiment.precipitantCompound.name);
				if (experiment.enzymes.length) name.push('enzymes: ' + _.map(experiment.enzymes, 'name').join(', '));
				if (experiment.transporters.length) name.push('transporters: ' + _.map(experiment.transporters, 'name').join(', '));
		 		return name.join(' | ');
			}
			
		},
		getterMethods: {},
		validate: {
			
			validateControlData: function () {
				if (this.experimentType.getHasControlData() === false) {
					if (this.isControlData) {
						throw new Error('Experiment type can not be control data.');
					}
					if (this.controlDataExperimentId) {
						throw new Error('Experiment type can not have control data.');
					}
				}
			},
			
			validateCroCutoff: function () {
				if (this.experimentType.getHasCroCutOff() === true) {
					if (!this.croCutoff) {
						throw new Error('Experiment type must have CRO cutoff.');
					}
				} else if (this.croCutoff) {
					throw new Error('Experiment type can not have CRO cutoff.');
				}
			},
			
			validateOverallEffect: function () {
				if (this.overallEffect !== 0 && this.experimentType.getHasOverallEffect() === false) {
					throw new Error('Experiment type can not have overall effect.');
				}
			},
			
			validateInverseOverallEffect: function () {
				if (this.overallEffect === -1 && this.experimentType.getHasInverseOverallEffect() === false) {
					return new Error("ExperimentType can not have inverse overall effect");
				}
			},
			
			validateObjectCompound: function () {
				if (this.experimentType.getHasObjectCompound() === true) {
					if (!this.objectCompoundId) {
						throw new Error('Experiment type must have an object compound.');
					}
				} else if (this.objectCompoundId) {
					throw new Error('Experiment type can not have an object compound.');
				}
			},
			
			validateObjectMetabolite: function () {
				if (this.experimentType.getHasObjectMetaboliteCompound() === true) {
					if (!this.objectMetaboliteCompoundId) {
						throw new Error('Experiment type must have an object metabolite compound.');
					} else if (!this.objectCompoundId) {
						throw new Error('Experiment types that have an object metabolite compound must have object compound.');
					} else {
						// get object compond and check metabolites
						// no idea how to get async validation to work
						//  Compound.findById(this.objectCompoundId, { include: { model: Compound, as: 'metabolites' } }).then(function (compound) {
						// 	if (!compound.metabolites.find(x => x.id == this.objectMetaboliteCompoundId)) {
						// 		throw new Error('Metabolite selected is not a metabolite of the object compound.');
						// 	}
						// });
					}
				} else if (this.objectMetaboliteCompoundId) {
					throw new Error('Experiment type can not have an object metabolite compound.');
				}
			},
			
			validatePrecipitantCompound: function () {
				if (this.experimentType.getHasPrecipitantCompound() === true) {
					if (!this.precipitantCompoundId) {
						throw new Error('Experiment type must have a precipitant compound.');
					}
				} else if (this.precipitantCompoundId) {
					throw new Error('Experiment type can not have a precipitant compound.');
				}
			},

			
			validateTestSystem: function () {
				if (this.experimentType.getHasTestSystem() === true) {
					if (!this.testSystemId) {
						throw new Error('Experiment type must have a test system.');
					}
				} else if (this.testSystemId) {
					throw new Error('Experiment type can not have a test system.');
				}
			},
			
			validateEnzymes: function () {
				if (this.isNewRecord) return;
				
				if (this.enzymes == null) return; // not loaded in model
				
				if (this.experimentType.getHasEnzymes() === true) {
					if (this.experimentType.getHasOptionalEnzymes() === false && this.enzymes.length == 0) {
						throw new Error('Experiment type must have enzymes.');
					}
				} else if (this.enzymes.length > 0) {
					throw new Error('Experiment type can not have enzymes.');
				}
			},
			
			validateTransporters: function () {
				if (this.isNewRecord) return;
				
				if (this.transporters == null) return; // not loaded in model
				
				if (this.experimentType.getHasTransporters() === true) {
					if (this.experimentType.getHasOptionalTransporters() === false && this.transporters.length == 0) {
						throw new Error('Experiment type must have transporters.');
					}
				} else if (this.transporters.length > 0) {
					throw new Error('Experiment type can not have transporters.');
				}
			},
			
		},
		hooks: {}
	}
	
};
