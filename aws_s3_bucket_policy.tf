resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = aws_s3_bucket.static_website.id
  policy = data.aws_iam_policy_document.cloudfront.json
}


data "aws_iam_policy_document" "cloudfront" {
  #  statement {
  #    actions = [
  #      "s3:ListBucket",
  #    ]
  #    resources = [
  #      aws_s3_bucket.static_website.arn,
  #    ]
  #    principals {
  #      type = "AWS"
  #      identifiers = [
  #        aws_cloudfront_origin_access_identity.current.iam_arn,
  #      ]
  #    }
  #  }

  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.static_website.arn}/*",
    ]
    principals {
      type = "AWS"

      identifiers = [
        aws_cloudfront_origin_access_identity.current.iam_arn,
      ]
    }
  }

  #  statement {
  #    sid    = "AllowSSLRequestsOnly"
  #    effect = "Deny"
  #    actions = [
  #      "s3:*",
  #    ]
  #    condition {
  #      test     = "Bool"
  #      variable = "aws:SecureTransport"
  #      values   = ["false"]
  #    }
  #    principals {
  #      type        = "*"
  #      identifiers = ["*"]
  #    }
  #    resources = [
  #      aws_s3_bucket.static_website.arn,
  #      "${aws_s3_bucket.static_website.arn}/*"
  #    ]
  #  }
}