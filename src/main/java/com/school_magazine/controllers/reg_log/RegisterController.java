package com.school_magazine.controllers.reg_log;

import com.school_magazine.data.UserData;
import com.school_magazine.data_base.DBConnector;
import com.school_magazine.error_window.ErrorWindow;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

import java.awt.event.ActionEvent;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class RegisterController {
    @FXML
    public GridPane register;
    @FXML
    public TextField textLoggin;
    @FXML
    public TextField textPassword;
    @FXML
    public TextField textSchoolCode;
    @FXML
    public TextField textFirstName;
    @FXML
    public TextField textLastName;
    @FXML
    public TextField textPatronymic;
    @FXML
    public TextField textClass;



    @FXML
    public void onRegister(){
        try {
            Connection conn = DBConnector.getConnection();
            Statement stm = conn.createStatement();

            if(stm.executeUpdate("INSERT INTO "+textSchoolCode.getText()+".users(loggin, password) " +
                    "SELECT '"+textLoggin.getText()+"' , '"+textPassword.getText()+"' " +
                    "WHERE NOT EXISTS(SELECT loggin, password FROM "+textSchoolCode.getText()+".users "+
                    "WHERE loggin = '"+textLoggin.getText()+"' AND password = '"+textPassword.getText()+"')") == 0)
            {
                throw new SQLException();
            }

            UserData user = new UserData(textLoggin.getText(), textPassword.getText(), textSchoolCode.getText());

            System.out.println("INSERT INTO "+textSchoolCode.getText()+".students(first_name, last_name, patronymic, users_id, class_id) "+
                    "SELECT '"+textFirstName.getText()+"' , '"+textLastName.getText()+"' , '"+textPatronymic.getText()+"' , "+textSchoolCode.getText()+".users.id , "+textPatronymic.getText()+".class.id from "+textSchoolCode.getText()+".users , "+textPatronymic.getText()+".class "+
                    "WHERE ("+textSchoolCode.getText()+".users.loggin = '"+textLoggin.getText()+"' AND "+textSchoolCode.getText()+".users.password = '"+textPassword.getText()+"') AND "+textPatronymic.getText()+".class.class_name = '"+textClass.getText()+"';");

            stm.executeUpdate("INSERT INTO "+textSchoolCode.getText()+".students(first_name, last_name, patronymic, users_id, class_id) "+
                    "SELECT '"+textFirstName.getText()+"' , '"+textLastName.getText()+"' , '"+textPatronymic.getText()+"' , "+textSchoolCode.getText()+".users.id , "+textSchoolCode.getText()+".class.id from "+textSchoolCode.getText()+".users , "+textSchoolCode.getText()+".class "+
                    "WHERE ("+textSchoolCode.getText()+".users.loggin = '"+textLoggin.getText()+"' AND "+textSchoolCode.getText()+".users.password = '"+textPassword.getText()+"') AND "+textSchoolCode.getText()+".class.class_name = '"+textClass.getText()+"';");

            stm.close();
            toRootScene();

        } catch (SQLException e) {
            ErrorWindow.errorMessage("cannot register");
        }
    }
    @FXML
    private void toRootScene(){
        try {


            Stage stage = (Stage) register.getScene().getWindow();

            Parent root = FXMLLoader.load(getClass().getResource("/RootScene.fxml"));
            Scene scene = new Scene(root);

            stage.setScene(scene);
            stage.setMinHeight(200);
            stage.setMinWidth(400);
            stage.setMaximized(true);
        }
        catch (IOException e){
            ErrorWindow.errorMessage("cannot open root scene");
        }
    }

    @FXML
    private void toLogger(){
        Stage stage = (Stage) register.getScene().getWindow();

        Parent root = null;
        try {
            root = FXMLLoader.load(getClass().getResource("/Reg_log/Logger.fxml"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        Scene scene = new Scene(root);

        stage.setScene(scene);
        stage.setMinHeight(150);
        stage.setMinWidth(265);
    }
}
