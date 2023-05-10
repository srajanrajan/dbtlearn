

      create or replace transient table airbnb.dev.dim_listings_w_hosts  as
      (

WITH
l AS (
    SELECT
        *
    FROM
        airbnb.dev.dim_listings_cleansed
),
h AS (
    SELECT * 
    FROM airbnb.dev.dim_hosts_cleansed
)

SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM l
LEFT JOIN h ON (h.host_id = l.host_id)
      );
    