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

CREATE VOLUME IF NOT EXISTS vol1;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC import os
-- MAGIC os.mkdir('/Volumes/workspace/default/vol1/config_data_v2')
-- MAGIC os.mkdir('/Volumes/workspace/default/vol1/transaction_data_v2')

-- COMMAND ----------

-- MAGIC %sh curl https://raw.githubusercontent.com/kunalmbm/dxb-tutorials/main/lakeflow/sample_data/config1.csv --output /Volumes/workspace/default/vol1/config_data_v2/config1.csv

-- COMMAND ----------

-- MAGIC %sh curl https://raw.githubusercontent.com/kunalmbm/dxb-tutorials/main/lakeflow/sample_data/config2.csv --output /Volumes/workspace/default/vol1/config_data_v2/config1.csv

-- COMMAND ----------

-- LIST "/Volumes/workspace/default/vol1/config_data_v1/";
SELECT * FROM csv.`/Volumes/workspace/default/vol1/config_data_v2/`;

-- COMMAND ----------

-- MAGIC %sh curl https://raw.githubusercontent.com/kunalmbm/dxb-tutorials/main/lakeflow/sample_data/transactions1.csv --output /Volumes/workspace/default/vol1/transaction_data_v2/transactions1.csv

-- COMMAND ----------

-- MAGIC %sh curl https://raw.githubusercontent.com/kunalmbm/dxb-tutorials/main/lakeflow/sample_data/transactions2.csv --output /Volumes/workspace/default/vol1/transaction_data_v2/transactions2.csv
-- MAGIC

-- COMMAND ----------

-- LIST "/Volumes/workspace/default/vol1/transaction_data_v1/"
SELECT * FROM csv.`/Volumes/workspace/default/vol1/transaction_data_v2/`;

-- COMMAND ----------

-- for cleanup 
DROP VOLUME IF EXISTS vol3;
ALTER VOLUME vol1 RENAME TO vol2;

-- COMMAND ----------

-- cell to query the tables
select * from mapped_transaction;
