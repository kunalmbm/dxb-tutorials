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

-- MAGIC %sh curl https://raw.githubusercontent.com/kunalmbm/dxb-tutorials/main/lakeflow/sample_data/config2.csv --output /Volumes/workspace/default/vol1/config_data_v2/config1.csv

-- COMMAND ----------

-- LIST "/Volumes/workspace/default/vol1/config_data_v1/";
SELECT * FROM csv.`/Volumes/workspace/default/vol1/config_data_v2/`;

-- COMMAND ----------

-- MAGIC %sh curl https://raw.githubusercontent.com/kunalmbm/dxb-tutorials/main/lakeflow/sample_data/transactions2.csv --output /Volumes/workspace/default/vol1/transaction_data_v2/transactions2.csv
-- MAGIC

-- COMMAND ----------

-- LIST "/Volumes/workspace/default/vol1/transaction_data_v1/"
SELECT * FROM csv.`/Volumes/workspace/default/vol1/transaction_data_v2/`;

-- COMMAND ----------

select current_timestamp();

-- COMMAND ----------

DROP VOLUME IF EXISTS vol3;

-- COMMAND ----------

ALTER VOLUME vol1 RENAME TO vol2;

-- transaction_id,user_id,item,amount,timestamp,city_code
-- T1000,U1010,Headphones,470.15,2025-07-01 10:00:00,MUC
-- T1001,U1008,Headphones,930.41,2025-07-01 10:05:00,ROM
-- T1002,U1005,Monitor,1490.4,2025-07-01 10:10:00,BER

-- country_code,country,city,city_code
-- DE,Germany,Munich,MUC
-- DE,Germany,Berlin,BER
-- FR,France,Paris,PAR
-- IT,Italy,Rome,ROM
-- ES,Spain,Barcelona,BCN

-- COMMAND ----------



-- COMMAND ----------

select transaction_id, user_id, item, amount, `timestamp`, upload_timestamp from transaction_bronze order by upload_timestamp, transaction_id;
