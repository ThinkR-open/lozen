## Script pour deployer sur Connect avec le CI
# _Créer un token de déploiement dédié au projet pour le user générique sur Connect
# _Ajouter le token en variable privée masquée dans le dépot GitLab: CONNECT_TOKEN
# _Ajouter le nom d'utilisateur Connect en variable privée masquée dans le dépot GitLab: CONNECT_USER
# _Dans le projet GitLab Settings > CI/CD > Variables > Expand > Add variable
# _Attention : si vous cochez "Protected" au moment de la création de la variable, alors celle-ci ne sera active que pour les branches protégées
# _Ajouter la ligne suivante dans votre gitlab-ci.yml, après la création du pkgdown
#   __ Si c'est le pkgdown que vous voulez envoyer
# `        - Rscript "dev/dev_history_connect.R"`

# Ajouter aussi ces 2 variables d'environnement dans votre .Rprofile local
#  pour le premier envoi manuel sur Connect

# Un stage complet de CI peut-être (Attention avec les espaces, faire du LINT)
# Changer master par main si besoin

# connect:
#   stage: deploy-connect
#   dependencies:
#     - pages
#   only:
#     - main
#     - master
#     - test-ci
#   script:
#     - Rscript "dev/dev_history_connect.R"
#   artifacts:
#     paths:
#     # This will download artifacts from previous jobs
#         - public
#     expire_in: 30 days

# Ne pas oublier d'ajouter le stage "deploy-connect"
# à la liste des stages du début du fichier gitlab-ci.yml
# Dans cet ordre

# stages:
#   - build
#   - test
#   - pkgdown
#   - pkgdown-move
#   - deploy
#   - deploy-connect


# ==== double version avec gh-pages ====
# Pour avoir une version dev et une version main, pour un book par exemple
# Nous allons utiliser https://github.com/statnmap/GitLab-Pages-Deploy
# *Sur GitLab*
#   - [ ] Créer un nouveau projet totalement vide sur GitLab
# + Choisir le groupe dans lequel le créer dans le menu déroulant
# + Surtout **ne pas** cocher "Initier avec un Readme"
# + Récupérer l'url du projet GitLab
#     + Vous pouvez la noter ici pour plus tard
# - [ ] Créer un token nommé `PROJECT_ACCESS_TOKEN` sur GitLab dans votre projet dans "Settings > Access Token" avec les accès "Read/Write repository"
#   + Copier le token ici, il ne sera visible qu'une fois
# + En savoir plus : https://github.com/statnmap/GitLab-Pages-Deploy#publish-one-site-for-each-branch
# - [ ] Créer une variable d'environnement pour le CI
#   + Aller à : Settings > CI/CD > Variables
#   + Cliquer sur "Expand"
#   - Add variable
#   - Remplir "key" avec `PROJECT_ACCESS_TOKEN`
#   - Remplir le token avec celui que vous avez sauvé ci-dessus
#   - Cocher la case 'Mask variable', et décocher la case 'Protected'
#   - Cliquer sur "Add variable"
#   - Supprimer le token si vous l'avez copié dans le fichier actuel au-dessus
#     + Il n'est plus nécessaire

# Créer la branche "gh-pages"
# Y déposer à la racine ce fichier 'dev_history_connect.R'

# Changer les stages pour
# stages:
#   - book-create
#   - prepare-deploy
#   - deploy
#   - deploy-connect

# _Puis ces deux stades après la création d'un book
#
# gh-pages-prep:
#     stage: prepare-deploy
#     only:
#       - main
#       - master
#       - production
#       - validation
#       - pages-deploy
#     script:
#       # Deploy a unique site in gh-pages branch,
#       # or a sub-website for each branch if SITE_BY_BRANCH: "TRUE"
#       - wget https://raw.githubusercontent.com/statnmap/GitLab-Pages-Deploy/main/deploy_pages_branch.sh
#       - /bin/bash deploy_pages_branch.sh
#
# pages:
#     stage: deploy
#     script:
#         - echo "book deployment"
#     artifacts:
#         paths:
#             - public
#     only:
#         # Because we use "deploy_pages_branch", only gh-pages branch needs to be deployed
#         # All outputs from other branches in "prepare-deploy" step will push in "gh-pages"
#         - gh-pages



# ==== connect ====
# /!\ => La premiere fois, laisser executer le CI en commentant le parametre "appID"
# Les fois suivantes, décommenter "appID" pour mettre le numéro de l'app sur Connect
# Choisir les paramètres ci-dessous en fonction de votre besoin

# Définir les droits de lecture de l'app sur Connect avec des individus et pas des groupes.
# Seuls les devs du projet et le client contact y ont accès

# Changer `mypackage` par le nom de votre package dans ce fichier

# Après le premier envoi manuel, définissez une url sur Connect directement
# pour avoir accès au site web - Ajuster les droits de lecture aussi
# Ensuite, mettez à jour le README pour dire où est le book et ses versions

# - version main : https://url_de_connect/my-book/main
# - version production : https://url_de_connect/my-book/production

# Deps
install.packages("rsconnect")

## deploy shinyapp
# orgiwd <- setwd(".") # Uncomment here and below
## deploy pkgdown
# pkgdown::build_site()
if (dir.exists("public")) {
  origwd <- setwd("public")
} else {
  origwd <- setwd("docs")
}
print(paste("--", getwd(), "--"))

rsconnect::addServer("https://url_de_connect/__api__", name = "connect")
rsconnect::connectApiUser(account = Sys.getenv("CONNECT_USER"),
                          server = "connect", apiKey = Sys.getenv("CONNECT_TOKEN"))

# S'il y a {renv} dans votre projet, vous devrez probablement cacher quelques dossiers, par exemple
appFiles <- list.files(".", recursive = TRUE)
appFiles <- appFiles[!grepl(".Rprofile|renv|rstudio_|deliverables|dev|data-raw|docker", appFiles)]

rsconnect::deployApp(
  ".",                          # the directory containing the content
  appName = "book-auto-ci",
  appFiles = appFiles,          # the list of files to include as dependencies (all of them)
  appPrimaryDoc = "index.html", # the primary file for pkgdown
  # appPrimaryDoc = "app.R", # the primary file for shinyapp # Uncomment here
  # appId = 000, # Define when known
  account = Sys.getenv("CONNECT_USER"),
  server  = "connect",
  forceUpdate = FALSE
)

setwd(origwd)
