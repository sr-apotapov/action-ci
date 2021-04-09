run_url=$(echo "$INPUT_TF_PLAN_OUTPUT" | grep -o "run-[A-Za-z0-9]*")
tfe_plan_url="https://app.terraform.io/api/v2/runs/${run_url}/plan"
echo $tfe_plan_url 
curl --header "Authorization: Bearer $tf_api_token" --header "Content-Type: application/json" $tfe_plan_url -o tfplan.json
tfplan_env=$(cat tfplan.json)
echo $tfplan_env