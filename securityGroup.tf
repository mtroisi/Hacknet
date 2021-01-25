resource "aws_security_group" "Instance" {
        name                    = "Hacknet security group"
        description     = "Security group for the Hacknet instance"

        ingress {
                from_port       = 22
                to_port         = 22
                protocol        = "tcp"
                description     = "SSH"
                cidr_blocks = ["0.0.0.0/0"]
        }
        
        ingress {
                from_port       = 55553
                to_port         = 55553
                protocol        = "tcp"
                description     = "armitage"
                cidr_blocks = ["0.0.0.0/0"]
        }
       
         ingress {
                from_port       = 4546
                to_port         = 4546
                protocol        = "tcp"
                description     = "C2"
                cidr_blocks = ["0.0.0.0/0"]
        }
        
        egress {
                from_port   = 0
                to_port     = 0
                protocol    = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }

}
