variable "bucket-name" {
  type    = string
  default = var.bucket_name
  description = "Bucket Name"

}

variable "region-name" {
  type = string
  default = var.region
  description = "Region Name for bucket"
}

variable "access_key" {
  type = string
  default = var.access_key
  description = "access key of aws"
}

variable "secret_key" {
  type = string
  default = var.secret_key
  description = "secret key of aws"
}