variable "gh_organization" {
  type = string
}

variable "repos" {
  description = "GitHub Repositories"
  type = map(object({
    description        = string
    visibility         = string
    allow_merge_commit = bool
    allow_squash_merge = bool
    allow_rebase_merge = bool
    has_wiki           = optional(bool)
    has_issues         = bool
  }))
}

