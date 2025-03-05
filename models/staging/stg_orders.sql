{{
    config(
        materialized='table'
    )
}}

select 
    -- from raw_orders
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - ordercostprice as profit,
    o.ordercostprice,
    o.ordersellingprice,
    -- from raw_customers
    c.customername,
    c.segment,
    c.country,
    c.customerid,
    -- from raw products
    p.category,
    p.productname,
    p.productid,
    p.subcategory
from {{ ref('raw_orders') }} o
left join {{ ref('raw_customers') }} c 
on o.customerid = c.customerid
left join {{ ref('raw_products') }} p 
on o.productid = p.productid