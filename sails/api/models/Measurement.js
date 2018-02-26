// Measurement.js

module.exports = {
	
	attributes: {
		
		// validate with this.experiment.experimentType.getHasControlGroup
		isControl: {
			field: 'is_control',
			type: Sequelize.BOOLEAN,
			allowNull: true,
			defaultValue: false
		},
		
		// one of value, low, high is required
		// uase valueType and Enums.ValueTypeFormat.properties to get required items
		// maybe make low and high have value {0} required
		value: {
			type: Sequelize.FLOAT,
			allowNull: false
		},
		
		// to preserve significant digits
		// admins to choose units which will allow decimal
		// TODO: unify leading 0
		valueString: {
			field: 'value_string',
			type: Sequelize.STRING,
			allowNull: false,
			validate: {
				isDecimal: true
			},
			set: function(val) {
				this.setDataValue('valueString', val);
				this.setDataValue('precision', this.parsePrecision(val));
				this.setDataValue('scale', this.parseScale(val));
			}
		},
		
		precision: {
			type: Sequelize.INTEGER,
			allowNull: false,
			validate: {
				min: 1
			},
			// private setter in .valueString
			set: function() {}
		},
		
		scale: {
			type: Sequelize.INTEGER,
			allowNull: false,
			validate: {
				min: 0
			},
			// private setter in .valueString
			set: function() {}
		},
		
		low: {
			type: Sequelize.FLOAT
		},
		
		high: {
			type: Sequelize.FLOAT
		},
		
		variability: { 
			type: Sequelize.FLOAT
		},
		
		numberOfExperiments: {
			field: 'n_experiments',
			type: Sequelize.INTEGER,
			allowNull: true,
			validate: {
				min: 1
			}
		}
		
	},
	
	associations: function() {
		
		Measurement.belongsTo(Experiment, {
			as: 'experiment',
			foreignKey: {
				name: 'experimentId',
				field: 'experiment_id',
				allowNull: false
			}
		});
		
		Measurement.belongsTo(MeasurementType, {
			as: 'measurementType',
			foreignKey: {
				name: 'measurementTypeId',
				field: 'measurement_type_id',
				allowNull: false
			}
		});
		
		// select one from measurementType.units
		// TODO: should we have a required 'null' unit to force completion
		Measurement.belongsTo(Unit, {
			as: 'unit',
			foreignKey: {
				name: 'unitId',
				field: 'unit_id',
				allowNull: false //required: true???
			}
		});
		
		Measurement.belongsTo(ValueType, {
			as: 'valueType',
			foreignKey: {
				name: 'valueTypeId',
				field: 'value_type_id',
				allowNull: false
			}
		});
		
		Measurement.belongsTo(Compound, {
			as: 'compound',
			foreignKey: {
				name: 'compoundId',
				field: 'compound_id',
				allowNull: false
			}
		});
				
		Measurement.hasMany(MeasurementAnswer, { 
			as: 'measurementAnswers',
			foreignKey: {
				name: 'measurementId',
				field: 'measurement_id',
				allowNull: false
			}
		});

	},
	
	defaultScope: function () {
		return {
			include: [
				{ model: Unit, as: 'unit' },
				{ model: ValueType, as: 'valueType' }
			]
		};
	},
	
	options: {
		freezeTableName: true,
		tableName: 'measurement',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {
			
			setChangeFromControl: function (t) {
				// if (this.experimentType.getHasControlGroup() === false) return;
				
				var thisMeasurement = this;
				
				// find other measurement if there
				return Measurement.findOne( { 
					where: { 
						experimentId: thisMeasurement.experimentId,
						measurementTypeId: thisMeasurement.measurementTypeId,
						compoundId: thisMeasurement.compoundId,
						isControl: !(Number(thisMeasurement.isControl))
					},
					transaction: t
				}).then(otherMeasurement => {
					if (otherMeasurement == null) return otherMeasurement;
					
					var controlValue  = thisMeasurement.value;
					var experimentalValue = otherMeasurement.value;
					
					if (otherMeasurement.isControl) {
						controlValue  = otherMeasurement.value;
						experimentalValue = thisMeasurement.value;
					}
					
					var changeValue = ((experimentalValue - controlValue) * 100) / Math.abs(controlValue);
					
					var changeMeasurement = Measurement.build({});

					changeMeasurement.isControl = null;
					changeMeasurement.valueString = changeValue.toFixed(2);
					changeMeasurement.value = changeValue;
					changeMeasurement.experimentId = thisMeasurement.experimentId;
					changeMeasurement.measurementTypeId = thisMeasurement.measurementTypeId;
					changeMeasurement.compoundId = thisMeasurement.compoundId;
					changeMeasurement.unitId = 1; // %
					changeMeasurement.valueTypeId = 1; // single value
					
					return changeMeasurement.save({ transaction: t });
				});
				
			},
			
			getReadOnlyMeasurementWithAssociations: function (measurementTypeCategories) {
				var categories = [];
				if (measurementTypeCategories) {
					categories = categories.concat(measurementTypeCategories);
				}
				
				var category = null;
				
				if (this.measurementType.categoryId) {
					category = _.find(categories, { id: this.measurementType.categoryId });
				}
				
				var measurementClone = _.clone(this.dataValues);
						
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
				
				return measurementClone;
			},
			
			parsePrecision: function (){
				if (this.valueString == null || isNaN(parseFloat(this.valueString)) || !isFinite(this.valueString)) return 0;
				
				// strip leading zeros and remove any decimal point
				return this.valueString.replace(/^0+/, '').replace('\.', '').length;
			},
			
			parseScale: function (){
				if (this.valueString == null || isNaN(parseFloat(this.valueString)) || !isFinite(this.valueString)) return 0;
				
				var parts = this.valueString.split('.');
				
				return parts[1] != null ? parts[1].length : 0;
			}
			
		},
		getterMethods: {},
		validate: {
			
			validateRange: function() {
				if (this.low !== null && this.high !== null) {
					if (this.low > this.high || this.low > this.value || this.high < this.value) {
					    throw new Error(StringService.format('Range values misaligned: {0}, low: {1}, high: {2}', this.value, this.low, this.high));
					}
				}
			}
			
		},
		hooks: {
			beforeDestroy: function (measurement, options) {
				if (measurement.isControl !== null) {
					return Measurement.findOne({ 
						where: { 
							experimentId: measurement.experimentId,
							measurementTypeId: measurement.measurementTypeId,
							compoundId: measurement.compoundId,
							isControl: null
						},
						transaction: options.transaction
					}).then(changeFromControl => {
						if (changeFromControl == null) return changeFromControl;
						
						return changeFromControl.destroy();
					});
				}
			},
			
			afterCreate: function (measurement, options) {
				if (measurement.isControl !== null) {
					return measurement.setChangeFromControl(options.transaction);
				}
			}
		},
		indexes: [
			{
				name: 'uq_measurement',
				type: 'unique',
				fields: [ 'experiment_id', 'compound_id', 'measurement_type_id', 'is_control' ]
			}
		]
	}
};
