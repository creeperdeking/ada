with p_esiut; use p_esiut;

with p_generation; use p_generation;

with p_depeche;use p_depeche;

procedure p8 is
    VD : Tv_Depeche;
begin
    Charge("depeches.txt", VD);
    Generation_Lexique(VD, Culture, "CULTURE2");
    Generation_Lexique(VD, Economie, "ECONOMIE2");
    Generation_Lexique(VD, Science, "SCIENCE2");
    Generation_Lexique(VD, Politique, "POLITIQUE2");
    Generation_Lexique(VD, Sports, "SPORTS2");
end p8;
