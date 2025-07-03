CREATE MATERIALIZED VIEW mapped_transaction
AS 
select 
  t.transaction_id, t.user_id, t.item, t.amount, c.city, c.country, t.`timestamp` 
from transaction t left join config_city c on t.city_code = c.city_code;
