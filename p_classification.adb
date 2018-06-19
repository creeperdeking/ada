package body P_classification is
        
function Score(D: in TR_Depeche; L : in TV_Lexique) return Integer is
--{} => {résultat = score de la dépêche D pour la catégorie dont le lexique est L} 
som:integer;
begin
	som:=0;
	for i in 1..d.nbmots loop 
		som:=som+Poids_Mot(D.texte(i),L);
	end loop;
	return som;
end Score;

function Max_Score(VS : in TV_Score) return T_Categorie is
--{ } => {resultat = Catégorie ayant le score maximal dans VS}
max:integer:=0;
cat:T_Categorie;

Begin
	for i in VS'range loop
		if VS(i)>max then
			max:=VS(i);
			cat:=i;
		end if;
	end loop;
	return cat;

	
		

end Max_Score;


end p_classification;
