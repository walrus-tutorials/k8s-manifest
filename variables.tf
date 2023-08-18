variable "manifest_url" {
  type = string
  description = "URL of the manifest file"
  default = ""
}

variable "namespace" {
  type        = string
  description = "Namespace to deploy. Auto-generated if empty."
  default     = ""
}

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
