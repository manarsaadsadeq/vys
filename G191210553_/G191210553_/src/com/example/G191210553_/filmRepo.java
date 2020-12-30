package com.example.G191210553_;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class filmRepo {
    private Connection connection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/KMDB",
                    "postgres", "zorsifre123");
            if (conn != null) {
                System.out.println("Veritabanına bağlandı!");
            } else
                System.out.println("Bağlantı Grişimi başarısız.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void getAllMovies() {
        String sql = "SELECT * FROM \"film\"";
        Connection con = this.connection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            con.close();
            while (rs.next()) {
                System.out.println(rs.getString("baslik") +" "+ rs.getString("aciklama") + " " +rs.getString("yayinTarihi") +" "+ rs.getString("dilID") +" "+ rs.getString("sure") +" "+ rs.getString("puan"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
