// Transporter.js

module.exports = {
	
	attributes: {

		name: {
		   type: Sequelize.STRING,
		   unique: true,
		   allowNull: false
		}
	},
	
	associations: function() {
		
    	Transporter.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		Transporter.belongsToMany(Experiment, { 
    		as: 'experiments',
    		to: 'transporters',
    		through: 'experiment_transporter_xref', 
    		foreignKey: {
    		    name: 'transporterId',
    		    field: 'transporter_id'
    		},
    		timestamps: false
    	});
    	
    },
	
    options: {
        freezeTableName: true,
        tableName: 'transporter',
        underscored: true,
		timestamps: false,
        classMethods: {},
        instanceMethods: {},
        hooks: {}
    }
    
};
