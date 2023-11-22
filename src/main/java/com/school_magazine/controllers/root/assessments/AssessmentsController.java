package com.school_magazine.controllers.root.assessments;

import com.school_magazine.data.UserData;
import com.school_magazine.data_base.DBConnector;
import com.school_magazine.error_window.ErrorWindow;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.ListView;

import java.sql.*;

public class AssessmentsController {

    @FXML
    public ComboBox comboSubject;
    @FXML
    public ListView listAssessments;

    private ObservableList<Integer> data = FXCollections.observableArrayList();

    @FXML
    public void initialize(){
        listAssessments.setItems(data);
        setComboSubject();
        comboSubject.getSelectionModel().selectFirst();
        init();

    }

    private void setComboSubject(){
        Connection conn = DBConnector.getConnection();

        UserData user = new UserData();
        try {
            Statement stm = conn.createStatement();

            ResultSet rs = stm.executeQuery("SELECT name FROM "+user.getSchool_code()+".school_subject");

            while (rs.next()){
                comboSubject.getItems().add(rs.getString("name"));
            }
            rs.close();
            stm.close();

        } catch (SQLException e) {
            ErrorWindow.errorMessage("cannot init Combo Subject");
        }

    }

    private void init(){
        UserData user = new UserData();
        Connection conn = DBConnector.getConnection();

        try {
            Statement stm = conn.createStatement();

            ResultSet rs = stm.executeQuery("SELECT assessment FROM "+user.getSchool_code()+".assessments " +
                                            "WHERE users_id = "+user.getId()+" AND school_subject_id = (SELECT id FROM "+user.getSchool_code()+".school_subject " +
                                            "WHERE name = '"+comboSubject.getValue()+"')");


            while (rs.next()){
                System.out.println(rs.getInt("assessment"));
                data.add(rs.getInt("assessment"));
            }

        } catch (SQLException e) {
            ErrorWindow.errorMessage("cannot load assessment");
        }

    }
    @FXML
    public void update(ActionEvent event) {
        data.clear();
        init();
    }
}
