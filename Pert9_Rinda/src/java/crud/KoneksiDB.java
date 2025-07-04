package crud;

import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {
    public static Connection getKoneksi() throws Exception {
        Class.forName("com.mysql.jdbc.Driver"); // gunakan com.mysql.cj.jdbc.Driver untuk MySQL 8+
        String url = "jdbc:mysql://localhost:3306/rinda";
        String user = "root";
        String pass = "";
        return DriverManager.getConnection(url, user, pass);
    }
}
