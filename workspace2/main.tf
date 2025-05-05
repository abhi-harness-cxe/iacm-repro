output "greeting" {
  value = "Hello, World"
}

variable "example_var" {
  description = "An example variable"
  type        = string
  default     = "test"
}

terraform {
  backend "s3" {
    bucket         = "iacm-repro-cxe"   # Replace with your S3 bucket name
    key            = "workspace2/terraform.tfstate"      # Path within the bucket (can be folders)
    region         = "ap-south-1"                      # Replace with your desired AWS region
    encrypt        = true                             # Encrypt the state file at rest  }
}
}
