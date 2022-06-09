# urban-task
* Creating cluster in GCP use:

Initialize terraform providers:

`terraform init`

View plan before apply:

`terraform plan`

Apply terraform:

`terraform apply`

After create cluster get kubeconfig file from GKE

gcloud container clusters get-credentials gke-urbant-test --zone us-east1-b --project <project_ID>