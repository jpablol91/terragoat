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
