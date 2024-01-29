# terraform_sandbox
Repository for holding terraform examples and experiments

1. github-create-repo - creates a basic repository in github

2. aws-create-instances - experiments with using functions to create EC2 instances in AWS

3. 

## Commands and Arguments

- jq : Allows you to view JSON formatted saved configuration plans.
    -  '.terraform_version, .format_version' plan_file_name.json : Shows version of Terraform used to generate the plan, and the version of the plan file format.
    -  '.configuration....' : JSON object that is a snapshot of the configuration at the time of running the terraform plan command.
        - .provider_config : Versions of the providers recorded in the .terraform.lock.hcl file.
        - .root_module.resources : Organizes resources defined at the top level.
        - .root_module.module_calls : Details of modules used, their input variables and outputs, and the resources to create.
    - '.planned_values' plan_file_name.json : Is a report of the diffeerences beetween the "before" and "after" values of the resources, showing the planned outcome for a run that would use this plan file.
    - '.prior_state' : Captures the state file exactly as it was prior to the plan command.
        - Only created when a state file existed prior to running the plan command.
    - '.variables' : Input variables used in the configuration.

- terraform apply : Applies configurations to create infrastructure.
    - Before applying changes, outputs execution plan which describes the actions Terraform will take in order to change your infrastructure to match the configuration, as well as waits for your approval via typing yes or no.
    - Outputs an execution plan of what happened to the configuration.
    - -var "variablename=newvalue" : Argument changes values for single apply, but does not save them for future applies.
    - Attach "plan_file_name" to end to apply a saved plan file.

- terraform destroy : Terminates resources defined in a Terraform configuration.
    - Outputs execution plan of what it will delete.

- terraform fmt : Automatically updates configurations in the current directory for readability and consistency.

- terraform init : Initializes a configuration directory and downloads and installs the providers defined in the configuration.
    - Output prints out names of the files modified, if any.
    -  -upgrade flag will upgrade all providers to the latest version consistent within the version constraints specified in the configuration.

- terraform login : Logs into Terraform Cloud account via API key.
    - Rerun terraform init command to intialize the backend.

- terraform plan : Creates a plan consisting of a set of changes that will make your resources match your configuration.
    -  -out "plan_file_name" : Allows you to save the changes.
    -  -json "plan_file_name" | jq > plan_file_name.json : Saves plan file in JSON.
    -  -destroy : Creates plan to destrooy all of the resources in the configuration. If you save it with -out flag you can run the terraform apply "destroy_plan_file_name" to tear it down.

- terraform output : Queries the output from the latest apply command.

- terraform show : Inspects the current state of resources being managed by Terraform.
    - Attach "plan_file_name" after show command to see a plan file from the terraform plan command.

- terraform state list : Lists the resources in the project's state.

- terraform validate : Checks configuration is syntactically valid and internally consistent.
    - If valid, return message will be: "Success! The configuration is valid."