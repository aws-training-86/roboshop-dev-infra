data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    #owners           = ["284495578555"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}


data "aws_ssm_parameter" "private_subnet_id" {
  name = "/${var.project_name}/${var.environment}/private_subnet_id"
}

# data "aws_ssm_parameter" "private_subnet_ids" {
#   name = "/roboshop/dev/private_subnet_ids"
# }


data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project_name}/${var.environment}/catalogue_sg_id"
}