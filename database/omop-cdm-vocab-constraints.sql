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

 ####### #     # ####### ######      #####  ######  #     #           #######     #####                                                                 
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #          #     #  ####  #    #  ####  ##### #####    ##   # #    # #####  ####  
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #          #       #    # ##   # #        #   #    #  #  #  # ##   #   #   #      
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######     #       #    # # #  #  ####    #   #    # #    # # # #  #   #    ####  
 #     # #     # #     # #          #       #     # #     #    #    #       #    #       #    # #  # #      #   #   #####  ###### # #  # #   #        # 
 #     # #     # #     # #          #     # #     # #     #     #  #  #     #    #     # #    # #   ## #    #   #   #   #  #    # # #   ##   #   #    # 
 ####### #     # ####### #           #####  ######  #     #      ##    #####      #####   ####  #    #  ####    #   #    # #    # # #    #   #    ####  
                                                                              

script to create constraints within OMOP common data model, version 5.0 for PostgreSQL database

last revised: 12 Oct 2014

author:  Patrick Ryan


*************************/


/************************
*************************
*************************
*************************

Primary key constraints

*************************
*************************
*************************
************************/



/************************

Standardized vocabulary

************************/



ALTER TABLE omop.concept ADD CONSTRAINT xpk_concept PRIMARY KEY (concept_id);

ALTER TABLE omop.vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY (vocabulary_id);

ALTER TABLE omop.domain ADD CONSTRAINT xpk_domain PRIMARY KEY (domain_id);

ALTER TABLE omop.concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY (concept_class_id);

ALTER TABLE omop.concept_relationship ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY (concept_id_1,concept_id_2,relationship_id);

ALTER TABLE omop.relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY (relationship_id);

ALTER TABLE omop.concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY (ancestor_concept_id,descendant_concept_id);

/*
ALTER TABLE omop.source_to_concept_map ADD CONSTRAINT xpk_source_to_concept_map PRIMARY KEY (source_vocabulary_id,target_concept_id,source_code,valid_end_date);

ALTER TABLE omop.drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY (drug_concept_id, ingredient_concept_id);
*/





/************************
*************************
*************************
*************************

Foreign key constraints

*************************
*************************
*************************
************************/


/************************

Standardized vocabulary

************************/


ALTER TABLE omop.concept ADD CONSTRAINT fpk_concept_domain FOREIGN KEY (domain_id)  REFERENCES omop.domain (domain_id);

ALTER TABLE omop.concept ADD CONSTRAINT fpk_concept_class FOREIGN KEY (concept_class_id)  REFERENCES omop.concept_class (concept_class_id);

ALTER TABLE omop.concept ADD CONSTRAINT fpk_concept_vocabulary FOREIGN KEY (vocabulary_id)  REFERENCES omop.vocabulary (vocabulary_id);

ALTER TABLE omop.vocabulary ADD CONSTRAINT fpk_vocabulary_concept FOREIGN KEY (vocabulary_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.domain ADD CONSTRAINT fpk_domain_concept FOREIGN KEY (domain_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.concept_class ADD CONSTRAINT fpk_concept_class_concept FOREIGN KEY (concept_class_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_1 FOREIGN KEY (concept_id_1)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_2 FOREIGN KEY (concept_id_2)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.concept_relationship ADD CONSTRAINT fpk_concept_relationship_id FOREIGN KEY (relationship_id)  REFERENCES omop.relationship (relationship_id);

ALTER TABLE omop.relationship ADD CONSTRAINT fpk_relationship_concept FOREIGN KEY (relationship_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.relationship ADD CONSTRAINT fpk_relationship_reverse FOREIGN KEY (reverse_relationship_id)  REFERENCES omop.relationship (relationship_id);

/*
ALTER TABLE omop.concept_synonym ADD CONSTRAINT fpk_concept_synonym_concept FOREIGN KEY (concept_id)  REFERENCES omop.concept (concept_id);
*/

ALTER TABLE omop.concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_1 FOREIGN KEY (ancestor_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_2 FOREIGN KEY (descendant_concept_id)  REFERENCES omop.concept (concept_id);

/*
ALTER TABLE omop.source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_v_1 FOREIGN KEY (source_vocabulary_id)  REFERENCES omop.vocabulary (vocabulary_id);

ALTER TABLE omop.source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_v_2 FOREIGN KEY (target_vocabulary_id)  REFERENCES omop.vocabulary (vocabulary_id);

ALTER TABLE omop.source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_c_1 FOREIGN KEY (target_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.drug_strength ADD CONSTRAINT fpk_drug_strength_concept_1 FOREIGN KEY (drug_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.drug_strength ADD CONSTRAINT fpk_drug_strength_concept_2 FOREIGN KEY (ingredient_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_1 FOREIGN KEY (amount_unit_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_2 FOREIGN KEY (numerator_unit_concept_id)  REFERENCES omop.concept (concept_id);

ALTER TABLE omop.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_3 FOREIGN KEY (denominator_unit_concept_id)  REFERENCES omop.concept (concept_id);
*/
