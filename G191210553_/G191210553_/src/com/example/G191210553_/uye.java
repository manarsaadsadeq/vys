package com.example.G191210553_;

public class uye {
    private String email;
    private String isim;
    private String soyisim;
    private String kullaniciIsmi;
    private String sifre;

    public uye(String mail, String isim, String soyisim, String nick, String pass) {
        this.email = mail;
        this.isim = isim;
        this.soyisim = soyisim;
        this.kullaniciIsmi = nick;
        this.sifre = pass;
    }

    public String getEmail() {
        return email;
    }

    public String getIsim() {
        return isim;
    }

    public String getSoyisim() {
        return soyisim;
    }

    public String getKullaniciIsmi() {
        return kullaniciIsmi;
    }

    public String getSifre() {
        return sifre;
    }
}
