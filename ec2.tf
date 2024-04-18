resource "aws_instance" "server_web" {
    ami = "ami-080e1f13689e07408"
    instance_type = "t2.micro"
    count = 1
    subnet_id = aws_subnet.subnet1_vpc_clase.id
    key_name = "Key_Server_Web"
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg_clase.id ]

    tags = {
      Name = "server_web"
    }
  
}