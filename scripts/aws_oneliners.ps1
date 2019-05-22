

# Get files from S3

get-s3bucket -BucketName ep11-files-987270341901 -Region eu-central-1

get-s3object only reads file info

read-s3object -BucketName ep11-files-987270341901 -File "c:\temp\exol_cache_ed14.bak" -Key "db_bak/exol_cache_ed14.bak" -Region eu-central-1
