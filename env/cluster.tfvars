environment = "env-q26337"

cluster = {
    display_name = "devops-webinar-standard-cluster"
    availability = "SINGLE_ZONE"
    cloud        = "GCP"
    region       = "europe-west3"
    type         = "STANDARD"
 }


service_account = {
    name = "CC-WEBINAR"
    role = "CloudClusterAdmin"
}
