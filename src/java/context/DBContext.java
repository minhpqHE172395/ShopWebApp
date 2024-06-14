package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

  protected Connection connection;

    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String database = "project";
            String url = "jdbc:sqlserver://localhost:1433;databaseName="+database;
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}
