 with Text_io; use Text_io;
with p_esiut;use p_esiut;
with p_lexique; use p_lexique;
with p_depeche;use p_depeche;
with p_classification;use p_classification;
with Calendar; use Calendar;
with p_generation; use p_generation;

procedure main is

	type TV_VScore is array(1..500) of TV_score;

	package P_CategorieIO is new P_Enum(T_Categorie); use P_CategorieIO;
	lexiques : TV_TLexiques;
    VD : Tv_Depeche;

    Ce_Time1 : Time;
   ce_Time2 : time;
   cette_annee : year_number;
   ce_mois : month_number;
   ce_jour : day_number;
   ces_Secondes1 : Day_Duration;
   Ces_Secondes2 : Day_Duration;
   ces_secondes3 : day_duration;

begin
    
    
    Charge("depeches.txt",VD);

    ce_time1 := clock;
    
    -- generation des lexiques:
    Generation_Lexique(VD, Culture, "CULTURE2");
    Generation_Lexique(VD, Economie, "ECONOMIE2");
    Generation_Lexique(VD, Science, "ENVIRONNEMENT-SCIENCES2");
    Generation_Lexique(VD, Politique, "POLITIQUE2");
    Generation_Lexique(VD, Sports, "SPORT2");
    ce_time2 := clock;
    Split (Ce_Time1,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes1);
    Split (Ce_Time2,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes2);
    ces_secondes3:=ces_secondes2-ces_secondes1;
    ecrire("duree de la génération des lexiques:");ecrire_ligne(day_duration'Image(ces_secondes3));
    
    -- classification:
    ce_time1 := clock;
    Init_Lexique("lexique/CULTURE2",lexiques(Culture));
	Init_Lexique("lexique/ECONOMIE2",lexiques(Economie));
	Init_Lexique("lexique/ENVIRONNEMENT-SCIENCES2",lexiques(Science));
	Init_Lexique("lexique/POLITIQUE2",lexiques(Politique));
    Init_Lexique("lexique/SPORT2",lexiques(Sports));

    ce_time2 := clock;
    Split (Ce_Time1,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes1);
    Split (Ce_Time2,Cette_Annee,Ce_Mois,Ce_Jour,Ces_Secondes2);
    ces_secondes3:=ces_secondes2-ces_secondes1;
    ecrire("duree de la classification:");ecrire_ligne(day_duration'Image(ces_secondes3));

    Run(VD,lexiques,"reponse génération automatique");
    
    

    -- Génération des lexiques manuels
	
	Init_Lexique("lexique/CULTURE",lexiques(Culture));
	Init_Lexique("lexique/ECONOMIE",lexiques(Economie));
	Init_Lexique("lexique/ENVIRONNEMENT-SCIENCES",lexiques(Science));
	Init_Lexique("lexique/POLITIQUE",lexiques(Politique));
	Init_Lexique("lexique/SPORT",lexiques(Sports));

	Run(VD,lexiques,"reponse lexiques manuels");
	
end main;
 
