# ECR Anywhere - Use AWS ECR private images anywhere

ECR Anywhere lets you use AWS ECR private images outside of EKS - GKE, AKS or any on-premise k8s installation are supported.

ECR access tokens last for 12 hours.
Since k8s currently has no way for a scheduled job to be run immediately once, inside the helm chart there is both a cronjob that will refresh the token periodically and a job for the first token creation.

## Requirements and Installation

To install ECR Anywhere in your kubernetes cluster, you will need both the access key ID and the secret access key to an IAM account with the required permissions to pull private ECR repositories.

Ideally, you should create an IAM role with read-only permissions to the specific repositories you need to pull from.

You will also need Helm to install ECR Anywhere through its Helm Chart.

### Install inside your cluster

Change the values.yaml file or use the `--set` flag in the Helm installation command

run:

`helm install ecr-anywhere ECR-anywhere-chart/`

After the first job is completed, you should find a secret called with the `secret.name` value you setup in the `values.yaml` file.

To deploy a pod from a private ECR repository, simply change your deployment yaml configuration to include the field `spec.imagePullSecrets: - name: <your-secret-name>`

### AWS-Kubectl image

ECR-anywhere depends on the docker image [paolofacchinetti/aws-kubectl](https://hub.docker.com/r/paolofacchinetti/aws-kubectl), look at the [Dockerfile](/Dockerfile) for more info.

Since AWS-Cli and Kubectl are in active development and have frequent releases, it's possible that the latest image of `paolofacchinetti/aws-kubectl` will not work (by AWS/k8s API deprecations, incompatibilities, etc.). You're free to build your own version of the image and use that one instead. The `values.yaml` file of the chart allows you to override the default image used by ECR-Anywhere.
