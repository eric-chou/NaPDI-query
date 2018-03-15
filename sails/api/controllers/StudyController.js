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
    allStudies: async function (req, res) {
        // get full list of study ID's into an array.
        // Study.findAll({
        //     attributes: ['id'], // how to exclude association columns?
        //     raw: true
        // }).then(studyIds => {
        //     // how to get ID's into an array?
        //     // console.log(JSON.parse(res.json(200,studyIds)));

        //     if (!studyIds) return res.notFound("No studies exist"); 
        //     return res.json(200, studyIds);
        // }).catch(err => res.json(500, err));

        // for now manually specifying the loaded ID's - needs work
        var studyIds = [1, 2, 4, 5, 7, 10, 11, 12, 13, 14, 15, 16, 23, 24, 28]
        for (var i = 0; i < studyIds.length; i++) {

            studyId = studyIds[i];
            console.log("[INFO] Download study (id " + studyId + ") as csv");

            await Experiment.findAll({
                
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
                // return res.json(200, studyExperiments);
                // console.log(studyExperiments);
                jsonexport(studyExperiments,function(err, csv){
                    if(err) return console.log(err);
                    // console.log(csv);
                    res.attachment('study-' + studyId + '-experiment-data.csv');
                    res.setHeader('Content-Type', 'text/csv');
                    res.end(csv); 
                }); // TODO maybe better to append studyExperiments to an array and deal with attaching this in another loop?
            }).catch(err => res.json(500, err));
            // Unhandled rejection Error: Can't set headers after they are sent.
        }

    },

    _config: {
        actions: false,
        shortcuts: false,
        rest: false
    }
};

