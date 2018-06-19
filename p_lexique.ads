with Text_io; use Text_io;
 with p_esiut;use p_esiut;
package p_lexique is

type TR_mot is record 
chaine : String(1..30);
poids: positive; 
end record;

type TV_lexique is array(Integer range<>) of TR_mot; 

function Nb_Mots(nomfic : in String)  return Integer;
--{}=>{résultat = nombre de lignes du fichier Nomfic et donc de mots dans le lexique correspondant}

procedure Init_Lexique(Nomfic: in String; L : out Tv_lexique);
--{On suppose que la taille du vecteur L correspond exactement au nombre de mots contenus dans le fichier} => {Range dans le vecteur  L, les mots contenus dans le fichier lexique Nomfic et les poids associés}

function Poids_Mot(M  : in String; L : in Tv_lexique) return integer ;
--{} => {résultat = le poids de M dans le lexique L est 0 si le mot n'est pas présent dans le lexique}

end p_lexique;
