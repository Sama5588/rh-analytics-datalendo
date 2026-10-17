# 📊 Projet RH Analytics – SQL (PostgreSQL)

## 👤 Contexte

Ce projet simule une mission de **Data Analyst SQL** au sein de l’entreprise fictive **DataLendo**, pour le service Ressources Humaines (RH).  

L’objectif est d’exploiter les données RH afin de produire des **indicateurs clés, analyses de performance et insights décisionnels** utiles à la direction RH.  

Ce projet met en avant mes compétences en :

- SQL avancé (PostgreSQL)
- Analyse de données RH
- Structuration de projets data
- Traduction des besoins business en requêtes analytiques

---

## 🎯 Objectifs business

Le service RH souhaite :

- Suivre l’évolution des effectifs
- Identifier les départements à risque (turnover)
- Évaluer la performance des employés
- Analyser la rétention par cohorte d’embauche
- Disposer d’un tableau de bord RH opérationnel

**15 questions business** ont été posées par le manager RH et résolues uniquement avec SQL.

---

## 🗂 Données utilisées

Le projet repose sur **4 tables principales**, fournies au format CSV.

### 1️⃣ employes
Informations individuelles des employés :

- `id_employe` (PK)  
- `nom`, `prenom`  
- `poste`  
- `departement_id` (FK)  
- `date_embauche`, `date_depart`  
- `salaire`  

---

### 2️⃣ departements
Référentiel des départements :

- `id_departement` (PK)  
- `nom_departement`  
- `manager`  
- `budget`  

---

### 3️⃣ performances
Évaluations trimestrielles de performance :

- `id_performance` (PK)  
- `id_employe` (FK)  
- `date_evaluation`  
- `score`  
- `objectifs_atteints`  

---

### 4️⃣ turnover
Historique des départs :

- `id_depart` (PK)  
- `id_employe`  
- `date_depart`  
- `type_depart` (volontaire / involontaire)  
- `anciennete`  

---

## 🛠 Outils & technologies

- **PostgreSQL** : requêtes analytiques avancées  
- **VS Code** : environnement de travail  
- **SQL avancé** :
  - CTE, JOIN multiples
  - Agrégations et fonctions de fenêtre
  - Segmentation et analyse comparative

---

## 🔄 Transformations & enrichissement des données

Pour rendre les données exploitables, plusieurs colonnes dérivées ont été créées :

- **Ancienneté** : durée entre la date d’embauche et aujourd’hui (ou date de départ)  
- **Cohorte d’embauche** : année d’entrée dans l’entreprise  
- **Score moyen** : moyenne des scores de performance par employé  
- **Catégorie de performance** :
  - Faible (< 60)  
  - Moyenne (60–80)  
  - Élevée (> 80)  

Ces transformations facilitent une analyse **temporelle, comparative et stratégique**.

---

## 📊 Analyses réalisées

Les analyses comprennent :

- Effectif actuel et par département  
- Turnover global et par département  
- Répartition des départs (volontaire / involontaire)  
- Salaire moyen par département  
- Employés à forte ancienneté  
- Performance moyenne par département  
- Top 10 des employés les plus performants  
- Identification des employés en difficulté  
- Rétention par cohorte d’embauche  
- Départements avec le plus de recrutements  
- Employés sans feedback récent  
- Segmentation des performances  
- Tableau de bord KPI par département et cohorte  

⚠️ Toutes les analyses sont réalisées uniquement avec **SQL**, sans outil de visualisation.

---

## 📈 KPIs produits

- Effectif par département  
- Salaire moyen  
- Score de performance moyen  
- Ancienneté moyenne  
- Turnover par type  
- Rétention par cohorte  

Ces indicateurs permettent aux directions RH et Finance de **prendre des décisions stratégiques éclairées**.

---

## 🧠 Insights & recommandations RH

À partir des analyses, les recommandations suivantes ont été formulées :

- Mettre en place des **plans de rétention** pour les employés à forte ancienneté  
- Auditer les départements à **turnover élevé**  
- Renforcer les **processus de feedback et d’évaluation**  
- Adapter les **politiques salariales** selon la performance  
- Améliorer l’**onboarding** des nouvelles cohortes

---

## 👨‍💻 Auteur

**Ibrahim SAMA**  
Élève Ingénieur Agronome – Spécialisation Agroéconomie  
Passionné de **Data & Business Intelligence**

---

## ✅ Pertinence pour un recruteur

- Cas métier réaliste  
- SQL avancé et structuré  
- Démarche analytique claire  
- Capacité à générer des insights business  
- Projet directement exploitable en entreprise  

---

## 🚀 Perspectives

- Création d’un **dashboard Power BI ou Tableau**  
- Analyse prédictive avec Python  
- Modélisation du **turnover futur**  
- Mise en place d’un **Data Warehouse RH**

> Projet réalisé dans une logique professionnelle orientée **décision stratégique et performance organisationnelle**.