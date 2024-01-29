# terraform_sandbox
Repository for holding terraform examples and experiments

1. github-create-repo - creates a basic repository in github

2. aws-create-instances - experiments with using functions to create EC2 instances in AWS

3. 

## Commands and Arguments

- terraform apply : Applies configurations to create infrastructure.
    - Before applying changes, outputs execution plan which describes the actions Terraform will take in order to change your infrastructure to match the configuration, as well as waits for your approval via typing yes or no.
    - Outputs an execution plan of what happened to the configuration.
    - -var "variablename=newvalue" : Argument changes values for single apply, but does not save them for future applies.

- terraform destroy : Terminates resources defined in a Terraform configuration.
    - Outputs execution plan of what it will delete.

- terraform fmt : Automatically updates configurations in the current directory for readability and consistency.

- terraform init : Initializes a configuration directory and downloads and installs the providers defined in the configuration.
    - Output prints out names of the files modified, if any.
    -  -upgrade flag will upgrade all providers to the latest version consistent within the version constraints specified in the configuration.

- terraform login : Logs into Terraform Cloud account via API key.
    - Rerun terraform init command to intialize the backend.

- terraform output : Queries the output from the latest apply command.

- terraform show : Inspects the current state of resources being managed by Terraform.

- terraform state list : Lists the resources in the project's state.

- terraform validate : Checks configuration is syntactically valid and internally consistent.
    - If valid, return message will be: "Success! The configuration is valid."