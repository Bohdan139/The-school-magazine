package com.school_magazine.data_base;
import java.sql.*;

import com.school_magazine.error_window.ErrorWindow;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class DBConnector {

    static private final String url = "jdbc:mysql://localhost:3306";
    static private final String login = "root";
    static private final String password = "MyRoot123";

    static Connection connection = null;

    private DBConnector(){
        try {
            connection = DriverManager.getConnection(url, login, password);
        } catch (SQLException e) {
            ErrorWindow.errorMessage("cannot connection");
        }
    }

    static public Connection getConnection(){

        if(connection == null){
             new DBConnector();
        }
        return connection;
    }

    static public void reconnect() {
        try{
            if(connection.isClosed())
                connection.close();

            connection = DriverManager.getConnection(url, login, password);
        } catch (SQLException e) {
            ErrorWindow.errorMessage("cannot reconnection");
        }
    }
}
