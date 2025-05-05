terraform {
  backend "s3" {
    bucket         = "iacm-repro-cxe"   # Replace with your S3 bucket name
    key            = "workspacerg/terraform.tfstate"      # Path within the bucket (can be folders)
    region         = "ap-south-1"                      # Replace with your desired AWS region
    encrypt        = true                             # Encrypt the state file at rest  }
}
}

variable "example_var" {
  description = "An example variable"
  type        = string
  default     = "test"
}

output "test_output" {
  value = var.example_var
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-terraform-state-bucketcxeeeeeeeeeqtpie"  # Replace with a globally unique bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

provider "aws" {
  region  = "ap-south-1"                   # Replace with your desired AWS region
}


