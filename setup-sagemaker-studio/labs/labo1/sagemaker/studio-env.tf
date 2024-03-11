#-----------------------------------------------------------------
# Domain
#-----------------------------------------------------------------

resource "aws_sagemaker_domain" "labo_domain" {
  domain_name = "labo-sagemaker-studio-domain"
  app_network_access_type = "VpcOnly"
  auth_mode   = "IAM"
  vpc_id      = var.vpc_id
  subnet_ids  = [var.private_subnet_1a_id]

  default_user_settings {
    execution_role = aws_iam_role.sagemaker_execution_role.arn
    security_groups = [aws_security_group.sagemaker_studio_sg.id]

    jupyter_server_app_settings {
      default_resource_spec {
        instance_type = "system"
      }
    }
  }
}

#-----------------------------------------------------------------
# User Profile
#-----------------------------------------------------------------

resource "aws_sagemaker_user_profile" "labo_user_profile" {
  domain_id      = aws_sagemaker_domain.labo_domain.id
  user_profile_name = "labo-sagemaker-user"
}

#-----------------------------------------------------------------
# SageMaker Role
#-----------------------------------------------------------------

resource "aws_iam_role" "sagemaker_execution_role" {
  name = "sagemaker_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "sagemaker.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "sagemaker_full_access" {
  name       = "sagemaker_full_access"
  roles      = [aws_iam_role.sagemaker_execution_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
}

#-----------------------------------------------------------------
# SageMaker Security Group
#-----------------------------------------------------------------

resource "aws_security_group" "sagemaker_studio_sg" {
  name        = "labo-sagemaker-studio-sg"
  description = "Security group for SageMaker Studio in labo environment"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "labo-sagemaker-studio-sg"
  }
}


