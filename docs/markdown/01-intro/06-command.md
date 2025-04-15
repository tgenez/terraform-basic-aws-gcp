## Installation terraform cli

* Il faut installer le client terraform pour pouvoir lancer du terraform.
* Il suffit de suivre la documentation terraform pour son système

[terraform install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
<!-- .element: class="credits" -->

##==##

## Command terraform init

* Initialise un répertoire de travail Terraform
* Télécharge les plugins des fournisseurs (providers) requis
* Configure le backend pour le stockage de l'état
* Prépare le répertoire de travail pour son utilisation.

##==##

## Command terraform plan

* Compare l'état actuel avec l'état souhaité
* Affiche un aperçu des modifications :
  * Ressources à créer (+)
  * Ressources à modifier (~)
  * Ressources à supprimer (-)
* N'effectue aucune modification réelle sur l'infrastructure

##==##

## command terraform apply

* Exécute le plan de déploiement et crée/modifie/supprime les ressources
* Demande une confirmation (sauf si utilisé avec -auto-approve)
* Applique les modifications planifiées sur l'infrastructure
* Met à jour le fichier d'état (state file)

##==##

## command terraform state

* Permet de parcourir le state et son état pour le modifier au besoin
* **terraform state list** - Liste toutes les ressources
* **terraform state show** - Affiche les détails d'une ressource
* **terraform state rm** - Supprime une ressource du state
