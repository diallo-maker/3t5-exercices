#### 5.1.1
# Obtenir la liste de tous les chemins contenus dans la variable d'environnement 
#     PATH, sous forme de tableau de strings.
# Quand tu fais le dir Env:Path tu a un tableau de 2 element et dans value les valeurs sont séparé par des ; donc mettre les dir env:path () pour avoir acces a Value
# et split avec ';' 

$path = (Get-ChildItem Env:\Path).Value.Split(';') 
$path

Ou bien encore plus simple faire:

$env:Path.split(';')

#### 5.1.2
# Inverser le sens des barres obliques dans la chaîne C:\Windows\System32 pour
#     qu'elle devienne C:/Windows/System32 en utilisant une méthode de
#     remplacement (replace).

# dans regex vu que \ est un caractere spécial pour le garder tel quel il faut mettre un autre \ donc \\ 

$replacement = "C:\Windows\System32"
$replacement -replace "\\", "/" 
#### 5.1.3
# En utilisant les solutions précédentes, inversez le sens des barres obliques 
#     pour tous les chemins de la variable PATH.

# là c'est juste un mélange des 2 premiers exos, tu split tout les chemins et ensuite en foreach, tu remplace \ par /
$env:Path.split(';') | ForEach-Object { $_ -replace "\\", "/" }

#### 5.1.4
# En utilisant la variable suivante, trouver la ligne de commande qui donne le
#     nombre de mots dans ce texte.

$montexte = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "      + `
    "Donec interdum ut lorem eget consequat. Nam sed leo hendrerit diam "    + `
    "pharetra blandit. Vestibulum enim diam, congue sit amet sem in, "       + `
    "maximus varius metus. Pellentesque in turpis rutrum, ornare ante a, "   + `
    "dapibus felis. Sed pellentesque, nunc non tincidunt pretium, velit "    + `
    "lorem scelerisque sem, quis tristique elit ex vel massa. Nam quam "     + `
    "magna, tempus sit amet lacus in, placerat suscipit velit. Aenean "      + `
    "eleifend fermentum risus, at laoreet urna malesuada nec. Etiam "        + `
    "tempus lectus scelerisque, sagittis elit sed, posuere nunc. Ut id "     + `
    "dictum libero, sed pharetra metus. Phasellus ac elit arcu. Fusce "      + `
    "nec luctus neque. In commodo id tellus at placerat. Class aptent "      + `
    "taciti sociosqu ad litora torquent per conubia nostra, per "            + `
    "inceptos himenaeos. Nam turpis tortor, eleifend ut tristique "          + `
    "vel, eleifend ut neque."


#La longueur ($montexte.Length) te donne le nombre de caractères, pas le nombre de mots.
#Pour compter les mots, il faut split le texte sur les espaces.

$montexte.Split(' ').Count


#### 5.1.5
# En utilisant le texte précédente, trouver la ligne de commande qui donne le 
#     nombre de phrases.

# split avec le '.' parce que chaque phrase finit par un .

$montexte.Split('.').Count


#### 5.1.6
# En utilisant une expression régulière, valider si la chaîne de caractères 
#     "A1B 2C3" correspond à un code postal canadien à l'aide de l'opérateur 
#     -Match
#
# Note: Un code postal canadien est constitué ainsi: 
#      [lettre] [chiffre] [lettre] [espace] [chiffre] [lettre] [chiffre].
#d = chiffre
#w = lettre
#s= espace

"A1B 2C3" -match "^\w\d\w\s\d\w\d$"


#### 5.1.7
# En utilisant une expression régulière, trouvez une ligne de commande qui 
#     retourne tous les chemins de la variable PATH qui se terminent par un "\".

$env:Path.Split(';') -match "\\$"

