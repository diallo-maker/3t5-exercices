## Exercice 2: Les services

# 4.2.1. Obtenir la liste de tous les services dont le nom commence par W et afficher les 
#        propriétés Name, Status et StartType dans un tableau.

get-service | where-object -Property Name -like "W*" | Select-Object Name, Status, StartType  | Format-Table

# 4.2.2. Même chose, mais montrer seulement les services en cours d'exécution.

get-service | where-object {$_.Name -like "W*" -and $_.Status -eq "Running" } | Select-Object Name, Status, StartType  | Format-Table

# 4.2.3. Même chose, mais montrer seulement les services en cours d'exécution qui 
#        s'exécutent automatiquement.

Get-Service | 
>> Where-Object {$_.Name -like "W*" -and $_.StartType -eq "Automatic"} |
>> ForEach-Object {
>>     Get-Service -Name $_.Name | Format-List * | Out-File "Service_$($_.Name).txt"}

# dans le ForEach-Object, le get-service -Name $_.name prend le nom du service qui est le courant et prend le service donc tout