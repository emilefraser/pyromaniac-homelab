variable "environment" {
  type        = string
  description = "Environment to deploy to"

  validation {
    condition = contains([
      "dev",
    ], var.environment_code)
    error_message = "[environment_code] not part of accepted list"
  }
}

variable "product_code" {
  type        = string
  description = "Resource Code for the project"

  validation {
    condition     = length(var.product_code) >= 3
    error_message = "[product_code] must be at least 3 characters long"
  }
}
