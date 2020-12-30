--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: actor_last_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actor_last_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE

BEGIN

    UPDATE "actor" SET last_update = CURRENT_DATE WHERE "actor_id" = NEW."actor_id";

    RETURN NEW;
END;

$$;


ALTER FUNCTION public.actor_last_update() OWNER TO postgres;

--
-- Name: address_clear(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.address_clear() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."address" = LTRIM(NEW."address");
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.address_clear() OWNER TO postgres;

--
-- Name: count_staff(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.count_staff() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	a integer;
BEGIN
   SELECT count(*) into a FROM "staff";
   RETURN a;
END;
$$;


ALTER FUNCTION public.count_staff() OWNER TO postgres;

--
-- Name: film_count(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.film_count() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	a integer;
BEGIN
   SELECT count(*) into a FROM "film";
   RETURN a;
END;
$$;


ALTER FUNCTION public.film_count() OWNER TO postgres;

--
-- Name: good_movies(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.good_movies() RETURNS void
    LANGUAGE sql
    AS $$
	 SELECT * FROM film WHERE rating>50 ;
	$$;


ALTER FUNCTION public.good_movies() OWNER TO postgres;

--
-- Name: languege_movies(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.languege_movies() RETURNS void
    LANGUAGE sql
    AS $$
	 SELECT * FROM "film" INNER JOIN "languege" ON "film"."languege_id" =  "languege"."languege_id"
	$$;


ALTER FUNCTION public.languege_movies() OWNER TO postgres;

--
-- Name: upper_country(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.upper_country() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW."country" = UPPER(NEW."country");
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.upper_country() OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: aktor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aktor (
    "aktorID" integer NOT NULL,
    isim character varying(2044) NOT NULL,
    "sonAktivite" character varying(2044) NOT NULL
);


ALTER TABLE public.aktor OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_actor_id_seq OWNED BY public.aktor."aktorID";


--
-- Name: adres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adres (
    "adresID" integer NOT NULL,
    "acikAdres" character varying(2044) NOT NULL,
    "sehirID" integer NOT NULL,
    postal_code integer NOT NULL,
    "sonAktivite" character varying(2044) NOT NULL
);


ALTER TABLE public.adres OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_address_id_seq OWNED BY public.adres."adresID";


--
-- Name: kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori (
    "kategoriID" integer NOT NULL,
    isim character varying(2044) NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.kategori OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.kategori."kategoriID";


--
-- Name: sehir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sehir (
    "sehirID" integer NOT NULL,
    isim character varying(2044) NOT NULL,
    "ulkeID" integer NOT NULL
);


ALTER TABLE public.sehir OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_city_id_seq OWNED BY public.sehir."sehirID";


--
-- Name: ulke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulke (
    "ulkeID" integer NOT NULL,
    isim character varying(2044) NOT NULL
);


ALTER TABLE public.ulke OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_country_id_seq OWNED BY public.ulke."ulkeID";


--
-- Name: musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri (
    "musteriID" integer NOT NULL,
    "magazaID" integer NOT NULL,
    isim character varying(2044) NOT NULL,
    email character varying(2044) NOT NULL,
    "adresID" integer NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.musteri OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.musteri."musteriID";


--
-- Name: dil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dil (
    "dilID" integer NOT NULL,
    isim character varying(2044) NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.dil OWNER TO postgres;

--
-- Name: envanter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.envanter (
    "envanterID" integer NOT NULL,
    "filmID" integer NOT NULL,
    "magazaID" integer NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.envanter OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    "filmID" integer NOT NULL,
    baslik character varying(2044) NOT NULL,
    aciklama character varying(2044) NOT NULL,
    "yayinTarihi" character varying(2044) NOT NULL,
    "dilID" integer NOT NULL,
    sure integer NOT NULL,
    puan integer NOT NULL,
    "sonAktivite" date
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_aktor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_aktor (
    "aktorID" integer NOT NULL,
    "filmID" integer NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.film_aktor OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_film_id_seq OWNER TO postgres;

--
-- Name: film_film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_film_id_seq OWNED BY public.film."filmID";


--
-- Name: film_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_kategori (
    "filmID" integer NOT NULL,
    "kategoriID" integer NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.film_kategori OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_inventory_id_seq OWNED BY public.envanter."envanterID";


--
-- Name: kiralama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kiralama (
    "kiralamaID" integer NOT NULL,
    "kiralamaTarihi" date NOT NULL,
    "envanterID" integer NOT NULL,
    "musteriID" integer NOT NULL,
    "personelID" integer NOT NULL,
    "sonAktivite" date NOT NULL
);


ALTER TABLE public.kiralama OWNER TO postgres;

--
-- Name: languege_languege_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languege_languege_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languege_languege_id_seq OWNER TO postgres;

--
-- Name: languege_languege_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languege_languege_id_seq OWNED BY public.dil."dilID";


--
-- Name: magaza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magaza (
    "magazaID" integer NOT NULL,
    "personelID" integer NOT NULL,
    "adresID" integer NOT NULL
);


ALTER TABLE public.magaza OWNER TO postgres;

--
-- Name: odeme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odeme (
    "odemeID" integer NOT NULL,
    "musteriID" integer NOT NULL,
    "personelID" integer NOT NULL,
    "kiralamaID" integer NOT NULL,
    miktar integer NOT NULL,
    "odemeTarihi" date NOT NULL
);


ALTER TABLE public.odeme OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.odeme."odemeID";


--
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    "personelID" integer NOT NULL,
    isim character varying(2044) NOT NULL,
    soyisim character varying(2044) NOT NULL,
    "adresID" integer,
    email character varying(2044) NOT NULL,
    "magazaID" character varying(2044),
    "kullaniciIsmi" character varying(2044) NOT NULL,
    sifre character varying(2044) NOT NULL,
    "sonAktivite" date
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_rental_id_seq OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rental_rental_id_seq OWNED BY public.kiralama."kiralamaID";


--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.personel."personelID";


--
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- Name: store_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.store_store_id_seq OWNED BY public.magaza."magazaID";


--
-- Name: adres adresID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres ALTER COLUMN "adresID" SET DEFAULT nextval('public.address_address_id_seq'::regclass);


--
-- Name: aktor aktorID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktor ALTER COLUMN "aktorID" SET DEFAULT nextval('public.actor_actor_id_seq'::regclass);


--
-- Name: dil dilID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dil ALTER COLUMN "dilID" SET DEFAULT nextval('public.languege_languege_id_seq'::regclass);


--
-- Name: envanter envanterID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter ALTER COLUMN "envanterID" SET DEFAULT nextval('public.inventory_inventory_id_seq'::regclass);


--
-- Name: film filmID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN "filmID" SET DEFAULT nextval('public.film_film_id_seq'::regclass);


--
-- Name: kategori kategoriID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori ALTER COLUMN "kategoriID" SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: kiralama kiralamaID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kiralama ALTER COLUMN "kiralamaID" SET DEFAULT nextval('public.rental_rental_id_seq'::regclass);


--
-- Name: magaza magazaID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza ALTER COLUMN "magazaID" SET DEFAULT nextval('public.store_store_id_seq'::regclass);


--
-- Name: musteri musteriID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri ALTER COLUMN "musteriID" SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: odeme odemeID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odeme ALTER COLUMN "odemeID" SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: personel personelID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel ALTER COLUMN "personelID" SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- Name: sehir sehirID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir ALTER COLUMN "sehirID" SET DEFAULT nextval('public.city_city_id_seq'::regclass);


--
-- Name: ulke ulkeID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulke ALTER COLUMN "ulkeID" SET DEFAULT nextval('public.country_country_id_seq'::regclass);


--
-- Data for Name: adres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.adres VALUES
	(1, 'adres 1', 1, 20, '10.08.2020'),
	(2, 'adres 2', 2, 30, '10.08.2020'),
	(3, 'adres 3', 3, 40, '10.08.2020'),
	(4, 'adres 4', 4, 50, '10.08.2020');


--
-- Data for Name: aktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aktor VALUES
	(1, 'Leonardo DiCaprio', '10.08.2020'),
	(2, 'Tom Hangs', '10.08.2020'),
	(3, 'Morgan Freeman', '10.08.2020'),
	(4, 'Christian Bale', '10.08.2020');


--
-- Data for Name: dil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dil VALUES
	(1, 'English', '2020-08-10'),
	(2, 'Türkçe', '2020-08-10'),
	(3, 'Español', '2020-08-10'),
	(4, 'Português', '2020-08-10');


--
-- Data for Name: envanter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.envanter VALUES
	(1, 1, 1, '2020-08-10'),
	(2, 3, 1, '2020-08-10'),
	(3, 5, 1, '2020-08-10');


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film VALUES
	(1, 'Esaretin Bedeli', 'esaretten kurtulan adamın hikayesi', '1994', 1, 120, 92, '2020-08-10'),
	(2, 'Baba', 'Mafya olan bir ailenin hikayesi', '1972', 1, 180, 91, '2020-08-10'),
	(3, 'Dövüş Kulübü', 'Çift karakterli bir insanın ülkeyi bir isyana sürüklemesini anlatır', '1999', 1, 140, 88, '2020-08-10'),
	(4, 'Forrest Gump', 'Zihinsel geriliği olan aynı zamanda çok iyi bir koşucu olan karakterin hikayesi', '1994', 1, 150, 88, '2020-08-10'),
	(5, 'Yeşil Yol', 'İzlemedim bilmiyorum', '1999', 1, 180, 85, '2020-08-10');


--
-- Data for Name: film_aktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film_aktor VALUES
	(1, 1, '2020-08-10'),
	(2, 2, '2020-08-10'),
	(3, 3, '2020-08-10');


--
-- Data for Name: film_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film_kategori VALUES
	(1, 1, '2020-08-10'),
	(2, 2, '2020-08-10'),
	(3, 3, '2020-08-10');


--
-- Data for Name: kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kategori VALUES
	(1, 'Aksiyon', '2020-08-10'),
	(2, 'Bilim Kurgu', '2020-08-10'),
	(3, 'Korku', '2020-08-10'),
	(4, 'Belgesel', '2020-08-10'),
	(5, 'Gerilim', '2020-08-10'),
	(6, 'Fantastik', '2020-08-10');


--
-- Data for Name: kiralama; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kiralama VALUES
	(1, '2020-08-10', 1, 1, 1, '2020-08-10'),
	(2, '2020-08-10', 2, 2, 2, '2020-08-10'),
	(3, '2020-08-10', 3, 3, 3, '2020-08-10');


--
-- Data for Name: magaza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.magaza VALUES
	(1, 1, 3),
	(2, 2, 4),
	(3, 3, 2);


--
-- Data for Name: musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musteri VALUES
	(1, 1, 'Gerardo Marsh', 'gmarsh@gmail.com', 1, '2020-08-10'),
	(2, 1, 'Caiden McLean', 'gmclean@gmail.com', 2, '2020-08-10'),
	(3, 2, 'Jakob Robinson', 'jrobinson@gmail.com', 3, '2020-08-10'),
	(4, 2, 'Ingrid Goode', 'igroode@gmail.com', 4, '2020-08-10');


--
-- Data for Name: odeme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.odeme VALUES
	(1, 1, 1, 1, 100, '2020-08-10'),
	(2, 2, 2, 2, 150, '2020-08-10'),
	(3, 3, 3, 3, 200, '2020-08-10');


--
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personel VALUES
	(2, 'Braedon ', 'McWilliams', 2, 'bmcwilliams@gmail.com', '2', 'breadon', '123', '2020-08-10'),
	(3, 'Alice', 'Reid', 3, 'areid@gmail.com', '3', 'alice', '123', '2020-08-10'),
	(5, 'Deneme', 'Deneme', NULL, 'deneme@gmail.com', NULL, 'den123', 'den', NULL);


--
-- Data for Name: sehir; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sehir VALUES
	(1, 'İstanbul', 1),
	(2, 'Londra', 2),
	(3, 'Delhi', 3),
	(4, 'New York', 4),
	(5, 'DC', 4);


--
-- Data for Name: ulke; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ulke VALUES
	(1, 'Türkiye'),
	(2, 'İngiltere'),
	(3, 'Hindistan'),
	(4, 'ABD');


--
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 4, true);


--
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 4, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 6, true);


--
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 5, true);


--
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 4, true);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 4, true);


--
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_film_id_seq', 10, true);


--
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 3, true);


--
-- Name: languege_languege_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languege_languege_id_seq', 4, true);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 3, true);


--
-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_rental_id_seq', 3, true);


--
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 5, true);


--
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 3, true);


--
-- Name: aktor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktor
    ADD CONSTRAINT actor_pkey PRIMARY KEY ("aktorID");


--
-- Name: adres address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres
    ADD CONSTRAINT address_pkey PRIMARY KEY ("adresID");


--
-- Name: kategori category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori
    ADD CONSTRAINT category_pkey PRIMARY KEY ("kategoriID");


--
-- Name: sehir city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT city_pkey PRIMARY KEY ("sehirID");


--
-- Name: ulke country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulke
    ADD CONSTRAINT country_pkey PRIMARY KEY ("ulkeID");


--
-- Name: musteri customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT customer_pkey PRIMARY KEY ("musteriID");


--
-- Name: film_aktor film_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_aktor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY ("aktorID", "filmID");


--
-- Name: film_kategori film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_kategori
    ADD CONSTRAINT film_category_pkey PRIMARY KEY ("filmID", "kategoriID");


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY ("filmID");


--
-- Name: envanter inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter
    ADD CONSTRAINT inventory_pkey PRIMARY KEY ("envanterID");


--
-- Name: dil languege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dil
    ADD CONSTRAINT languege_pkey PRIMARY KEY ("dilID");


--
-- Name: odeme payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT payment_pkey PRIMARY KEY ("odemeID");


--
-- Name: kiralama rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT rental_pkey PRIMARY KEY ("kiralamaID");


--
-- Name: personel staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT staff_pkey PRIMARY KEY ("personelID");


--
-- Name: magaza store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza
    ADD CONSTRAINT store_pkey PRIMARY KEY ("magazaID");


--
-- Name: aktor actor_last_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actor_last_update BEFORE INSERT ON public.aktor FOR EACH ROW EXECUTE PROCEDURE public.actor_last_update();


--
-- Name: adres address_clear; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER address_clear BEFORE INSERT ON public.adres FOR EACH ROW EXECUTE PROCEDURE public.address_clear();


--
-- Name: ulke upper_country; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER upper_country BEFORE INSERT ON public.ulke FOR EACH ROW EXECUTE PROCEDURE public.upper_country();


--
-- Name: film_aktor lnk_actor_film_actor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_aktor
    ADD CONSTRAINT lnk_actor_film_actor FOREIGN KEY ("aktorID") REFERENCES public.aktor("aktorID") MATCH FULL;


--
-- Name: musteri lnk_address_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT lnk_address_customer FOREIGN KEY ("adresID") REFERENCES public.adres("adresID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personel lnk_address_staff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT lnk_address_staff FOREIGN KEY ("adresID") REFERENCES public.adres("adresID") MATCH FULL;


--
-- Name: magaza lnk_address_store; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magaza
    ADD CONSTRAINT lnk_address_store FOREIGN KEY ("adresID") REFERENCES public.adres("adresID") MATCH FULL;


--
-- Name: film_kategori lnk_category_film_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_kategori
    ADD CONSTRAINT lnk_category_film_category FOREIGN KEY ("kategoriID") REFERENCES public.kategori("kategoriID") MATCH FULL;


--
-- Name: adres lnk_city_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres
    ADD CONSTRAINT lnk_city_address FOREIGN KEY ("sehirID") REFERENCES public.sehir("sehirID") MATCH FULL;


--
-- Name: sehir lnk_country_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT lnk_country_city FOREIGN KEY ("ulkeID") REFERENCES public.ulke("ulkeID") MATCH FULL;


--
-- Name: odeme lnk_customer_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT lnk_customer_payment FOREIGN KEY ("musteriID") REFERENCES public.musteri("musteriID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kiralama lnk_customer_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT lnk_customer_rental FOREIGN KEY ("musteriID") REFERENCES public.musteri("musteriID") MATCH FULL;


--
-- Name: film_aktor lnk_film_film_actor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_aktor
    ADD CONSTRAINT lnk_film_film_actor FOREIGN KEY ("filmID") REFERENCES public.film("filmID") MATCH FULL;


--
-- Name: film_kategori lnk_film_film_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_kategori
    ADD CONSTRAINT lnk_film_film_category FOREIGN KEY ("filmID") REFERENCES public.film("filmID") MATCH FULL;


--
-- Name: envanter lnk_film_inventory; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter
    ADD CONSTRAINT lnk_film_inventory FOREIGN KEY ("filmID") REFERENCES public.film("filmID") MATCH FULL;


--
-- Name: kiralama lnk_inventory_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kiralama
    ADD CONSTRAINT lnk_inventory_rental FOREIGN KEY ("envanterID") REFERENCES public.envanter("envanterID") MATCH FULL;


--
-- Name: film lnk_languege_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT lnk_languege_film FOREIGN KEY ("dilID") REFERENCES public.dil("dilID") MATCH FULL;


--
-- Name: odeme lnk_rental_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odeme
    ADD CONSTRAINT lnk_rental_payment FOREIGN KEY ("kiralamaID") REFERENCES public.kiralama("kiralamaID") MATCH FULL;


--
-- PostgreSQL database dump complete
--

