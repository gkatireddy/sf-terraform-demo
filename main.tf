terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "Snowflake_demos"

    workspaces {
      name = "gh-actions-demo-new"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema_2" {
  database = snowflake_database.demo_db.name
  name     = "DEMO_SCHEMA_2"
  comment  = "Schema for Snowflake Terraform demo 2"
}