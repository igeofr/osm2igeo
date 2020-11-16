SET standard_conforming_strings = OFF;
CREATE SCHEMA "osm2igeo";
DROP TABLE IF EXISTS "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" CASCADE;
DELETE FROM geometry_columns WHERE f_table_name = 'i_osm_zone_activite_pai_administratif_militaire' AND f_table_schema = 'osm2igeo';
BEGIN;
CREATE TABLE "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" ( "ogc_fid" SERIAL, CONSTRAINT "i_osm_zone_activite_pai_administratif_militaire_pk" PRIMARY KEY ("ogc_fid") );
SELECT AddGeometryColumn('osm2igeo','i_osm_zone_activite_pai_administratif_militaire','geom',2154,'GEOMETRY',2);
CREATE INDEX "i_osm_zone_activite_pai_administratif_militaire_geom_geom_idx" ON "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" USING GIST ("geom");
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" ADD COLUMN "id" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" ADD COLUMN "nature" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" ADD COLUMN "nom" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" ADD COLUMN "source" VARCHAR;
ALTER TABLE "osm2igeo"."i_osm_zone_activite_pai_administratif_militaire" ADD COLUMN "date_maj" VARCHAR;
COMMIT;
