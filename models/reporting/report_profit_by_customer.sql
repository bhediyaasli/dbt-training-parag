select 
    b.customerid,
    b.segment,
    b.country,
    sum(profit) as profit
from 
    {{ ref('stg_orders') }} b 
group by 
    b.customerid,
    b.segment,
    b.country