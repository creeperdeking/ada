with Text_io; use Text_io;
with p_esiut;use p_esiut;
with p_lexique; use p_lexique;
with p_depeche;use p_depeche;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package P_classification is

type TV_TLexiques is array(Politique..Science) of TV_lexique(1..20);


function Score(D: in TR_Depeche; L : in TV_Lexique) return Integer;
--{} => {résultat = score de la dépêche D pour la catégorie dont le lexique est L}

function Max_Score(VS : in TV_Score) return T_Categorie;
--{ } => {resultat = Catégorie ayant le score maximal dans VS}

procedure Run (VD : in TV_Depeche;lexiques:TV_TLexiques; Nomfic : String);
--{ } => {Génère le fichier texte réponse Nomficétant donné les dépêches et les lexiques passés en argument

     
end p_classification;
