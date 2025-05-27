🚀 Terraform 2-Tier AWS Application Deployment

This project demonstrates a production-style 2-tier web application deployment on AWS using Terraform. It showcases my hands-on expertise in infrastructure as code (IaC), cloud architecture, and automation of secure and scalable AWS environments — ideal for roles in Cloud Security, DevSecOps, and Infrastructure Engineering.

🔧 Technologies & Tools

Terraform (v1.5+)

AWS Cloud (VPC, EC2, ALB, Auto Scaling, RDS, CloudFront, IAM, ACM)

Git & GitHub

GoDaddy DNS Integration

S3 (for backend state management)

🧱 Architecture Overview

The architecture follows a 2-tier model with high availability and security best practices:

Networking (VPC): Public and private subnets across two AZs

Security: IAM roles, custom security groups, and encryption

Compute Layer: EC2 Auto Scaling Group behind an ALB

Database Layer: RDS MySQL in private subnets

Key Pair: For secure EC2 access

CloudFront + ACM: Global CDN with HTTPS support using custom domain (buildwithumar.online)

GoDaddy DNS: Integrated with CloudFront via CNAME records

🗂️ Project Structure

Project2/
├── modules/
│   ├── alb/
│   ├── asg/
│   ├── cloudfront/
│   ├── key/
│   ├── nat/
│   ├── rds/
│   ├── route53/ (optional if using external DNS)
│   ├── security-group/
│   └── vpc/
├── root/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
└── .gitignore

🌍 Domain & Certificate

Custom domain: project2.buildwithumar.online (via GoDaddy)

SSL certificate: Managed by AWS ACM and integrated with CloudFront

💠 Features

✅ Infrastructure-as-Code with reusable Terraform modules

✅ Auto Scaling and Load Balancing

✅ Secure VPC design with NAT Gateways and Bastion setup

✅ S3 backend with state locking using DynamoDB

✅ Modular and production-ready layout

✅ CloudFront + HTTPS with custom domain integration

📌 How to Deploy

Prerequisites:

AWS CLI configured

Terraform installed

AWS S3 bucket and DynamoDB table for backend

Initialize the backend:

terraform init

Plan and apply:

terraform plan
terraform apply

👨‍💻 About Me

I'm Umar, a Cloud Security & DevSecOps enthusiast with hands-on experience building secure infrastructure using AWS and Terraform. This project reflects my commitment to best practices in scalable and secure cloud deployments.



