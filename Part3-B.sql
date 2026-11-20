-- Un Non-Repeatable Read se produit lorsqu'une transaction lit 
-- plusieurs fois la même donnée et obtient des valeurs différentes, 
-- car une autre transaction a modifié et validé cette donnée entre les deux lectures.

-- Sous REPEATABLE READ, les données reste stable pendant la transaction.
-- Ainsi, même si une autre transaction modifie une donnée et valide sa modification,
-- la première transaction conserve la même valeur lors de ses lectures répétées.

-- Write-Ahead Log annule toutes les modifications non validées du coup lors d'une
-- coupure serveur ce qui n'est pas validé est annulé

