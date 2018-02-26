/*********************************************************************************
# Copyright 2014 Observational Health Data Sciences and Informatics
#
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           #######    ###                                           
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #           #  #    # #####  ###### #    # ######  ####  
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #           #  ##   # #    # #       #  #  #      #      
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######      #  # #  # #    # #####    ##   #####   ####  
 #     # #     # #     # #          #       #     # #     #    #    #       #     #  #  # # #    # #        ##   #           # 
 #     # #     # #     # #          #     # #     # #     #     #  #  #     #     #  #   ## #    # #       #  #  #      #    # 
 ####### #     # ####### #           #####  ######  #     #      ##    #####     ### #    # #####  ###### #    # ######  ####  
                                                                              

script to create the required indexes within OMOP common data model, version 5.0 for PostgreSQL database

last revised: 12 Oct 2014

author:  Patrick Ryan

description:  These indices are considered a minimal requirement to ensure adequate performance of analyses.

*************************/


/************************

Standardized vocabulary

************************/

CREATE UNIQUE INDEX  idx_concept_concept_id  ON  concept  (concept_id ASC);
CLUSTER  concept  USING  idx_concept_concept_id ;
CREATE INDEX idx_concept_code ON concept (concept_code ASC);
CREATE INDEX idx_concept_vocabluary_id ON concept (vocabulary_id ASC);
CREATE INDEX idx_concept_domain_id ON concept (domain_id ASC);
CREATE INDEX idx_concept_class_id ON concept (concept_class_id ASC);

CREATE UNIQUE INDEX  idx_vocabulary_vocabulary_id  ON  vocabulary  (vocabulary_id ASC);
CLUSTER  vocabulary  USING  idx_vocabulary_vocabulary_id ;

CREATE UNIQUE INDEX  idx_domain_domain_id  ON  domain  (domain_id ASC);
CLUSTER  domain  USING  idx_domain_domain_id ;

CREATE UNIQUE INDEX  idx_concept_class_class_id  ON  concept_class  (concept_class_id ASC);
CLUSTER  concept_class  USING  idx_concept_class_class_id ;

CREATE INDEX idx_concept_relationship_id_1 ON concept_relationship (concept_id_1 ASC); 
CREATE INDEX idx_concept_relationship_id_2 ON concept_relationship (concept_id_2 ASC); 
CREATE INDEX idx_concept_relationship_id_3 ON concept_relationship (relationship_id ASC); 

CREATE UNIQUE INDEX  idx_relationship_rel_id  ON  relationship  (relationship_id ASC);
CLUSTER  relationship  USING  idx_relationship_rel_id ;

/*
CREATE INDEX  idx_concept_synonym_id  ON  concept_synonym  (concept_id ASC);
CLUSTER  concept_synonym  USING  idx_concept_synonym_id ;
*/

CREATE INDEX  idx_concept_ancestor_id_1  ON  concept_ancestor  (ancestor_concept_id ASC);
CLUSTER  concept_ancestor  USING  idx_concept_ancestor_id_1 ;
CREATE INDEX idx_concept_ancestor_id_2 ON concept_ancestor (descendant_concept_id ASC);

/*
CREATE INDEX  idx_source_to_concept_map_id_3  ON  source_to_concept_map  (target_concept_id ASC);
CLUSTER  source_to_concept_map  USING  idx_source_to_concept_map_id_3 ;
CREATE INDEX idx_source_to_concept_map_id_1 ON source_to_concept_map (source_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_id_2 ON source_to_concept_map (target_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_code ON source_to_concept_map (source_code ASC);

CREATE INDEX  idx_drug_strength_id_1  ON  drug_strength  (drug_concept_id ASC);
CLUSTER  drug_strength  USING  idx_drug_strength_id_1 ;
CREATE INDEX idx_drug_strength_id_2 ON drug_strength (ingredient_concept_id ASC);
*/
