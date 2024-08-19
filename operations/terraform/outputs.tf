output "environment_code" {
  description = "Environment Code"
  value       = var.environment_code
}

output "region_code" {
  description = "Region Code"
  value       = var.region_code
}

output "product_storage_account_name" {
  description = "Product Storage Name"
  value       = module.storage.storage_account_name
}

output "storage_account_id" {
  description = "Product Storage Name"
  value       = module.storage.storage_account_id
}

output "product_storage_account_primary_access_key" {
  description = "Product Storage AccessKey"
  value       = module.storage.storage_account_primary_access_key
  sensitive   = true
}