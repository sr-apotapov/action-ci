#!/bin/bash
#tflint
tflint
#terrascan
terrascan init
terrascan scan -i terraform -t all -o human -v
#tf env
tfenv install $terraform_version
tfenv use $terraform_version
#terraform
echo 'credentials "app.terraform.io" {
        token = "'${TF_API_TOKEN}'"
        }' > /root/.terraformrc
terraform fmt -check
terraform init || true
tfe_output=$(terraform plan -no-color)
echo $tfe_output