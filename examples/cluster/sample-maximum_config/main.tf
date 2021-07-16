module "databricks_workspace_management" {
  source = "../../../"

  workspace_url = "https://test-tomarv2.cloud.databricks.com"
  dapi_token    = var.dapi_token
  # ------------------------------------------------
  # Admin Console
  # ------------------------------------------------
  /*
  # NOTE: 2 options are available:
    - No `create_user`: no permissions are configured.
    - `databricks_username`, `create_user`, and `create_group` to create user(user should not be existing already) and group.
    - Provide `create_user` and `databricks_username`
  */
  databricks_username = "demo@demo.com"
  create_user         = true
  create_group        = true
  /*
  # ------------------------------------------------
  # NOTE: If `databricks_username` is not provided, no permissions are configured
  databricks_username = "demo@demo.com"
  */
  aws_attributes = {
    instance_profile_arn = "arn:aws:iam::123456789012:instance-profile/demo-role"
  }
  # ------------------------------------------------
  # CLUSTER
  # ------------------------------------------------
  deploy_cluster                  = true
  cluster_autotermination_minutes = 30
  fixed_value                     = 1
  auto_scaling                    = [2, 3]
  # ------------------------------------------------
  # Cluster Instance Pool
  # ------------------------------------------------
  deploy_instance_pool                  = false
  min_idle_instances                    = 1
  max_capacity                          = 5
  idle_instance_autotermination_minutes = 30
  # ------------------------------------------------
  # Cluster Policy
  # ------------------------------------------------
  cluster_policy_max_dbus_per_hour       = 5
  cluster_policy_autotermination_minutes = 5
  # ------------------------------------------------
  # Cluster Worker Type
  # ------------------------------------------------
  local_disk    = 0
  min_cores     = 0
  gb_per_core   = 0
  min_gpus      = 0
  min_memory_gb = 0
  category      = "General purpose"
  # ------------------------------------------------
  # Do not change the teamid, prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
