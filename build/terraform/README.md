## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.performance-agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.ec2-key-pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_network_interface_sg_attachment.allow-ssh-sg-attachment-loadgens](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_sg_attachment) | resource |
| [aws_security_group.allow-ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.AnsibleInventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_id.stack_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_provider_credentials"></a> [aws\_provider\_credentials](#input\_aws\_provider\_credentials) | The AWS shared credentials file | `string` | `"~/.aws/credentials"` | no |
| <a name="input_aws_provider_profile"></a> [aws\_provider\_profile](#input\_aws\_provider\_profile) | The AWS credentials profile | `string` | `"default"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region that the resources will reside in | `string` | `"us-east-2"` | no |
| <a name="input_aws_subnet_cidr_block"></a> [aws\_subnet\_cidr\_block](#input\_aws\_subnet\_cidr\_block) | The AWS subnet CIDR block | `string` | `"0.0.0.0/0"` | no |
| <a name="input_aws_subnet_ipv6_cidr_block"></a> [aws\_subnet\_ipv6\_cidr\_block](#input\_aws\_subnet\_ipv6\_cidr\_block) | The AWS subnet CIDR block | `string` | `"::/0"` | no |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | The AWS VPC ID for the subnet resources | `string` | `""` | no |
| <a name="input_ec2_key_pair_public_key"></a> [ec2\_key\_pair\_public\_key](#input\_ec2\_key\_pair\_public\_key) | RSA public key of EC2 key pair, used to access created instances | `string` | n/a | yes |
| <a name="input_github"></a> [github](#input\_github) | GHES environment info | `map` | <pre>{<br>  "hostname": "github.example.com",<br>  "password": "passworD1",<br>  "username": "perfadmin"<br>}</pre> | no |
| <a name="input_handle"></a> [handle](#input\_handle) | GitHub Handle | `string` | `"svc-devops-bot"` | no |
| <a name="input_ingress_cidrs"></a> [ingress\_cidrs](#input\_ingress\_cidrs) | The CIDR/network address space of the subnet for the primary GHE instance | `list` | <pre>[<br>  "10.0.0.0/24"<br>]</pre> | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | How many instances do we want to provision? | `string` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The EC2 instance type that the primary GHE instance will run on | `string` | `"r4.2xlarge"` | no |
| <a name="input_metrics_host"></a> [metrics\_host](#input\_metrics\_host) | GitHub Metrics Server Hostname | `string` | `"metrics.ghe-test.net"` | no |
| <a name="input_name_tag_prefix"></a> [name\_tag\_prefix](#input\_name\_tag\_prefix) | String prefix that uniquely identifies resources as part of the multi cloud solution | `string` | `"dev_test"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_loadgens-public-dns"></a> [loadgens-public-dns](#output\_loadgens-public-dns) | n/a |
