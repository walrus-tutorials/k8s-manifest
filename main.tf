data "http" "manifest_file" {
  count = var.source_type == "http" ? 1 : 0
  url = var.http_url
}

data "kubectl_file_documents" "manifest_doc" {
  content = var.source_type == "http" ? data.http.manifest_file.0.response_body : yamlencode(var.yaml_manifest)
}

resource "kubectl_manifest" "manifest" {
  for_each  = data.kubectl_file_documents.manifest_doc.manifests
  yaml_body = each.value
  wait_for_rollout = false
  override_namespace = var.seal_metadata_namespace_name
}

