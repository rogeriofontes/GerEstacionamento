package br.com.unipac.GerEstacionamento.infra;

import java.sql.*;
//https://zetcode.com/java/h2database/
public class H2Infra {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.h2.Driver";
    static final String DB_URL = "jdbc:h2:~/test";

    //  Database credentials
    static final String USER = "sa";
    static final String PASS = "";

    public Connection getConnection() {
        try {
            Class.forName(JDBC_DRIVER);
            System.out.println("Connecting to database...");
            return DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Statement getStatement()  {
        try {
            return getConnection().createStatement();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void close() {
        try {
            getStatement().close();
            getConnection().close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
