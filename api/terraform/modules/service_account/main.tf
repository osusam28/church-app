resource "google_service_account" "service_account" {
  account_id   = var.service_account_map.account_id
}

resource "google_project_iam_member" "iam_permission" {
  for_each = toset(var.service_account_map.roles)
  role     = each.key
  member   = "serviceAccount:${google_service_account.service_account.email}"
}