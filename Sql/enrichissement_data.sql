-- Ancienneté des employés (en année)

ALTER TABLE employes
ADD COLUMN anciennete INT;

UPDATE employes
SET anciennete =
EXTRACT(YEAR FROM AGE(COALESCE(date_depart, CURRENT_DATE), date_embauche));


-- Cohorte d'embauche

ALTER TABLE employes
ADD COLUMN cohorte_embauche INT;

UPDATE employes
SET cohorte_embauche = EXTRACT(YEAR FROM date_embauche);

-- Score moyen par employé

CREATE VIEW performance_moyenne AS
SELECT
    id_employe,
    ROUND(AVG(score), 2) AS score_moyen
FROM performances
GROUP BY id_employe;


-- Catégorie de performance
CREATE VIEW performance_categorie AS
SELECT
    p.id_employe,
    p.score_moyen,
    CASE
        WHEN p.score_moyen < 60 THEN 'Faible'
        WHEN p.score_moyen BETWEEN 60 AND 80 THEN 'Moyenne'
        ELSE 'Elevée'
    END AS categorie_performance
FROM performance_moyenne p;
