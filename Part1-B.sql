CREATE INDEX idx_cmd_statut_date
ON commandes (statut, date_commande, client_id, montant_total);
 -- Trie en fonction du status puis des dates

ALTER TABLE commandes DROP FOREIGN KEY fk_commandes_client;
ALTER TABLE commandes DROP PRIMARY KEY,
ADD PRIMARY KEY (id, date_commande)
-- on remplace la clé primaire pour une nouvelle plus large
PARTITION BY RANGE COLUMNS (date_commande) (
 PARTITION p2024 VALUES LESS THAN ('2025-01-01'),
 PARTITION p2025 VALUES LESS THAN ('2026-01-01'),
 PARTITION p2026 VALUES LESS THAN ('2027-01-01'),
 PARTITION pmax VALUES LESS THAN (MAXVALUE)
);

-- C'est du coup beaucoup moins couteux


--Ici l'idée va être de mettre un Where avec un PARTITION (p2024) 
-- ce qui va faire qu'il ne va même pas lire les autres lignes
