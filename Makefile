upload:
	aws s3 cp data.csv "s3://${S3_BUCKET}/dbt_external_tables/$(date '+%Y/%m/%d')/"

init:
	dbt deps

create_external_table:
	redshift-credentials --workgroup default -- dbt run-operation --profiles-dir . create_spectrum_schema
	redshift-credentials --workgroup default -- dbt run-operation --profiles-dir . stage_external_sources

build:
	redshift-credentials --workgroup default -- dbt build --profiles-dir .

fmt:
	sqlfmt models
