// Study.js
// The top level experiment container.

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		// e.g., no idea what this will look like
		napdiIdentifier: {
			field: 'napdi_identifier',
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		// publicly viewable comments on study results
		overallSummary: {
			field: 'overall_summary',
			type: Sequelize.TEXT
		},
		
		// e.g., 27051282
		pubmedId: {
			field: 'pubmed_id',
			type: Sequelize.INTEGER,
			allowNull: true
		},
		
		// e.g., 2014966867
		embaseId: {
			field: 'embase_id',
			type: Sequelize.INTEGER,
			allowNull: true
		},
		
		////////////////////////////////////////////////
		// remaining properties for internal use only //
		////////////////////////////////////////////////
		
		// no idea what this will look like
		croIdentifier: {
			field: 'cro_identifier',
			type: Sequelize.STRING,
			// unique: true,
			allowNull: false
		},
		
		// e.g., "SuperDuper InVivo Corp"
		croInformation: {
			field: 'cro_information',
			type: Sequelize.STRING,
			allowNull: false
		},
		
		// when was study performed
		dateStart: {
			field: 'date_start',
			type: Sequelize.DATE,
			allowNull: true
		},
		
		// when was study performed
		dateEnd: {
			field: 'date_end',
			type: Sequelize.DATE,
			allowNull: true
		},
		
		// comment for admins
		internalComment: {
			field: 'internal_comment',
			type: Sequelize.TEXT
		},
		
		status: {
			field: 'status',
			type: Sequelize.STRING,
			allowNull: false,
			defaultValue: 'draft',
			validate: {
				isIn: [[ 'published', 'pending', 'draft']]
			}
		}
	},
	
	associations: function () {
		
		// Published report
		// Manuscript prepared or submitted for peer-reviewed publication
		// Unpublished data submitted through a NaPDI form
		Study.belongsTo(StudySourceType, {
			as: 'studySourceType',
			foreignKey: {
				name: 'studySourceTypeId',
				field: 'study_source_type_id',
				allowNull: false,
				defaultValue: 1
			}
		});
		
		Study.belongsTo(NaturalProduct, {
			as: 'naturalProduct',
			foreignKey: {
				name: 'naturalProductId',
				field: 'natural_product_id',
				allowNull: false
			}
		});

		Study.hasMany(Experiment, {
			as: 'experiments',
			foreignKey: {
				name: 'studyId',
				field: 'study_id',
				allowNull: false
			},
			onDelete: 'CASCADE',
			hooks: true
		});

		// validationBy: {
		// 	collection: userTag
			
		// 	userTag: {
		// 		user,
		// 		timestamp,
		// 		note,
		// 		status: draft, pending review, published
		// 	}
		// }
	},
	
	defaultScope: function () {
		return {
			include: [
				{ model: NaturalProduct, as: 'naturalProduct' }, // needed for getLongName()
				{ model: StudySourceType, as: 'studySourceType' }
			]
		};
	},
	
	options: {
		freezeTableName: true,
		tableName: 'study',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {
			
			getLongName: function () {
				return this.naturalProduct.name + ' &mdash; ' + this.name;
			}
		},
		hooks: {}
	}
	
};
