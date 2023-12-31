# create a s3 bucket

resource "aws_s3_bucket" "my_portfolio" {
  bucket = var.bucket-name
}

# upload index.html and error.html 
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.my_portfolio.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  acl = "public-read"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.my_portfolio.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  acl = "public-read"
}

# make pulic for everyone
resource "aws_s3_bucket_public_access_block" "bucket-policies" {
  bucket = aws_s3_bucket.my_portfolio.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}



resource "aws_s3_bucket_policy" "hosting_bucket_policy" {
  bucket = aws_s3_bucket.my_portfolio.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::${var.bucket-name}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "static-site-configuration" {
  bucket = aws_s3_bucket.my_portfolio.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}