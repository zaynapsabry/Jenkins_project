# Creating role for lamda function
resource "aws_iam_role" "lambda_role" {
name   = "lamda-ses-role"
assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}

# Creating the policy for lambda function
resource "aws_iam_policy" "iam_policy_for_lambda" {
 name         = "iam_policy_for_lambda_role"
 path         = "/"
 description  = "AWS IAM Policy for managing aws lambda role on ses"
 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::zeinab-bucket-terraform-src-bucket",
                "arn:aws:s3:::zeinab-bucket-terraform-src-bucket/*"
            ]
        }
    ]
}
EOF
}

# Attach Iam policy to role
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

# Archiving for python file
data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "${path.module}/python/"
output_path = "${path.module}/python/python-lambda.zip"
}

# Create lambda function
resource "aws_lambda_function" "terraform_lambda_func" {
filename                       = "${path.module}/python/python-lambda.zip"
function_name                  = "lambda-ses"
role                           = aws_iam_role.lambda_role.arn
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

# Creating event to trigger lamda function
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "zeinab-bucket-terraform"

  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  }
}

# Permission to trigger lambda function
resource "aws_lambda_permission" "allow_terraform_bucket" {
   statement_id = "AllowExecutionFromS3Bucket"
   action = "lambda:InvokeFunction"
   function_name = aws_lambda_function.terraform_lambda_func.arn
   principal = "s3.amazonaws.com"
   source_arn = "arn:aws:s3:::zeinab-bucket-terraform"
}

