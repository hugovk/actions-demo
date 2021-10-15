resource "aws_instance" "demo-server" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.ec2-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.github-demo-sg.id]
  count = var.instance_count

  ebs_block_device {
    delete_on_termination = true
    device_name = "/dev/sda1"
    volume_size = 40
    volume_type = "gp2"
  }

  tags = {
    Name = "server_${count.index +1}"
  }
}
