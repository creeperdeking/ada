package body P_classification is
        
function Score(D: in TR_Depeche; L : in TV_Lexique) return Integer is
--{} => {résultat = score de la dépêche D pour la catégorie dont le lexique est L} 
som:integer;
begin
	som:=0;
	for i in 1..d.nbmots loop 
		som:=som+Poids_Mot(D.texte(i),L);
	end loop;
	return som;
end Score;

function Max_Score(VS : in TV_Score) return T_Categorie is
--{ } => {resultat = Catégorie ayant le score maximal dans VS}
max:integer:=0;
cat:T_Categorie := T_categorie'first;

Begin
	for i in VS'range loop
		if VS(i)>max then
			max:=VS(i);
			cat:=i;
		end if;
	end loop;
	return cat;

end Max_Score;

procedure Run (VD : in TV_Depeche; lexiques : TV_TLexiques; Nomfic : String) is
--{ } => {Génère le fichier texte réponse Nomfic étant donné les dépêches et les lexiques passés en argument}
	file : text_io.file_type;
	
	package P_CategorieIO is new P_Enum(T_Categorie); use P_CategorieIO;
	
	score_justes : TV_Score := (others => 0);
	score_total : TV_Score := (others => 0);
	
	categ : T_categorie;
	
	type TV_VScore is array(1..500) of TV_score;

	scores : TV_VScore;
	
	sum : float := 0.0;
	res : integer;
	
begin
	create(file, out_file, Nomfic);
	for i in VD'range loop

		for cat in Politique..Science loop
			scores(i)(cat) := Score(VD(i), lexiques(cat));
		end loop;
		
		categ := Max_score(scores(i));
		
		if categ = VD(i).cat then
			score_justes(VD(i).cat) := score_justes(VD(i).cat) + 1;
		end if;
		score_total(VD(i).cat) := score_total(VD(i).cat) + 1;
		
		
		put_line(file, Integer'image(i)&":"&T_categorie'image(categ));
	end loop;
	for cat in Politique..Science loop
		res := (score_justes(cat)*100)/score_total(cat);
		sum := sum + float(res);
		put_line(file,T_categorie'image(cat)&": "&Integer'image(res));
	end loop;
	put(file,"Moyenne : ");
	put(file, sum/5.0, 2, 1, 0);
	new_line(file);
end run;

end p_classification;
