data "http" "manifest_file" {
  url = var.manifest_url
}

data "kubectl_file_documents" "manifest_doc" {
  content = data.http.manifest_file.body
}

resource "kubectl_manifest" "manifest" {
  for_each  = data.kubectl_file_documents.manifest_doc.manifests
  yaml_body = each.value
  wait_for_rollout = false
  override_namespace = var.seal_metadata_namespace_name
}

