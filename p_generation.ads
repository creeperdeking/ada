with p_depeche; use p_depeche;
with Text_io; use Text_io;
with p_chaine; use p_chaine;
package p_generation is
    type TR_Entree is record
        mot : String(1..30);
        score: integer;  
    end record;

    type TV_Dico is array(1..2000) of TR_Entree;

    function Recherche(VM: in Tv_Dico;N: in Integer; M:String) return Integer;
    -- { } => {resultat = indice du mot  M dans le vecteur VM  si il est présent et -1 sinon. N est le nombre de mots rangés dans le vecteur}

    procedure  Init_Dico(VD: in  Tv_Depeche;C  : in  T_Categorie;  VM: out  Tv_Dico;  N  : out Integer);
    -- { } => {Charge dans VM tous les mots présents dans au moins une dépêche de la catégorie C du vecteur de dépêches VD.Attention, même si le mot est présent plusieurs fois, il ne doit apparaître qu'une fois dans le vecteur VM. La procédure initialise aussi tous les scores à 0 et range dans N le nombre de mots ajoutés dans VM}

    procedure Calcul_Scores(VD: in Tv_Depeche; C: in T_Categorie; VM: in out Tv_Dico;N: in Integer);
    -- { } => {Cette procédure met à jour les scores des différents mots présents dans VM. Lorsqu'un mot présent dans VMapparaît dans une dépêche du vecteur VD, son  score est  décrémenté si la dépêche n'est pas dans la catégorie C et incrémenté si la dépêche est dans la catégorie C } 

    function Poids_Score(S: in Integer) return Integer;
    -- { } => {resultat = valeur du poids à attribuer étant donné un scoreS}

    procedure Generation_Lexique(VD: in Tv_Depeche;C: in T_Categorie;Fl: in String);
    -- { } => {Cette procédure créé pour la catégorie Cle fichier lexique de nom Flà partir du vecteur de dépêches de nom VD.Cette procédure doit déclarer un vecteur de type TV_Dico puis le remplir en utilisant Init_Dico, puis Calcul_Scores et enfin utiliser le vecteur résultant pour créer un fichier lexique en utilisant la fonction Poids_Score}

    
end p_generation;
