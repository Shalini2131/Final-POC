resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.ami.id
  subnet_id              = aws_subnet.public[0].id
  instance_type          = var.instance_type
  iam_instance_profile   = "ecsInstanceRole"
  vpc_security_group_ids = [aws_security_group.alb_security_group.id]
  user_data              = data.template_file.user_data.rendered
  key_name = "final-task"
  associate_public_ip_address = true
}

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"
}

resource "aws_launch_configuration" "as_conf" {
  name          = "terraform-ecs-launch-config"
  image_id      = aws_instance.ec2_instance.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.alb_security_group.id]
  iam_instance_profile = var.iam_instance_profile
  
}