provider "github" {
  owner = var.gh_organization
}

resource "github_repository" "repos" {
  for_each           = var.repos
  name               = each.key
  description        = each.value.description
  visibility         = each.value.visibility
  allow_merge_commit = each.value.allow_merge_commit
  allow_squash_merge = each.value.allow_squash_merge
  allow_rebase_merge = each.value.allow_rebase_merge
  has_wiki           = try(each.value.has_wiki, false)
  has_issues         = each.value.has_issues
}

resource "github_branch_protection" "main" {
  for_each = var.repos
  repository_id = each.key
  pattern = "main"
  enforce_admins = try(each.value.branch_protection.enforce_admins, true)
  required_linear_history = try(each.value.branch_protection.linear_history, true)
  require_conversation_resolution =try(each.value.branch_protection.conversation_resolution, true)
  required_pull_request_reviews {
    required_approving_review_count = 1
  }
}