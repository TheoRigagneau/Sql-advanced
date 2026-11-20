-- Si la sous-requête contient un seul NULL
-- la comparaison peut devenir UNKNOWN, ce qui empêche les lignes d'être retournées

SELECT employes.id, employes.nom FROM employes
WHERE NOT EXISTS
(SELECT 1 FROM employes m WHERE m.manager_id = employes.id);