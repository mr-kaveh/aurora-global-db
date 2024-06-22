# aurora-global-db
Setting up an Amazon Aurora Global Database using Terraform and Terragrunt

### Deploy with Terragrunt

Navigate to the `terragrunt/us-east-1` directory and run Terragrunt:

	cd terragrunt/us-east-1
	terragrunt init
	terragrunt apply

Repeat the same steps for the `terragrunt/eu-west-1` directory:

	cd terragrunt/eu-west-1
	terragrunt init
	terragrunt apply
