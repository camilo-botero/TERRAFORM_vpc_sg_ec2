resource "aws_security_group" "sg_clase" {
    name = "sg_clase"
    description = "Permitir SSH, HTTP y HTTPS"
    vpc_id = aws_vpc.vpc_clase.id

    tags = {
      Name = "sg_clase"
    }
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso SSH"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso WEB"
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso SSL"
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol= "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso Salida"
  }
}