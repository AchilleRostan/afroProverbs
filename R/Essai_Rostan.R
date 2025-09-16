library(jsonlite)

# Charger le fichier JSON
cameroon_proverbs <- fromJSON("data-raw/cameroon.json")

# Voir un aperçu
print(head(cameroon_proverbs))

# Ajouter au dataset consolidé (proverbs_core.rda) si existant, sinon créer
if (file.exists("data/proverbs_core.rda")) {
  load("data/proverbs_core.rda")
  proverbs_core <- rbind(proverbs_core, cameroon_proverbs)
} else {
  proverbs_core <- cameroon_proverbs
}

# Sauvegarder le dataset mis à jour
save(proverbs_core, file = "data/proverbs_core.rda")
