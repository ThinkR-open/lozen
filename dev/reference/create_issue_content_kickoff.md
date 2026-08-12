# Create issue content for kickoff

Generate text for kickoff issue

## Usage

``` r
create_issue_content_kickoff()
```

## Value

character vector of the issue content

## Examples

``` r
create_issue_content_kickoff()
#>  [1] "## Validation (Pour les clients)"                                                                                                                                                                                        
#>  [2] ""                                                                                                                                                                                                                        
#>  [3] "- [ ] Je comprend qu'un ticket est divisé en 3 parties: le titre (besoin), les critères de validation et une partie technique"                                                                                           
#>  [4] "- [ ] Je comprend que la partie validation est celle qui me concerne en tant client et que toutes les informations pour valider le ticket y sont présentes"                                                              
#>  [5] "- [ ] J'ai été informé que la partie validation est auto-portante: toutes les informations permettant de valider seront présentes et complétée avec des captures d'écran ou url à explorer"                              
#>  [6] "- [ ] Je comprend que la partie technique ne concernent que les personnes qui développent"                                                                                                                               
#>  [7] "- [ ] Je comprend que pour valider ce ticket, je dois ajouter un commentaire ci-dessous pour indiquer que je valide la totalité du ticket et qu'il peut être fermé. Le cas échéant, j'indique les corrections à apporter"
#>  [8] ""                                                                                                                                                                                                                        
#>  [9] "## Technique (Pour les devs)"                                                                                                                                                                                            
#> [10] ""                                                                                                                                                                                                                        
#> [11] "+ [ ] Ajouter un lien vers le site {pkgdown} du projet dans le critère 3 (auto-portant)"                                                                                                                                 
#> [12] "+ [ ] Mettre ce ticket dans la colonne validation"                                                                                                                                                                       
#> [13] "+ [ ] Faire en sorte que ce ticket soit validé en KickOff avec le client"                                                                                                                                                
```
