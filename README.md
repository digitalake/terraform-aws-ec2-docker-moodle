# Terraform-aws-ec2-docker-moodle
# Project-acceptance IP: [Moodle-link](http://3.126.250.190)

#### Hi there!
#### In this project i provided simple Terraform template + some additional scripts to deploy AWS Ec2-instance vm with Moodle onboard.

In this method i've used Docker-compose to deploy simple stack with Mysql, Apache, PHP and Moodle.

The AWS provides flexible vm configuration so i decided to use custom ami with docker pre-installed

For using "empty" amis _docker-spray.sh_ script was provied right in this project

#### Terraform Credentials 
Do not use credentials right inside _*.tf_ files
Use 
```
export FOO=bar
```
in CLI

Or you can specify AWS credentials using AWS CLI with command right in your terminal
```
aws configure
```

#### Docker-compose file variables
Docker compose can be used with variables right inside compose _*.yml_ file,
but its also unsecure to provide sensetive information such as secrets etc.

Thats it's useful to use _.env_ file with all variables provided

> Make sure you are not pushing files with sensetive data to public repos

###### Example

In _docker-compose.yml_:
```
...
MOODLE_USER=$FOO
```

In your _.env_ file:
```
FOO=bar
```

Make sure you specified _.env_ file and custom _.yml_ file name like this:
```
docker-compose -f <custom folename> --env-file <env.file name> up -d 
```
#### Terraform 
While using terraform its impotant to provide _terraform.tfvars_ files

Using only _variables.tf_ is not the best practice

Make sure you did provide your own file with variables using format:
```
<var-name>="value"
```
##### Using Terraform
Terraform commands to use are:
```
terrafrom init
```
```
terraform plan
```
```
terraform apply
```
```
terraform destroy
```

Useful commands during working with terraform files:

```
terraform validate
```
```
terraform fmt
```
```
terraform show
```
```
terraform output
```



  
#### Usefull links
- [Docker-compose link](https://docs.docker.com/compose/)
- [About Bitnami Moodle](https://github.com/bitnami/bitnami-docker-moodle)
- [Docker Mysql](https://hub.docker.com/_/mysql)
- [Create AWS account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
- [Configure keys for access via Terraform](https://docs.aws.amazon.com/keyspaces/latest/devguide/access.credentials.html)
- [Terraform download](https://developer.hashicorp.com/terraform/downloads)
