SET standard_conforming_strings = OFF;
CREATE SCHEMA "osm2igeo";
DROP TABLE IF EXISTS "osm2igeo"."x_osm_topo_topo_poi" CASCADE;
DELETE FROM geometry_columns WHERE f_table_name = 'x_osm_topo_topo_poi' AND f_table_schema = 'osm2igeo';
BEGIN;
CREATE TABLE "osm2igeo"."x_osm_topo_topo_poi" ( "ogc_fid" SERIAL, CONSTRAINT "x_osm_topo_topo_poi_pk" PRIMARY KEY ("ogc_fid") );
SELECT AddGeometryColumn('osm2igeo','x_osm_topo_topo_poi','geom',2154,'GEOMETRY',2);
CREATE INDEX "x_osm_topo_topo_poi_geom_geom_idx" ON "osm2igeo"."x_osm_topo_topo_poi" USING GIST ("geom");
ALTER TABLE "osm2igeo"."x_osm_topo_topo_poi" ADD COLUMN "id" VARCHAR;
ALTER TABLE "osm2igeo"."x_osm_topo_topo_poi" ADD COLUMN "nature" VARCHAR;
ALTER TABLE "osm2igeo"."x_osm_topo_topo_poi" ADD COLUMN "nom" VARCHAR;
ALTER TABLE "osm2igeo"."x_osm_topo_topo_poi" ADD COLUMN "elev" VARCHAR;
ALTER TABLE "osm2igeo"."x_osm_topo_topo_poi" ADD COLUMN "source" VARCHAR;
ALTER TABLE "osm2igeo"."x_osm_topo_topo_poi" ADD COLUMN "date_maj" VARCHAR;
COMMIT;