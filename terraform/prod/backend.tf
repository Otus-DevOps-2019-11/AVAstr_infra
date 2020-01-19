terraform {
  backend "gcs" {
    bucket = "storage-bucket-hw09"
    prefix = "stage_state"
  }
}
