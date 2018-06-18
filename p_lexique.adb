package lexique body is

function Nb_Mots(nomfic : in String) return Integer;
{} => {résultat nombre de lignes du fichier Nomfic et donc de mots dans le lexique correspondant}
    file : Text_io.file_type;
begin
    open(file, in_file,nomfic);

    close();
end;

end package;
