#' Analyse et résumé des thèmes dans le dataset principal
#'
#' Cette fonction charge le dataset `proverbs_core` du package
#' et retourne la fréquence de chaque thème présent dans la base.
#'
#' @param top Indique le nombre de thèmes les plus fréquents à retourner (optionnel, par défaut 10).
#' @param plot Afficher un graphique (TRUE/FALSE, par défaut FALSE).
#' @return Un data.frame avec les thèmes et leur fréquence, ou un graphique si plot=TRUE.
#' @examples
#' ap_themes() # tableau des 5 thèmes les plus fréquents
#' ap_themes(top = 5)
#' ap_themes(plot = TRUE)
ap_themes <- function(top = 5, plot = FALSE) {
  
  # Charger les donnees
  load("data/proverbs_core.rda")  
  results <- proverbs_core
  
  # Regroupement par thème et comptage
  tab <- as.data.frame(table(tolower(results$theme)))
  colnames(tab) <- c("theme", "frequency")
  tab <- tab[order(tab$frequency, decreasing = TRUE), ]
  
  # Output - tableau ou graphique
  if (plot) {
    barplot(
      tab$frequency[1:top], names.arg = tab$theme[1:top],
      main = "Répartition des thèmes des proverbes",
      ylab = "Nombre de proverbes", col = "steelblue", las = 2
    )
    invisible(tab[1:top, ])
  } else {
    return(tab[1:top, ])
  }
}

ap_themes()
ap_themes(top = 3, plot = TRUE)
