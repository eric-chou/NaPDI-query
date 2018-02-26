/*

following tables have concept_id column
    answer
    compound
    enzyme
    measurement_type
    natural_product
    question
    test_system
    transporter
    unit
    value_type

would we specifically use concept_id = 0 for napdi concepts that do not and should not have a mapping?

*/


-- Adverse Events, all domain 'Condition', concept class 'SOC', vocab 'MedDRA'
update answer set concept_id = 35100000 where id = 700; -- Blood and lymphatic system disorders
update answer set concept_id = 35200000 where id = 701; -- Cardiac disorders
update answer set concept_id = 35300000 where id = 702; -- Congenital, familial and genetic disorders
update answer set concept_id = 35400000 where id = 703; -- Ear and labyrinth disorders
update answer set concept_id = 35500000 where id = 704; -- Endocrine disorders
update answer set concept_id = 35600000 where id = 705; -- Eye disorders
update answer set concept_id = 35700000 where id = 706; -- Gastrointestinal disorders
update answer set concept_id = 35800000 where id = 707; -- General disorders and administration site conditions
update answer set concept_id = 35900000 where id = 708; -- Hepatobiliary disorders
update answer set concept_id = 36000000 where id = 709; -- Immune system disorders
update answer set concept_id = 36100000 where id = 710; -- Infections and infestations
update answer set concept_id = 36200000 where id = 711; -- Injury, poisoning and procedural complications
update answer set concept_id = 36300000 where id = 712; -- Investigations
update answer set concept_id = 36400000 where id = 713; -- Metabolism and nutrition disorders
update answer set concept_id = 36500000 where id = 714; -- Musculoskeletal and connective tissue disorders
update answer set concept_id = 36600000 where id = 715; -- Neoplasms benign, malignant and unspecified (incl cysts and polyps)
update answer set concept_id = 36700000 where id = 716; -- Nervous system disorders
update answer set concept_id = 36800000 where id = 717; -- Pregnancy, puerperium and perinatal conditions
update answer set concept_id = 36900000 where id = 718; -- Psychiatric disorders
update answer set concept_id = 37000000 where id = 719; -- Renal and urinary disorders
update answer set concept_id = 37100000 where id = 720; -- Reproductive system and breast disorders
update answer set concept_id = 37200000 where id = 721; -- Respiratory, thoracic and mediastinal disorders
update answer set concept_id = 37300000 where id = 722; -- Skin and subcutaneous tissue disorders
update answer set concept_id = 37400000 where id = 723; -- Social circumstances
update answer set concept_id = 37500000 where id = 724; -- Surgical and medical procedures
update answer set concept_id = 37600000 where id = 725; -- Vascular disorder

-- Pharmacodynamic classes, all domain 'Condition', concept class 'SOC', vocab 'MedDRA'
update answer set concept_id = 35100000 where id = 800; -- Blood and lymphatic system disorders
update answer set concept_id = 35200000 where id = 801; -- Cardiac disorders
update answer set concept_id = 35300000 where id = 802; -- Congenital, familial and genetic disorders
update answer set concept_id = 35400000 where id = 803; -- Ear and labyrinth disorders
update answer set concept_id = 35500000 where id = 804; -- Endocrine disorders
update answer set concept_id = 35600000 where id = 805; -- Eye disorders
update answer set concept_id = 35800000 where id = 806; -- Gastrointestinal disorders
update answer set concept_id = 35800000 where id = 807; -- General disorders and administration site conditions
update answer set concept_id = 35900000 where id = 808; -- Hepatobiliary disorders
update answer set concept_id = 36000000 where id = 809; -- Immune system disorders
update answer set concept_id = 36100000 where id = 810; -- Infections and infestations
update answer set concept_id = 36200000 where id = 811; -- Injury, poisoning and procedural complications
update answer set concept_id = 36300000 where id = 812; -- Investigations
update answer set concept_id = 36400000 where id = 813; -- Metabolism and nutrition disorders
update answer set concept_id = 36500000 where id = 814; -- Musculoskeletal and connective tissue disorders
update answer set concept_id = 36600000 where id = 815; -- Neoplasms benign, malignant and unspecified (incl cysts and polyps)
update answer set concept_id = 36800000 where id = 816; -- Nervous system disorders
update answer set concept_id = 36800000 where id = 817; -- Pregnancy, puerperium and perinatal conditions
update answer set concept_id = 36900000 where id = 818; -- Psychiatric disorders
update answer set concept_id = 37000000 where id = 819; -- Renal and urinary disorders
update answer set concept_id = 37100000 where id = 820; -- Reproductive system and breast disorders
update answer set concept_id = 37200000 where id = 821; -- Respiratory, thoracic and mediastinal disorders
update answer set concept_id = 37300000 where id = 822; -- Skin and subcutaneous tissue disorders
update answer set concept_id = 37400000 where id = 823; -- Social circumstances
update answer set concept_id = 37500000 where id = 824; -- Surgical and medical procedures
update answer set concept_id = 37600000 where id = 825; -- Vascular disorder

-- measurement_type
update measurement_type set concept_id = -7999926 where id = 8; -- 'EC<sub>50</sub>' --> 'half maximal effective concentration (EC50)'
update measurement_type set concept_id = -7999925 where id = 13; -- 'IC<sub>50</sub>' --> 'half maximal inhibitory concentration (IC50)'
update measurement_type set concept_id = -7999700 where id = 22; -- 'K<sub>I</sub>' --> 'inhibitory constant'

-- all domain 'Drug', concept class 'Ingredient', vocab 'RxNorm' unless otherwise noted
update compound set concept_id = 19012197 where id = 80; -- berberine
update compound set concept_id = -7999995 where id = 86; -- 7-ethoxyresorufin
update compound set concept_id = 1125315 where id = 5; -- acetaminophen
update compound set concept_id = 781039 where id = 38; -- alprazolam
update compound set concept_id = 750982 where id = 6; -- bupropion
update compound set concept_id = 1134439 where id = 7; -- caffeine
update compound set concept_id = 43012577 where id = 8; -- catechin
update compound set concept_id = 42898681 where id = 10; -- chlorogenic acid
update compound set concept_id = 19008106 where id = 11; -- coumarin
update compound set concept_id = 1119510 where id = 12; -- dextromethorphan
update compound set concept_id = 4349487 where id = 13; -- dextrorphan (NDFRT classification)
update compound set concept_id = 1124300 where id = 14; -- diclofenac
update compound set concept_id = 1326303 where id = 15; -- digoxin
update compound set concept_id = 1337860 where id = 44; -- dopamine
update compound set concept_id = 19058494 where id = 19; -- epigallocatechin gallate
update compound set concept_id = 953076 where id = 20; -- famotidine
update compound set concept_id = 42899258 where id = 21; -- gallic acid
update compound set concept_id = 4037950 where id = 24; -- hydroxybupropion (SNOMED)
update compound set concept_id = 708298 where id = 26; -- midazolam
update compound set concept_id = 1313200 where id = 40; -- nadolol
update compound set concept_id = 1318137 where id = 74; -- nicardipine
update compound set concept_id = 19033710 where id = 28; -- phenacetin
update compound set concept_id = 1513103 where id = 75; -- raloxifene
update compound set concept_id = -7999853 where id = 87; -- resorufin
update compound set concept_id = 1763204 where id = 29; -- rifampin
update compound set concept_id = 1510813 where id = 30; -- rosuvastatin
update compound set concept_id = 964339 where id = 31; -- sulfasalazine
update compound set concept_id = 19100575 where id = 32; -- theanine
update compound set concept_id = 19137056 where id = 33; -- theobromine
update compound set concept_id = 1237049 where id = 34; -- theophylline


-- For now, enzyme concepts could come from a variety of places in the vocab. In the future, it will be PRO
update enzyme set concept_id = 4173297 where name = 'CYP1A1';
update enzyme set concept_id = 4312402 where name = 'CYP1A2';
update enzyme set concept_id = 4309826 where name = 'CYP2A6';
update enzyme set concept_id = 4308333 where name = 'CYP2B6';
update enzyme set concept_id = 4311137 where name = 'CYP2C19';
update enzyme set concept_id = 4306333 where name = 'CYP2C8';
update enzyme set concept_id = 4309227 where name = 'CYP2C9';
update enzyme set concept_id = 4173631 where name = 'CYP2D6';
update enzyme set concept_id = 4173608 where name = 'CYP2E1';
update enzyme set concept_id = 4308020 where name = 'CYP2J2';
update enzyme set concept_id = 4306811 where name = 'CYP3A4';
update enzyme set concept_id = 40782950 where name = 'UGT1A1';


-- all domain 'Drug', concept class 'Ingredient', vocab 'RxNorm'
update natural_product set concept_id = 19124972 where id = 1; -- Green Tea
update natural_product set concept_id = 43525850 where id = 2; -- Goldenseal
update natural_product set concept_id = 19080470 where id = 3; -- Glycyrrhizin / Licorice

-- all test systems
update test_system set concept_id = -7999662 where id = 6; -- Pooled human liver microsomes --> 'pooled human liver microsomal fraction'
update test_system set concept_id = -7999663 where id = 8; -- Pooled human intestinal microsomes --> 'pooled human intestinal microsomal fraction'
update test_system set concept_id = -7999704 where id = 9; -- Individual human intestinal microsomes --> 'individual human intestinal microsomal fraction'

-- all domain 'Unit', concelpt class 'Unit', vocab 'UCUM'
update unit set concept_id = 8554 where id = 1; -- percent
update unit set concept_id = 9667 where id = 2; -- μM
update unit set concept_id = 9542 where id = 30; -- L/kg
update unit set concept_id = 8541 where id = 6; --  /min
update unit set concept_id = 8749 where id = 23; -- umol/L
update unit set concept_id = 8842 where id = 24; -- ng/mL
update unit set concept_id = 44777603 where id = 25; -- L/h
update unit set concept_id = 8505 where id = 28; -- h
update unit set concept_id = 8519 where id = 29; -- L



-- 8523	ratio


/*

-- get all experiment type questions
select et.name as experiment_type, et.id as experiment_type_id, 
    qs.name as question_section, qs.id as question_section_id, 
    qc.name as question_category, qc.id as question_category_id, 
    q.text as question, q.id as question_id, max_answers 
from experiment_type_question_xref etq
    join question_category qc on qc.id = etq.category_id
    join question_section qs on qs.id = qc.section_id
    join question q on q.id = etq.question_id
    join experiment_type et on et.id = etq.experiment_type_id
order by question, question_section, experiment_type;


-- get all experiment type measurement types
select et.name as experiment_type, et.id as experiment_type_id,
    mtc.name as measurement_type_category, mtc.id as measurement_type_category_id,
    mt.name as measurement_type, mt.id as measurement_type_id
from experiment_type_measurement_type_xref etmt
    full outer join experiment_type et on et.id = etmt.experiment_type_id
    full outer join measurement_type mt on mt.id = etmt.measurement_type_id
    full outer join measurement_type_category mtc on mtc.id = etmt.category_id
order by measurement_type, experiment_type;


-- get all measurement type questions
select mt.name, q.text 
from measurement_type_question_xref mtq
    join question q on q.id = mtq.question_id
    join measurement_type mt on mt.id = mtq.measurement_type_id;

*/
