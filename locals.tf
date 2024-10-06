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
      execution_mode      = "local"
      project_id          = module.project["ks-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/ks-eci-terraform-github"
    }
  }
}
