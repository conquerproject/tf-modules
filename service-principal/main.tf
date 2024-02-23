provider "azurerm" {
  features {
  }
}

provider "azuread" {
}

data "azuread_users" "owners" {
  user_principal_names = var.owners
}

locals {
  # { "/subs../id" => ["Role", ...] } => { "/subs.../id:Role" = { scope = "/subs.../id", role = "Role" }, ... }
  role_assignments = merge([
    for scope, roles in var.permissions : {
      for role in roles : "${scope}:${role}" => {
        scope = scope
        role  = role
      }
    }
  ]...)
}

locals {
  subject_name = {
    for name in var.subjects :
    name => replace(replace(replace(replace(name, "repo:", ""), ":", "-"), "ref:refs/heads", ""), "/", "-")
  }
}

resource "azuread_application" "oidc" {
  display_name            = var.app_name
  owners                  = data.azuread_users.owners.object_ids
  description             = "Application for ${var.app_name}"
  prevent_duplicate_names = var.prevent_duplicate_names

  api {
    requested_access_token_version = 2
  }
}

resource "azuread_service_principal" "oidc" {
  client_id   = azuread_application.oidc.client_id
  description = "Service principal for ${var.app_name}"
}

resource "azuread_application_federated_identity_credential" "this" {
  for_each       = local.subject_name 
  application_id = azuread_application.oidc.id
  display_name   = each.value
  description    = "Deployments for ${each.key}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = each.key
}

resource "azurerm_role_assignment" "this" {
  for_each             = local.role_assignments
  scope                = each.value.scope
  role_definition_name = each.value.role
  principal_id         = azuread_service_principal.oidc.id 
}

