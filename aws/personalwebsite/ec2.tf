# Create EC2 Instance
resource "aws_instance" "docker_host" {
  # t2.micro is free tier eligible
  instance_type = "t2.micro"
  
  # Amazon Linux 2 AMI (free tier eligible)
  # Note: AMI ID may vary by region, this is an example
  ami = "ami-0cff7528ff583bf9a"

  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  # This user data script installs Docker
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              usermod -a -G docker ec2-user
              EOF

  root_block_device {
    volume_size = 8  # Free tier eligible storage size
  }

  tags = {
    Name = "docker-host"
  }
}