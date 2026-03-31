variable "example_var" {
  description = "An example variable"
  type        = string
  default     = "test"
}

output "test_output" {
  value = var.example_var
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-terraform-state-bucketcxeeeeeeeeeq"  # Replace with a globally unique bucket name
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

module "vpn-module" {
  source  = "app.harness.io/B91tP-WFQKiWjJ_i0OoZ1g/vpn-module/aws"
  version = "v2.0.0"
}

