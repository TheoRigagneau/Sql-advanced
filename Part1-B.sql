CREATE INDEX idx_cmd_statut_date
ON commandes (statut, date_commande, client_id, montant_total);
 -- Trie en fonction du status puis des dates