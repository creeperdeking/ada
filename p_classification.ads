with Text_io; use Text_io;
with p_esiut;use p_esiut;
with p_lexique; use p_lexique;
with p_depeche;use p_depeche;

package P_classification is




function Score(D: in TR_Depeche; L : in TV_Lexique) return Integer;
--{} => {résultat = score de la dépêche D pour la catégorie dont le lexique est L}

function Max_Score(VS : in TV_Score) return T_Categorie;
--{ } => {resultat = Catégorie ayant le score maximal dans VS}
     
end p_classification;
