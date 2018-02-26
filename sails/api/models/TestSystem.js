// TestSystem.js

module.exports = {
	
	attributes: {
		
		name: {
			type: Sequelize.STRING,
			unique: true,
			allowNull: false
		},
		
		sortOrder: {
			field: 'sort_order',
			type: Sequelize.INTEGER,
			allowNull: true,
			defaultValue: 0
		}

	},
	
	associations: function() {
		
		TestSystem.belongsTo(Concept, { 
			as: 'concept',
			foreignKey: {
				name: 'conceptId',
				field: 'concept_id',
				allowNull: true
			}
		});
		
		// the category of this test system, if any
		TestSystem.belongsTo(TestSystemCategory, { 
			as: 'category',
			foreignKey: {
				name: 'categoryId',
				field: 'category_id',
				allowNull: false
			}
		});
		
		// the experiment types a test system is valid for
		
		TestSystem.belongsToMany(ExperimentType, { 
			as: 'experimentTypes',
			to: 'testSystems',
			through: 'experiment_type_test_system_xref', 
			foreignKey: {
				name: 'testSystemId',
				field: 'test_system_id'
			},
			timestamps: false
		});
		
		// get all experiments assigned a test system
		TestSystem.hasMany(Experiment, {
			as: 'experiments',
			foreignKey: {
				name: 'testSystemId',
				field: 'test_system_id'
			}
		});
		
	},
	
	defaultScope: function() {
		return {
			include: [
				{ model: TestSystemCategory, as: 'category' } // needed for getRequiresCytochromeB5()
			]
		};
	},
	
	options: {
		freezeTableName: true,
		tableName: 'test_system',
		underscored: true,
		timestamps: false,
		classMethods: {},
		instanceMethods: {
		    
			getRequiresCytochromeB5: function () {
				return this.category.requiresCytochromeB5;
			}
			
		},
		getterMethods: {},
		hooks: {}
	}
};

/*
All InVitro except for below (from template)
----------------------------
Cell System 
	Hepatocytes 
		Human cryopreserved 
		Human freshly isolated 
		Transgenic animal 
	Cell line 
		HepG2 Cells 
		HepaRG cells 
Cell Fraction 
	Human liver microsomes 
		Pooled HLMs 
		Individual HLMs 
	Human intestinal microsomes  
		Pooled human liver microsomes 
		Individual human intestinal microsomes 
	Cytosolic fraction 
		Human liver 
		Human intestine 
	S9 fraction 
		Human liver 
		Human intestine 
Recombinant Expression System 
	Baculovirus-insect cells 
	E.coli 
	Yeast


InVitro Enzyme Induction
------------------------
Cell System
	Hepatocytes
		Human cryopreserved
		Human freshly isolated
	Cell line
		HepG2 Cells
		epaRG cells
		Fa2N-4 cells
		BC2 cells
-- create "Other" category for this one
Transgenic Animal Model -- different than Cell System > Hepatocytes > Transgenic animal above


InVitro Transporter Kinetics/Inhibition/Induction
-------------------------------------------------
Transfected/siRNA Knock-out/Injected Cells ??? is this categorization needed?
	MDCK-transfected Cells
	LLC-PK1-transfected Cells
	HEK293-transfected
	HeLa-transfected
	CHO-transfected
	HepG2-transfected
	siRNA Knock-out Hepatocytes
	siRNA Knock-out Caco-2 Cells
	siRNA Knock-out Other Cells
	X.laevis Oocytes-injected
	Inside-out Membrane Vesicles
Cell System -- change from "Cell Type" in current spec for consistancy
	Hepatocytes
		Primary Hepatocytes
		Cryopreserved Hepatocytes
		Sandwich Cultured Hepatocytes
	Intestinal Epithelial Cells
	Caco-2 Cells 
	Other Cells 

*/