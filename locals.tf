locals {
  project = {
    "ks-eci-project" = {
      description = "Example description for the project"
    }
  }
  workspace = {
    "ks-eci-tfe" = {
      description    = "Example description for the workspace"
      execution_mode = "local"
      project_id     = module.project["ks-eci-project"].id
    }
  }
} 
