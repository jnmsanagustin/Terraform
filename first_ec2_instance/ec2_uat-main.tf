resource "aws_instance" "ec2_uatmain" {
    ami  = "ami-012c2e8e24e2ae21d"
    instance_type = "t2.micro"

    tags = {
        Name  = "EC2 UAT-MAIN"    
    }
}
