/*

Use this script to copy omop vocabulary data from our latest omop only db to the napdi_repository.

Run this script on the napdi_repository db you want to copy the data to. 

'omop_db' is the store for our latest omop vocabulary data to copy from.  
The omop db contains only omop data and is the single source to pull the latest omop data into a napdi repository db.

RDS requires full host and user definition for dblink even if the dbs are on the same server.


Full omop import process still TBD -
    Do we drop constraints and tables in target db and recreate with omop scripts?
    If so, where do we drop hard fk, or do we impliment with soft fk?
    
    If instead we truncate tables and keep contraints, need to determine order of data copy to keep constraints happy.

*/

CREATE EXTENSION postgres_fdw;
CREATE EXTENSION dblink;

CREATE SERVER omop_db
        FOREIGN DATA WRAPPER postgres_fdw
        OPTIONS (host '', port '', dbname 'omop', sslmode 'require');
CREATE USER MAPPING FOR postgres
        SERVER omop_db
        OPTIONS (user 'postgres', password 'postgres');

INSERT INTO omop.concept (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM concept')
        AS t (
            concept_id INTEGER,
            concept_name VARCHAR(255),
            domain_id VARCHAR(20),
            vocabulary_id VARCHAR(20),
            concept_class_id VARCHAR(20),
            standard_concept VARCHAR(1),
            concept_code VARCHAR(50),
            valid_start_date DATE,
            valid_end_date DATE,
            invalid_reason VARCHAR(1)
        )
    )
;

INSERT INTO omop.vocabulary (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM vocabulary')
        AS t (
            vocabulary_id VARCHAR(20),
            vocabulary_name VARCHAR(255),
            vocabulary_reference VARCHAR(255),
            vocabulary_version VARCHAR(255),
            vocabulary_concept_id INTEGER
        )
    )
;

INSERT INTO omop.domain (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM domain')
        AS t (
            domain_id VARCHAR(20),
            domain_name VARCHAR(255),
            domain_concept_id INTEGER
        )
    )
;

INSERT INTO omop.concept_class (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM concept_class')
        AS t (
            concept_class_id VARCHAR(20),
            concept_class_name VARCHAR(255),
            concept_class_concept_id INTEGER
        )
    )
;

INSERT INTO omop.concept_relationship (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM concept_relationship')
        AS t (
            concept_id_1 INTEGER,
            concept_id_2 INTEGER,
            relationship_id VARCHAR(20),
            valid_start_date DATE,
            valid_end_date DATE,
            invalid_reason VARCHAR(1)
        )
    )
;

INSERT INTO omop.relationship (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM relationship')
        AS t (
            relationship_id VARCHAR(20),
            relationship_name VARCHAR(255),
            is_hierarchical VARCHAR(1),
            defines_ancestry VARCHAR(1),
            reverse_relationship_id VARCHAR(20),
            relationship_concept_id INTEGER
        )
    )
;

/*
INSERT INTO omop.concept_synonym (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM concept_synonym')
        AS t (
            concept_id INTEGER,
            concept_synonym_name VARCHAR(1000),
            language_concept_id INTEGER
        )
    )
;
*/

INSERT INTO omop.concept_ancestor (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM concept_ancestor')
        AS t (
            ancestor_concept_id INTEGER,
            descendant_concept_id INTEGER,
            min_levels_of_separation INTEGER,
            max_levels_of_separation INTEGER
        )
    )
;

/*
INSERT INTO omop.source_to_concept_map (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM source_to_concept_map')
        AS t (
            source_code VARCHAR(50),
            source_concept_id INTEGER,
            source_vocabulary_id VARCHAR(20),
            source_code_description VARCHAR(255),
            target_concept_id INTEGER,
            target_vocabulary_id VARCHAR(20),
            valid_start_date DATE,
            valid_end_date DATE,
            invalid_reason VARCHAR(1)
        )
    )
;
*/

/*
INSERT INTO omop.drug_strength (
    SELECT t.* FROM dblink('omop_db',
        'SELECT * FROM drug_strength')
        AS t (
            drug_concept_id INTEGER,
            ingredient_concept_id INTEGER,
            amount_value NUMERIC,
            amount_unit_concept_id INTEGER,
            numerator_value NUMERIC,
            numerator_unit_concept_id INTEGER,
            denominator_value NUMERIC,
            denominator_unit_concept_id INTEGER,
            box_size INTEGER,
            valid_start_date DATE,
            valid_end_date DATE,
            invalid_reason VARCHAR(1)
        )
    )
;
*/

-- clean up
DROP SERVER IF EXISTS omop_db CASCADE;
DROP EXTENSION postgres_fdw;
DROP EXTENSION dblink;
