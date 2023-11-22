package com.school_magazine.controllers.root.schedule;

import com.school_magazine.data.UserData;
import com.school_magazine.data_base.DBConnector;
import com.school_magazine.error_window.ErrorWindow;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ScheduleData {
    private String monday;
    private String tuesday;
    private String wednesday;
    private String thursday;
    private String friday;


    public ScheduleData(int id){
        this.monday = init(id,"monday");
        this.tuesday = init(id,"tuesday");
        this.wednesday = init(id,"wednesday");
        this.thursday = init(id, "thursday");
        this.friday = init(id, "friday");


    }

    private String init(int id,String dataBaseColumn){
        String data = null;
        Connection conn = DBConnector.getConnection();
        UserData user = new UserData();
        try {
            Statement stm = conn.createStatement();
            ResultSet class_id = stm.executeQuery("SELECT class_id FROM "+user.getSchool_code()+".students WHERE users_id = "+user.getId());
            class_id.next();

            ResultSet class_name = stm.executeQuery("SELECT class_name FROM "+user.getSchool_code()+".class WHERE id = "+class_id.getInt("class_id"));
            class_name.next();

            ResultSet rs = stm.executeQuery("SELECT "+dataBaseColumn+" FROM "+user.getSchool_code()+".schedule_"+class_name.getString("class_name")+" WHERE id = "+ id);

            rs.next();


            try {

                ResultSet rsWeek = stm.executeQuery("SELECT name FROM "+user.getSchool_code()+".school_subject WHERE id = "+rs.getInt(dataBaseColumn));
                rsWeek.next();

                data = rsWeek.getString("name");
                rsWeek.close();

            }
            catch (SQLException e){

            }

            class_id.close();
            class_name.close();
            rs.close();
            stm.close();

        } catch (SQLException e) {
           // ErrorWindow.errorMessage("cannot load schedule");
        }


        return data;

    }


    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }

    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

}
