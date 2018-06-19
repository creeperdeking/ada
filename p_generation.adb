package body p_generation is

function Recherche(VM: in Tv_Dico;N: in Integer; M:String) return Integer is
    -- { } => {resultat = indice du mot  M dans le vecteur VM  si il est présent et -1 sinon. N est le nombre de mots rangés dans le vecteur}
begin 
    for i in VM'range loop
        if VM(i).mot = M then
            return i;
        end if;
    end loop;
    return -1;
end Recherche;

procedure  Init_Dico(VD: in  Tv_Depeche; C  : in  T_Categorie;  VM: out Tv_Dico;  N  : out Integer) is
    -- { } => {Charge dans VM tous les mots présents dans au moins une dépêche de la catégorie C du vecteur de dépêches VD. Attention, même si le mot est présent plusieurs fois, il ne doit apparaître qu'une fois dans le vecteur VM. La procédure initialise aussi tous les scores à 0 et range dans N le nombre de mots ajoutés dans VM}
    cursor : integer := VM'first;
    trouve: boolean;
    temp_vect : TV_Dico;
begin 
    N := 0;
    for i in VD'range loop
        if VD(i).cat = C then
            for j in VD(i).texte'range loop
                trouve := false;
                for k in temp_vect'first..cursor loop
                    if temp_vect(k).mot = VD(i).texte(j) then
                        trouve := true;
                    end if;
                end loop;
                
                if not trouve then
                    temp_vect(cursor).score := 0;
                    temp_vect(cursor).mot := VD(i).texte(j);
                    N := N+1;
                    cursor := cursor + 1;
                end if;
            end loop;
        end if;
    end loop;
    VM := temp_vect;
end Init_Dico;

    procedure Calcul_Scores(VD: in Tv_Depeche; C: in T_Categorie; VM: in out Tv_Dico; N: in Integer) is
        -- { } => {Cette procédure met à jour les scores des différents mots présents dans VM. Lorsqu'un mot présent dans VM apparaît dans une dépêche du vecteur VD, son  score est  décrémenté si la dépêche n'est pas dans la catégorie C et incrémenté si la dépêche est dans la catégorie C } 
    begin 
        for i in VM'first..N loop
            for j in VD'range loop
                for k in VD(j).texte'range loop
                    if VD(j).texte(k) = VM(i).mot then
                        if VD(j).cat = C then
                            VM(i).score := VM(i).score + 1;
                        else
                            VM(i).score := VM(i).score - 1;
                        end if;
                    end if;
                end loop;
            end loop;
        end loop;
    
    end Calcul_Scores;

    function Poids_Score(S: in Integer) return Integer is
        -- { } => {resultat = valeur du poids à attribuer étant donné un score S}
        poids : integer := 0;
    begin 
        if S < 0 then
            poids := 0;
        elsif S < 10 then
            poids := 1;
        elsif S < 20 then
            poids := 2;
        else
            poids := 3;
        end if;
        return poids;
    end Poids_Score;

    procedure Generation_Lexique(VD: in Tv_Depeche; C: in T_Categorie; Fl: in String) is
        -- { } => {Cette procédure créé pour la catégorie C le fichier lexique de nom Fl à partir du vecteur de dépêches de nom VD. Cette procédure doit déclarer un vecteur de type TV_Dico puis le remplir en utilisant Init_Dico, puis Calcul_Scores et enfin utiliser le vecteur résultant pour créer un fichier lexique en utilisant la fonction Poids_Score}
        dict : TV_Dico;
        N : integer;
        file : text_io.file_type;
        cptr : integer := 0;

        i,j : integer := dict'first;
        tmp_entree :TR_entree;
    begin 
        Init_Dico(VD, C, dict, N);
        Calcul_Scores(VD, C, dict, N);

        -- On trie le dictionnaire
        create(file, out_file, "lexique/"&Fl);
        while i < dict'first+20 loop
            j := N;
            
            while j > i loop
                if dict(j).score > dict(j-1).score then
                    tmp_entree := dict(j);
                    dict(j) := dict(j-1);
                    dict(j-1) := tmp_entree;
                end if;
                j := j-1;
            end loop;
            put_line(file, dict(i).mot(1..IndexSeparateur(dict(i).mot,1)-1) & ":" & Integer'image(Poids_Score(dict(i).score))(2..2));
            i := i+1;
        end loop;
        
    end Generation_Lexique;
end p_generation;

