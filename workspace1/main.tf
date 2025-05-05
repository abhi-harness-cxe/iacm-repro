variable "example_var" {
  description = "An example variable"
  type        = string
  default     = "test"
}

output "test_output" {
  value = var.example_var
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-terraform-state-bucketcxeeeeeeeee"  # Replace with a globally unique bucket name
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

