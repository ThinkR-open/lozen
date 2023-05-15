# Guide des bonnes pratiques pour contribuer et relire les documents digitaux de la NDC

## Structure du projet

Le projet s'organise en différentes branches :

-   master/main : la branche principale, les contributeurs doivent s'accorder sur son
    contenu. Les contributeurs ne sont pas supposés la modifier directement sauf
    pour des changements mineurs

-   branche thématique : ces branches sont issues de main et sont créées par
    chacun des contributeurs souhaitant ajouter quelque chose au projet

-   validation : cette branche correspond au "bon à tirer", seul le valideur
    final est autorisé à fusionner la branche main avec la branche validation

## Arborescence du projet

Chaque fiche est rédigée dans un document markdown dans le dossier
correspondant. Les images de la fiche peuvent également être stockées dans ce
dossier. Dans le dossier racine, les fichiers .gitignore et Rproj servent à
configurer le projet git, gitlab-ci et pandoc.yml servent pour compiler le
fichier .odt en sortie, et les fichiers Contributing.md et Read.me donnent des
informations sur le fonctionnement du projet.

## Méthode pour rédaction d'un document à plusieurs

1.  Bien paramétrer le projet (fichier `.gitignore`)
2.  Commencer par créer un squelette de fiche qui sera poussé dans main (avec
    titres, sous-titres ou repères. Si les différents contributeurs ont des
    parties distinctes, on peut mettre des commentaires du type
    `<!-- partie de David -->` et on convient de ne jamais toucher aux
    commentaires, car ils servent de repères à git).
3.  Créer une issue par partie (sauf si une issue aborde plusieurs sujets qui
    n'ont rien à voir, auquel cas ce ne serait pas idiot d'en faire plus.
    L'objectif est que chaque issue porte sur un sujet unique. Les issues sont
    aussi des lieux de réflexion et de discussion.)
4.  Créer une branche par issue à partir de main (ne pas oublier de faire un
    pull de main avant) : nom de la branche x-titre_de_la_branche (x étant le
    numéro de l'issue)
5.  Chaque rédacteur ouvre une merge request en mode Draft en rajoutant `WIP:`
    devant le nom de sa MR avant de commencer à rédiger (MR de sa branche vers
    main). Ce signal veut dire "je commence à m'y mettre"
6.  Quand un rédacteur a terminé sa contribution, il retire le mode Draft en
    enlevant le `WIP:` et demande une relecture par les collègues
7.  Chaque relecteur fera ses propositions de modification comme je vous l'ai
    montré (commentaire et suggestions). La relecture se termine par une
    approbation de la merge request (il y a un bouton)
8.  Ensuite on merge chaque merge request approuvée dans main

## Créer et contribuer à un document

### Utiliser RStudio pour rédiger le rapport en local et envoyer ses modifications

- Récupérer la dernière version du projet
    + "Pull": Onglet "Git" > Flèche bleue vers le bas
- S'assurer d'être dans la bonne branche git
    + Onglet "Git"
    + Le nom de la branche apparaît à droite
    + Utiliser une branche existante dans le menu déroulant
        + Ou en créer une nouvelle en cliquant sur l'icone violette à côté
- Rédiger le contenu dans les fichiers Rmd adéquats
- Sauvegarder les fichiers modifiés
- Compiler le livre pour voir à quoi cela ressemble
  + Onglet "Build" > Build book > Choisir "lozendown" dans le menu déroulant
- Enregistrer ses modifications dans l'historique git
    + Onglet "Git" > Cocher les fichiers modifiés à envoyer
    +"Commit" ses modifications
- Envoyer vers le serveur distant
    + "Push": Onglet "Git" > Flèche verte vers le haut

### Création d'un document

-   créer un document markdown (md) dans main avec une trame/plan (ceci aide
    git à faire les futures fusions de paragraphes)

-   créer des issues correspond aux thèmes traités (sous parties/paragraphes).
    Une issue unique par thème est conseillée.

-   créer une branche correspondant à cette issue à partir de main (faire un
    pull de main est donc nécessaire avant la création de la nouvelle branche)

-   créer une merge request (MR) en mode draft (nom débute par `WIP:`). Cela
    permet de prévenir les collègues que le travail débute. Quand le
    contributeur a fini, il retire le mode draft et demande aux collègues de
    relire et faire des propositions de modifications.

*Conseil* : A chaque issue est affecté un numéro unique. Après avoir créé une
issue, si je crée une branche dont le nom commence par x-... où x est le numéro
de l'issue, alors la merge request fermera automatiquement l'issue en question.
Ca évite d'avoir à écrire close \#x dans la merge request (en fait, ça alimente
automatiquement le texte de la merge request)

### Discuter

Discussion dans l'issue/merge request? Proposition de modification dans la merge
request

Les conversations thématiques doivent avoir lieu sur le gitlab, cela permet de
garder une trace, ou sur slack

### Apporter sa contribution

-   créer une issue
-   créer une branche x-titre_de_la_branche (x étant le numéro de l'issue)
-   créer une merge request (MR)

*Conseil* : ça vaut vraiment le coût de rajouter dans la description de la merge
request close \#x pour relier automatiquement la merge request et l'issue.

### Relecture par les collègues

-   Une fois que j'ai terminé ma contribution, je le signale à mes collègues en
    enlevant le mode draft (préfixe `WIP:` de ma merge request). A ce moment là,
    ils peuvent relire. Pour apporter des suggestions, un moyen simple est
    d'aller dans Changes, de cliquer à gauche `Add a comment to this line` cela
    permet de faire un commentaire. Ils peuvent même suggérer directement une
    modification en cliquant, dans le commentaire sur `Insert suggestion`. Pour
    accepter une suggestion, je n'aurais plus qu'à cliquer sur
    `Apply suggestion` si je suis d'accord. Pour faire une suggestion sur
    plusieurs lignes, insérer une suggestion sur la première ligne à modifier,
    et ajuster le paramètre `suggestion:-0+0` en le remplaçant par exemple par
    `suggestion:-0+2` pour inclure les deux lignes suivantes.
-   Pour connaître l'avancement de relecture de mes collègues, je peux modifier
    le chapeau de ma Merge Request et faire une liste à cocher avec leurs noms.
    De cette manière, une fois qu'ils ont effectué leur relecture, ils cochent
    cette case pour me prévenir qu'ils ont terminé la relecture.
-   L'idée générale du workflow des commentaires, c'est qu'un commentaire crée
    un début de discussion. Pour pouvoir merger, le commentaire doit être
    résolu. Les commentaires non résolus sont des **unresolved threads** qu'il
    faut resolve, en acceptant la suggestion ou en le fermant, avant de passer à
    l'étape suivante.

### Valider

-   valider une merge request : Dans les merge requests, vous avez l'option
    `Squash commits` (il s'agit d'une case à cocher). Par défaut, elle n'est pas
    cochée. Lorsqu'on fusionne une branche dans une autre, on a le choix de
    conserver tous les commits ou bien de créer un seul commit résumant
    l'ensemble des modifications. Pour les merge requests que vous préparez,
    conserver l'ensemble des commits va avoir peu d'intérêt. Il est donc
    conseillé de cocher `Squash commits`.
-   En cas de conflit, voir le paragraphe Résolution de conflits ci-dessous.

## Résolution de conflits

Comment sait-on que nous avons un conflit ? Il y a 2 façons de le voir :

-   sur la page des merge requests, on voit l'icône :danger: sur la ligne ;
-   pour une merge request, il est impossible de la merger et il est écrit
    "There are merge conflicts"

Il est déconseillé d'utiliser les boutons de l'interface web de GitLab ("resolve
conflicts" ou "merge locally"). On va plutôt utiliser l'interface RStudio et les
lignes de commandes.

Les étapes à suivre :

1.  On ouvre RStudio, on se positionne sur la branche main et on fait un pull.
2.  Dans RStudio, on se positionne sur la branche qui contient des conflits et
    on fait un pull.
3.  On va utiliser git en ligne de commande, soit avec clic droit -\> git bash
    here, soit avec le terminal de RStudio.
4.  On vérifie qu'on est bien sur la branche qui ne veut pas merger
    automatiquement et on fait git merge main et on obtient ça comme réponse
    (exemple) :

`$ git merge main Removing international/.gitkeep Removing git_command Auto-merging fiche_international.md CONFLICT (content): Merge conflict in fiche_international.md Removing example_fiche_international.md Automatic merge failed; fix conflicts and then commit the result.`

5.  On recherche les lignes où git nous indique un conflit (`CONFLICT`). Dans
    l'exemple, on n'a qu'un seul fichier qui pose problème : `international.md`.
    On l'ouvre. Les opérations qui suivent seront à réaliser pour tous les
    fichiers qui auraient des conflits.
6.  On recherche dans le fichier international.md toutes les occurences de la
    ligne `=======` . Elle est présente pour chaque conflit (il peut y avoir
    plusieurs conflits au sein d'un même fichier).
7.  Au dessus de cette ligne, on recherche la première occurence de
    `<<<<<<< HEAD` Au dessous de cette ligne, on rechercher la première
    occurence de `>>>>>>> main`. L'ensemble du conflit à traiter se situe
    entre la ligne qui commence par `<<<<<<` et celle qui commence par
    `>>>>>>>`.
8.  Il faut choisir soit le bloc au-dessus de la ligne `=======` soit celui en
    dessous de `=======`. Il est également possible d'écrire tout autre chose.
    On supprime ensuite tout le reste, soit `<<<<<<< HEAD` + la partie que l'on
    n'a pas choisie + `=======` + `>>>>>>> main`.
9.  Comme git est en mode conflit, il attend une action : il faut faire un
    commit. Le fichier modifié, ici `international.md`, est dans un état bizarre
    : c'est le mode résolution de conflit. Il faut le sélectionner et faire un
    commit, puis on push la branche.

## Conseils divers

### Bien commencer sa journée

Les bonnes habitudes du matin lorsqu'on recommence à travailler sur un projet :

-   aller faire un tour sur la page d'activité du projet (voir lien ci-dessus),
    regarder tout ce qui a été fait par les membres du projet

-   ouvrir RStudio regarder dans l'onglet git l'état de son projet local : on
    devrait l'avoir quitté sans travail en cours non pushé. Autrement dit, bien
    vérifier que dans l'onglet git, il n'y a pas de ligne.

-   S'il y a des lignes, il est toujours temps de le pousser vers le serveur. Se
    positionner sur main et faire un pull se positionner dans sa branche de
    travail et faire un pull.
