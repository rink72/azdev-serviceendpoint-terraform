. ../.env.local.ps1

terraform init -backend-config="subscription_id=$($ENV:TF_SUBSCRIPTION_ID)" -backend-config="key=azdev-serviceendpoint-terraform/dev.terraform.tfstate"

terraform apply