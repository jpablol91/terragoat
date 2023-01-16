provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dockingbay" {
  bucket_prefix = "docking-bay-storage-"

  tags = {
    Name                 = "Docking Bay"
    Environment          = "Dev"
    git_commit           = "682fa6d0c9e1b0a16857a06ff3389e599cd881c7"
    git_file             = "simple_instance/s3.tf"
    git_last_modified_at = "2023-01-15 22:28:55"
    git_last_modified_by = "jpablol91@gmail.com"
    git_modifiers        = "jpablol91"
    git_org              = "jpablol91"
    git_repo             = "terragoat"
    yor_trace            = "20ce17b3-eddb-40d6-ae01-db27427d0f03"
  }
}


resource "aws_s3_bucket_versioning" "dockingbay" {
  bucket = aws_s3_bucket.dockingbay.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "destination" {
  bucket = aws_s3_bucket.dockingbay.id
  versioning_configuration {
    status = "Enabled"
  }
  tags = {
    git_commit           = "12b2d84df771fdc3ad4fa6cf47ffdc7a504595fd"
    git_file             = "simple_instance/s3.tf"
    git_last_modified_at = "2023-01-16 02:12:31"
    git_last_modified_by = "jpablol91@gmail.com"
    git_modifiers        = "jpablol91"
    git_org              = "jpablol91"
    git_repo             = "terragoat"
    yor_trace            = "f0d13360-e10a-4ed1-83ba-cdacc60b7591"
  }
}

resource "aws_iam_role" "replication" {
  name               = "aws-iam-role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
  tags = {
    git_commit           = "12b2d84df771fdc3ad4fa6cf47ffdc7a504595fd"
    git_file             = "simple_instance/s3.tf"
    git_last_modified_at = "2023-01-16 02:12:31"
    git_last_modified_by = "jpablol91@gmail.com"
    git_modifiers        = "jpablol91"
    git_org              = "jpablol91"
    git_repo             = "terragoat"
    yor_trace            = "1b0bf845-20ac-4c6b-9f29-a73e79ca4b35"
  }
}

resource "aws_s3_bucket_replication_configuration" "dockingbay" {
  depends_on = [aws_s3_bucket_versioning.dockingbay]
  role       = aws_iam_role.dockingbay.arn
  bucket     = aws_s3_bucket.dockingbay.id
  rule {
    id     = "foobar"
    status = "Enabled"
    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}


resource "aws_s3_bucket" "dockingbay_log_bucket" {
  bucket = "dockingbay-log-bucket"
  tags = {
    git_commit           = "8626f6a881df05c2389abfa4d11a1907450bd402"
    git_file             = "simple_instance/s3.tf"
    git_last_modified_at = "2023-01-16 02:12:42"
    git_last_modified_by = "jpablol91@gmail.com"
    git_modifiers        = "jpablol91"
    git_org              = "jpablol91"
    git_repo             = "terragoat"
    yor_trace            = "75d2c165-a3f1-4c42-ae2a-8b912cc36bc7"
  }
}

resource "aws_s3_bucket_logging" "dockingbay" {
  bucket = aws_s3_bucket.dockingbay.id

  target_bucket = aws_s3_bucket.dockingbay_log_bucket.id
  target_prefix = "log/"
}
