
resource "aws_lightsail_instance" "example_instance" {
  name              = "dev-instance"
  availability_zone = "us-east-1a" # Replace with your desired availability zone
  blueprint_id      = "centos_7_1905_01"
  bundle_id         = "micro_2_0" # Lightsail instance type and size

  user_data = <<EOF
#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1>This Server is created using Terraform </h1>" > /var/www/html/index.html'
EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example_instance.public_ip_address
}