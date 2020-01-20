provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source        = "SweetOps/storage-bucket/google"
  version       = "0.3.0"
  location      = var.region
  force_destroy = true
  # Имя поменяйте на другое
  name = "storage-bucket-hw09-stage"
}

#module "storage-bucket-prod" {
#  source  = "SweetOps/storage-bucket/google"
#  version = "0.3.0"
#  location = var.region
#  force_destroy=true
#  # Имя поменяйте на другое
#  name = "storage-bucket-hw09-prod"
#}
#
#output storage-bucket_url {
#  value = module.storage-bucket.url
#}
