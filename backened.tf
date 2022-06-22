terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "tg-bshn-state"
    key            = "backend/terraform.tfstate"
    region         = "eu-central-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "tg-bosch-dynamo"
    encrypt        = true
  }
}
