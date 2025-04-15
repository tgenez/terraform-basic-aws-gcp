## Constitution d'un projet terraform

Projet avec modules et folder par environment:
* Permet changement plus facile de l'infrastructure entre dev et prod

```
📁 environements
 └──📁 dev
     ├── main.tf           # déclaration des ressources et autres
     ├── provider.tf       # définition des provider à utiliser comme gcp ou aws  
     ├── terraform.tfvars  # affectation des variables
     └── variables.tf      # définition des variables
   └──📁 prod
     ├── .....             # même fichier
📁 modules
 └──📁 module
     ├── main.tf        # déclaration des ressources et autres
     ├── output.tf      # variable à exporter pour être utiliser en dehors 
     └── variables.tf   # définition des variables
```

##==##

## Constitution d'un projet terraform

Projet avec tout dans un seul folder et variables par environnements
* Code qui peut être complexe en conditionnement entre les environnements

```
📁 environements
 └──📁 aws
     ├── main.tf           # déclaration des ressources et autres
     ├── provider.tf       # définition des provider à utiliser comme gcp ou aws  
     ├── terraform.dev.tfvars  # affectation des variables
     ├── terraform.prod.tfvars  # affectation des variables
     └── variables.tf      # définition des variables
📁 modules
 └──📁 module
     ├── main.tf        # déclaration des ressources et autres
     ├── output.tf      # variable à exporter pour être utiliser en dehors 
     └── variables.tf   # définition des variables
```
