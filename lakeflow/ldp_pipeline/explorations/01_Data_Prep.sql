-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### Prepare Sample Data
-- MAGIC
-- MAGIC Prepare the sample data for pipeline ingestion

-- COMMAND ----------

-- !!! Before performing any data analysis, make sure to run the pipeline to materialize the sample datasets. The tables referenced in this notebook depend on that step.

USE CATALOG `workspace`;
USE SCHEMA `default`;

SELECT current_catalog(), current_schema();

-- COMMAND ----------

-- MAGIC %sh curl https://github.com/kunalmbm/dxb-tutorials/blob/ae70038f05f2d5ac9215ee99f60bbac4bae93df2/lakeflow/sample_data/config_table.csv --output /Volumes/workspace/default/vol1/config_data/curl-subway.csv
-- MAGIC
