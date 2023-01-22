# Git Hub Action for Confluent Cloud Kafka Cluster creation using Confluent Terraform Provider Example

This repo provides a Github Action workflow example based on this [Ioannis Moustakis blog post](https://spacelift.io/blog/github-actions-terraform) using [Confluent Teraform Provider](https://docs.confluent.io/cloud/current/get-started/terraform-provider.html#confluent-terraform-provider) and Google Cloud Storage bucket as Terraform State backend.

## Prerrequisites

This repo is focus on the Kafka Cluster creation so you will need:

1. Confluent Cloud Service account with cluster creation permission*
2. A Confluent Cloud Environment already created*
4. Confluent Cloud API Key with permission on the environment 
3. A Google Cloud Bucket and proper credentials to login into as descrived here [here](https://developer.hashicorp.com/terraform/language/settings/backends/gcs).

* Nevertheless you can follow the [Terraform Provider Sample project example](https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/guides/sample-project) to know hot to create it through Terraform
## Functionalities

This terraform script only describe the configuration needed to run the module implemented on this [Marcelo Colomer's](https://github.com/mcolomerc) [repo](https://github.com/mcolomerc/terraform-confluent-kafka-cluster).

This module will:

1. Create a Kafka Cluster on the environment of your choice using the config described on `env/cluster.tfvars`
2. Grant the proper permission on the Cluster to the Service Account provided
3. Create a cluster API key with the permission needed to manage it. 

## Git Hub Action Workflow

The github action workflow is described over `.github/workflows/kafka-cluster.yaml`

This workflow uses repository secrets to store the sensitive information:

- `CCLOUD_API_KEY`: Containing the API Key associated to the user that own the environment with cluster creation rights granted.

- `CCLOUD_API_SECRET`: Containing the secret for the API KEY

- `GOOGLE_CREDENTIALS`: Containing the `application_default_credentials.json` needed for Google Storage login.

The secrets will be stored as environment variables on the workflow setup so Terraform can use it.

-
This actions has two separate phases:

### 1. PR Phase

When a new PR is created the action will:

1. Init the terraform Environment
2. Validate and format checking of terraform scripts.
3. Create a show the terraform plan.

### 2. PR Merged (Main commit push)

Apply the terraform plan using Google Storage Bucket for state storage as configured on `backend.tf`.