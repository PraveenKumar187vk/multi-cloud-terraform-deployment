variable "aws_region" { default = "us-west-2" }
variable "gcp_region" { default = "us-central1" }
variable "instance_type" { default = "t2.micro" }
variable "gcp_machine_type" { default = "f1-micro" }
variable "ssh_key_name" { description = "AWS Key pair name" }
variable "gcp_project_id" { description = "GCP Project ID" }
variable "ssh_public_key" { description = "GCP SSH public key" }