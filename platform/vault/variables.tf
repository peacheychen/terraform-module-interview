# Input variable definitions

# vault_generic_secret
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret

variable "vault_generic_secret_data_json" {
  description = "(Required) String containing a JSON-encoded object that will be written as the secret data at the given path. "
}

variable "vault_generic_secret_path" {
  description = "(Required) The full logical path at which to write the given data"
  type        = string
  default     = ""
}

# vault_policy
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy
variable "vault_policy_name" {
  description = "(Required) The name of the policy"
  type        = string
  default     = ""
}

variable "vault_policy_policy" {
  description = "(Required) String containing a Vault policy"
}

# vault_generic_endpoint
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint
variable "vault_generic_endpoint_path" {
  description = "(Required) The full logical path at which to write the given data. Consult each backend's documentation to see which endpoints support the PUT methods and to determine whether they also support DELETE and GET."
}

variable "vault_generic_endpoint_data_json" {
  description = "(Required) String containing a JSON-encoded object that will be written to the given path as the secret data."
}

variable "vault_generic_endpoint_depends_on" {
  description = "depends on vault_auth_backend"
}
