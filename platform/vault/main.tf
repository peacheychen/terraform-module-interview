terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    vault = {
      version = ">= 3.0.1"
    }
  }
}

resource "vault_generic_secret" "secret" {
#   name = "account-$(var.environment)"
  # provider = vault.vault_prod
  path     = var.vault_generic_secret_path

  data_json = var.vault_generic_secret_data_json
}

resource "vault_policy" "policy" {
#   provider = vault.vault_prod
  name     = var.vault_policy_name

  policy = var.vault_policy_policy
}

data "vault_auth_backend" "userpass" {
  path = "userpass"
}

resource "vault_generic_endpoint" "endpoint" {
#   provider             = vault.vault_prod
  # depends_on           = [data.vault_auth_backend.userpass]
  depends_on           = [var.vault_generic_endpoint_depends_on]
  path                 = var.vault_generic_endpoint_path
  ignore_absent_fields = true

  data_json = var.vault_generic_endpoint_data_json
}
