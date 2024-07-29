resource "aws_instance" "website-ec2" {
    ami  = "ami-04c66ebde909439f8"
    instance_type = "t2.micro"

    tags = {
        Name  = "website-ec2"    
    }
}


resource "aws_security_group" "terraform_firewall" {
  name        = "terraform_firewall"
  description = "Managed from Terraform"

  tags = {
    Name = "terraform_firewall"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.terraform_firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.terraform_firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = "sg-012416f116e97a1fb"
  cidr_ipv4         = "3.0.5.32/29"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_80" {
  security_group_id = "sg-012416f116e97a1fb"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_443" {
  security_group_id = "sg-012416f116e97a1fb"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


