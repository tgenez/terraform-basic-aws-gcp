
## HCL (HashiCorp Configuration Language)

* Langage déclaratif créé par HashiCorp
* Syntaxe simple et lisible, proche du JSON/YAML
* Conçu spécifiquement pour décrire l'infrastructure

##==##

## Structure: Providers

* Plugin pour interagir avec différentes platform cloud ou autres

``` terraform
terraform {
  required_version = ">= 1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.81.0"
    }

  }
}

provider "aws" {
  region = var.aws_region
}
```

Notes:
- Providers Les providers sont des plugins qui permettent à Terraform d'interagir avec différentes plateformes cloud ou services en fournissant les API nécessaires.


##==##

## Structure: Ressources

* Contenu dans tous les fichiers *.tf

``` terraform
resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "var.instance_type
  tags = {
    Name = "example-instance"
  }
}
```

Notes:
- Ressources Les ressources sont les éléments centraux qui définissent les infrastructures à créer et à gérer dans votre environnement cible.

##==##

## Structure: Variables

* Definition dans variables.tf

``` terraform
variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}
```

<br/>

* Changement de valeurs dans terraform.tfvars

``` terraform
instance_type="t3.medium"
``` 

Notes:
- Variables Les variables permettent de paramétrer et rendre dynamique le code Terraform en définissant des valeurs réutilisables et modifiables.

##==##

## Structure: Data

* Contenu dans un fichier data.tf ou au début des fichiers

``` terraform
data "aws_ami" "amazon_linux_2" {
	most_recent = true
	owners      = ["amazon"]

	filter {
		name   = "name"
		values = ["amzn2-ami-hvm-*-x86_64-gp2"]
	}
}
```

Notes:
- Data Sources Les data sources permettent d'interroger et d'utiliser des informations sur des ressources existantes non gérées par Terraform.
