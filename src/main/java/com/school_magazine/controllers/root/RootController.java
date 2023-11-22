package com.school_magazine.controllers.root;

import com.school_magazine.data_base.DBConnector;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;

import java.io.IOException;

public class RootController {
    @FXML
    public AnchorPane centerScene;
    @FXML
    public Label labelTitle;


    public void initialize() throws IOException{
        centerScene.getChildren().add(FXMLLoader.load(getClass().getResource("/Root/Profile.fxml")));
        labelTitle.setText("Профіль");
    }



    public void toProfile(ActionEvent event)throws IOException{
        if(!centerScene.getChildren().isEmpty())
            centerScene.getChildren().remove(centerScene.getChildren().get(0));
        centerScene.getChildren().add(FXMLLoader.load(getClass().getResource("/Root/Profile.fxml")));
        labelTitle.setText("Профіль");
    }

    public void toAssessments(ActionEvent event)throws IOException{
        if(!centerScene.getChildren().isEmpty())
            centerScene.getChildren().remove(centerScene.getChildren().get(0));
        FXMLLoader loader = new FXMLLoader(getClass().getResource("/Root/Assessments.fxml"));


        centerScene.getChildren().add(loader.load());

        labelTitle.setText("Журнал");

    }


    public void toSchedule(ActionEvent event) throws IOException {
        if(!centerScene.getChildren().isEmpty())
            centerScene.getChildren().remove(centerScene.getChildren().get(0));
        centerScene.getChildren().add(FXMLLoader.load(getClass().getResource("/Root/Schedule.fxml")));
        labelTitle.setText("Розклад");


    }

    @FXML
    public void toReconnect() {

        DBConnector.reconnect();

    }






}