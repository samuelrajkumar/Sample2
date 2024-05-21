use schema NEW_DEMO;
create or replace TABLE NEW_DEMO.EMPLOYEE (
	ID NUMBER(38,0),
	NAME VARCHAR(16777216),
	DOB VARCHAR(16777216),
	PHONE NUMBER(38,0),
	PAN VARCHAR(16777216),
	EMAIL VARCHAR(16777216),
	DEPARTMENT VARCHAR(16777216),
	SALARY NUMBER(38,0),
	EXPERIENCE NUMBER(38,0)
);
create or replace file format my_csv_format
  type = csv
  record_delimiter = '\n'
  field_delimiter = ','
  skip_header = 1;

CREATE STORAGE INTEGRATION IF NOT EXISTS s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::211125542189:role/aws_admin'
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://bucketstg/csvfiles/');

  CREATE STAGE IF NOT EXISTS AWS_STG 
  STORAGE_INTEGRATION = s3_int
  URL = 's3://bucketstg/csvfiles/'
  FILE_FORMAT = my_csv_format;

  
