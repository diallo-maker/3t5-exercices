## Exercice sur les fichiers CSV
##
## Voir: https://info.cegepmontpetit.ca/3t5-automatisation/exercices/fichiers-csv
##


# 1. Dans PowerShell, utilisez la commande Get-Content pour voir le contenu de ce fichier texte.

get-content -Path "C:\Users\1856207\Downloads\stawars.csv"

# 2. Utilisez maintenant la commande Import-Csv pour importer le fichier sous forme d'un tableau d'objets.

$starwars = Import-Csv -Path "C:\Users\1856207\Downloads\stawars.csv" -Delimiter ';'


# 3. Donnez le prénom et le nom des contrebandiers, en ordre alphabétique de nom.

$contrebandiers = $starwars | Where-object -Property Profession -Match "Contrebandier" | select-object -Property Prenom, Nom | sort-object -Property Nom 


# 4. Sauvegardez ces nouvelles données dans le fichier contrebandiers.csv afin qu'il puisse être ouvert dans Excel
#    (donc encore attention au délimiteur. Attention aussi à la première ligne qui contient l'information de type (si 
#    vous utilisez Windows PowerShell). Le fichier devrait pouvoir être ouvert dans Excel sans erreur.


$contrebandiers | Export-Csv -Path "C:\Users\1856207\Downloads\contrbandiers.csv" -Delimiter ';'

