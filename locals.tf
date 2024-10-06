locals {
  project = {
    "ks-eci-project" = {
      description = "Example description for the project"
    }
  }
  workspace = {
    "ks-eci-tfe" = {
      description         = "Example description for the workspace"
      execution_mode      = "remote"
      project_id          = module.project["ks-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/ks-eci-terraform-tfe"
    }
    "ks-eci-github" = {
      description         = "Example automation workspace for GitHub resources"
      execution_mode      = "remote"
      project_id          = module.project["ks-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/ks-eci-terraform-github"
    }

    "ks-eci-aws-network" = {
      description         = "Example automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["ks-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/ks-eci-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "ks-eci"
        },
      ]
    }

    "ks-eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["ks-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/ks-eci-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "kirilsoshnin.com"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "ks-eci-kirilsoshnin"
        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "ks-eci"
        },
      ]
    }

    "ks-eci-product-service-example-go-prod" = {
      description         = "Example automation for product service resources."
      execution_mode      = "remote"
      project_id          = module.project["ks-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/ks-eci-terraform-product-service-example-go"

      variables = [
        {
          category = "terraform"
          key      = "cluster_name"
          value    = "ks-eci-kirilsoshnin-prod"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
      ]
    }
  }
}
