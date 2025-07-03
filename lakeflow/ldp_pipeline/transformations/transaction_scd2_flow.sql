CREATE OR REFRESH STREAMING TABLE transaction_history
COMMENT "history table for user transactions";

CREATE FLOW transaction_history_flow
AS AUTO CDC INTO transaction_history
FROM stream(transaction_clean)
KEYS (transaction_id)
APPLY AS DELETE WHEN
operation = "DELETE"
SEQUENCE BY timestamp
COLUMNS * EXCEPT (src_file_path, src_file_modification_time, src_file_size, upload_timestamp, operation, _rescued_data)
STORED AS SCD TYPE 2;