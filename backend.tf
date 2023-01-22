terraform {
  backend "gcs" {
    bucket = "ogomez-tf-state"
    prefix = "cc-webinar/terraform/state/kafka-cluster"
  }
}