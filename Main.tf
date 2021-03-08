terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "ab" {
  name     = "amin01"
  location= var.location
  }

resource "azurerm_resource_group" "ra" {
  name     ="amin02"
  location =var.location2
}

  terraform {
  

 backend "remote" {
   organization = "nik1"
   workspaces {
     name = "Example-Workspace"
   }
 }
  }