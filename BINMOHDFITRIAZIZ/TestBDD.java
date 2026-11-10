import java.sql.*;

public class TestBDD {
    public static void main(String[] args) {

        String url = "jdbc:mariadb://localhost:3306/quiz";
        String user = "quiz_user";
        String password = "bddmelayu";

        try (Connection conn =
                DriverManager.getConnection(url, user, password)) {

            System.out.println("Connexion réussie !");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                "SELECT idTheme, nomTheme FROM theme ORDER BY ordre"
            );

            while (rs.next()) {
                System.out.println(
                    rs.getInt("idTheme") + " - " +
                    rs.getString("nomTheme")
                );
            }

            rs.close();
            stmt.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
