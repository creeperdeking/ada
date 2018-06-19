 with Text_io; use Text_io;
with p_esiut;use p_esiut;
with p_lexique; use p_lexique;
with p_depeche;use p_depeche;
with p_classification;use p_classification;

procedure p5 is

	type TV_VScore is array(1..500) of TV_score;

	scores : TV_VScore;
	package P_CategorieIO is new P_Enum(T_Categorie); use P_CategorieIO;
	lexiques : TV_TLexiques;
	depeche : Tv_Depeche;
	
	sc : T_categorie;

begin
	Charge("depeches.txt",depeche);
	
	Init_Lexique("lexique/CULTURE2",lexiques(Culture));
	
	Init_Lexique("lexique/ECONOMIE2",lexiques(Economie));
	Init_Lexique("lexique/ENVIRONNEMENT-SCIENCES2",lexiques(Science));
	Init_Lexique("lexique/POLITIQUE2",lexiques(Politique));
	Init_Lexique("lexique/SPORT2",lexiques(Sports));

	Run(depeche,lexiques,"reponse");
	
end p5;
