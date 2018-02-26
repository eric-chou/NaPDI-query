/**
 * ExperimentController
 *
 * @description :: Server-side logic for managing Experiments
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	
    experiments: function (req, res) {

        Experiment.findAll({
            raw: true
        }).then(experiments => {
                if (!experiments) return res.notFound("No experiment exists."); 
        return res.json(200, experiments);
        
        }).catch(err => res.json(500, err));
        
    },

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
                },
                required: false // left outer join instead of inner join
            }],
            // this uses "AND experimentType.isInVitro = true" immediately after the experiment type join.
            raw: true
        }).then(experiments => {
                if (!experiments) return res.notFound("No experiment exists."); 
        return res.json(200, experiments);
        
        }).catch(err => res.json(500, err));
        
    }
};

