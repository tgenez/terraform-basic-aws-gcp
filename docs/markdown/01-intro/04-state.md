
## Qu'est-ce que le Terraform State?

* Fichier JSON qui stocke l'état actuel de l'infrastructure gérée
* Permet à Terraform de suivre les ressources qu'il gère
* Généralement stocké dans un fichier `terraform.tfstate`
* Contient les métadonnées, mappings et attributs de chaque ressource

##==##

## Importance du State

* Permet à Terraform de déterminer quelles modifications apporter
* Établit la correspondance entre les ressources déclarées et les ressources réelles
* Stocke les dépendances entre les ressources
* Mémorise les attributs pour les utiliser dans d'autres ressources

##==##

## Gestion du State

* **Local**: Stocké par défaut dans le répertoire de travail
* **Remote**: Peut être stocké dans un backend distant (S3, Azure Blob, GCS, etc.)
* **Verrouillage**: Empêche les modifications simultanées (crucial en équipe)

