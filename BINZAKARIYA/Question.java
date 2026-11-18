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
