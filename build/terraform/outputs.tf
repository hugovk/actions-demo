output "demo-server-public-dns" {
  value = aws_instance.demo-server.*.public_dns
}

data "aws_region" "current" { }

output "aws-region" {
  value = data.aws_region.current.name
}

### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      ssh-private-key = var.ssh_private_key_path
      demo-server-public-ip = aws_instance.demo-server.*.public_ip
      demo-server-public-dns = aws_instance.demo-server.*.public_dns
      instance-id = aws_instance.demo-server.*.id
      demo-server-name = aws_instance.demo-server.*.tags.Name
    }
  )
  filename = "../ansible/hosts.yml"
}
