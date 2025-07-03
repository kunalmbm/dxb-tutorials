CREATE OR REFRESH STREAMING TABLE transaction_clean (
  CONSTRAINT no_rescued_data EXPECT (_rescued_data IS NULL) ON VIOLATION DROP ROW,
  CONSTRAINT valid_user_id EXPECT (user_id is not null) ON VIOLATION DROP ROW,
  CONSTRAINT valid_amount EXPECT (amount is not null) ON VIOLATION DROP ROW
)
COMMENT "clean table for user transactions";

CREATE FLOW transaction_clean_flow AS
INSERT INTO transaction_clean BY NAME
SELECT 
  *, 'APPEND' AS operation
FROM STREAM transaction_bronze;