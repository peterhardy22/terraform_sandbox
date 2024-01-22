terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "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"
}

resource "github_repository" "terraform_sandbox" {
  name        = "terraform_sandbox"
  description = "Repository for holding terraform examples and experiments"

  visibility = "public"
}