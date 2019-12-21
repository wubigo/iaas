
del /f  *.tfstate*

aws ec2 describe-regions --all-regions

terraform apply  -auto-approve