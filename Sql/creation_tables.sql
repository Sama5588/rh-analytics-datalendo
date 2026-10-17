-- Creéation de la table départements

CREATE TABLE departements (
    id_departement INT PRIMARY KEY,
    nom_departement VARCHAR(100),
    manager VARCHAR(100),
    budget NUMERIC
);

-- Creéation de la table employés

CREATE TABLE employes (
    id_employe INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    poste VARCHAR(50),
    departement_id INT,
    date_embauche DATE,
    date_depart DATE,
    salaire NUMERIC,
    FOREIGN KEY (departement_id) REFERENCES departements(id_departement)
);

-- Création de la table performances

CREATE TABLE performances (
    id_performance INT PRIMARY KEY,
    id_employe INT,
    date_evaluation DATE,
    score INT,
    objectifs_atteints BOOLEAN,
    FOREIGN KEY (id_employe) REFERENCES employes(id_employe)
);

-- Création de la table turnover

CREATE TABLE turnover (
    id_depart INT PRIMARY KEY,
    id_employe INT,
    date_depart DATE,
    type_depart VARCHAR(20),
    anciennete INT
);
