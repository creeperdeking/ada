with p_esiut; use p_esiut;

with p_generation; use p_generation;

procedure p7 is
    VD : Tv_Depeche;
    N : integer;
    VM : TV_dico;
begin
    Charge("depeches.txt", VD);
    Init_Dico(VD, Science,  VM, N);
    Calcul_Scores(VD, Science, VM, N);
    for i in VM'first..N loop
        ecrire(VM(i).mot);ecrire(" : ");ecrire_ligne(VM(i).score);
    end loop;
end p7;
