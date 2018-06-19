with Text_io; use Text_io;
with p_esiut;use p_esiut;
with p_lexique; use p_lexique;
with p_depeche;use p_depeche;
with p_classification;use p_classification;

procedure p4 is

	type TV_VScore is array(1..500) of TV_score;

	scores : TV_VScore;
	package P_CategorieIO is new P_Enum(T_Categorie); use P_CategorieIO;
	type TV_TLexiques is array(Politique..Science) of TV_lexique(1..20);
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

	for i in depeche'range loop
		for cat in  Politique..Science loop
			scores(i)(cat) := Score(depeche(i), lexiques(cat));
			ecrire(i);ecrire(",");ecrire(cat);ecrire(" : ");
			ecrire_ligne(scores(i)(cat));
			
		end loop;
		sc := Max_score(scores(i));
		ecrire("max score:"); ecrire_ligne(sc);
	end loop;
	
end p4;
