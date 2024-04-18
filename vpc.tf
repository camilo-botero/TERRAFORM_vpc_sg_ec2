resource "aws_vpc" "vpc_clase" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "vpc_clase"
    }
}

resource "aws_subnet" "subnet1_vpc_clase" {
    vpc_id = aws_vpc.vpc_clase.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1c"

    tags = {
        Name = "subnet1_vpc_clase"
    }
}

resource "aws_internet_gateway" "gw_clase" {
    vpc_id = aws_vpc.vpc_clase.id
  
    tags = {
        Name = "gw_clase"
    }
}

resource "aws_route_table" "rt_clase" {
    vpc_id = aws_vpc.vpc_clase.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw_clase.id
    }
  
    tags = {
        Name =  "rt_clase"
    }

}

resource "aws_route_table_association" "a_rt_clase_subnet1" {
    subnet_id = aws_subnet.subnet1_vpc_clase.id
    route_table_id = aws_route_table.rt_clase.id
  
}