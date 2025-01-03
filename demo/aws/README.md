# terraform demo

The goal is to have a terraform
* Creating VPC with 2 subnet public and 2 subnet private
* a public Virtual machine (EC2) in the public subnet
* a private Virtual machine (EC2) in the private subnet
* Connect in ssh to the public and ping the private to check the security group

open git bash console select your profile aws with an account to create VPC and EC2
```
export AWS_PROFILE=277707143685_AWSPowerUserAccess
```

create s3 for terraform state if needed
```
aws s3api create-bucket --bucket tgenez-terraform-state-s3 --region eu-west-3 --create-bucket-configuration LocationConstraint=eu-west-3
```

launch terraform on folder `terraform/environments/test`
```
terraform init
terraform apply
```

Will generate a file tgenez-key-pair-private.pem to use for next step ssh
connect ssh from aws-training (get dns public from console aws)
```
chmod 400 "tgenez-key-pair-private.pem"
ssh -i "tgenez_test-key-pair.pem" ec2-user@REPLACE_BY_PUBLIC_DNS
```

ping the private instance when in the public instance (get ip private from console aws)
```
ping ip-private-ec2
```
