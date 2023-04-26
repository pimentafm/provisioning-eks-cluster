# Provision an EKS Cluster

Start the project: `terraform init`

Format the code: `terraform fmt`

Validate the code: `terraform validate`

Execute plan: `terraform plan`

Applay: `terraform apply [-auto-approve]`

Destroy: `terraform destroy [-auto-aprove]`

Connect to cluster: `aws eks update-kubeconfig --region us-east-1 --name data-engineering-project-eks --profile <your_profile>`

Get nodes: `kubectl get nodes`
Get pods: `kubectl get pods -A`
