package com.school_magazine.controllers.root.profile;

import com.school_magazine.data.UserData;
import com.school_magazine.data_base.DBConnector;
import com.school_magazine.error_window.ErrorWindow;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.HBox;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ProfileController {
    @FXML
    public Label textFirstName;
    @FXML
    public Label textLastName;
    @FXML
    public Label textPatronymic;
    @FXML
    public Label textLoggin;
    @FXML
    public Label textPassword;
    @FXML
    public AnchorPane root;

    @FXML
    public void initialize(){
        UserData user = new UserData();
        user.reconnect();
        textLoggin.setText(user.getLoggin());
        textPassword.setText(user.getPassword());

        Connection conn = DBConnector.getConnection();

        try {
            Statement stm = conn.createStatement();

            ResultSet rs = stm.executeQuery("SELECT first_name, last_name, patronymic FROM "+ user.getSchool_code()+".students \n" +
                    "WHERE users_id = "+user.getId());

            rs.next();

            textFirstName.setText(rs.getString("first_name"));
            textLastName.setText(rs.getString("last_name"));
            textPatronymic.setText(rs.getString("patronymic"));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void changeData(String what, String where, String id){
        Connection conn = DBConnector.getConnection();

        Stage state = new Stage();

        HBox hBox = new HBox();
        hBox.setSpacing(20);
        hBox.setPadding(new Insets(20,20,20,20));
        hBox.setAlignment(Pos.CENTER);

        TextField newData = new TextField();

        Button bChange = new Button();
        bChange.setText("змінити");

        bChange.setOnAction(event -> {
            try {
                Statement stm = conn.createStatement();
                UserData user = new UserData();

                stm.executeUpdate("UPDATE "+ user.getSchool_code()+"."+where+" SET "+what+" = '"+newData.getText()+"' WHERE "+id+" = "+user.getId());
                state.close();
            } catch (SQLException e) {
                ErrorWindow.errorMessage("cannot change data");
            }
        });

        hBox.getChildren().addAll(newData, bChange);

        Scene scene = new Scene(hBox);

        state.setScene(scene);
        state.setMinWidth(350);
        state.setMinHeight(130);
        state.setWidth(350);
        state.setHeight(130);
        state.setMaximized(false);
        state.initModality(Modality.APPLICATION_MODAL);
        state.showAndWait();

        initialize();
    }


    public void changeFirstName(ActionEvent event) {
        changeData("first_name", "students", "users_id");
    }

    public void changePassword(ActionEvent event) {
        changeData("password", "users", "id");
    }

    public void changeLoggin(ActionEvent event) {
        changeData("loggin", "users", "id");
    }

    public void changePatronymic(ActionEvent event) {
        changeData("patronymic", "students", "users_id");
    }

    public void changeLastName(ActionEvent event) {
        changeData("last_name", "students", "users_id");
    }
}
