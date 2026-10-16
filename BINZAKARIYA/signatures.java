public class Reponse {
  private String type;
  private String contenu;
  private boolean valide;

  public Reponse(String type, String contenu, boolean valide){
  };
  public String getType();
  public String getContenu();
  public boolean isValide();
  public void setType(String type);
  public void setContenu(String contenu);
  public void setValide(boolean valide);
}

public class Question {
  private String type;
  private String enonce;
  private ArrayList<Reponse> reponses;

  public Question(String type, String enonce);
  public void ajouterReponse(Reponse r);
  public void supprimerReponse(Reponse r);
  public void afficher();
  public String getType();
  public String getEnonce();
  public ArrayList<Reponse> getReponses();
  public void setType(String type);
  public void setEnonce(String enonce);
}

public class Quiz {
  private String titre;
  private ArrayList<Question> questions;

  public Quiz(String titre);

  public void ajouterQ(Question q);
  public void supprimer(Question q);
  public void afficher();
  public void lancer();
  public void importQR(String url);
  public String getTitre();
  public ArrayList<Question> getQuestions();
  public void setTitre(String titre);
}

public class BDD {
  private Connection conn;

  public Connection getConnection();
  public void ajouterQ(Question q);
  public void supprimerQ(Question q);
  public void setTypeQ(int id, String type);
  public void setEnonceQ(int id, String enonce);
  public void ajouterR(Reponse r);
  public void supprimerR(Reponse r);
  public void setTypeR(int id, String type);
  public void setEnonceR(int id, String enonce);
}

public static void main(String[] args){
}


  

