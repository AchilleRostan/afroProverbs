# 📜 afroProverbs – Guide Contributeurs

Bienvenue dans le projet **afroProverbs** 🎉  

Ce document s’adresse aux **membres de l’équipe qui contribuent** au développement du package.  
Il explique **ce que nous construisons**, **comment nous organisons nos fichiers**, et **quelles sont les étapes à suivre**.

---

## 🌍 Vision

`afroProverbsAfrica` est un package R qui collecte et analyse des **proverbes africains multilingues**.  
Objectif : **préserver la culture** et fournir des outils simples pour la **recherche, l’éducation, la data science et le NLP**.

---

## 🎯 Objectifs

- Collecter des proverbes dans plusieurs pays africains (** Cameroun, Congo, Tchad, Centrafrique, Madagascar, Togo**).  
- Stocker les proverbes dans des **fichiers JSON par pays** (`data-raw/`).  
- Fusionner ces fichiers en un seul dataset R (`proverbs_core.rda`).  
- Développer 3 fonctions principales :  
  - `ap_search()` → rechercher un proverbe.  
  - `ap_themes()` → analyser les thèmes.  
  - `ap_tokens()` → tokeniser le texte.  
- Livrer une **première version (v0.1.0)** sur GitHub avec au moins **1000 proverbes**.

---

## 📂 Organisation du dépôt

```
afroProverbsAfrica/
├─ R/ # Fonctions R
│ ├─ search.R # ap_search()
│ ├─ themes.R # ap_themes()
│ ├─ tokens.R # ap_tokens()
│ └─ utils.R # utilitaires communs
│
├─ data-raw/ # Données brutes en JSON
│ ├─ madagascar.json
│ ├─ cameroun.json
│ ├─ congo.json
│ ├─ tchad.json
│ ├─ centrafrique.json
│ └─ togo.json
│
├─ data/ # Données consolidées pour R
│ └─ proverbs_core.rda
│
├─ tests/ # Tests unitaires
│ └─ testthat/
│ ├─ test-search.R
│ ├─ test-themes.R
│ └─ test-tokens.R
│
├─ vignettes/ # Tutoriels (Quickstart)
│ └─ quickstart.Rmd
│
├─ DESCRIPTION # Métadonnées du package
├─ NAMESPACE # Fonctions exportées
├─ LICENSE # MIT
└─ README_DEV.md # Ce guide (contributeurs)
```

---

## 🗂️ Format JSON (obligatoire)

Chaque fichier JSON doit avoir la même structure :  

```json
{
  "id": "mg1",
  "language": "mg",
  "country": "Madagascar",
  "proverb_original": "Ny valala tsy indroa mandry am-bavahady",
  "translation_en": "The locust does not sleep twice at the gate",
  "theme": "resilience",
  "source": "Malagasy oral"
}

```
## 🗂️ Champs obligatoires

Chaque fichier JSON doit contenir les champs suivants :  

- **id** : identifiant unique (ex. `mg1`, `cm2`, …)  
- **language** : code langue (`mg`, `ewondo`, `ln`, `ar`, `sango`, `ewe`, …)  
- **country** : pays d’origine du proverbe  
- **proverb_original** : texte original (UTF-8)  
- **translation_en** : traduction anglaise  
- **theme** : thème (parmi la liste :  
  `wisdom`, `community`, `resilience`, `solidarity`, `nature`, `unity`, `fate`, `cooperation`)  
- **source** : origine (oral, recueil, livre, etc.)  

---

## 🚀 Étapes du MVP (4 semaines)

- **Semaine 1 : Collecte**  
  - Créer la structure du package.  
  - Ajouter au moins 10 proverbes par pays dans `data-raw/`.  
  - Fusionner en dataset consolidé `proverbs_core.rda`.  

- **Semaine 2 : Développement**  
  - Implémenter les fonctions principales :  
    - `ap_search()`  
    - `ap_themes()`  
    - `ap_tokens()`  

- **Semaine 3 : Documentation & Tests**  
  - Rédiger un tutoriel *Quickstart* (`vignettes/quickstart.Rmd`).  
  - Ajouter des tests unitaires (`testthat`).  

- **Semaine 4 : Finalisation**  
  - Nettoyer le code et la documentation.  
  - Revue d’équipe (QA).  
  - Publier la version `v0.1.0` sur GitHub.  

---

## 👥 Rôles dans l’équipe

- **Data** : collecte, traduction et validation des proverbes (Avo,..).
- **Dev** : implémentation et tests des fonctions R.  
- **Doc** : rédaction README, vignette, exemples d’utilisation.  
- **QA** : vérification des formats et revue finale.  

---

## ✅ Definition of Done

Une contribution est considérée comme **terminée** si :  
- Le fichier JSON est valide et contient tous les champs obligatoires.  
- Le code passe `devtools::check()` sans erreur.  
- La documentation est complète et à jour.  
- Un exemple d’utilisation est fourni.  
- La Pull Request est validée et mergée dans `dev`.  

---
