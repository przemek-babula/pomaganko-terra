resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "pomaganko-codepipeline-bucket" # zmień na unikalną nazwę
  acl    = "private"
}

resource "aws_iam_role" "codepipeline_role" {
  name = "codepipeline-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "codepipeline.amazonaws.com"
        },
      },
    ],
  })
}
