terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "6.61.0"
        }
    }
}

module "kms" {
  source = "terraform-aws-modules/kms/aws"
  version = "3.0.0"

  description         = "External key example"
  key_material_base64 = "Wblj06fduthWggmsT0cLVoIMOkeLbc2kVfMud77i/JY="
  valid_to            = "2085-04-12T23:20:50.52Z"

  # Policy
  key_owners         = ["arn:aws:iam::012345678901:role/owner"]
  key_administrators = ["arn:aws:iam::012345678901:role/admin"]
  key_users          = ["arn:aws:iam::012345678901:role/user"]
  key_service_users  = ["arn:aws:iam::012345678901:role/ec2-role"]

  # Aliases
  aliases                 = ["mycompany/external"]
  aliases_use_name_prefix = true

  # Grants
  grants = {
    lambda = {
      grantee_principal = "arn:aws:iam::012345678901:role/lambda-function"
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
      constraints = {
        encryption_context_equals = {
          Department = "Finance"
        }
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "renovate"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}