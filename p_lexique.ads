 package lexique is

type TR_mot is record 
chaine : String(1..30);
poids: positive; 
end record;

type TV_lexique is array(Integer range<>) of TR_mot; 

function Nb_Mots(nomfic : in String)  return Integer;
--{}=>{résultat = nombre de lignes du fichier Nomfic et donc de mots dans le lexique correspondant}

function Poids_Mot(M  : in String; L : in Tv_lexique) return integer ;
--{} => {résultat = le poids de M dans le lexique L est 0 si le mot n'est pas présent dans le lexique}

end lexique;
