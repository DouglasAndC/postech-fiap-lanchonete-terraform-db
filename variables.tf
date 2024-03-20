variable "vpc_id" {
  description = "VPC id"
  default     = "vpc-07d676a9b00bf272a"
}


variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "subnet_ids" {
  description = ""
  default     = ["subnet-0aa0f1404dddd9d0e", "subnet-0bddc3ddf59646253"]
}