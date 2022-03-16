# ECR Token Refresher for Kubernetes

Token refresher for AWS ECR private repositories used outside of EKS such as GKE, AKS or any on-premise k8s or k3s installation.

Since k8s currently has no way for a scheduled job to be run immediately once, inside the helm chart there is both a cronjob (the actual refresher) and a job for the first token creation.

## Requirements and Installation

To install the ecr token refresher in your kubernetes cluster, you will both the access key ID and the secret access key to an IAM account with the required permissions to pull private ECR repositories.

Ideally, you should create an IAM role with read-only permissions to the specific repositories you need to pull from.

You will also need Helm to install the ecr token refresher through its Helm Chart.

### Install inside your cluster

Change the values.yaml file or use the `--set` flag in the Helm installation command

run:

`helm install ecr-refresher refresher-helm-chart/`

After the first job is completed, you should find a secret called with the `secret.name` value you setup in the `values.yaml` file.

To deploy a pod from a private ECR repository, simply change your deployment yaml configuration to include the field `spec.imagePullSecrets: - name: <your-secret-name>`