resource "null_resource" "inst_null_res" {

    depends_on = [ module.ec2_instance ]
 
    connection {
        host = aws_eip.inst_eip.public_ip
        private_key = data.aws_key_pair.terraform_key.id
        user = "ec2-user"
        password = ""
        type = "ssh"
    }

    provisioner "file" {
        source = "terraform-manifest/private-key/terraform-key1.pem"
        destination = "/tmp/terraform-key1.pem"
    
    }
    provisioner "remote-exec" {
        # Bootstrap script called with private_ip of each node in the cluster
        inline = ["sudo chmod 400 /tmp/terraform-key1.pem"]
    }
    provisioner "local-exec" {
        when = create
        command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
        working_dir = "terraform-manifest/local-output-folder/"
        on_failure = continue
    
    }
}