package com.example.G191210553_;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("KMDB Gururla Sunar...");
        System.out.println("Üyeliğiniz var ise 1'i yok ise 2'yi tuşlayınız");
        String loginInput;
        String KullaniciAdi;
        String Adi;
        String Soyadi;
        String _sifre;
        String email;
        uye uye = null;
        int id = 0;
        uyeRepo uyerepo = new uyeRepo();
        filmRepo filmRepo = new filmRepo();
        while (true) {
            loginInput = scanner.next();
            if (loginInput.equals("1")) {
                System.out.println("Kullanıcı ID giriniz");
                id = scanner.nextInt();
                uye = uyerepo.login(id);
                System.out.println("Hoşgeldin " + uye.getIsim());
                break;
            } else if (loginInput.equals("2")) {
                System.out.print("Adınızı Giriniz:");
                Adi = scanner.next();
                System.out.print("\nSoyadinizi Giriniz:");
                Soyadi = scanner.next();
                System.out.print("\nSifre giriniz:");
                _sifre = scanner.next();
                System.out.print("\nKullanici Adinizi giriniz:");
                KullaniciAdi = scanner.next();
                System.out.print("\nEmail giriniz:");
                email = scanner.next();
                uye = new uye(email, Adi, Soyadi, KullaniciAdi, _sifre);

                uyerepo.kaydet(uye);
                break;
            } else {
                System.out.println("Hatalı giriş yaptınız. Tekrar deneyin");
            }
        }
        while (true) {
            System.out.println("1- Tüm filmleri listele");
            System.out.println("2- Üyelik bilgilerimi güncelle");
            System.out.println("3- Üyeliğimi sil");
            System.out.println("4- Çıkış yap");
            String crudInput = scanner.next();
            if (crudInput.equals("1")) {
                filmRepo.getAllMovies();
            } else if (crudInput.equals("2")) {
                System.out.print("Adınızı Giriniz:");
                Adi = scanner.next();
                System.out.print("\nSoyadinizi Giriniz:");
                Soyadi = scanner.next();
                System.out.print("\nSifre giriniz:");
                _sifre = scanner.next();
                System.out.print("\nKullanici Adinizi giriniz:");
                KullaniciAdi = scanner.next();
                System.out.print("\nEmail giriniz:");
                email = scanner.next();
                uye = new uye(email, Adi, Soyadi, KullaniciAdi, _sifre);
                uyerepo.degistir(uye, id);
            } else if (crudInput.equals("3")) {
                uyerepo.sil(id);
                break;
            } else if (crudInput.equals("4")) {
                break;
            } else {
                System.out.println("Geçersiz komut!");
            }
        }
    }
}
