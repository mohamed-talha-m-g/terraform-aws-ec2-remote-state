output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.web.id
}

output "ami_id" {
  description = "Ubuntu AMI used"
  value       = data.aws_ami.ubuntu.id
}

output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.web.public_ip
}

output "security_group_id" {
  description = "Security group attached to the instance"
  value       = aws_security_group.web_sg.id
}

output "website_url" {
  description = "Open in a browser to verify port 80"
  value       = "http://${aws_instance.web.public_ip}"
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i `/.ssh/${var.key_name}.pem ubuntu@${aws_instance.web.public_ip}"
}