provider "aws" {
  region  = var.region
  profile = "iam-admin-kg-prod"

}

resource "aws_s3_bucket" "killer_games" {
  bucket = "killer.games"
}

resource "aws_s3_bucket" "www_killer_games" {
  bucket = "www.killer.games"
}

resource "aws_s3_bucket_website_configuration" "killer_games" {
  bucket = aws_s3_bucket.killer_games.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_website_configuration" "www_killer_games" {
  bucket = aws_s3_bucket.www_killer_games.bucket
  redirect_all_requests_to {
    host_name = var.domain_name
    protocol  = "http"
  }

}