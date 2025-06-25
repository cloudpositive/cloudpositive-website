# cloud-positive-website
To initialize your local machine the following commands:

```
export ARM_TENANT_ID="<replace_with_the_same_value_as_in_repo_secrets>"
export ARM_SUBSCRIPTION_ID="<replace_with_the_same_value_as_in_repo_secrets>"

az config set core.login_experience_v2=off
az login --tenant $ARM_TENANT_ID --use-device-code
az account set --subscription $ARM_SUBSCRIPTION_ID

terraform login
```

To rollout the resources in this configuration, locally:

```
terraform plan -var-file variables.tfvars && terraform apply -var-file variables.tfvars
```