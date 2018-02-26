-- These are concepts from OBO Foundry ontologies that are not imported into DIDEO but are useful to NaPDI.
-- NOTE: vocabularies and domains that are not explicitly added here are added in the dideo term import script
-- TODO: register these concept_id with the same persistence method used for tracking concept ids for DIDEO imports 

-- Proteins
INSERT INTO omop.concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) VALUES (-7000001, 'UDP-galactose translocator', 'Metadata', 'PR', 'Domain', '', '000015090', '2000-01-01', '2099-02-22', '');

-- Compounds
INSERT INTO omop.concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) VALUES (-7000002, '(-)-epicatechin-3-O-gallate', 'Metadata', 'CHEBI', 'Domain', '', '70255', '2000-01-01', '2099-02-22', '');
INSERT INTO omop.concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) VALUES (-7000003, '4-methylumbelliferone', 'Metadata', 'CHEBI', 'Domain', '', '17224', '2000-01-01', '2099-02-22', '');
INSERT INTO omop.concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) VALUES (-7000004, '4-Methylumbelliferone glucuronide', 'Metadata', 'CHEBI', 'Domain', '', '1904', '2000-01-01', '2099-02-22', '');
