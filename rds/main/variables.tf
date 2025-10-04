variable "allow_local_sg_id" {
  type    = string
  default = "sg-0bce1d98d9a37c8e6"
}

variable "allow_tls_sg_id" {
  type    = string
  default = "sg-09574d46795f90047"
}

variable "subnet_a_id" {
  type    = string
  default = "subnet-0b9e2a9b0fd6dd238"
}

variable "subnet_b_id" {
  type    = string
  default = "subnet-0f21662422a5cf0a7"
}

variable "subnet_list" {
  type    = list(any)
  default = ["subnet-0b9e2a9b0fd6dd238", "subnet-0f21662422a5cf0a7"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-0513770c5171251da"
}

