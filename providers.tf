terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# === 🌍 PROVIDERS ===
provider "aws" {
  region = "us-east-1"
}

provider "google" {
  credentials = file("~/.cloud_keys/gcp/my_terraform-key.json")
  project     = "superbach1986"
}

provider "azurerm" {
  features {}
}
