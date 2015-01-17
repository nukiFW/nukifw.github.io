# Une page statique
Ceci est un article d'exemple (et d'expérience). Ce système de publication repose principalement sur ces technologies : 

*    **Pandoc** : Conversion de Markdown en HTML
*    **Github pages** : Hébergement et versionnement
*    **Sed** : Remplacement de contenu
*    **Highlight.js** : Colorisation syntaxique
*    **DisqUs** : Commentaires sur les articles
*    **GNU Make** : Automatisation des tâches
*    **HTML**, **CSS**, **Javascript** : Rendu en pages HTML

## Exemples de code

```ocaml
let fact = 
  let rec fact acc = function 
  | n when n < 2 -> acc 
  | n -> fact (acc * n) (pred n)
in fact 1
``` 

## Tentative de mathématiques 
$$
\lambda x \oplus 9
$$