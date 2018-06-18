with Text_io; use Text_io;
with p_esiut;use p_esiut;
with p_lexique; use p_lexique;
with p_depeche;use p_depeche;
with P_classification;use P_classification;

procedure p3 is
	nb:integer;
	S:integer;
	V:TV_depeche;
begin
	nb:=NB_Mots("CULTURE");

	declare
		lexique: TV_Lexique (1..nb);
	begin
		Init_Lexique("CULTURE",lexique);

		Charge("depeches.txt",V);
		
		S:=Score(V(V'first),lexique);
		ecrire(S);
	end;
end p3;
