package body p_lexique is

function Nb_Mots(nomfic : in String) return Integer is
-- {} => {résultat nombre de lignes du fichier Nomfic et donc de mots dans le lexique correspondant}
    file : Text_io.file_type;
    cptr : integer := 0;
begin
    open(file, in_file, nomfic);
    while not end_of_file(file) loop
        cptr := cptr + 1;
        skip_line(file);
    end loop;
    close(file);
    return cptr;
end Nb_Mots;

function Poids_Mot(M  : in String; L : in Tv_lexique) return integer is
--{} => {résultat = le poids de M dans le lexique L est 0 si le mot n'est pas présent dans le lexique}
begin
    for i in L'range loop
        if L(i).chaine = M then
            return L(i).poids;
        end if;
    end loop;
    return 0;
end poids_mot;

procedure Init_Lexique(Nomfic: in String; L : out Tv_lexique) is
    --{On suppose que la taille du vecteur L correspond exactement au nombre de mots contenus dans le fichier} => {Range dans le vecteur  L, les mots contenus dans le fichier lexique Nomfic et les poids associés}
    file : Text_io.file_type;
    fin : natural;
    line : String(1..100); -- On sait que la ligne ne dépassera pas 100 caractères
    cptr : integer := L'first;
begin
    open(file, in_file, nomfic);
    while not end_of_file(file) loop
        get_line(file, line, fin);
        L(cptr).chaine := line(1..fin-2);
        L(cptr).poids := Integer'value(line(fin-1..fin));
        cptr := cptr +1;
    end loop;
    close(file);
end Init_Lexique;

end p_lexique;
