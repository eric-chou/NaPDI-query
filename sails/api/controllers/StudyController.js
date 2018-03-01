/**
 * StudyController
 *
 * @description :: Server-side logic for managing Studies
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var jsonexport = require('jsonexport');

module.exports = {

    specificStudy: function (req, res) {

        var studyId = req.param('id');
        console.log("[INFO] Study (id " + studyId + ")");

        Experiment.findAll({

            include: [{
                model: Study,
                as: 'study',
                where: {
                    'id': studyId
                }
            }],
            raw: true
        }).then(studyExperiments => {
            if (!studyExperiments) return res.notFound("No experiment exists for study id" + studyId + "."); 
            return res.json(200, studyExperiments);
        }).catch(err => res.json(500, err));
    },
    downloadSpecificStudy: function (req, res) {

        var studyId = req.param('id');
        console.log("[INFO] Download study (id " + studyId + ") as csv");

        Experiment.findAll({
            
            include: [{
                model: Study,
                as: 'study',
                where: {
                    'id': studyId
                }
            }],
            raw: true
        }).then(studyExperiments => {

            if (!studyExperiments) return res.notFound("No experiment exists."); 

            // console.log(experiments);

            jsonexport(studyExperiments,function(err, csv){
                if(err) return console.log(err);
                // console.log(csv);
                res.attachment('study-' + studyId + '-experiment-data.csv');
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

