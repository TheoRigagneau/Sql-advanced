
-- on a split la table afin qu'ils n'aient plus de dépendances(hormis clé)
	                            
-- departements(dept_id, dept_nom)	                        dept_id	                : clé primaire

-- employes_info(employe_id, employe_nom, dept_id)	        employe_id              : clé primaire
--         	                                    dept_id → departements.dept_id      : clé étrangère

-- chefs_projet(chef_id, chef_nom, chef_tel)                chef_id                 : clé primaire

-- projets(projet_id, projet_nom, chef_id)	                projet_id               : clé primaire
-- 	                                            chef_id → chefs_projet.chef_id      : clé étrangère

-- affectations(employe_id, projet_id) 	                    (employe_id, projet_id) : clé primaire
-- 	                                            employe_id → employes_info.employe_id, 
--                                              projet_id → projets.projet_id       : clé étrangère