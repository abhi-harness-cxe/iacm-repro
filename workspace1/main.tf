terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

########################################
# Create a local file
########################################

resource "local_file" "test" {
  filename = "${path.module}/test.txt"
  content  = <<EOT
Hello from Terraform!
Created at: ${timestamp()}
EOT
}

########################################
# Read the file using a data source
########################################

data "local_file" "test" {
  filename = local_file.test.filename

  depends_on = [
    local_file.test
  ]
}

########################################
# Execute a local command
########################################

resource "null_resource" "list_directory" {

  depends_on = [
    local_file.test
  ]

  provisioner "local-exec" {
    command = "ls -la > directory_listing.txt"
  }
}

########################################
# Read the generated directory listing
########################################

data "local_file" "directory_listing" {
  filename = "${path.module}/directory_listing.txt"

  depends_on = [
    null_resource.list_directory
  ]
}

########################################
# Outputs
########################################

output "file_path" {
  value = local_file.test.filename
}

output "file_content" {
  value = data.local_file.test.content
}

output "directory_listing" {
  value = data.local_file.directory_listing.content
}
