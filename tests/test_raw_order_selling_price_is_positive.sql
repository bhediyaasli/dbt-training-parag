with orders as (
    select * from {{ ref('raw_orders') }}
)
select 
    * 
from 
    orders