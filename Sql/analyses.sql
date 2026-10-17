-- 1.	Combien d’employés sont actuellement actifs ?

SELECT COUNT(*) AS employes_actifs
FROM employes
WHERE date_depart IS NULL

-- 2.	Combien de départs avons-nous eu sur les 12 derniers mois ?

SELECT COUNT(*) AS departs_12_mois
FROM turnover
WHERE date_depart >= CURRENT_DATE - INTERVAL '12 months';

-- 3.	Quels départements ont le turnover le plus élevé ?

SELECT d.nom_departement,
    COUNT(t.id_depart) AS nombre_departs
FROM turnover t
JOIN employes e ON t.id_employe = e.id_employe
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY d.nom_departement
ORDER BY nombre_departs DESC;

-- 4.	Quel est le salaire moyen par département ?

SELECT 
    d.nom_departement, 
    ROUND(AVG(e.salaire), 2) AS salaire_moyen
FROM employes e
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY d.nom_departement
ORDER BY salaire_moyen DESC;

-- 5.	Quels employés ont plus de 5 ans d’ancienneté ?
SELECT
    id_employe
    nom, 
    prenom,
    anciennete
FROM employes
WHERE anciennete > 5
ORDER BY anciennete DESC;

-- 6.	Classez les départements par performance moyenne trimestrielle.

SELECT 
    d.nom_departement, 
    ROUND(AVG(p.score), 2) AS performance_moyenne
FROM performances p
JOIN employes e ON e.id_employe = p.id_employe
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY d.nom_departement
ORDER BY performance_moyenne DESC;

-- 7.	Identifier les 10 meilleurs employés sur 3 derniers trimestres.

SELECT
    p.id_employe,
    e.nom, 
    e.prenom,
    ROUND(AVG(p.score), 2) as score_moyen,
    COUNT(*) AS nb_trimestres
FROM performances p
JOIN employes e ON p.id_employe = e.id_employe
GROUP BY p.id_employe, e.nom, e.prenom
HAVING COUNT(*) >= 3
ORDER BY score_moyen DESC
LIMIT 10;

-- 8.	Identifier les employés les moins performants et leur département.
SELECT
    p.id_employe,
    e.nom, 
    e.prenom,
    d.nom_departement,
    ROUND(AVG(p.score), 2) as score_moyen
FROM performances p
JOIN employes e ON p.id_employe = e.id_employe
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY p.id_employe, e.nom, e.prenom, d.nom_departement
HAVING AVG(p.score) < 60
ORDER BY score_moyen ASC;

-- 9.	Calculer la rétention moyenne par cohorte d’embauche.

SELECT
    cohorte_embauche,
    ROUND(AVG(anciennete), 2) AS anciennete_moyenne
FROM employes
GROUP BY cohorte_embauche
ORDER BY cohorte_embauche;

-- 10.	Quels départements recrutent le plus souvent ?

SELECT
    d.nom_departement,
    COUNT(e.date_embauche) AS nb_embauche
FROM employes e
JOIN departements d ON e.departement_id = d.id_departement
GROUP BY nom_departement
ORDER BY nb_embauche DESC;


-- 11.	Quelle proportion des départs est volontaire vs involontaire ?

SELECT
    type_depart,
    COUNT(*) AS nombre_departs,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 
        2
    ) AS pourcentage
FROM turnover
GROUP BY type_depart;

-- 12.	Quelle est la distribution des postes par ancienneté ?

SELECT
    poste,
    CASE
        WHEN anciennete < 2 THEN '0–2 ans'
        WHEN anciennete BETWEEN 2 AND 5 THEN '2–5 ans'
        ELSE '5+ ans'
    END AS tranche_anciennete,
    COUNT(*) AS nombre_employes
FROM employes
GROUP BY poste, tranche_anciennete
ORDER BY poste, tranche_anciennete;

-- 13.	Quels employés n’ont pas encore reçu de feedback cette année ?

SELECT
    e.id_employe,
    e.nom,
    e.prenom
FROM employes e
LEFT JOIN performances p
    ON e.id_employe = p.id_employe
    AND EXTRACT(YEAR FROM p.date_evaluation) = EXTRACT(YEAR FROM CURRENT_DATE)
WHERE p.id_employe IS NULL
AND e.date_depart IS NULL;

-- 14.	Segmentez les employés par niveau de performance : faible / moyen / élevé.

SELECT
    categorie_performance,
    COUNT(*) AS nombre_employes
FROM performance_categorie
GROUP BY categorie_performance
ORDER BY nombre_employes DESC;

-- 15.	Générer un tableau résumé avec KPIs par département et par cohorte.

SELECT
    d.nom_departement,
    e.cohorte_embauche,
    COUNT(e.id_employe) AS effectif,
    ROUND(AVG(e.salaire), 2) AS salaire_moyen,
    ROUND(AVG(pm.score_moyen), 2) AS score_moyen,
    ROUND(AVG(e.anciennete), 2) AS anciennete_moyenne
FROM employes e
JOIN departements d ON e.departement_id = d.id_departement
LEFT JOIN performance_moyenne pm ON e.id_employe = pm.id_employe
GROUP BY d.nom_departement, e.cohorte_embauche
ORDER BY d.nom_departement, e.cohorte_embauche;