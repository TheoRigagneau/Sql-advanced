EXPLAIN ANALYZE 
SELECT id, client_id, date_commande, montant_total 
FROM commandes WHERE YEAR(date_commande) = 2026 AND statut = 'LIVREE' 
ORDER BY montant_total DESC LIMIT 10;

-- Avec YEAR(date_commande) = 2026, ça force un seq scan complet sur commande
-- -> mieux d'utiliser >='2026-01-01' et <'2027-01-01'

--l'index ne prends pas en compte le tri sur montant_total desc donc une autre étape de tri est ajouté
-- -> créer un index spécialement pour ça
