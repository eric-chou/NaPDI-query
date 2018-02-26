/*

move all omop tbles to their own schema

concept
vocabulary
domain
concept_class
concept_relationship
relationship
concept_ancestor

*/

CREATE SCHEMA omop;

ALTER TABLE concept SET SCHEMA omop;

ALTER TABLE vocabulary SET SCHEMA omop;
 
ALTER TABLE domain SET SCHEMA omop;
     
ALTER TABLE concept_class SET SCHEMA omop;

ALTER TABLE concept_relationship SET SCHEMA omop;

ALTER TABLE relationship SET SCHEMA omop;

ALTER TABLE concept_ancestor SET SCHEMA omop;
