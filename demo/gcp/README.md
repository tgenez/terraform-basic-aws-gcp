# terraform demo

The goal is to have a terraform
* Creating VPC with 1 subnet public
* Create firewall rules to autorise ssh
* a public Virtual machine
* a private Virtual machine
* Connect in ssh to the public and ping the private to check the firewall rules

launch terraform on folder `terraform/environments/test`
```
terraform init
terraform apply
```

connect ssh from the local computer
```
gcloud compute ssh --project=PROJECT_ID --zone=ZONE VM_NAME

gcloud compute ssh --project=sxb-emotors-mde --zone=europe-west9-a tgenez-test-public
```

ping the private instance when in the public instance (get ip private from console aws)
```
ping ip-private-ec2
```
