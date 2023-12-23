provider "aws" {
  region = "ap-southeast-1"
  # Add other necessary configurations for authentication, etc., if required
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name = "my-container-repo"
  # Optionally, you can specify additional settings here as needed
  # For example:
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  # Tags for the ECR repository (Optional)
  tags = {
    Environment = "Production"
    Project     = "MyProject"
  }
}
