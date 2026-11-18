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
