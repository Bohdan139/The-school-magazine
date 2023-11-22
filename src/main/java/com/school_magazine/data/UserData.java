package com.school_magazine.data;

import com.school_magazine.data_base.DBConnector;

import java.sql.*;

public class UserData {

    static private int id;
    static private String loggin;
    static private String password;
    static private String school_code;

    public UserData(){

    }

    public UserData(String loggin, String password, String school_code) throws SQLException {


        Connection conn = DBConnector.getConnection();

        Statement stm = conn.createStatement();


        ResultSet rs = stm.executeQuery("SELECT * FROM "+ school_code +".users WHERE loggin = '" + loggin + "' AND password = '" + password + "';");


        rs.next();
        if(rs.getInt("id") == 0 )
            throw new SQLException();
        this.id = rs.getInt("id");
        this.loggin = rs.getString("loggin");
        this.password = rs.getString("password");



        this.school_code = school_code;


        stm.close();
        rs.close();
    }



    public String getLoggin() {
        return loggin;
    }

    public String getPassword() {
        return password;
    }

    public String getSchool_code() {
        return school_code;
    }

    public int getId() {
        return id;
    }

    public void reconnect(){
        Connection conn = DBConnector.getConnection();

        Statement stm = null;
        try {
            stm = conn.createStatement();



            ResultSet rs = stm.executeQuery("SELECT * FROM "+ school_code +".users WHERE id = "+id+";");


            rs.next();
            if(rs.getInt("id") == 0 )
                throw new SQLException();
            this.id = rs.getInt("id");
            this.loggin = rs.getString("loggin");
            this.password = rs.getString("password");
        } catch (SQLException e) {
            throw new RuntimeException(e);
     }

    }


}
