package com.example.G191210553_;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class uyeRepo {

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

    public uye login(int id) {
        String sql = "SELECT * FROM \"personel\" WHERE \"personelID\" = " + id;
        uye uye = null;
        Connection con = this.connection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            con.close();
            String email;
            String isim;
            String soyisim;
            String kullaniciIsmi;
            String sifre;
            while (rs.next()) {
                email = rs.getString("email");
                isim = rs.getString("isim");
                soyisim = rs.getString("soyisim");
                kullaniciIsmi = rs.getString("kullaniciIsmi");
                sifre = rs.getString("sifre");
                uye = new uye(email, isim, soyisim, kullaniciIsmi, sifre);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return uye;
    }

    public void kaydet(uye uye){
        String sql= "INSERT INTO  \"personel\" (\"isim\",\"soyisim\",\"email\",\"sifre\",\"kullaniciIsmi\") VALUES(\'"+uye.getIsim()+"\',\'"+uye.getSoyisim()+"\',\'"+uye.getEmail()+"\',\'"+uye.getSifre()+"\',\'"+uye.getKullaniciIsmi()+"\')";
        Connection conn=this.connection();
        try
        {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            //***** Bağlantı sonlandırma *****
            conn.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void degistir(uye uye,int id) {

        String sql= "UPDATE \"personel\" SET \"isim\"=\'"+uye.getIsim()+ "\', \"soyisim\"=\'"+uye.getSoyisim()+ "\',\"kullaniciIsmi\"=\'"+uye.getKullaniciIsmi()+ "\',\"sifre\"=\'"+uye.getSifre()+ "\',\"email\"=\'"+uye.getEmail()+ "\' WHERE \"personelID\"=\'"+id+"\'";

        Connection conn=this.connection();

        try
        {
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            //***** Bağlantı sonlandırma *****
            conn.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void sil(int id){
        System.out.println("Kişi siliniyor...");

        String sql= "DELETE FROM \"personel\" WHERE \"personelID\"="+id;

        Connection conn=this.connection();
        try{
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            //***** Bağlantı sonlandırma *****
            conn.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
