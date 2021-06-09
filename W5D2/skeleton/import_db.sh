#!/usr/bin/env sh
dropdb sqlzoo
createdb -U postgres sqlzoo
psql sqlzoo < data/create_tables.sql
