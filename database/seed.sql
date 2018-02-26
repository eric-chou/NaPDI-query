/*

sudo service postgresql start

sudo sudo -u postgres psql

\c napdi_repository;

\c postgres;
drop database napdi_repository;
create database napdi_repository;
\c napdi_repository;

psql -h localhost -d napdi_repository -U postgres -f database/omop-cdm-vocab-ddl.sql
psql -h localhost -d napdi_repository -U postgres -f database/omop-cdm-vocab-constraints.sql
psql -h localhost -d napdi_repository -U postgres -f database/omop-cdm-vocab-indexes.sql
psql -h localhost -d napdi_repository -U postgres -f database/omop-cdm-schema.sql

copy data with db_link if you want it omop-copy-data-with-dblink.sql

-- run sails lift to create tables from models in /sails/api/models/

psql -h localhost -d napdi_repository -U postgres -f database/functions/setval_max.function.sql

psql -h localhost -d napdi_repository -U postgres -f database/seed.sql

psql -h localhost -d napdi_repository -U postgres -f database/test.sql

-- if omop populated with needed vocabulary data you can add concept_ids
psql -h localhost -d napdi_repository -U postgres -f database/seed_concept_ids.sql

*/

INSERT INTO study_source_type (id, name)
	values
	(1, 'Published report'),
	(2, 'Manuscript prepared or submitted for peer-reviewed publication'),
	(3, 'Unpublished data submitted through a NaPDI form')
;


------------------------------------------------------------
-- natural_product -----------------------------------------
------------------------------------------------------------
INSERT INTO natural_product (id, name, itis)
	values
	(1, 'Green Tea', 506801), -- Green tea extract - http://www.ohdsi.org/web/atlas/#/concept/19124972
	(2, 'Goldenseal', 18781), -- Goldenseal extract - http://www.ohdsi.org/web/atlas/#/concept/43525850
	(3, 'Glycyrrhizin / Licorice', 26717) /* Genus 
	Glycyrrhizin is a compound in Licorice - http://www.ohdsi.org/web/atlas/#/concept/44526043 https://pubchem.ncbi.nlm.nih.gov/compound/3495
	Licorice - http://www.ohdsi.org/web/atlas/#/concept/1353048
	Licorice extract - http://www.ohdsi.org/web/atlas/#/concept/19080470
	Licorice root extract - http://www.ohdsi.org/web/atlas/#/concept/19055215
	(4, 'Turmeric', 42394) -- Turmeric extract - http://www.ohdsi.org/web/atlas/#/concept/40241181
	(5, 'Schisandra', 42394), Genus
	(6, 'Resveratrol'), -- Resveratrol - http://www.ohdsi.org/web/atlas/#/concept/40225716
	(7, 'Cinnamon', 18174), Genus
	(8, 'Red Yeast Rice'), -- red yeast rice - http://www.ohdsi.org/web/atlas/#/concept/1389885
	(9, 'Garlic', 42652), 	Allium sativum var. sativum L. – cultivated garlic
	(10, 'Ginseng', 29371) Family
	*/
;


------------------------------------------------------------
-- compound ------------------------------------------------
------------------------------------------------------------
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (3, '4-hydroxymephenytoin, (S)-', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (9, 'catechin sulfate', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (16, 'epicatechin', '34PHS7TU43', 'PFTAWBLQPZVEMU-UKRRQHHQSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (18, 'epigallocatechin', '7Z197MG6QL', 'XMOCLSLCDHWDHP-IUODEOHRSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (22, 'gallocatechin', 'HEJ6575V1X', 'XMOCLSLCDHWDHP-SWLSCSKDSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (23, 'gallocatechin gallate', '0C056HB16M', 'WMBWREPUVVBILR-GHTZIAJQSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (25, 'mephenytoin, (S)-', 'D9818430MW', 'GMHKMTDVRCWUDX-LBPRGKRZSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (27, 'paraxanthine', 'Q3565Y41V7', 'QUNWUDVFRNGTCO-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (35, 'green tea leaf', 'W2ZU1RY8B0', null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (19, 'epigallocatechin gallate', 'BQM438CTEL', 'WMBWREPUVVBILR-WIYYLYMNSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (45, 'dopamine sulfate', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (38, 'alprazolam', null, 'VREFGVBLTWBCJP-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (40, 'ritodrine', null, 'IOVGROKTTNBUGK-SJCJKPOMSA-', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (46, 'nadolol', null, 'VWPOSFSPZNDTMJ-UCWKZMIHSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (44, 'dopamine', null, 'VYFYYTLLBUKUHU-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (47, 'amodiaquine', null, 'OVCDSSHSILBFBN-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (48, 'N-desethylamodiaquine', null, 'VRXFDHAGFYWGHT-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (49, 'metformin', null, 'XZWYZXLIPXDOLR-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (50, '4''-methyl-epigallocatechin', null, 'ITDYPNOEEHONAH-UKRRQHHQSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (51, 'mycophenolic acid', null, 'HPNSFSBZBAHARI-RUDMXATFSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (52, 'trifluoperazine', null, 'ZEWQUBUPAILYHI-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (53, 'mycophenolic acid 7-O-glucuronide', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (54, 'serotonin', null, 'QZAYGJVTTNCVMB-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (55, 'serotonin glucuronide', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (56, 'trifluoperazine glucuronide', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (58, '17-beta-estradiol-3-O-glucuronide', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (59, 'buspirone', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (5, 'acetaminophen', '362O9ITL9D', 'RZVAJINKPMORJF-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (6, 'bupropion', '01ZG3TPX31', 'SNPPWIUOZRMYNY-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (7, 'caffeine', '3G6A5W338E', 'RYYVLZVUVIJVGH-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (8, 'catechin', '8R1V1STN48', 'PFTAWBLQPZVEMU-DZGCQCFKSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (10, 'chlorogenic acid', '318ADP12RI', 'CWVRJTMFETXNAD-JUHZACGLSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (12, 'dextromethorphan', '7355X3ROTS', 'MKXZASYAUGDDCJ-NJAFHUGGSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (57, '17-beta-estradiol', null, 'VOXZDWNPVJITMN-ZBRFXRBCSA-N', 'Synonymns Estradiol; Beta-Estradiol; 17beta-Estradiol; 50-28-2; Oestradiol; Dihydrofolliculin -- https://pubchem.ncbi.nlm.nih.gov/compound/5757', null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (14, 'diclofenac', '144O8QL0L1', 'DCOPUUMXTXDBNB-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (15, 'digoxin', '73K4184T59', 'LTMHDMANZUZIPE-PUGKRICDSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (20, 'famotidine', '5QZO15J2Z8', 'XUFQPHANEAPEMJ-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (21, 'gallic acid', '632XD903SP', 'LNTHITQWFMADLM-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (24, 'hydroxybupropion', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (26, 'midazolam', 'R60L0SM5BC', 'DDLIGBOFAVUZHB-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (28, 'phenacetin', 'ER0CTH01H9', 'CPJSUEIXXCENMM-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (29, 'rifampin', 'VJT6J7R4TR', 'JQXXHWHPUNPDRT-WLSIYKJHSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (30, 'rosuvastatin', '413KH5ZJ73', 'BPRHUIZQVSMCRT-VEUZHWNKSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (31, 'sulfasalazine', '3XC8GUZ6CB', 'NCEXYHBECQHGNR-QZQOTICOSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (32, 'theanine', '8021PR16QO', 'DATAGRPVKZEWHA-YFKPBYRVSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (33, 'theobromine', 'OBD445WZ5P', 'YAPQBXQYLJRXSA-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (34, 'theophylline', 'C137DTR5RG', 'INQSMEFCAIHTJG-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (39, 'green tea leaf extract', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (41, 'ritodrine sulfate ester', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (42, 'p-nitrophenol', null, 'BTJIUGUIPKRLHP-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (43, '4-Nitrophenyl sulfate', null, 'JBGHTSSFSSUKLR-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (61, 'losartan', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (62, 'losartan carboxylic acid', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (1, '1''-hydroxymidazolam', null, 'QHSMEGADRFZVNE-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (13, 'dextrorphan', null, 'JAQUASYNZVUNQP-PVAVHDDUSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (71, 'methylumbelliferone', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (72, 'anan', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (76, 'raloxifene 4''-glucuronide', null, 'VHXYPEXOSLGZKH-WKRHDJAJSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (77, 'raloxifene 6-glucuronide', null, 'MZPMSLSINDGEPM-WKRHDJAJSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (74, 'nicardipine', null, 'ZBBHBTPTTSWHBA-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (75, 'raloxifene', null, 'GZUITABIAKMVPG-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (78, 'atorvastatin', null, 'XUKUURHRXDUEBC-KAYWLYCHSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (79, 'bromosulfophthalein', null, 'GHAFORRTMVIXHS-UHFFFAOYSA-L', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (17, 'epicatechin gallate', '92587OVD8Z', 'LSHVYAFMTMFKBA-TZIWHRDSSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (70, '4-methylumbelliferone', null, 'HSHNITRMYYLLCV-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (73, '4-methylumbelliferone glucuronide', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (80, 'berberine', null, 'YBHILYKTIRIUTE-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (81, '(-)-beta-hydrastine', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (82, 'hydrastine', null, 'JZUTXVTYJDCMDU-MOPGFXCFSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (2, '4''-hydroxydiclofenac', null, 'KGVXVPRLBMWZLG-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (83, 'tienilic acid', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (84, 'paroxetine', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (85, 'troleandomycin', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (86, '7-ethoxyresorufin', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (87, 'resorufin', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (4, '7-hydroxycoumarin', null, 'ORHBXUUXSCNDEV-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (88, '7-ethoxycoumarin', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (89, '4-nitrophenol', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (90, '4-nitrocatechol', null, null, null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (11, 'coumarin', null, 'ZYGHJZDHTFUPRJ-UHFFFAOYSA-N', null, null, null);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (64, '(-)-epicatechin-3-gallate', null, null, null, null, 17);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (65, '(-)-epigallocatechin', null, null, null, null, 18);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (66, '(-)-epicatechin', null, null, null, null, 16);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (37, 'epigallocatechin gallate, (-)-', null, null, null, null, 19);
INSERT INTO public.compound (id, name, unii, inchikey, public_description, internal_comment, enantiomer_of_id) VALUES (36, 'gallocatechin, (-)-', null, null, null, null, 22);


------------------------------------------------------------
-- compound_metabolite_xref --------------------------------
------------------------------------------------------------
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (27, 7);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (34, 7);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (33, 7);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (9, 8);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (43, 42);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (45, 44);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (48, 47);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (50, 18);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (58, 57);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (62, 61);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (1, 26);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (53, 51);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (55, 54);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (3, 25);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (13, 12);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (24, 6);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (56, 52);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (73, 70);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (76, 75);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (77, 75);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (2, 14);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (87, 86);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (4, 11);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (4, 88);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (90, 89);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (41, 40);
INSERT INTO public.compound_metabolite_xref (metabolite_id, compound_id) VALUES (11, 88);


------------------------------------------------------------
-- natural_product_compound_xref ---------------------------
------------------------------------------------------------
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (7, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (8, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (9, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (10, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (16, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (17, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (18, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (19, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (21, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (22, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (23, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (35, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (36, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (27, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (32, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (33, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (34, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (39, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (64, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (65, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (66, 1);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (80, 2);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (81, 2);
INSERT INTO public.natural_product_compound_xref (compound_id, natural_product_id) VALUES (82, 2);

/* update all metabolites to be isActiveMetabolite = 1 */


------------------------------------------------------------
-- enzyme --------------------------------------------------
------------------------------------------------------------
INSERT INTO enzyme (id, name)
	values
	(1, 'Alcohol dehydrogenase'),
	(2, 'Aldehyde dehydrogenase'),
	(3, 'Aldehyde Oxidase'),
	(4, 'CYP1A2'),
	(5, 'CYP2A6'),
	(6, 'CYP2B6'),
	(7, 'CYP2C8'),
	(8, 'CYP2C9'),
	(9, 'CYP2C19'),
	(10, 'CYP2D6'),
	(11, 'CYP2E1'),
	(12, 'CYP2J2'),
	(13, 'CYP3A4'),
	(14, 'CYP4F1'),
	(15, 'Flavin Monooxygenase'),
	(16, 'Monoamine Oxidase'),
	(17, 'UGT1A1'),
	(18, 'UGT1A3'),
	(19, 'UGT1A4'),
	(20, 'UGT1A6'),
	(21, 'UGT1A9'),
	(22, 'UGT2B7'),
	(23, 'UGT2B15'),
	(24, 'Xanthine Oxidase'),
	(25,'SULT1A1'),	       
	(26,'SULT1A3'),
	(27,'UGT'),
	(28,'UGT1A10'),
	(29,'UGT1A8')

;


------------------------------------------------------------
-- transporter ---------------------------------------------
------------------------------------------------------------
INSERT INTO transporter (id, name)
	values
	(1, 'BCRP (ABCG2)'),
	(2, 'BSEP (ABCB11)'),
	(3, 'MATE1 (SLC47A1)'),
	(4, 'MATE2-K (SLC47A2)'),
	(5, 'OAT1 (SLC22A6)'),
	(6, 'OAT3 (SLC22A8)'),
	(7, 'OATP1B1 (SLCO1B1)'),
	(8, 'OATP1B3 (SLCO1B3)'),
	(9, 'OATP2B1 (SLCO2B1)'),
	(10, 'OCT2 (SLC22A2)'),
	(11, 'P-gp (ABCB1)')
;


------------------------------------------------------------
-- experiment_type -----------------------------------------
------------------------------------------------------------
INSERT INTO experiment_type (id, name, is_invitro, is_transporter, is_enzyme)
	values
	(1, 'In Vitro Enzyme Inhibition', true, false, true),
	(2, 'In Vitro Enzyme Induction', true, false, true),
	(3, 'In Vitro Enzyme Kinetics', true, false, true),
	(4, 'In Vitro Enzyme Screen', true, false, true),
	(5, 'In Vitro Transporter Inhibition', true, true, false),
	(6, 'In Vitro Transporter Induction', true, true, false),
	(7, 'In Vitro Transporter Kinetics', true, true, false),
	(8, 'In Vivo Pharmacokinetics', false, false, false),
	(9, 'In Vivo Interaction', false, false, false)
;


------------------------------------------------------------
-- test_system_category ------------------------------------
------------------------------------------------------------
INSERT INTO test_system_category (id, name, sort_order, requires_cytochrome_b5)
	values
	(1, 'Cell system', 1, false),
	(2, 'Cell fraction', 2, false),
	(3, 'Recombinant expression system', 3, true),
	(4, 'Transfected / siRNA knock-out / injected cells', 4, false),
	(5, 'Other', 5, false)
;


------------------------------------------------------------
-- test_system ---------------------------------------------
------------------------------------------------------------
INSERT INTO test_system (id, category_id, name)
	values
	(1, 1, 'Human cryopreserved hepatocytes'),
	(2, 1, 'Human freshly isolated hepatocytes'),
	(3, 1, 'Transgenic animal hepatocytes'),
	(4, 1, 'HepG2 cell line'),
	(5, 1, 'HepaRG cell line'),
	(17, 1, 'Fa2N-4 cell line'),
	(18, 1, 'BC2 cell line'),
	(31, 1, 'Primary hepatocytes'),
	(32, 1, 'Cryopreserved hepatocytes'),
	(33, 1, 'Sandwich cultured hepatocytes'),
	(34, 1, 'Intestinal epithelial cells'),
	(35, 1, 'Caco-2 cells'),
	(36, 1, 'Other cells'),
	
	(6, 2, 'Pooled human liver microsomes'),
	(7, 2, 'Individual human liver microsomes'),
	(8, 2, 'Pooled human intestinal microsomes'),
	(9, 2, 'Individual human intestinal microsomes'),
	(10, 2, 'Human liver cytosolic fraction'),
	(11, 2, 'Human intestine cytosolic fraction'),
	(12, 2, 'Human liver S9 fraction'),
	(13, 2, 'Human intestine S9 fraction'),
	
	(14, 3, 'Baculovirus-insect cells'),
	(15, 3, 'E.coli'),
	(16, 3, 'Yeast'),
	(37, 3, 'Not available'),
	
	(20, 4 ,'MDCK transfected cells'),
	(21, 4 ,'LLC-PK1 transfected cells'),
	(22, 4 ,'HEK293 transfected cells'),
	(23, 4 ,'HeLa transfected cells'),
	(24, 4 ,'CHO transfected cells'),
	(25, 4 ,'HepG2 transfected cells'),
	(26, 4 ,'siRNA knock-out hepatocytes'),
	(27, 4 ,'siRNA knock-out caco-2 cells'),
	(28, 4 ,'siRNA knock-out other cells'),
	(29, 4 ,'X.laevis oocytes injected'),
	(30, 4 ,'Inside-out membrane vesicles'),
	
	(19, 5, 'Transgenic animal model')
;


------------------------------------------------------------
-- cytochrome_b5 -------------------------------------------
------------------------------------------------------------
INSERT INTO cytochrome_b5 (id, name, sort_order) values (1, 'Co-expressed', 1), (2, 'Supplemented ', 2), (3, 'No', 3), (4, 'Not available', 4);


------------------------------------------------------------
-- experiment_type_test_system_xref ------------------------
------------------------------------------------------------
INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), 
	(1, 10), (1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 37)
;

INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(2, 1), (2, 2), (2, 4), (2, 5), (2, 17), (2, 18), (2, 19)
;

INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), 
	(3, 10), (3, 11), (3, 12), (3, 13), (3, 14), (3, 15), (3, 16), (3, 37)
;

INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), 
	(4, 10), (4, 11), (4, 12), (4, 13), (4, 14), (4, 15), (4, 16), (4, 37)
;

INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(5, 20), (5, 21), (5, 22), (5, 23), (5, 24), (5, 25), (5, 26), (5, 27), (5, 28), (5, 29), 
	(5, 30), (5, 31), (5, 32), (5, 33), (5, 34), (5, 35), (5, 36)
;

INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(6, 20), (6, 21), (6, 22), (6, 23), (6, 24), (6, 25), (6, 26), (6, 27), (6, 28), (6, 29), 
	(6, 30), (6, 31), (6, 32), (6, 33), (6, 34), (6, 35), (6, 36)
;

INSERT INTO experiment_type_test_system_xref (experiment_type_id, test_system_id)
	values
	(7, 20), (7, 21), (7, 22), (7, 23), (7, 24), (7, 25), (7, 26), (7, 27), (7, 28), (7, 29), 
	(7, 30), (7, 31), (7, 32), (7, 33), (7, 34), (7, 35), (7, 36)
;


------------------------------------------------------------
-- measurement_type_category -------------------------------
------------------------------------------------------------
INSERT INTO measurement_type_category (id, name, sort_order)
	values
	(1, 'Barrier Permeability Measurement', 1),
	(2, 'Uptake Measurement', 2),
	(3, 'Kinetic Measurement', 3)
;


------------------------------------------------------------
-- measurement_type ----------------------------------------
------------------------------------------------------------
INSERT INTO measurement_type (id, name)
	values
	(1, 'K<sub>m</sub>'),
	(2, 'V<sub>max</sub>'),
	(3, 'CL<sub>int total</sub>'),
	(4, 'CL<sub>int unbound</sub>'),
	(5, 'Percent bound'),
	(6, 'Metabolic rate'),
	(7, '% parent remaining'),
	(8, 'EC<sub>50</sub>'),
	(9, 'E<sub>max</sub>'),
	(10, 'Change from vehicle control'),
	(11, 'Change from positive control'),
	(12, '% Inhibition'),
	(13, 'IC<sub>50</sub>'),
	(14, 'Ki<sub>total</sub>'),
	(15, 'Ki<sub>unbound</sub>'),
	(16, '% Inhibition <sub>pre-incubation</sub>'),
	(17, '% Inhibition <sub>co-incubation</sub>'),
	(18, 'IC<sub>50 pre-incubation</sub>'),
	(19, 'IC<sub>50 co-incubation</sub>'),
	(20, 'IC<sub>50</sub> -fold shift'),
	(21, 'K<sub>inact</sub>'),
	(22, 'K<sub>I</sub>'),
	(23, 'K<sub>inact</sub> / K<sub>I</sub>'),
	(24, 'Change in efflux compared with vehicle control'),
	(25, 'Change in efflux compared with positive control'),
	(26, 'Change in accumulation compared with vehicle control'),
	(27, 'Change in accumulation compared with positive control')
;

INSERT INTO measurement_type (id, name)
	values
	(30, 'P<sub>app</sub> A-B Vector Control'),
	(31, 'P<sub>app</sub> A-B Transfected'),
	(32, 'P<sub>app</sub> A-B Caco-2'),
	(33, 'P<sub>app</sub> B-A Vector Control'),
	(34, 'P<sub>app</sub> B-A Transfected'),
	(35, 'P<sub>app</sub> B-A Caco-2'),
	(36, 'Ratio P<sub>app</sub>B-A / P<sub>app</sub>A-B Vector Control'),
	(37, 'Ratio P<sub>app</sub>B-A / P<sub>app</sub>A-B Transfected'),
	(38, 'Ratio P<sub>app</sub>B-A / P<sub>app</sub>A-B Caco-2'),
	(39, 'Ratio Transfected / Vector Control'),
	(40, 'Permeability Rate'),
	(41, 'Efflux Rate'),
	(42, 'Fold Accumulation Vector Control'),
	(43, 'Fold Accumulation Transfected'),
	(44, 'Ratio of Fold Accumulation Transfected / Vector Control'),
	(45, 'Accumulation Rate'),
	(46, 'K<sub>m total</sub>'),
	(47, 'K<sub>m unbound</sub>'),
	/* (48, 'Percent  Bound'), need to fix duel use of this in and out of category use 5 */
	(49, 'V<sub>max</sub> or J<sub>max</sub>'),
	(50, 'V<sub>max</sub> / K<sub>m</sub> or J<sub>max</sub> / K<sub>m</sub>'),
	(51, 'Fit Model'),
	(52, 'Hill Coefficient'),
	
	/* invivo */
	(101, 'AUC<sub>Tau</sub>'),
	(102, 'AUC<sub>(0-infinity)</sub>'),
	(103, 'AUC<sub>(0-tn)</sub>'),
	(104, 'AUC<sub>(0-t)</sub>'),
	(105, 'AUC ratio (metabolite/parent)'),
	(106, 'AUC ratio (parent/metabolite)'),
	(107, 'C (plasma)'),
	(108, 'C ratio (metabolite/parent)'),
	(109, 'C ratio (parent/metabolite)'),
	(110, 'CL (renal)'),
	(111, 'CL/F'),
	(112, 'C<sub>max</sub>'),
	(113, 'C<sub>ss avg</sub>'),
	(114, 'C<sub>ss trough</sub>'),
	(115, 'Fraction bound in plasma'),
	(116, 'Fraction unbound in plasma'),
	(117, 'Half-life (terminal)'),
	(118, 'MRT'),
	(119, 'T<sub>max</sub>'),
	(120, 'Cumulative Urinary Excretion (% Dose)'),
	(121, 'Urinary molar ratio (metabolite/parent)'),
	(122, 'Urinary molar ratio (parent/metabolite)'),
	(123, 'V<sub>d</sub>/F')
;


------------------------------------------------------------
-- unit ----------------------------------------------------
------------------------------------------------------------
INSERT INTO unit (id, name)
	values
	(1, '%'),
	(2, 'μM'),
	(3, 'μL/min/pmol P450'),
	(4, 'pmol/min/pmol P450'),
	(5, 'μL/min/mg protein'),
	(6, '/min'),
	(7, '/min/μM'),
	(8, 'x10<sup>-6</sup> cm/s'),
	(9, 'nmol/cm<sup>2</sup>/h'),
	(10, 'pmol/min/10<sup>6</sup> cells'),
	(11, 'pmol/min/pmol'),
	(12, 'pmol/min/oocyte'),
	(13, 'µL/cm<sup>2</sup>/min'),
	(14, 'µL/min/pmol'),
	(15, 'µL/min/10<sup>6</sup> cells'),
	(16, 'µL/min/oocyte'),
	(17, 'mL/cm<sup>2</sup>/min'),
	(18, 'Hill Equation'),
	(19, 'Michaelis-Menten'),
	(20, '-fold'),
	
	(21, 'µmol/L*h'),
	(22, 'ng/mL*h'),
	(23, 'µmol/L'),
	(24, 'ng/mL'),
	(25, 'L/h'),
	(26, 'mL/min/kg'),
	(27, 'L/h/kg'),
	(28, 'h'),
	(29, 'L'),
	(30, 'L/kg'),
	(31, 'µg/mL'),
	(32, '%v/v'),
	
	(100, '')
;


------------------------------------------------------------
-- measurement_type_unit_xref ------------------------------
------------------------------------------------------------
INSERT INTO measurement_type_unit_xref (measurement_type_id, unit_id)
	values
	(1, 2),
	(2, 4),
	(3, 3),
	(4, 3),
	(5, 1),
	(6, 5),
	(7, 1),
	(8, 2),
	(9, 20),
	(10, 1),
	(11, 1),
	(12, 1),
	(13, 2),
	(13, 31),
	(13, 32),
	(14, 2),
	(14, 31),
	(15, 2),
	(16, 1),
	(17, 1),
	(18, 2),
	(19, 2),
	(20, 20),
	(21, 6),
	(22, 2), 
	(23, 7),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(30, 8),
	(31, 8),
	(32, 8),
	(33, 8),
	(34, 8),
	(35, 8),
	
	(36, 100),
	(37, 100),
	(38, 100),
	(39, 100),
	(40, 100),
	(41, 100),
	(42, 20),
	(43, 20),
	(44, 20),
	(45,100),
	(46, 2),
	(47, 2),
	(49, 9),
	(49, 10),
	(49, 11),
	(49, 12),
	(50, 13),
	(50, 14),
	(50, 15),
	(50, 16),
	(50, 17),
	(51, 18),
	(51, 19),
	(52, 100),
	
	(101, 21),
	(101, 22),
	(102, 21),
	(102, 22),
	(103, 21),
	(103, 22),
	(104, 21),
	(104, 22),
	(105, 100),
	(106, 100),
	(107, 23),
	(107, 24),
	(108, 100),
	(109, 100),
	(110, 26),
	(110, 27),
	(111, 25),
	(111, 26),
	(111, 27),
	(112, 23),
	(112, 24),
	(113, 23),
	(113, 24),
	(114, 23),
	(114, 24),
	(115, 100),
	(116, 100),
	(117, 28),
	(118, 28),
	(119, 28),
	(120, 1),
	(121, 100),
	(122, 100),
	(123, 29),
	(123, 30)
;


------------------------------------------------------------
-- experiment_type_measurement_type_xref -------------------
------------------------------------------------------------
INSERT INTO experiment_type_measurement_type_xref (experiment_type_id, measurement_type_id)
	values
	(2, 8),
	(2, 9),
	(2, 10),
	(2, 11),
	
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(3, 5),
	
	(4, 6),
	(4, 7)
;

INSERT INTO experiment_type_measurement_type_xref (experiment_type_id, measurement_type_id, sort_order)
	values
	(1, 12, 1),
	(1, 14, 2),
	(1, 15, 4),
	(1, 16, 5),
	(1, 17, 6),
	(1, 13, 7),
	(1, 18, 8),
	(1, 19, 9),
	(1, 20, 10),
	(1, 21, 11),
	(1, 22, 12),
	(1, 23, 13),
	
	(6, 8, 1),
	(6, 9, 2),
	(6, 24, 3),
	(6, 25, 4),
	(6, 26, 5),
	(6, 27, 6),
	(6, 10, 7),
	(6, 11, 8),
	
	(8, 101, 1),
	(8, 102, 2),
	(8, 103, 3),
	(8, 104, 4),
	(8, 105, 5),
	(8, 106, 6),
	(8, 107, 7),
	(8, 108, 8),
	(8, 109, 9),
	(8, 110, 10),
	(8, 111, 11),
	(8, 112, 12),
	(8, 113, 13),
	(8, 114, 14),
	(8, 115, 15),
	(8, 116, 16),
	(8, 117, 17),
	(8, 118, 18),
	(8, 119, 19),
	(8, 120, 20),
	(8, 121, 21),
	(8, 122, 22),
	(8, 123, 23),
	
	(9, 101, 1),
	(9, 102, 2),
	(9, 103, 3),
	(9, 104, 4),
	(9, 105, 5),
	(9, 106, 6),
	(9, 107, 7),
	(9, 108, 8),
	(9, 109, 9),
	(9, 110, 10),
	(9, 111, 11),
	(9, 112, 12),
	(9, 113, 13),
	(9, 114, 14),
	(9, 115, 15),
	(9, 116, 16),
	(9, 117, 17),
	(9, 118, 18),
	(9, 119, 19),
	(9, 120, 20),
	(9, 121, 21),
	(9, 122, 22),
	(9, 123, 23)
;

INSERT INTO experiment_type_measurement_type_xref (experiment_type_id, measurement_type_id, sort_order, category_id)
	values
	(5, 30, 1, 1),
	(5, 31, 2, 1),
	(5, 32, 3, 1),
	(5, 33, 4, 1),
	(5, 34, 5, 1),
	(5, 35, 6, 1),
	(5, 36, 7, 1),
	(5, 37, 8, 1),
	(5, 38, 9, 1),
	(5, 39, 10, 1),
	(5, 40, 11, 1),
	(5, 41, 12, 1),
	(5, 42, 13, 2),
	(5, 43, 14, 2),
	(5, 44, 15, 2),
	(5, 45, 16, 2),
	
	(7, 30, 1, 1),
	(7, 31, 2, 1),
	(7, 32, 3, 1),
	(7, 33, 4, 1),
	(7, 34, 5, 1),
	(7, 35, 6, 1),
	(7, 36, 7, 1),
	(7, 37, 8, 1),
	(7, 38, 9, 1),
	(7, 39, 10, 1),
	(7, 40, 11, 1),
	(7, 41, 12, 1),
	(7, 42, 1, 2),
	(7, 43, 2, 2),
	(7, 44, 3, 2),
	(7, 45, 3, 2),
	(7, 46, 1, 3),
	(7, 47, 2, 3),
	(7, 5, 3, 3),
	(7, 49, 4, 3),
	(7, 50, 5, 3),
	(7, 51, 6, 3),
	(7, 52, 7, 3)
;

INSERT INTO experiment_type_measurement_type_xref (experiment_type_id, measurement_type_id, sort_order, non_control_only)
	values

	(5, 12, 17, true),
	(5, 14, 18, true),
	(5, 15, 19, true),
	(5, 5, 20, true),
	(5, 13, 21, true)
;


------------------------------------------------------------
-- question ------------------------------------------------
------------------------------------------------------------
INSERT INTO question (id, text, max_answers, required) 
	values
	(1001, 'P-value', 1, false),
	(1002, 'Inhibition type', 1, true),
	(1003, 'Ki determination method', 1, true),
	(1004, 'Method for protein binding determination', 1, true),
	(1005, 'Total collection time', null, false),
	(1006, 'Sample type', 1, true)
;


------------------------------------------------------------
-- answer --------------------------------------------------
------------------------------------------------------------
INSERT INTO answer (id, question_id, text) 
	values
	(1001, 1001, 'P < 0.05'),
	(1002, 1001, 'P < 0.01'),
	(1003, 1001, 'P < 0.005'),
	(1004, 1001, 'Not significant'),
	
	(1100, 1002, 'Competitive'),
	(1101, 1002, 'Non-competitive'),
	(1102, 1002, 'Uncompetitive'),
	(1103, 1002, 'Mixed'),
	(1104, 1002, 'Time-dependent - reversible'),
	(1105, 1002, 'Time-dependent - irreversible'),
	(1106, 1002, 'Not time-dependent'),
	(1107, 1002, 'Mechanism-based'),
	(1108, 1002, 'Not available '),
	
	(1200, 1003, 'Linear transformation – Dixon plot'),
	(1201, 1003, 'Linear transformation - Eadie-Hofstee'),
	(1202, 1003, 'Linear transformation – Lineweaver-Burk'),
	(1203, 1003, 'Linear transformation – other'),
	(1204, 1003, 'Nonlinear least-squares regression'),
	(1205, 1003, 'Graphic read'),
	(1206, 1003, 'Not available'),
	
	(1300, 1004, 'Equilibrium dialysis'),
	(1301, 1004, 'Ultrafiltration'),
	(1302, 1004, 'Ultracentrifugation'),
	(1303, 1004, 'Not available'),
	
	(1400, 1006, 'Plasma'),
	(1401, 1006, 'Urine')
;


------------------------------------------------------------
-- measurement_type_question_xref --------------------------
------------------------------------------------------------
INSERT INTO measurement_type_question_xref (measurement_type_id, question_id)
	values
	(1, 1001),
	(5, 1004),
	(9, 1001),
	(10, 1001),
	(11, 1001),
	(12, 1001),
	(16, 1001),
	(17, 1001),
	(20, 1001),
	(14, 1002),
	(15, 1002),
	(16, 1002),
	(17, 1002),
	(18, 1002),
	(19, 1002),
	(20, 1002),
	(21, 1002),
	(22, 1002),
	(23, 1002),
	(14, 1003),
	(15, 1003),
	(24, 1001),
	(25, 1001),
	(26, 1001),
	(27, 1001),
	(42, 1001),
	(43, 1001),
	(44, 1001),
	
	(104, 1005),
	(107, 1005),
	(108, 1005),
	(109, 1005),
	(121, 1005),
	(122, 1005)
;


------------------------------------------------------------
-- question ------------------------------------------------
------------------------------------------------------------
INSERT INTO question (id, text, max_answers, required) 
	values
	(1, 'Cell density', null, false),
	(2, 'Protein concentration', null, false),
	(3, 'Test system preparation', 1, false),
	(4, 'Test system lot number', null, false),
	(5, 'Incubation volume', null, false),
	(6, 'Incubation time', null, false),
	(7, 'Co-factors', 100, false),
	(8, 'Co-substrate', 100, false),
	(9, 'Protein linearity', 1, false),
	(10, 'Time linearity', 1, false),
	(11, 'Object concentrations tested', null, false),
	
	(12, 'Lot number', null, false),
	(13, 'Viability test', 1, false),
	(14, 'Number of livers', null, false),
	(15, 'Precipitant concentrations tested', null, false),
	
	(16, 'Method for determination of overall effect', 1, true),
	
	(19, 'Induction measurement level', 1, true),
	(20, 'Precipitant pre-incubation volume', null, false), 
	(21, 'Precipitant pre-incubation time', null, false),
	(22, 'Precipitant pre-incubation condition', 1, false),
	(23, 'Secondary enzyme activity incubation volume', null, false), 
	(24, 'Secondary enzyme activity incubation time', null, false),
	(25, 'Dilution factor', null, false),
	
	(26, 'Precipitant source', null, false),
	(27, 'Incubation time for mRNA measurement', null, false),
	(28, 'Method for mRNA determination', null, false),
	(29, 'Incubation time for protein measurement', null, false),
	(30, 'Method for protein determination', null, false),
	(31, 'Incubation time for activity measurement', null, false),
	(32, 'Method for enzyme activity determination', 1, false), 
	(42, 'Method for transporter activity determination', 1, false), 
	
	(33, 'Density', null, false),
	(34, 'Protein amount/well or concentration', null, false),
	(35, 'Plate type', null, false),
	(36, 'Days after plating', null, false),
	(37, 'Passage number', null, false),
	
	(38, 'TEER', null, false),
	(39, 'Barrier integrity method', null, false),
	
	(40, 'Incubation temperature', null, false),
	(41, 'Incubation pH', null, false),
	
	/* invivo */
	
	(100, 'Study design', 100, true),
	(101, 'Demographic characteristics', 100, true),
	(102, 'Lifestyle factors', 100, false),
	(103, 'Ethnicity', 100, false),
	(104, 'Phenotype', 100, false),
	(105, 'Genotype', null, false),
	(106, 'Number of subjects', null, true),
	(107, 'Population additional information', null, false),

	(108, 'Administration route', 1, true),
	(109, 'Formulation', null, true),
	(110, 'Total daily dose', null, true),
	(111, 'Interval/frequency', null, false),
	(112, 'Duration', null, false),
	/* duplicates */
	(113, 'Administration route', 1, true),
	(114, 'Formulation', null, true),
	(115, 'Total daily dose', null, true),
	(116, 'Interval/frequency', null, false),
	(117, 'Duration', null, false),
	
	(118, 'Manufacturer/source', null, false),
	/* lot number id 12 */
	(119, 'Natural product characterization', null, false),
	(120, 'Natural product additional information', null, false),
	
	(121, 'Times of PK samples for object',null, false),
	(122, 'Object PK samples quality concerns', null, false),
	(123, 'Times of PK samples for precipitant', null, false),
	(124, 'Precipitant PK sample quality concerns', null, false),
	
	/* in vivo pd & se */
	(125, 'Pharmacodynamic protocol', null, false),
	(126, 'Pharmacodynamic measurement classes', 100, false),
	(127, 'Pharmacodynamic results', null, false),
	(128, 'Adverse event classes', 100, false),
	(129, 'Safety results', null, false),
	
	(130, 'Prandial state', 1, false),
	(131, 'Prandial state comment', null, false),
	(132, 'Year sourcing was completed', null, true)
	
	/*(131, 'Compartmental Modeling Parameters', null, 0)*/
;

-- set type/rule
update question set type = 'STRING' where max_answers is null;
update question set type = 'TEXT' where id in (107, 120, 125, 127, 1290);


------------------------------------------------------------
-- answer --------------------------------------------------
------------------------------------------------------------
INSERT INTO answer (id, question_id, text)
	values
	(1, 3, 'Commercially available'),
	(2, 3, 'In-house preparation'),
	(3, 7, 'MgCl2'),
	(4, 7, 'NAD'),
	(5, 7, 'NADH'),
	(6, 7, 'NADPH'),
	(7, 7, 'NADPH regenerating system'),
	(8, 7, 'P450 reductase'),
	(9, 8, 'UDPGA'),
	(10, 8, 'PAPS'),
	(11, 8, 'GSH'),
	(12, 9, 'Available'),
	(13, 9, 'Not available'),
	(14, 10, 'Available'),
	(15, 10, 'Not available'),
	(16, 13, 'Yes'),
	(17, 13, 'No'),
	(18, 16, 'Parent disappearance study'),
	(19, 16, 'Metabolite formation study'),
	(20, 19, 'mRNA expression'),
	(21, 19, 'Protein expression'),
	(22, 19, 'Enzyme activity'),
	(23, 22, 'NADPH with precipitant'),
	(24, 22, 'NADPH with no precipitant'),
	(25, 22, 'No NADPH with precipitant'),
	(26, 22, 'No NADPH with no precipitant'),
	
	(200, 101, 'Males'),
	(201, 101, 'Females'),
	(202, 101, 'Healthy volunteers'),
	(203, 101, 'Patients'),
	
	(300, 102, 'Nonsmokers'),
	(301, 102, 'Smokers'),
	(302, 102, 'No alcohol drinking'),
	(303, 102, 'Healthy alcohol drinking'),
	(304, 102, 'Unhealthy alcohol drinking '),
	(305, 102, 'No marijuana use'),
	(306, 102, 'Occasional marijuana use'),
	(307, 102, 'Regular marijuana use'),
	
	/* http://www.cdc.gov/nchs/data/dvs/Race_Ethnicity_CodeSet.pdf */
	(400, 103, 'Not Hispanic or Latino'), /* omop ethnicity */
	(401, 103, 'Hispanic or Latino'),
	(402, 103, 'American Indian or Alaska native'),
	(403, 103, 'Asian'),
	(404, 103, 'Native Hawaiian or Other Pacific Islander'),
	(405, 103, 'Black or African American'),
	(406, 103, 'White'),
	(407, 103, 'More than one race'), /* not in omop */
	
	(500, 104, 'CYP2D6 poor metabolizer'),
	(501, 104, 'CYP2D6 intermediate metabolizer'),
	(502, 104, 'CYP2D6 normal metabolizer'),
	(504, 104, 'CYP2D6 ultra-rapid metabolizer'),
	
	(510, 104, 'CYP2C19 poor metabolizer'),
	(511, 104, 'CYP2C19 intermediate metabolizer'),
	(512, 104, 'CYP2C19 normal metabolizer'),
	(513, 104, 'CYP2C19 rapid metabolizer'),
	(514, 104, 'CYP2C19 ultra-rapid metabolizer'),
	
	(600, 108, 'Oral'),
	(601, 108, 'Intravenous'),
	(602, 108, 'Transdermal'),
	(603, 108, 'Intramuscular'),
	(604, 108, 'Inhalation'),
	
	(610, 113, 'Oral'), /* 4128794 */
	(611, 113, 'Intravenous'), /* 4112421 */
	(612, 113, 'Transdermal'), /* 4262099 not S */
	(613, 113, 'Intramuscular'), /* 4302612 not S */
	(614, 113, 'Inhalation'), /* 45956874 */
	
	/*
	Common Terminology Criteria for Adverse Events (CTCAE)
	https://evs.nci.nih.gov/ftp1/CTCAE/CTCAE_4.03_2010-06-14_QuickReference_8.5x11.pdf
	SOCs
	*/
	(700, 128, 'Blood and lymphatic system disorders'),
	(701, 128, 'Cardiac disorders'),
	(702, 128, 'Congenital, familial and genetic disorders'), /* 35300000 */
	(703, 128, 'Ear and labyrinth disorders'),
	(704, 128, 'Endocrine disorders'),
	(705, 128, 'Eye disorders'),
	(706, 128, 'Gastrointestinal disorders'),
	(707, 128, 'General disorders and administration site conditions'),
	(708, 128, 'Hepatobiliary disorders'),
	(709, 128, 'Immune system disorders'),
	(710, 128, 'Infections and infestations'),
	(711, 128, 'Injury, poisoning and procedural complications'),
	(712, 128, 'Investigations'),
	(713, 128, 'Metabolism and nutrition disorders'),
	(714, 128, 'Musculoskeletal and connective tissue disorders'),
	(715, 128, 'Neoplasms benign, malignant and unspecified (incl cysts and polyps)'),
	(716, 128, 'Nervous system disorders'),
	(717, 128, 'Pregnancy, puerperium and perinatal conditions'),
	(718, 128, 'Psychiatric disorders'),
	(719, 128, 'Renal and urinary disorders'),
	(720, 128, 'Reproductive system and breast disorders'),
	(721, 128, 'Respiratory, thoracic and mediastinal disorders'),
	(722, 128, 'Skin and subcutaneous tissue disorders'),
	(723, 128, 'Social circumstances'),
	(724, 128, 'Surgical and medical procedures'),
	(725, 128, 'Vascular disorder'),
	
	/* PD - use CTCAE SOCs */
    (800, 126, 'Blood and lymphatic system disorders'),
    (801, 126, 'Cardiac disorders'),
    (802, 126, 'Congenital, familial and genetic disorders'), /* 35300000 */
    (803, 126, 'Ear and labyrinth disorders'),
    (804, 126, 'Endocrine disorders'),
    (805, 126, 'Eye disorders'),
    (806, 126, 'Gastrointestinal disorders'),
    (807, 126, 'General disorders and administration site conditions'),
    (808, 126, 'Hepatobiliary disorders'),
    (809, 126, 'Immune system disorders'),
    (810, 126, 'Infections and infestations'),
    (811, 126, 'Injury, poisoning and procedural complications'),
    (812, 126, 'Investigations'),
    (813, 126, 'Metabolism and nutrition disorders'),
    (814, 126, 'Musculoskeletal and connective tissue disorders'),
    (815, 126, 'Neoplasms benign, malignant and unspecified (incl cysts and polyps)'),
    (816, 126, 'Nervous system disorders'),
    (817, 126, 'Pregnancy, puerperium and perinatal conditions'),
    (818, 126, 'Psychiatric disorders'),
    (819, 126, 'Renal and urinary disorders'),
    (820, 126, 'Reproductive system and breast disorders'),
    (821, 126, 'Respiratory, thoracic and mediastinal disorders'),
    (822, 126, 'Skin and subcutaneous tissue disorders'),
    (823, 126, 'Social circumstances'),
    (824, 126, 'Surgical and medical procedures'),
    (825, 126, 'Vascular disorder')
;

INSERT INTO answer (id, question_id, text, sort_order)
	values
	(100, 100, 'Probe cocktail study', 10),
	(101, 100, 'Double-blind', 20),
	(102, 100, 'Fixed-sequence', 30),
	(103, 100, 'Parallel', 40),
	(104, 100, 'Placebo-controlled', 50),
	(105, 100, 'Randomized crossover', 60),
	(106, 100, 'Single dosing', 70),
	(107, 100, 'Multiple dosing', 80),
	
	(900, 130, 'Fed', 10),
	(901, 130, 'Fasted', 20)
;


INSERT INTO answer (id, question_id, text)
	values
	(1500, 32, 'Bufuralol 1''-hydroxylation'),
	(1501, 32, 'Bupropion hydroxylation'),
	(1502, 32, 'Chlorzoxazone 6-hydroxylation'),
	(1503, 32, 'Coumarin 7-hydroxylation'),
	(1504, 32, 'Diclofenac 4''-hydroxylation'),
	(1505, 32, 'Dextromethorphan O-demethylation'),
	(1506, 32, 'Estradiol glucuronidation'),
	(1507, 32, '7-Ethoxyresorufin O-deethylation'),
	(1508, 32, 'Fluorescent probe'),
	(1509, 32, 'Lamotrigine glucuronidation'),
	(1510, 32, 'Midazolam 1''-hydroxylation'),
	(1511, 32, 'Nifedipine dehydrogenation'),
	(1512, 32, 'Omeprazole 5-hydroxylation'),
	(1513, 32, 'Paclitaxel 6-alpha-hydroxylation'),
	(1514, 32, 'Phenacetin O-deethylation'),
	(1515, 32, '(S)-mephenytoin N-demethylation'),
	(1516, 32, 'Testosterone 6-beta-hydroxylation'),
	(1517, 32, 'Tolbutamide methylhydroxylation'),
	(1518, 42, 'Rhodomine 123 uptake/retention assay')
;


------------------------------------------------------------
-- question_section ----------------------------------------
------------------------------------------------------------
INSERT INTO question_section (id, name, sort_order)
	values
	(1, 'Experimental Conditions', 0),
	(2, 'Drug or Natural Product Administration', 20),
	(3, 'Results', 30),
	(4, 'Pharmacodynamics (PD) & Adverse Events', 40)
;


------------------------------------------------------------
-- question_category ---------------------------------------
------------------------------------------------------------
INSERT INTO question_category (id, name, sort_order, section_id)
	values
	(10, null, 0, 1), /* default for all exp conditions */
	(11, 'Cell Culture Conditions', 30, 1),
	(12, 'Viability and Function', 40, 1),
	(13, 'Assay Conditions', 50, 1),
	(14, 'Population', 10, 1),
	(15, 'Pharmacokinetic (PK) Sampling Information', 20, 1),
	
	(20, null, 0, 2),
	(21, 'Object Administration', 10, 2),
	(22, 'Precipitant Administration', 20, 2),
	(23, 'Natural Product Administration', 10, 2),
	(24, 'Natural Product Characteristics', 30, 2),
	
	(30, null, 0, 3),
	
	/* pd & se */
	(40, null, 0, 4)
	/* set comment as question.id = 1 to each */
;


------------------------------------------------------------
-- experiment_type_question_xref ---------------------------
------------------------------------------------------------
INSERT INTO experiment_type_question_xref (experiment_type_id, question_id, category_id, sort_order)
	values
	/* In Vitro Transporter Inhibition */
	(5, 33, 11, 1),
	(5, 34, 11, 2),
	(5, 35, 11, 3),
	(5, 36, 11, 4),
	(5, 37, 11, 5),
	
	(5, 38, 12, 1),
	(5, 39, 12, 2),
	
	(5, 6, 13, 1),
	(5, 40, 13, 2),
	(5, 41, 13, 3),
	(5, 11, 13, 4),
	(5, 15, 13, 5),
	(5, 26, 13, 6),
	
	/* In Vitro Transporter Kinetics */
	(7, 33, 11, 1),
	(7, 34, 11, 2),
	(7, 35, 11, 3),
	(7, 36, 11, 4),
	(7, 37, 11, 5),
	
	(7, 38, 12, 1),
	(7, 39, 12, 2),
	
	(7, 6, 13, 1),
	(7, 40, 13, 2),
	(7, 41, 13, 3),
	(7, 11, 13, 4),
	
	/* In Vivo Pharmacokinetics */
	(8, 100, 10, 0),
	(8, 101, 14, 1),
	(8, 102, 14, 2),
	(8, 103, 14, 3),
	(8, 104, 14, 4),
	(8, 105, 14, 5),
	(8, 106, 14, 6),
	(8, 107, 14, 7),
	
	(8, 108, 23, 1),
	(8, 109, 23, 2),
	(8, 110, 23, 3),
	(8, 130, 23, 4),
	(8, 131, 23, 5),
	(8, 111, 23, 6),
	(8, 112, 23, 7),
	
	(8, 118, 24, 1),
	(8, 12, 24, 2),
	(8, 119, 24, 3),
	(8, 132, 24, 4),
	(8, 120, 24, 5),
	
	(8, 121, 15, 1),
	(8, 122, 15, 2),
	
	/*(8, 131, 30, 1),*/
	
	(8, 125, 40, 10),
	(8, 126, 40, 20),
	(8, 127, 40, 30),
	(8, 128, 40, 40),
	(8, 129, 40, 50),
	
	/* In Vivo Pharmacokinetics */
	(9, 100, 10, 0),
	(9, 101, 14, 1),
	(9, 102, 14, 1),
	(9, 103, 14, 2),
	(9, 104, 14, 3),
	(9, 105, 14, 4),
	(9, 106, 14, 5),
	(9, 107, 14, 6),
		
	(9, 108, 21, 1),
	(9, 109, 21, 2),
	(9, 110, 21, 3),
	(9, 111, 21, 4),
	(9, 112, 21, 5),
	
	(9, 113, 22, 1),
	(9, 114, 22, 2),
	(9, 115, 22, 3),
	(9, 116, 22, 4),
	(9, 117, 22, 5),
	
	(9, 118, 24, 1),
	(9, 12, 24, 2),
	(9, 119, 24, 3),
	(9, 132, 24, 4),
	(9, 120, 24, 5),
		
	(9, 121, 15, 1),
	(9, 122, 15, 2),
	(9, 123, 15, 3),
	(9, 124, 15, 4),
	
	/*(9, 131, 30, 1),*/
	
	(9, 125, 40, 10),
	(9, 126, 40, 20),
	(9, 127, 40, 30),
	(9, 128, 40, 40),
	(9, 129, 40, 50)
;

INSERT INTO experiment_type_question_xref (experiment_type_id, question_id, sort_order, category_id)
	values
	/* In Vitro Enzyme Inhibition */
	(1, 1, 1, 10),
	(1, 2, 2, 10),
	(1, 3, 3, 10),
	(1, 4, 4, 10),
	(1, 5, 5, 10),
	(1, 6, 6, 10),
	(1, 7, 7, 10),
	(1, 8, 8, 10),
	(1, 9, 9, 10),
	(1, 10, 10, 10),
	(1, 11, 11, 10),
	(1, 20, 12, 10),
	(1, 21, 13, 10),
	(1, 22, 14, 10),
	(1, 23, 15, 10),
	(1, 24, 16, 10),
	(1, 25, 17, 10),
	(1, 15, 18, 10),
	
	/* In Vitro Enzyme Induction */
	(2, 19, 0, 10),
	(2, 1, 1, 10),
	(2, 12, 2, 10),
	(2, 13, 3, 10),
	(2, 14, 4, 10),
	(2, 15, 5, 10),
	(2, 27, 6, 10),
	(2, 28, 7, 10),
	(2, 29, 8, 10),
	(2, 30, 9, 10),
	(2, 31, 10, 10),
	(2, 32, 11, 10),
	
	/* In Vitro Enzyme Kinetics */
	(3, 16, 0, 10),
	(3, 1, 1, 10),
	(3, 2, 2, 10),
	(3, 3, 3, 10),
	(3, 4, 4, 10),
	(3, 5, 5, 10),
	(3, 6, 6, 10),
	(3, 7, 7, 10),
	(3, 8, 8, 10),
	(3, 9, 9, 10),
	(3, 10, 10, 10),
	(3, 11, 11, 10),
	
	/* In Vitro Enzyme Screen */
	(4, 16, 0, 10),
	(4, 1, 1, 10),
	(4, 2, 2, 10),
	(4, 3, 3, 10),
	(4, 4, 4, 10),
	(4, 5, 5, 10),
	(4, 6, 6, 10),
	(4, 7, 7, 10),
	(4, 8, 8, 10),
	(4, 9, 9, 10),
	(4, 10, 10, 10),
	(4, 11, 11, 10),
	
	/* In Vitro Transporter Induction */
	(6, 19, 0, 10),
	(6, 1, 1, 10),
	(6, 12, 2, 10),
	(6, 13, 3, 10),
	(6, 15, 4, 10),
	(6, 26, 5, 10),
	(6, 27, 6, 10),
	(6, 28, 7, 10),
	(6, 29, 8, 10),
	(6, 30, 9, 10),
	(6, 31, 10, 10),
	(6, 42, 11, 10)
;


------------------------------------------------------------
-- value_type ----------------------------------------------
------------------------------------------------------------
INSERT INTO value_type (id, name, format) 
	VALUES 
	(1, 'Single value', 1),
	(2, 'Mean', 1),
	(3, 'Mean ± SD', 2),
	(4, 'Mean ± SEM', 2),
	(5, 'Mean (range)', 3),
	(6, 'Mean (CV%)', 5),
	(7, 'Mean (90% CI)', 4),
	(8, 'Mean (95% CI)', 4),
	(9, 'Median', 1),
	(10, 'Median (CV%)', 5),
	(11, 'Median (range)', 3),
	(12, 'Median (90% CI)', 4),
	(13, 'Median (95% CI)', 4)
;


------------------------------------------------------------
-- reset the sequences to reflect the above inserted data -- 
------------------------------------------------------------
select setval_max('public');
