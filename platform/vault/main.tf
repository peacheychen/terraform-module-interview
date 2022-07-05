terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    vault = {
      version = ">= 3.0.1"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret

resource "vault_generic_secret" "secret" {
#   name = "account-$(var.environment)"
  # provider = vault.vault_prod
  path     = var.vault_generic_secret_path

  data_json = var.vault_generic_secret_data_json
}

# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy

resource "vault_policy" "policy" {
#   provider = vault.vault_prod
  name     = var.vault_policy_name

  policy = var.vault_policy_policy
}

# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/auth_backend
data "vault_auth_backend" "userpass" {
  path = "userpass"
}

# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint

resource "vault_generic_endpoint" "endpoint" {
#   provider             = vault.vault_prod
  # depends_on           = [data.vault_auth_backend.userpass]
  depends_on           = [var.vault_generic_endpoint_depends_on]
  path                 = var.vault_generic_endpoint_path
  ignore_absent_fields = true

  data_json = var.vault_generic_endpoint_data_json
}
