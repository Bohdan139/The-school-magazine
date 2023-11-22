package com.school_magazine.error_window;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class ErrorWindow {

    static public void errorMessage(String errorText){
        Stage dialog = new Stage();


        AnchorPane APane = new AnchorPane();
        Label errorLabel = new Label(errorText);

        AnchorPane.setBottomAnchor(errorLabel, 0.0);
        AnchorPane.setLeftAnchor(errorLabel, 0.0);
        AnchorPane.setTopAnchor(errorLabel, 0.0);
        AnchorPane.setRightAnchor(errorLabel, 0.0);
        errorLabel.setAlignment(Pos.CENTER);

        Button close = new Button("Закрити");
        close.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                dialog.close();
            }
        });

        AnchorPane.setRightAnchor(close, 5.0);
        AnchorPane.setBottomAnchor(close, 5.0);

        APane.getChildren().add(errorLabel);
        APane.getChildren().add(close);

        Scene scene1 = new Scene(APane);

        dialog.setScene(scene1);
        dialog.setMinWidth(250);
        dialog.setMinHeight(130);
        dialog.initModality(Modality.APPLICATION_MODAL);
        dialog.showAndWait();
    }
}
