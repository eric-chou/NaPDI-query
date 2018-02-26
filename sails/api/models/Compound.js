// Compound.js

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		// PubChemCid: {
		// 	type: Sequelize.INTEGER
		// 	// unique... shrug, see https://pubchem.ncbi.nlm.nih.gov/docs/subcmpd_summary_page_help.html#DataProcessingCID
		// 	// https://pubchem.ncbi.nlm.nih.gov/compound/3672
		// 	// https://pubchem.ncbi.nlm.nih.gov/pug_rest/PUG_REST_Tutorial.html
		// },
		
		unii: {
			type: Sequelize.STRING(10),
			unique: true
		},
		
		inChIKey: {
			field: 'inchikey',
			type: Sequelize.STRING(27),
			unique: true
		},
		
		publicDescription: {
			field: 'public_description',
			type: Sequelize.TEXT
		},
		
		internalComment: {
			field: 'internal_comment',
			type: Sequelize.TEXT
		}
	},
	
	associations: function() {
		
		Compound.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Compound.belongsToMany(NaturalProduct, { 
			as: 'naturalProducts',
			to: 'compounds',
			through: 'natural_product_compound_xref', 
			foreignKey: {
				name: 'compoundId',
				field: 'compound_id'
			},
			timestamps: false
		});
		
		Compound.belongsTo(Compound, {
			as: 'enantiomerOfCompound',
			foreignKey: {
				name: 'enantiomerOfId',
				field: 'enantiomer_of_id'
			}
		});
		
		Compound.hasMany(Compound, {
			as: 'enantiomers',
			foreignKey: {
				name: 'enantiomerOfId',
				field: 'enantiomer_of_id'
			}
		});
		
		Compound.belongsToMany(Compound, {
			as: 'metaboliteOfCompounds',
			to: 'metabolites',
			through: 'compound_metabolite_xref', 
			foreignKey: {
				name: 'metaboliteId',
				field: 'metabolite_id'
			},
			timestamps: false
		});
		
		Compound.belongsToMany(Compound, {
			as: 'metabolites',
			to: 'metaboliteOfCompounds',
			through: 'compound_metabolite_xref', 
			foreignKey: {
				name: 'compoundId',
				field: 'compound_id'
			},
			timestamps: false
		});
		
		Compound.hasMany(Experiment, {
			as: 'experimentsAsObject',
			foreignKey: {
				name: 'objectCompoundId',
				field: 'object_id',
				allowNull: true
			}
		});
		
		Compound.hasMany(Experiment, {
			as: 'experimentsAsObjectMetabolite',
			foreignKey: {
				name: 'objectMetaboliteCompoundId',
				field: 'object_metabolite_id',
				allowNull: true
			}
		});
				
		Compound.hasMany(Experiment, {
			as: 'experimentsAsPrecipitant',
			foreignKey:  {
				name: 'precipitantCompoundId',
				field: 'precipitant_id',
				allowNull: true
			}
		});
		
		Compound.hasMany(Measurement, {
			as: 'measurements',
			foreignKey: {
				name: 'compoundId',
				field: 'compound_id',
				allowNull: false
			}
		});

	},
	
	// scopes: {
	// 	relatedCompounds: {
	// 		include: [
	// 			{ model: NaturalProduct, as: 'naturalProducts' },
	// 			{ model: Compound, as: 'enantiomers' },
	// 			{ model: Compound, as: 'enantiomerOfCompound' },
	// 			{ model: Compound, as: 'metabolites' },
	// 			{ model: Compound, as: 'metaboliteOfCompounds' }
	// 		]
	// 	}
	// },
	
	options: {
		freezeTableName: true,
		tableName: 'compound',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {
			
			getAllExperiments: function () {
				return _.union([], this.experimentsAsObject, this.experimentsAsPrecipitant, this.experimentsAsObjectMetabolite);
			}
			
		},
		hooks: {}
	}
	
};
