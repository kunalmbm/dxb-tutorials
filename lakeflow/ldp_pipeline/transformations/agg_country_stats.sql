CREATE OR REFRESH MATERIALIZED VIEW country_stats
AS
select 
  country, sum(amount) total_spend, count(transaction_id) as total_transactions  
from mapped_transaction group by country;