
CREATE OR REFRESH STREAMING TABLE transaction_bronze
TBLPROPERTIES (
  'delta.columnMapping.mode' = 'name'
)
COMMENT "User purchase transaction details";

CREATE FLOW transaction_bronze_flow AS
INSERT INTO transaction_bronze BY NAME
  SELECT
    `transaction_id` AS transaction_id,
    `user_id` AS user_id,
    `item` AS item,
    `amount` AS amount,
    `timestamp` AS timestamp,
    `city_code` AS city_code,
    _metadata.file_path AS src_file_path,
    _metadata.file_modification_time AS src_file_modification_time,
    _metadata.file_size AS src_file_size,
    current_timestamp() AS upload_timestamp,
    _rescued_data
  FROM STREAM read_files(
      "/Volumes/workspace/default/vol1/transaction_data_v2/",
      format => "csv",
      header => true,
      inferSchema => true,
      delimiter => ","
  )