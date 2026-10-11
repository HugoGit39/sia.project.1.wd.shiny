############################################################################################
#
# Function for GitHub links
#
# Stress in Action 2025
#
#############################################################################################

# Links point to the GitHub owner this copy came from, so HugoGit39 copies link to
# HugoGit39 and stress-in-action copies (and the live server) to stress-in-action.
github_owner <- function(default = "stress-in-action") {
  # A git clone: owner of its origin remote
  url <- tryCatch(
    suppressWarnings(system2("git", c("-C", shQuote(getwd()), "config", "--get", "remote.origin.url"),
                             stdout = TRUE, stderr = FALSE)),
    error = function(e) character(0)
  )
  if (length(url) == 1 && grepl("github\\.com[:/]", url)) {
    return(sub(".*github\\.com[:/]([^/]+)/.*", "\\1", url))
  }
  default
}

github_url <- function(repo) {
  paste0("https://github.com/", github_owner(), "/", repo)
}
