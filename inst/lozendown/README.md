# <<DIRNAME>>

<!-- badges: start -->
<!-- badges: end -->

<!-- Avant de commencer à rédiger le contenu -->
<!-- /!\ SUIVRE les instructions de dev/dev_history_book.Rmd /!\ -->

Ce livre numérique contient ...

## Organisation du projet

Le fonctionnement des contributions est expliquée dans
<CONTRIBUTING.md>

## Génération automatique des documents

Les documents sont générés automatiquement grâce à un dispositif qui s'appelle
l'intégration continue. La dernière version de ces documents est disponible en
cliquant ici :
*<url a definir>*

## Un rapport pour chaque branche importante

Le rapport est compilé et généré automatiquement dès fusion vers la branche principale (`main`). La dernière version est accessible ici: <url-pages/main>
Cette version peut-être imprimée en PDF en l'état.

Chaque branche spécifique comme `production` ou `validation` montre une version du rapport dans cette branche :

- Pour `production`: <url-pages/production>
- Pour `validation`: <url-pages/validation>
Toutes les versions de branches spécifiques sont visibles dans l'index: <url-pages/index.html>

_Pour changer l'apparence de la sortie HTML (couleurs, espaces, ...), il est nécessaire de modifier les ressources du package._

## Un rapport au format odt à jour

Le rapport au format "odt" peut être téléchargé dans sa dernière version ici: <url-pages/main/rapport.odt>

_Note : Pour ce format, vous avez la possibilité de changer le template par défaut inclu dans le 'pandoc/reference.odt'_

## Rédiger le rapport en local et envoyer ses modifications

Voir ["CONTRIBUTING.md"](CONTRIBUTING.md)

### Détails techniques

La conversion s'effectue grâce à R et [pandoc](https://pandoc.org).  
L'intégration continue utilise l'image docker officielle de rocker qui est une image Ubuntu avec pandoc d'installé.

## Configuration de git sur les postes de travail

*Dans le Terminal*  
``` bash
git config --global user.name "Toto Tata"
git config --global user.email "toto@email.fr"
```

## Utilisation du mode Editeur Visuel dans RStudio

> Il est recommandé d'écrire de faire en sorte qu'il n'y ait qu'une phrase par ligne pour faciliter le suivi des modifications dans git. Si vous utilisez l'Editeur Visuel, activez cette fonctionnalité dans RStudio : Tools > Global Options > RMarkdown > Visual > "Automatic Text Wrapping (Line break) : 'sentence'"

## Modifications du YAML de "index.Rmd"

-   `toc-title` : le titre de la table des matières
-   `main-color` : le code hex de la couleur principale des liens dans le document

## Modifications du YAML de rendu dans "\_output.yml"

Les options de `pagedown::html_paged()` permettent de choisir :

-   `front_cover` : chemin local ou URL vers l'image de la page de garde
-   `back_cover` : chemin local ou URL vers l'image de la page de fin
-   `other_css` : chemin local vers un fichier css complémentaire

Vous pouvez aussi utiliser les options de `bookdown::html_document2()` :

- `number_sections` : Faut-il numéroter les sections (`true`) ou non (`false`).
    + Notez que vous pouvez utiliser la notation `## Mon titre {-}` pour que ce titre ne soit pas numéroté.

## Besoin d'aide ?

Travail collaboratif avec la méthode PROPRE: <https://rdes_dreal.gitlab.io/publication_guide/>
