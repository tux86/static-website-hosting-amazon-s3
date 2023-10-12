# Uploads all files from the local "src/dist" directory to a specified AWS S3 bucket.
resource "aws_s3_object" "static_file" {
  for_each     = fileset(local.dist_dir, "**")
  bucket       = aws_s3_bucket.static_website.id
  key          = each.key
  source       = "${local.dist_dir}/${each.value}"
  content_type = lookup(local.content_types, regex("\\.[^.]+$", each.value), null)
  etag         = filemd5("${local.dist_dir}/${each.value}")
}
