variable "environment_code" {
  type        = string
  description = "Environment to deploy to"

  validation {
    condition = contains([
      "dev01",
      "tst01",
      "stg01",
      "dmo01",
      "prd01"
    ], var.environment_code)
    error_message = "[environment_code] not part of accepted list"
  }
}

variable "region_code" {
  type        = string
  description = "Region to deploy to"

  validation {
    condition = contains([
      "aen01",
      "aus01",
      "cac01",
      "neu01",
      "wus01",
      "wu301"
    ], var.region_code)
    error_message = "[region_code] not part of accepted list"
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
