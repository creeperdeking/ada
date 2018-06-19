with Text_io; use Text_io; with p_esiut;use p_esiut;with p_lexique; use p_lexique;
 procedure p2 is
	nomfic:string(1..54);
	nb:integer;
	score:integer;
	mot:string(1..30); 
begin
		nomfic:="/users/info/etu-s1/daiha/Documents/ada/lexique/CULTURE";
		nb:=NB_Mots(nomfic);
	declare
		lexique: TV_Lexique (1..nb);
	begin
		Init_Lexique(nomfic,lexique);
		
		ecrire("what's the word: ")	;lire(mot);
		score:=Poids_Mot(mot,lexique);
		ecrire(score);
	end;
end p2;

