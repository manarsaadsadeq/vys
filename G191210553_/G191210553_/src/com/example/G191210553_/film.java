package com.example.G191210553_;

public class film {
    private String baslik;
    private String aciklama;
    private String yayinTarihi;
    private int dilID;
    private int sure;
    private int puan;
    film(String baslik,String aciklama,String yayinTarihi,int dilID,int sure,int puan){
        this.baslik = baslik;
        this.aciklama = aciklama;
        this.yayinTarihi = yayinTarihi;
        this.dilID = dilID;
        this.sure = sure;
        this.puan = puan;
    }
    public String getBaslik(){return baslik;}
    public String getAciklama(){return aciklama;}
    public String getYayinTarihi(){return yayinTarihi;}
    public int getDilID(){return dilID;}
    public int getSure(){return sure;}
    public int getPuan(){return puan;}
}
