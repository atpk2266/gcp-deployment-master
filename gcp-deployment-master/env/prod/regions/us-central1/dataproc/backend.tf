terraform {
  backend "gcs" {
    bucket = "prod-project_id-tfstate-region-gcs"
    prefix = "prod/regions/us-central1/dataproc/cluster-abc"
  }
}
