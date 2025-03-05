{{
    config(
        materialized='view'
    )
}}

select 
    b.productid,
    b.productname,
    b.category,
    b.subcategory,
    sum(b.profit) as profit
from 
    {{ ref('stg_orders') }} b
group by 
    b.productid,
    b.productname,
    b.category,
    b.subcategory 