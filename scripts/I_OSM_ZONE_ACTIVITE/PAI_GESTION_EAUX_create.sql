SET standard_conforming_strings = OFF;
CREATE SCHEMA "osm2igeo";
DROP TABLE IF EXISTS "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" CASCADE;
DELETE FROM geometry_columns WHERE f_table_name = 'i_osm_zone_activite_pai_gestion_eaux' AND f_table_schema = 'osm2igeo';
BEGIN;
CREATE TABLE "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" ( "ogc_fid" SERIAL, CONSTRAINT "i_osm_zone_activite_pai_gestion_eaux_pk" PRIMARY KEY ("ogc_fid") );
SELECT AddGeometryColumn('osm2igeo','i_osm_zone_activite_pai_gestion_eaux','geom',2154,'GEOMETRY',2);
CREATE INDEX "i_osm_zone_activite_pai_gestion_eaux_geom_geom_idx" ON "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" USING GIST ("geom");
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" ADD COLUMN "id" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" ADD COLUMN "nature" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" ADD COLUMN "source" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_gestion_eaux" ADD COLUMN "date_maj" VARCHAR;
COMMIT;