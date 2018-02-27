/**
 * ExperimentController
 *
 * @description :: Server-side logic for managing Experiments
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var json2csv = require('json2csv');
var jsonexport = require('jsonexport');

module.exports = {
	
    experiments: function (req, res) {

        Experiment.findAll({
            raw: true
        }).then(experiments => {
            if (!experiments) return res.notFound("No experiment exists."); 
            return res.json(200, experiments);
        }).catch(err => res.json(500, err));
        
    },

    downloadExperiments: function (req, res) {

        Experiment.findAll({
            raw: true
        }).then(experiments => {

            if (!experiments) return res.notFound("No experiment exists."); 

            console.log(experiments);
            // var fields = ['id', 'name', 'overallEffect', 'isControlData', 'croCutoff', 'croIdentifier', 'comment', 'experimentalConditionsComment', 'resultsComment', 'internalComment', 'objectCompoundId', 'objectMetaboliteCompoundId', 'precipitantCompoundId', 'cytochromeB5Id', 'studyId', 'experimentTypeId', 'testSystemId', 'controlDataExperimentId', 'controlDataForExperimentId', 'transporters.id', 'transporters.name', 'transporters.conceptId', 'transporters.experiment_transporter_xref.experimentId', 'transporters.experiment_transporter_xref.transporterId', 'enzymes.id', 'enzymes.name', 'enzymes.conceptId', 'enzymes.experiment_enzyme_xref.enzymeId', 'enzymes.experiment_enzyme_xref.experimentId', 'objectMetaboliteCompound.id', 'objectMetaboliteCompound.name', 'objectMetaboliteCompound.unii', 'objectMetaboliteCompound.inChIKey', 'objectMetaboliteCompound.publicDescription', 'objectMetaboliteCompound.internalComment', 'objectMetaboliteCompound.conceptId', 'objectMetaboliteCompound.enantiomerOfId', 'precipitantCompound.id', 'precipitantCompound.name', 'precipitantCompound.unii', 'precipitantCompound.inChIKey', 'precipitantCompound.publicDescription', 'precipitantCompound.internalComment', 'precipitantCompound.conceptId', 'precipitantCompound.enantiomerOfId', 'objectCompound.id', 'objectCompound.name', 'objectCompound.unii', 'objectCompound.inChIKey', 'objectCompound.publicDescription', 'objectCompound.internalComment', 'objectCompound.conceptId', 'objectCompound.enantiomerOfId', 'experimentType.id', 'experimentType.name', 'experimentType.isInVitro', 'experimentType.isTransporter', 'experimentType.isEnzyme'];

            // var csvResults = json2csv({data: experiments, fields: fields});
            // console.log(csvResults);
            // res.attachment('all-experiments.csv');
            // res.setHeader('Content-Type', 'text/csv');
            // res.end(csvResults);

            jsonexport(experiments,function(err, csv){
                if(err) return console.log(err);
                // console.log(csv);
                res.attachment('all-experiment-data.csv');
                res.setHeader('Content-Type', 'text/csv');
                res.end(csv); 
            });

        }).catch(err => res.json(500, err));
        
    },
    // below is a test grafted from StudyController.js on the main NaPDI branch.
    /*downloadStudies: function (req, res) {
        var sequelize = new Sequelize('demo_napdi_repository', 'postgres', 'e123779871435990', {
            host: 'localhost',
            dialect: 'postgres'
        });

        sequelize.query("select study.napdi_identifier, natural_product.name np_name, exp.study_id study_id, exp.id experiment_id, exp.name experiment_name, exp.is_control_data, compound.name precipitant_name, experiment_type.name experiment_type_name, experiment_type.is_transporter, experiment_type.is_enzyme, enzyme.name enzyme_name, transporter.name transporter_name, test_system.name test_system_name, test_system_category.name test_system_category_name, measurement.value, measurement.measurement_type_id, measurement_type.name from experiment exp inner join compound on exp.precipitant_id = compound.id inner join study on study.id = exp.study_id inner join natural_product on study.natural_product_id = natural_product.id inner join experiment_type on exp.experiment_type_id = experiment_type.id inner join test_system on exp.test_system_id = test_system.id inner join test_system_category on test_system.category_id = test_system_category.id left join experiment_enzyme_xref on experiment_enzyme_xref.experiment_id = exp.id left join enzyme on experiment_enzyme_xref.enzyme_id = enzyme.id left join experiment_transporter_xref on experiment_transporter_xref.experiment_id = exp.id left join transporter on experiment_transporter_xref.transporter_id = transporter.id left join measurement on exp.id = measurement.experiment_id left join measurement_type on measurement.measurement_type_id = measurement_type.id")
            .spread((study, metadata) => {
                
                if (!study) return res.notFound("No study data avaiable");
                console.log(study);
                // var fields = ['napdi_identifier', 'np_name', 'study_id', 'experiment_id', 'experiment_name', 'is_control_data', 'precipitant_name', 'experiment_type_name', 'is_transporter', 'is_enzyme', 'enzyme_name', 'transporter_name', 'test_system_name', 'test_system_category_name', 'value', 'measurement_type_id', 'name']
                
                // var csvResults = json2csv({data: study, fields: fields});
                // console.log(csvResults);
                // res.attachment('all-study-data.csv');
                // res.setHeader('Content-Type', 'text/csv');
                // res.end(csvResults); 

                // couldn't get json2csv to work the way Yifan did in StudyController.js on the main NaPDI branch.

                jsonexport(study,function(err, csv){
                    if(err) return console.log(err);
                    // console.log(csv);
                    res.attachment('all-study-data.csv');
                    res.setHeader('Content-Type', 'text/csv');
                    res.end(csv); 
                });
                
            }).catch(err => res.json(500, err));                        
    },*/

    inVitroExperiments: function (req, res) {

        Experiment.findAll({

            // where: {
            //     'experimentType.isInVitro': true
            // },
            // include: [
            //     {model: ExperimentType, as: 'experimentType', required: false}
            // ],
            // this version uses "where" at the end of the query
            // above also doesn't work because it tries to use "Experiment.'experimentType.isInVitro' = true"

            include: [{
                model: ExperimentType,
                as: 'experimentType',
                where: {
                    'isInVitro': true
                }//,
                // required: false // left outer join instead of inner join
            }],
            // this uses "AND experimentType.isInVitro = true" immediately after the experiment type join.
            raw: true
        }).then(experiments => {
            if (!experiments) return res.notFound("No experiment exists."); 
            return res.json(200, experiments);
        }).catch(err => res.json(500, err));
        
    },

    downloadInVitroExperiments: function(req, res) {
        Experiment.findAll({

            // where: {
            //     'experimentType.isInVitro': true
            // },
            // include: [
            //     {model: ExperimentType, as: 'experimentType', required: false}
            // ],
            // this version uses "where" at the end of the query
            // above also doesn't work because it tries to use "Experiment.'experimentType.isInVitro' = true"

            include: [{
                model: ExperimentType,
                as: 'experimentType',
                where: {
                    'isInVitro': true
                }//,
                // required: false // left outer join instead of inner join
            }],
            // this uses "AND experimentType.isInVitro = true" immediately after the experiment type join.
            raw: true
        }).then(experiments => {
            if (!experiments) return res.notFound("No experiment exists."); 
            
            console.log(experiments);

            jsonexport(experiments,function(err, csv){
                if(err) return console.log(err);
                // console.log(csv);
                res.attachment('in-vitro-experiment-data.csv');
                res.setHeader('Content-Type', 'text/csv');
                res.end(csv); 
            });

        }).catch(err => res.json(500, err));
    },

    _config: {
        actions: false,
        shortcuts: false,
        rest: false
    }
};

