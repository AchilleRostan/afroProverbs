#' Rechercher des proverbes dans le dataset principal par texte original ou traduction
#'
#' Cette fonction permet de rechercher des proverbes selon différents filtres 
#' et de choisir si la recherche s'effectue dans le texte original, dans la traduction,
#' ou dans les deux.
#'
#' @param data data.frame ou tibble contenant les proverbes.
#' @param query Mot(s)-clé(s) à rechercher (optionnel).
#' @param theme Thème du proverbe (optionnel).
#' @param country Pays d'origine (optionnel).
#' @param language Code langue (optionnel).
#' @param search_original Rechercher dans 'proverb_original' (par défaut TRUE).
#' @param search_translation Rechercher dans 'translation_en' (par défaut TRUE).
#' @return Un data.frame filtré.
#' @examples
#' @examples
#' # Recherche simple par mot-clé
#' ap_search(proverbs_core, query = "truth")
#'
#' # Recherche par thème
#' ap_search(proverbs_core, theme = "wisdom")
#'
#' # Recherche par mot-clé et pays
#' ap_search(proverbs_core, query = "child", country = "Cameroon")
#'
#' ap_search(proverbs_core, query = "enfant", search_original = TRUE, search_translation = FALSE)
#' ap_search(proverbs_core, query = "truth", search_translation = TRUE)

ap_search <- function(
    data, 
    query = NULL,
    theme = NULL,
    country = NULL,
    language = NULL,
    search_original = TRUE,
    search_translation = TRUE
) {
  results <- data
  
  # Recherche par mot-clé dans les colonnes choisies
  if (!is.null(query)) {
    mask <- rep(FALSE, nrow(results))
    if (search_original && "proverb_original" %in% names(results)) {
      mask <- mask | grepl(query, results$proverb_original, ignore.case = TRUE)
    }
    if (search_translation && "translation_en" %in% names(results)) {
      mask <- mask | grepl(query, results$translation_en, ignore.case = TRUE)
    }
    results <- results[mask, ]
  }
  if (!is.null(theme)) {
    results <- results[tolower(results$theme) == tolower(theme), ]
  }
  if (!is.null(country)) {
    results <- results[tolower(results$country) == tolower(country), ]
  }
  if (!is.null(language)) {
    results <- results[tolower(results$language) == tolower(language), ]
  }
  
  # Construction output customisé
  if (nrow(results) == 0) {
    
    return("Aucun proverbe trouvé avec ce(s) critère(s).")
  } else { 
      summary <- paste("Nombre de proverbes trouvés :", nrow(results))
      # Sélection des colonnes principales
      display_df <- results[, c("language", "country", "proverb_original", "translation_en", "theme")]
      
      return(list(summary = summary, results = display_df))
  }
} 
