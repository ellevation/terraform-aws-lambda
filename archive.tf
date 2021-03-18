data "local_file" "deployment_package" {
    filename = var.deployment_package_path
}

resource "local_file" "deployment_package_with_hash" {
    content_base64 = data.local_file.deployment_package.content_base64
    filename       = "${path.module}/aws-to-slack-${md5(data.local_file.deployment_package.content_base64)}.zip"
}
