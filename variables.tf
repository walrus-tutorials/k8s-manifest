
# @label "Source Type"
# @options ["yaml", "http"]
variable "source_type" {
  type = string
  description = "Source type of the manifest"
  default = "yaml"
}

# @label "HTTP URL"
# @show_if "source_type=http"
variable "http_url" {
  type = string
  description = "HTTP URL of the manifest file"
  default = ""
}


# @label "YAML Manifest"
# @show_if "source_type=yaml"
variable "yaml_manifest" {
  type = map(any)
  description = "Manifest in YAML format"
  default = {}
}

# @label "Wait For Rollout"
variable "wait_for_rollout" {
  type = bool
  description = "Wait or not for Deployments and APIService to complete rollout."
  default = false
}

# @hidden
variable "seal_metadata_namespace_name" {
  type        = string
  description = "Seal metadata namespace name."
  default     = ""
}
