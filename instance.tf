# Gets the region specified in the provider as a data block
data "aws_availability_zones" "available" {
	state 		= "available"
}

# Get ubuntu AMI
data "aws_ami" "ubuntu" {
	most_recent 	= true
	filter {
		name 	= "description"
		values 	= ["*Minimal, 20.04 LTS*"]
	}

	owners			= ["099720109477"] # Canonical
}

# ssh key
resource "aws_key_pair" "terraform_key" {
	key_name 		= "terraform_auto"
	public_key 		= file("~/.ssh/id_rsa.pub")
}

# Create Hacknet instance
resource "aws_instance" "Instance" {

	ami 						= data.aws_ami.ubuntu.id
	instance_type 				= var.instance_type
	associate_public_ip_address = true
	key_name 					= aws_key_pair.terraform_key.key_name

	security_groups 			= [aws_security_group.Instance.name]

	tags = {
		Name = var.name
	}

	provisioner "local-exec" {
		command = "sleep 30; ansible-playbook ./ansible/playbook.yml --ssh-common-args='-o StrictHostKeyChecking=no' -u ${var.Instanceusername} --extra-vars 'team_password=${var.team_password}' -i ${self.public_ip},"
	}
}
