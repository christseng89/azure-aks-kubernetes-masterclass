# Terraform Resource to Create Azure Resource Group with Input Variables defined in variables.tf

resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location
  # https://github.com/hashicorp/terraform-provider-azurerm/issues/7034
  tags = {
    "owner" = var.owner
  }
  lifecycle {
    ignore_changes = [tags.changedbyui]
  }
}
