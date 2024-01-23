variable "region" {
    description = "Value of the AWS Region"
    type        = string
    default     = "us-east-2"
}

variable "tags" {
    description = "Tags for each EC2 instance"
    type        = list
    default     = ["first_instance","second_instance"]
}

variable "ami" {
    description = "The AMI Id values across multiple AWS Regions"
    type        = map
    default     = {
        "us-east-2" = "ami-123456789"
        "us-east-1" = "ami-987654321"
        "us-west-1" = "ami-192837465"
    }
}