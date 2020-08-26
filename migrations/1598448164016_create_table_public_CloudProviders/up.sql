CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE "public"."CloudProviders"("id" uuid NOT NULL DEFAULT gen_random_uuid(), "name" name NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("name"));
