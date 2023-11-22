package com.school_magazine;

import com.school_magazine.data_base.DBConnector;
import com.school_magazine.error_window.ErrorWindow;
import javafx.scene.Parent;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;

import java.sql.Connection;
import java.sql.SQLException;


public class Main extends Application{

    public static void main(String[] args) throws SQLException {
        Connection conn = DBConnector.getConnection();
        launch(args);
        conn.close();
    }

    @Override
    public void start(Stage stage) throws Exception {



        Parent root = FXMLLoader.load(getClass().getResource("/Reg_log/Logger.fxml"));


        Scene scene = new Scene(root);

        stage.setScene(scene);
        stage.setMinHeight(150);
        stage.setMinWidth(265);

        stage.show();



    }
}
