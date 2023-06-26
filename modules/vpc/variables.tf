variable "public_subnet_numbers" {
  type        = map(number)
  description = "Map of the AZ to a number that should be used for public subnets."
  default = {
    "us-east-1a" : 0
    "us-east-1b" : 2
    "us-east-1c" : 4
  }
}

variable "tags" {
  type        = map(string)
  description = "The tags for the VPC instance"
  default     = {}
}
