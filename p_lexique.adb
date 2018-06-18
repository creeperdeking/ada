package body p_lexique  is

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

end p_lexique;
