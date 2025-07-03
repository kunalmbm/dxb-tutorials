CREATE OR REFRESH MATERIALIZED VIEW config_city
AS
SELECT
  country_code,
  country,
  city,
  city_code,
  _metadata.file_path AS src_file_path,
  _metadata.file_modification_time AS src_file_modification_time,
  _metadata.file_size AS src_file_size,
  current_timestamp() AS upload_timestamp,
  _rescued_data
FROM read_files(
  "/Volumes/workspace/default/vol1/config_data_v2/",
  format => "csv",
  header => true,
  inferSchema => true,
  delimiter => ","
);