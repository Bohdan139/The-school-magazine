package com.school_magazine.controllers.root.schedule;

import com.school_magazine.data.UserData;
import com.school_magazine.data_base.DBConnector;
import com.school_magazine.error_window.ErrorWindow;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ScheduleController {

    @FXML
    public TableView<ScheduleData> table;
    @FXML
    public TableColumn<ScheduleData, String> cMonday;
    @FXML
    public TableColumn<ScheduleData, String> cTuesday;
    @FXML
    public TableColumn<ScheduleData, String> cWednesday;
    @FXML
    public TableColumn<ScheduleData, String> cThursday;
    @FXML
    public TableColumn<ScheduleData, String> cFriday;


    private final ObservableList<ScheduleData> data = FXCollections.observableArrayList(
            new ScheduleData(1),
            new ScheduleData(2),
            new ScheduleData(3),
            new ScheduleData(4),
            new ScheduleData(5),
            new ScheduleData(6),
            new ScheduleData(7)
    );

    @FXML
    public void initialize(){
        cMonday.setCellValueFactory( new PropertyValueFactory<ScheduleData, String>("monday"));
        cTuesday.setCellValueFactory(new PropertyValueFactory<ScheduleData, String>("tuesday"));
        cWednesday.setCellValueFactory( new PropertyValueFactory<ScheduleData, String>("wednesday"));
        cThursday.setCellValueFactory( new PropertyValueFactory<ScheduleData, String>("thursday"));
        cFriday.setCellValueFactory(new PropertyValueFactory<ScheduleData, String>("friday"));

        table.setItems(data);

    }
}

