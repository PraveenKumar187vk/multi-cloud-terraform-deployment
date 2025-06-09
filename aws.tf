provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  key_name      = var.ssh_key_name

  tags = { Name = "aws-web" }

  user_data = templatefile("${path.module}/healthcheck.tpl", {
    port    = 80
    backend = "AWS"
  })
}