output "environment_code" {
  description = "Environment Code"
  value       = var.environment_code
}

output "product_storage_account_name" {
  description = "Product Storage Name"
  value       = module.storage.storage_account_name
}
