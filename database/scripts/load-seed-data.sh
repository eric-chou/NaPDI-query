#!/bin/bash
# This script purpose for load sample static data
# Adjust postgres DB connection based on your environment

echo "[INFO] Begin load seed data..."

psql -U postgres -h localhost -p 5432 -d demo_napdi_repository -a -f ../functions/setval_max.function.sql
psql -U postgres -h localhost -p 5432 -d demo_napdi_repository -a -f ../seed.sql
psql -U postgres -h localhost -p 5432 -d demo_napdi_repository -a -f ../test.sql
psql -U postgres -h localhost -p 5432 -d demo_napdi_repository -a -f ../seed_concept_ids.sql

echo "[INFO] load seed data finished"
