resource"aws_instance""DockerHost"{
    ami = data.aws_ami.joindevops.id
    instance_type = "t3.medium"
    vpc_security_group_ids = [aws_security_group.docker.id]
    tags={
        Name = "Docker_instance_roboshop"
    }
    root_block_device {
      volume_size = 50
      volume_type = "gp3"
    }

    user_data =file("docker.sh")
}

resource "aws_security_group""docker"{
    name = "Docker"
    description = "for docker"

    ingress{
        from_port=0
        to_port=0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }

    egress{
        from_port=0
        to_port=0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]  
    }
}