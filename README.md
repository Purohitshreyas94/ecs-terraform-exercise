# Deploying Application to AWS ECS with Terraform

Sets up the following AWS infrastructure:

- Networking:
    - VPC
    - Public and private subnets
    - Routing tables
    - Internet Gateway
    - Key Pairs
- Security Groups
- Load Balancers, Listeners, and Target Groups
- IAM Roles and Policies
- ECS:
    - Task Definition (with multiple containers)
    - Cluster
    - Service
- Launch Config and Auto Scaling Group
- RDS
- Health Checks and Logs
- Route53

## Steps to run this project

1. Install Terraform

1. Sign up for an AWS account

1. Create two ECR repositories, `django-app` and `nginx`.

1. Fork/Clone

1. Build the Django and Nginx Docker images and push them up to ECR:

    ```sh
    $ cd app
    $ docker build -t <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/django-app:latest .
    $ docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/django-app:latest
    $ cd ..

    $ cd nginx
    $ docker build -t <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/nginx:latest .
    $ docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/nginx:latest
    $ cd ..
    ```

1. Update the variables in *terraform/variables.tf*.

1. Set the following environment variables, init Terraform, create the infrastructure:

    ```sh
    $ cd terraform
    $ export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
    $ export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"

    $ terraform init
    $ terraform plan
    $ terraform apply
    ```
