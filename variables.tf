variable "dataform_repository_iam_members" {
  description = <<EOT
Map of dataform_repository_iam_members, attributes below
Required:
    - member
    - repository
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member     = string
    repository = string
    role       = string
    project    = optional(string)
    region     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

