#!/bin/bash
set -euxo pipefail

sudo apt-get update -y
sudo apt-get install -y nginx

TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 300")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
  <head><title>Terraform EC2 + Remote State</title></head>
  <body style="font-family: sans-serif; text-align: center; margin-top: 10%;">
    <h1>Deployed with Terraform</h1>
    <p>EC2 + Security Group + Remote State (S3 + DynamoDB)</p>
    <p>Instance ID: ${INSTANCE_ID}</p>
  </body>
</html>
EOF

sudo systemctl enable nginx
sudo systemctl restart nginx