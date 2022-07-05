### docker example

This is a prepared docker module for terragrunt.

- example usage
```
module "app_layer_container_account"  {
  source = "./modules/app_layer/docker"

  docker_container_image = "form3tech-oss/platformtest-account"
  docker_container_name  = "account_production"

  docker_container_env = [
    "VAULT_ADDR=http://vault-production:8200",
    "VAULT_USERNAME=account-production",
    "VAULT_PASSWORD=123-account-production",
    "ENVIRONMENT=production"
  ]
  docker_container_network = "vagrant_production"
}

```