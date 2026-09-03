## Exercice 1: Les fichiers

# 4.1.1. Obtenir tous les fichiers contenus dans le répertoire C:\Windows.
   
get-childItem -path C:\Windows\ -File  

# 4.1.2. Obtenir tous les fichiers contenus dans le répertoire C:\Windows, triés par ordre 
#        décroissant de taille.

get-childItem -path C:\Windows\ -File | sort-object -Property Length -Descending


# 4.1.3. Même chose, mais montrer seulement les fichiers plus grands que 1 mégaoctet.

get-childItem -path C:\Windows\ -File | Where-Object -Property Length -gt 1mb | sort-object -Property Length -Descending

# 4.1.4. Même chose, mais montrer seulement les fichiers qui pèsent entre 1 et 100 kilooctets.

get-childItem -path C:\Windows\ -File | Where-Object {$_.Length -ge 100kb -and $_.Length -le 1mb  }| sort-object -Property Length -Descending 


# 4.1.5. Même chose, mais montrer seulement les fichiers qui pèsent soit plus de 1 mégaoctet 
#        ou moins de 1 kilooctet.

get-childItem -path C:\Windows\ -File | Where-Object {$_.Length -gt 1mb -or $_.Length -lt 1kb }| sort-object -Property Length -Descending 
