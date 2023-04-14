{%- macro create_spectrum_schema() -%}

{%- set query %}
create external schema spectrum
from data catalog
database 'spectrum'
iam_role '{{ env_var("SPECTRUM_IAM_ROLE") }}'
create external database if not exists;
{%- endset %}

{%- do run_query(query) %}

{%- endmacro -%}
