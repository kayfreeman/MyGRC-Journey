# Triggering the GRC Pipeline

# 1. The Provider
provider "aws" {
  region = "us-east-1"
}

# 2. The Resource (S3 BUCKET)
resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "grc-lab-bucket-kayofreeman-20251124"
  
  # --- THIS IS WHERE THE SKIP BELONGS ---
  # checkov:skip=CKV_AWS_144: "This is a lab environment. Data replication is too expensive."

  tags = {
    Environment = "Dev"
    Owner       = "GRC-Student"
  }
}

# GRC TEST RESOURCE: Hard Drive (EBS)
resource "aws_ebs_volume" "example_drive" {
  availability_zone = "us-east-1a"
  size              = 10
  
  # Perfect Fix!
  encrypted         = true 
  
  tags = {
    Name = "Compliant-Drive"
  }
}