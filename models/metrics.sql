{{
    config(
        materialized="incremental",
        unique_key=["ymd"],
        sort="ymd",
    )
}}

select *
from {{ source("src", "metrics") }}
where collector_date = getdate()::date
