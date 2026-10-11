resource "google_dataform_repository_iam_member" "dataform_repository_iam_members" {
  for_each = var.dataform_repository_iam_members

  member     = each.value.member
  repository = each.value.repository
  role       = each.value.role
  project    = each.value.project
  region     = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

