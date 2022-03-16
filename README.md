# k8s-ecr-token-refresher

Token refresher for AWS ECR private repositories used outside of EKS such as GKE, AKS or any on-premise k8s or k3s installation.

You will need both the access key ID and the secret access key to an IAM account with the required permissions to pull private ECR repositories.

Since k8s currently has no way for a scheduled job to be run immediately once, inside the helm chart there is both a cronjob (the actual refresher) and a job for the first token creation.

### Install

Change the values.yaml file or use the `--set` flag in the Helm installation command

run:

`helm install ecr-refresher refresher-helm-chart/`