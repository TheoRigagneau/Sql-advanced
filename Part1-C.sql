CREATE TABLE mv_synthese_segments (
 segment VARCHAR(50) NOT NULL PRIMARY KEY,
 nb_commandes INT NOT NULL,
 ca_total DECIMAL NOT NULL,
 derniere_maj DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);

INSERT INTO mv_synthese_segments (segment, nb_commandes, ca_total)
SELECT clients.segment,
 COUNT(commandes.id),
 ROUND(COALESCE(SUM(commandes.montant_total), 0), 2)
 -- Récup la première valeur non null
FROM clients
LEFT JOIN commandes ON commandes.client_id = clients.id
GROUP BY clients.segment;

-- on fait un test
INSERT INTO commandes (client_id, date_commande, montant_total, statut)
VALUES (1, '2026-11-20', 5000.00, 'LIVREE');