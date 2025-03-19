variable "example_var" {
  description = "An example variable"
  type        = string
  default     = "test"
}

output "test_output" {
  value = var.example_var
}
