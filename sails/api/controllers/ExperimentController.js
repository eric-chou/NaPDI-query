/**
 * ExperimentController
 *
 * @description :: Server-side logic for managing Experiments
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

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

            // console.log(experiments);

            jsonexport(experiments,function(err, csv){
                if(err) return console.log(err);
                // console.log(csv);
                res.attachment('all-experiment-data.csv');
                res.setHeader('Content-Type', 'text/csv');
                res.end(csv); 
            });

        }).catch(err => res.json(500, err));
        
    },

    inVitroExperiments: function (req, res) {

        Experiment.findAll({

            include: [{
                model: ExperimentType,
                as: 'experimentType',
                where: {
                    'isInVitro': true
                }
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

            include: [{
                model: ExperimentType,
                as: 'experimentType',
                where: {
                    'isInVitro': true
                }
            }],
            // this uses "AND experimentType.isInVitro = true" immediately after the experiment type join.
            raw: true
        }).then(experiments => {
            if (!experiments) return res.notFound("No experiment exists."); 
            
            // console.log(experiments);

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

