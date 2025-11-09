locals {
  common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev
  private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
  ami_id = data.aws_ami.joindevops.id
  common_tags = {
      Project = var.project_name
      Environment = var.environment
      Terraform = "true"
  }
}

# --- Data Sources ---
# data "aws_ssm_parameter" "private_subnet_ids" {
#   name = "/roboshop/dev/private_subnet_ids"
# }

# data "aws_ami" "joindevops" {
#   most_recent = true
#   owners      = ["973714476881"] # example account ID for JoinDevOps AMIs
#   filters = [
#     {
#       name   = "name"
#       values = ["joindevops-*"]
#     }
#   ]
# }

# # --- Locals ---
# locals {
#   common_name_suffix = "${var.project_name}-${var.environment}" # roboshop-dev
#   private_subnet_id  = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
#   ami_id             = data.aws_ami.joindevops.id

#   common_tags = {
#     Project     = var.project_name
#     Environment = var.environment
#     Terraform   = "true"
#   }
# }
