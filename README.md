# Databricks Lakeflow – Hands-On Implementation

This repository contains the source code, sample data, and setup instructions for the hands-on implementation described in the Medium article:  
**Databricks Lakeflow: A Unified Data Engineering Solution**

## 📌 Overview

Databricks Lakeflow is a unified data engineering solution that simplifies the ingestion, transformation, and orchestration of both batch and streaming data pipelines. This repo demonstrates how to build a complete Lakeflow pipeline using:

- Full-load ingestion with materialized views
- Incremental ingestion using streaming tables and Auto Loader
- Change Data Capture (CDC) and Slowly Changing Dimensions (SCD)
- Stream-static joins and aggregations
- Medallion Architecture (Bronze, Silver, Gold layers)

---

## 📁 Repository Structure
lakeflow/
lakeflow/
│
├── sample_data/
│   ├── config_data_v1.csv
│   ├── config_data_v2.csv
│   ├── transactions_v1.csv
│   └── transactions_v2.csv
│
├── ldp_pipeline/transformations/
│   ├── agg_country_stats.sql
│   ├── config_city_mv.sql
│   ├── transaction_bronze_flow.sql
│   ├── transaction_clean_flow.sql
│   ├── transaction_scd1_flow.sql
│   ├── transaction_scd2_flow.sql
│   ├── mapped_transaction_flow.sql
│   └── country_stats.sql
│
├── ldp_pipeline/explorations/
│   └── setup_notebook.py
│
└── README.md


