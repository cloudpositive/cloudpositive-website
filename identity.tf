 resource "azurerm_user_assigned_identity" "wordpress_uami" {
  location            = azurerm_resource_group.frontend-rg.location
  name                = "cpw-p-frnt-uami"
  resource_group_name = azurerm_resource_group.frontend-rg.name
}

#resource "azurerm_role_assignment" "frntend_uami_role_assignment" {
#  scope                = azurerm_resource_group.frontend-rg.id
#  role_definition_name = "Contributor"
#  principal_id         = azurerm_user_assigned_identity.frntend_uami.principal_id
#}

# resource "azurerm_role_assignment" "mi_to_acs" {
#  principal_id         = azurerm_user_assigned_identity.wordpress.principal_id
#  role_definition_name = "Contributor"
#  scope                = azurerm_communication_service.acs.id
# }