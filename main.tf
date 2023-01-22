module "cluster" {
  source                     = "github.com/mcolomerc/terraform-confluent-kafka-cluster"
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
  environment                = var.environment
  cluster                    = var.cluster
  service_account            = var.service_account
}
