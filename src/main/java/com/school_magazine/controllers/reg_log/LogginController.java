package com.school_magazine.controllers.reg_log;

import com.school_magazine.data.UserData;
import com.school_magazine.error_window.ErrorWindow;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;

public class LogginController {
    @FXML
    public GridPane logger;
    @FXML
    public TextField textSchoolCode;
    @FXML
    public TextField textPassword;
    @FXML
    public TextField textLoggin;

    @FXML
    public void onLoggin(ActionEvent event) {
        try {

            UserData user = new UserData(textLoggin.getText(), textPassword.getText(), textSchoolCode.getText());
            toRootScene();

        } catch (SQLException e) {
            ErrorWindow.errorMessage("cannot loggin");
        }
    }

    private void toRootScene(){
        try {


            Stage stage = (Stage) logger.getScene().getWindow();

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
    public void toRegister(ActionEvent event) {
        try {


            Stage stage = (Stage) logger.getScene().getWindow();

            Parent root = FXMLLoader.load(getClass().getResource("/Reg_log/Register.fxml"));
            Scene scene = new Scene(root);

            stage.setScene(scene);
            stage.setMinHeight(330);
            stage.setMinWidth(265);
        }
        catch (IOException e){
            ErrorWindow.errorMessage("cannot open register scene");
        }


    }
}
