/**
 * StudyController
 *
 * @description :: Server-side logic for managing Studies
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var jsonexport = require('jsonexport');
var http = require('http');
var archiver = require('archiver');

module.exports = {

    specificStudy: function (req, res) {

        var studyId = req.param('id');
        console.log("[INFO] Study (id " + studyId + ")");

        Experiment.findAll({

            include: [
                {
                    model: Study,
                    as: 'study',
                    where: {
                        'id': studyId
                    }
                },
                {
                    model: TestSystem,
                    as: 'testSystem',
                    required: false
                },
                {
                    model: CytochromeB5,
                    as: 'cytochromeB5',
                    required: false
                },
                {
                    model: Measurement,
                    as: 'measurements',
                    required:false
                }
            ],
            raw: true,
        }).then(studyExperiments => {
            if (!studyExperiments) return res.notFound("No experiment exists for study id" + studyId + ".");
            return res.json(200, studyExperiments);
        }).catch(err => res.json(500, err));

    },

    downloadSpecificStudy: function (req, res) {

        var studyId = req.param('id');
        console.log("[INFO] Download study (id " + studyId + ") as csv");

        Experiment.findAll({

            include: [
                {
                    model: Study,
                    as: 'study',
                    where: {
                        'id': studyId
                    }
                },
                {
                    model: TestSystem,
                    as: 'testSystem',
                    required: false
                },
                {
                    model: CytochromeB5,
                    as: 'cytochromeB5',
                    required: false
                },
                {
                    model: Measurement,
                    as: 'measurements',
                    required: false
                }
            ],
            // TODO order by experiment ID
            raw: true
        }).then(studyExperiments => {

            if (!studyExperiments) return res.notFound("No experiment exists."); 

            jsonexport(studyExperiments,function(err, csv){
                if(err) return console.log(err);
                // console.log(csv);
                res.attachment('study-' + studyId + '-experiment-data.csv');
                res.setHeader('Content-Type', 'text/csv');
                res.end(csv); 
            });

        }).catch(err => res.json(500, err));
        
    },

    downloadStudies: function (req, res) {
        Study.unscoped().findAll({
            attributes: ['id'],
            raw: true
        }).then(studyIds => {
            console.log(studyIds);
            console.log(studyIds[0]['id']);
            console.log(typeof(studyIds[0]['id']));
            downloadAllStudies(studyIds, res);
        }).catch(err => res.json(500, err));
    },

    _config: {
        actions: false,
        shortcuts: false,
        rest: false
    }
};

// should be called 
async function downloadAllStudies(studyIds, res) {

    // manual specification of all study ID's
    // var studyIds = [1, 2, 4, 5, 7, 10, 11, 12, 13, 14, 15, 16, 23, 24, 28]

    var zip = archiver('zip');

    for (var i = 0; i < studyIds.length; i++) {

        studyId = studyIds[i]['id'];
        console.log("[INFO] Download study (id " + studyId + ") as csv");
        // var promises = [];

        await Experiment.findAll({
            
            include: [
                {
                    model: Study,
                    as: 'study',
                    where: {
                        'id': studyId
                    }
                },
                {
                    model: TestSystem,
                    as: 'testSystem',
                    required: false
                },
                {
                    model: CytochromeB5,
                    as: 'cytochromeB5',
                    required: false
                },
                {
                    model: Measurement,
                    as: 'measurements',
                    required: false
                }
            ],
            raw: true
        }).then(studyExperiments => {
            if (!studyExperiments) return res.notFound("No experiment exists for study id" + studyId + "."); 
            // return res.json(200, studyExperiments);
            console.log("Downloading study " + studyId);
            // promises.push(studyExperiments);

            jsonexport(studyExperiments,function(err, csv){
                if(err) return console.log(err);
                // res.attachment('study-' + studyId + '-experiment-data.csv');
                // res.setHeader('Content-Type', 'text/csv');
                // res.end(csv);
                // console.log(csv); 
                if (i == studyIds.length - 1) {
                    res.writeHead(200, {
                        'Content-Type': 'application/zip',
                        'Content-disposition': 'attachment; filename=all_studies.zip'
                    });
                    // Send the file to the page output.
                    zip.pipe(res);
                    zip.append(csv, { name: 'study-' + studyId + '-experiment-data.csv' }).finalize();
                }
                else {
                    zip.append(csv, { name: 'study-' + studyId + '-experiment-data.csv' });
                }
            });
        }).catch(err => res.json(500, err));
    }

}

