--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-27 12:41:38

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
-- TOC entry 244 (class 1255 OID 17026)
-- Name: aratoplam(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.aratoplam() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	fiyati integer;
	miktari integer;
	sonuc integer;
BEGIN
	miktari:= (select miktar from ilacrecete order by id desc limit 1);
	fiyati:=(select fiyat from ilac where ilacid=(select ilacid from ilacrecete order by id desc limit 1));
  	sonuc:=miktari * fiyati;
  
  	UPDATE ilacrecete SET aratoplam=sonuc where id=(select id from ilacrecete order by id desc limit 1);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.aratoplam() OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 17350)
-- Name: ilac_ekle(text, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.ilac_ekle(IN ad text, IN firma integer, IN kategori integer, IN fiyat integer)
    LANGUAGE sql
    AS $$
insert into ilac (adi,firmaid,kategori,fiyat) values (ad,firma,kategori,fiyat);
$$;


ALTER PROCEDURE public.ilac_ekle(IN ad text, IN firma integer, IN kategori integer, IN fiyat integer) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 17392)
-- Name: ilacara(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ilacara(ilacno integer) RETURNS TABLE(id integer, ilacadi character varying, firma integer, kategorid integer, fiyati integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "ilacid", "adi", "firmaid", "kategori", "fiyat" FROM ilac
                 WHERE "ilacid" = ilacno;
END;
$$;


ALTER FUNCTION public.ilacara(ilacno integer) OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 17281)
-- Name: raporlama(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.raporlama() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF(TG_OP = 'INSERT') THEN
		INSERT INTO rapor SELECT NEW.ilacid, NEW.adi, NEW.fiyat, 'eklendi', NOW();
		RETURN NEW;
	ELSEIF(TG_OP = 'UPDATE') THEN
		INSERT INTO rapor SELECT NEW.ilacid, NEW.adi, NEW.fiyat, 'guncellendi', NOW();
		RETURN NEW;
	ELSEIF(TG_OP = 'DELETE') THEN
		INSERT INTO rapor SELECT OLD.ilacid, OLD.adi, OLD.fiyat, 'silindi', NOW();
		RETURN NEW;
	END IF;
	RETURN NULL;
   
END;
$$;


ALTER FUNCTION public.raporlama() OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 17352)
-- Name: satisfiyatsorgula(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.satisfiyatsorgula(fiyat double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
fiyat:=fiyat*0.15+fiyat;
return fiyat;
end;
$$;


ALTER FUNCTION public.satisfiyatsorgula(fiyat double precision) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 17059)
-- Name: tarihekleme(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tarihekleme() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.tarih = NOW();

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.tarihekleme() OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 17353)
-- Name: toplamilacsayisi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplamilacsayisi() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare 
toplam integer;
begin
select count(*) into toplam from ilac;
return toplam;
end;
$$;


ALTER FUNCTION public.toplamilacsayisi() OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 17047)
-- Name: toplamtutar(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplamtutar() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	sonuc integer;
BEGIN
	sonuc:=(select sum(aratoplam)from ilacrecete where receteid=(select receteid from fatura order by faturano desc limit 1));
  
  	UPDATE fatura SET toplamtutar=sonuc where receteid=(select receteid from fatura order by faturano desc limit 1);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.toplamtutar() OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 16970)
-- Name: zaman(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.zaman() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.tarih = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.zaman() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 17219)
-- Name: depo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depo (
    depoid integer NOT NULL,
    adi character varying(25) NOT NULL,
    iletisimid integer NOT NULL
);


ALTER TABLE public.depo OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17218)
-- Name: depo_depoid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depo_depoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.depo_depoid_seq OWNER TO postgres;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 233
-- Name: depo_depoid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depo_depoid_seq OWNED BY public.depo.depoid;


--
-- TOC entry 229 (class 1259 OID 17081)
-- Name: kisiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kisiler (
    id integer NOT NULL,
    tcno bigint NOT NULL,
    adi character varying(25) NOT NULL,
    soyadi character varying(25) NOT NULL,
    iletisim integer NOT NULL
);


ALTER TABLE public.kisiler OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17080)
-- Name: kisiler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kisiler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kisiler_id_seq OWNER TO postgres;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 228
-- Name: kisiler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kisiler_id_seq OWNED BY public.kisiler.id;


--
-- TOC entry 230 (class 1259 OID 17206)
-- Name: depocalisan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depocalisan (
    id integer DEFAULT nextval('public.kisiler_id_seq'::regclass),
    depoid integer
)
INHERITS (public.kisiler);


ALTER TABLE public.depocalisan OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17224)
-- Name: eczane; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eczane (
    eczaneid integer NOT NULL,
    adi character varying(25) NOT NULL,
    iletisimid integer NOT NULL
);


ALTER TABLE public.eczane OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17223)
-- Name: eczane_eczaneid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eczane_eczaneid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eczane_eczaneid_seq OWNER TO postgres;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 235
-- Name: eczane_eczaneid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eczane_eczaneid_seq OWNED BY public.eczane.eczaneid;


--
-- TOC entry 231 (class 1259 OID 17210)
-- Name: eczanecalisan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eczanecalisan (
    id integer DEFAULT nextval('public.kisiler_id_seq'::regclass),
    eczaneid integer
)
INHERITS (public.kisiler);


ALTER TABLE public.eczanecalisan OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17031)
-- Name: fatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fatura (
    faturano integer NOT NULL,
    receteid integer NOT NULL,
    eczaneid integer NOT NULL,
    toplamtutar integer,
    tarih timestamp without time zone
);


ALTER TABLE public.fatura OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17030)
-- Name: fatura_faturano_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fatura_faturano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fatura_faturano_seq OWNER TO postgres;

--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 222
-- Name: fatura_faturano_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fatura_faturano_seq OWNED BY public.fatura.faturano;


--
-- TOC entry 232 (class 1259 OID 17214)
-- Name: hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasta (
    id integer DEFAULT nextval('public.kisiler_id_seq'::regclass),
    receteid integer NOT NULL
)
INHERITS (public.kisiler);


ALTER TABLE public.hasta OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17061)
-- Name: il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.il (
    ilid integer NOT NULL,
    iladi character varying(25) NOT NULL
);


ALTER TABLE public.il OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16927)
-- Name: ilac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilac (
    ilacid integer NOT NULL,
    adi character varying(25) NOT NULL,
    firmaid integer NOT NULL,
    kategori integer NOT NULL,
    fiyat integer NOT NULL
);


ALTER TABLE public.ilac OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16926)
-- Name: ilac_ilacid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilac_ilacid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilac_ilacid_seq OWNER TO postgres;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 216
-- Name: ilac_ilacid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilac_ilacid_seq OWNED BY public.ilac.ilacid;


--
-- TOC entry 221 (class 1259 OID 16939)
-- Name: ilacfirma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilacfirma (
    firmaid integer NOT NULL,
    firmadi character varying(25) NOT NULL,
    iletisimid integer NOT NULL
);


ALTER TABLE public.ilacfirma OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16938)
-- Name: ilacfirma_firmaid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilacfirma_firmaid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilacfirma_firmaid_seq OWNER TO postgres;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 220
-- Name: ilacfirma_firmaid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilacfirma_firmaid_seq OWNED BY public.ilacfirma.firmaid;


--
-- TOC entry 219 (class 1259 OID 16934)
-- Name: ilackategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilackategori (
    kategorid integer NOT NULL,
    kategoriadi character varying(25) NOT NULL
);


ALTER TABLE public.ilackategori OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16933)
-- Name: ilackategori_kategorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilackategori_kategorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilackategori_kategorid_seq OWNER TO postgres;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 218
-- Name: ilackategori_kategorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilackategori_kategorid_seq OWNED BY public.ilackategori.kategorid;


--
-- TOC entry 215 (class 1259 OID 16922)
-- Name: ilacrecete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilacrecete (
    id integer NOT NULL,
    receteid integer NOT NULL,
    ilacid integer NOT NULL,
    miktar integer NOT NULL,
    aratoplam integer
);


ALTER TABLE public.ilacrecete OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16921)
-- Name: ilacrecete_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilacrecete_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilacrecete_id_seq OWNER TO postgres;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 214
-- Name: ilacrecete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilacrecete_id_seq OWNED BY public.ilacrecete.id;


--
-- TOC entry 225 (class 1259 OID 17066)
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    ilceno integer NOT NULL,
    ilceadi character varying(25) NOT NULL,
    ilno integer NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17072)
-- Name: iletisim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iletisim (
    id integer NOT NULL,
    telefon integer NOT NULL,
    adres text NOT NULL,
    ilceid integer NOT NULL
);


ALTER TABLE public.iletisim OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17071)
-- Name: iletisim_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.iletisim_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iletisim_id_seq OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 226
-- Name: iletisim_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.iletisim_id_seq OWNED BY public.iletisim.id;


--
-- TOC entry 237 (class 1259 OID 17268)
-- Name: rapor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rapor (
    ilacid integer,
    adi character varying(25),
    fiyat integer,
    durum text,
    tarih time without time zone
);


ALTER TABLE public.rapor OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17360)
-- Name: recete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recete (
    id integer NOT NULL,
    receteid integer NOT NULL,
    hastaid integer NOT NULL,
    tarih timestamp without time zone
);


ALTER TABLE public.recete OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17359)
-- Name: recete_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recete_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recete_id_seq OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 238
-- Name: recete_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recete_id_seq OWNED BY public.recete.id;


--
-- TOC entry 3261 (class 2604 OID 17222)
-- Name: depo depoid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depo ALTER COLUMN depoid SET DEFAULT nextval('public.depo_depoid_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 17227)
-- Name: eczane eczaneid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eczane ALTER COLUMN eczaneid SET DEFAULT nextval('public.eczane_eczaneid_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 17034)
-- Name: fatura faturano; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura ALTER COLUMN faturano SET DEFAULT nextval('public.fatura_faturano_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16930)
-- Name: ilac ilacid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilac ALTER COLUMN ilacid SET DEFAULT nextval('public.ilac_ilacid_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 16942)
-- Name: ilacfirma firmaid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacfirma ALTER COLUMN firmaid SET DEFAULT nextval('public.ilacfirma_firmaid_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16937)
-- Name: ilackategori kategorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilackategori ALTER COLUMN kategorid SET DEFAULT nextval('public.ilackategori_kategorid_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 16925)
-- Name: ilacrecete id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacrecete ALTER COLUMN id SET DEFAULT nextval('public.ilacrecete_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 17075)
-- Name: iletisim id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim ALTER COLUMN id SET DEFAULT nextval('public.iletisim_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 17084)
-- Name: kisiler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler ALTER COLUMN id SET DEFAULT nextval('public.kisiler_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 17363)
-- Name: recete id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete ALTER COLUMN id SET DEFAULT nextval('public.recete_id_seq'::regclass);


--
-- TOC entry 3482 (class 0 OID 17219)
-- Dependencies: 234
-- Data for Name: depo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depo (depoid, adi, iletisimid) FROM stdin;
1	hızır ecza deposu	5
2	selçuk ecza deposu	4
\.


--
-- TOC entry 3478 (class 0 OID 17206)
-- Dependencies: 230
-- Data for Name: depocalisan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depocalisan (id, tcno, adi, soyadi, iletisim, depoid) FROM stdin;
1	11111111111	ahmet	yolcu	1	1
4	22222222222	ahmet	selcuk	2	2
5	33333333333	yiğit	hızır	2	1
\.


--
-- TOC entry 3484 (class 0 OID 17224)
-- Dependencies: 236
-- Data for Name: eczane; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eczane (eczaneid, adi, iletisimid) FROM stdin;
1	GÜL Eczanesi	1
2	hayat eczanesi	2
\.


--
-- TOC entry 3479 (class 0 OID 17210)
-- Dependencies: 231
-- Data for Name: eczanecalisan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eczanecalisan (id, tcno, adi, soyadi, iletisim, eczaneid) FROM stdin;
2	44444444444	ahmet	dursun	1	1
3	55555555555	hayat	çiçekci	2	2
\.


--
-- TOC entry 3471 (class 0 OID 17031)
-- Dependencies: 223
-- Data for Name: fatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fatura (faturano, receteid, eczaneid, toplamtutar, tarih) FROM stdin;
9	1	2	198	2022-12-26 13:24:27.089932
12	3	1	135	2022-12-26 13:27:12.714905
13	2	1	74	2022-12-26 13:27:25.021947
\.


--
-- TOC entry 3480 (class 0 OID 17214)
-- Dependencies: 232
-- Data for Name: hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasta (id, tcno, adi, soyadi, iletisim, receteid) FROM stdin;
9	66666666666	kemal	erdemli	6	1
11	77777777777	ali	yılmaz	7	2
12	88888888888	buse	yılmaz	8	3
\.


--
-- TOC entry 3472 (class 0 OID 17061)
-- Dependencies: 224
-- Data for Name: il; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.il (ilid, iladi) FROM stdin;
34	İSTANBUL
54	SAKARYA
41	KOCAELİ
59	TEKİRDAĞ
16	BURSA
\.


--
-- TOC entry 3465 (class 0 OID 16927)
-- Dependencies: 217
-- Data for Name: ilac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ilac (ilacid, adi, firmaid, kategori, fiyat) FROM stdin;
1	dolorex	2	2	37
2	cipro	1	1	45
3	afrein	2	1	54
12	minoset	2	2	1234
16	nurofen	1	2	28
17	sfejsf	2	2	9867587
\.


--
-- TOC entry 3469 (class 0 OID 16939)
-- Dependencies: 221
-- Data for Name: ilacfirma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ilacfirma (firmaid, firmadi, iletisimid) FROM stdin;
1	biofarma	1
2	abdiibrahim	2
3	sanofi	3
\.


--
-- TOC entry 3467 (class 0 OID 16934)
-- Dependencies: 219
-- Data for Name: ilackategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ilackategori (kategorid, kategoriadi) FROM stdin;
1	antibiyotik
2	agrı kesici
\.


--
-- TOC entry 3463 (class 0 OID 16922)
-- Dependencies: 215
-- Data for Name: ilacrecete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ilacrecete (id, receteid, ilacid, miktar, aratoplam) FROM stdin;
43	1	3	2	108
44	1	2	2	90
46	2	1	2	74
47	3	2	3	135
\.


--
-- TOC entry 3473 (class 0 OID 17066)
-- Dependencies: 225
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ilce (ilceno, ilceadi, ilno) FROM stdin;
5901	ÇORLU	59
5902	ÇERKEZKÖY	59
3401	TUZLA	34
3402	BEŞİKTAŞ	34
4101	GEBZE	41
5401	SERDİVAN	54
1601	İNEGÖL	16
1602	GEMLİK	16
\.


--
-- TOC entry 3475 (class 0 OID 17072)
-- Dependencies: 227
-- Data for Name: iletisim; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iletisim (id, telefon, adres, ilceid) FROM stdin;
1	11111111	medeniyet caddesi	5401
2	222222222	postane mahalle	3401
4	33333333	kiremti sokak	3402
5	44444	paptya caddesi	1601
6	55555555	hürriyet mahhalesi	5901
7	666666	gül sokak	5902
8	7777777	istasyon sokak	4101
9	8888888	palmiye sokak	1602
\.


--
-- TOC entry 3477 (class 0 OID 17081)
-- Dependencies: 229
-- Data for Name: kisiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kisiler (id, tcno, adi, soyadi, iletisim) FROM stdin;
\.


--
-- TOC entry 3485 (class 0 OID 17268)
-- Dependencies: 237
-- Data for Name: rapor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rapor (ilacid, adi, fiyat, durum, tarih) FROM stdin;
9	aaaaa	11111	eklendi	21:42:55.434293
5	ghjc	2222	guncellendi	21:44:30.195213
10	vvvvv	33333	eklendi	21:50:06.66208
10	vvvvv	444	guncellendi	21:50:26.371564
11	eeeeee	7777	eklendi	21:57:13.529337
11	eeeeee	7777	eklendi	21:57:13.529337
11	eeeeee	66677	guncellendi	21:57:20.461645
11	eeeeee	66677	guncellendi	21:57:20.461645
12	minoset	1234	eklendi	21:58:42.294238
12	minoset	1234	eklendi	21:58:42.294238
13	tttt	675856	eklendi	22:00:31.596505
13	tttt	34	guncellendi	22:00:57.424182
14	ggggg	123124	eklendi	22:03:44.641766
14	ggggg	45	guncellendi	22:04:04.667111
14	ggggg	45	silindi	22:04:32.565512
15	hahaha	333	eklendi	00:57:08.712028
15	hhhhhh	111	guncellendi	00:57:44.309686
15	hhhhhh	111	silindi	00:57:56.540103
9	aaaaa	11111	silindi	13:23:44.661891
5	ghjc	2222	silindi	13:23:44.661891
10	vvvvv	444	silindi	13:23:44.661891
13	tttt	34	silindi	13:23:44.661891
16	nurofen	28	eklendi	14:33:22.775699
17	sfejsf	7865	eklendi	18:01:16.082207
17	sfejsf	9867587	guncellendi	18:02:53.841515
\.


--
-- TOC entry 3487 (class 0 OID 17360)
-- Dependencies: 239
-- Data for Name: recete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recete (id, receteid, hastaid, tarih) FROM stdin;
5	1	9	2022-12-26 13:20:37.363753
6	3	12	2022-12-26 13:21:15.654856
\.


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 233
-- Name: depo_depoid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depo_depoid_seq', 2, true);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 235
-- Name: eczane_eczaneid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eczane_eczaneid_seq', 2, true);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 222
-- Name: fatura_faturano_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fatura_faturano_seq', 13, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 216
-- Name: ilac_ilacid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilac_ilacid_seq', 17, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 220
-- Name: ilacfirma_firmaid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilacfirma_firmaid_seq', 3, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 218
-- Name: ilackategori_kategorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilackategori_kategorid_seq', 2, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 214
-- Name: ilacrecete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilacrecete_id_seq', 47, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 226
-- Name: iletisim_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iletisim_id_seq', 9, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 228
-- Name: kisiler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kisiler_id_seq', 12, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 238
-- Name: recete_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recete_id_seq', 6, true);


--
-- TOC entry 3296 (class 2606 OID 17245)
-- Name: depo depo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depo
    ADD CONSTRAINT depo_pkey PRIMARY KEY (depoid);


--
-- TOC entry 3298 (class 2606 OID 17243)
-- Name: eczane eczane_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eczane
    ADD CONSTRAINT eczane_pkey PRIMARY KEY (eczaneid);


--
-- TOC entry 3278 (class 2606 OID 17036)
-- Name: fatura fatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura
    ADD CONSTRAINT fatura_pkey PRIMARY KEY (faturano);


--
-- TOC entry 3294 (class 2606 OID 17365)
-- Name: hasta hasta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT hasta_pkey PRIMARY KEY (receteid);


--
-- TOC entry 3282 (class 2606 OID 17065)
-- Name: il il_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il
    ADD CONSTRAINT il_pkey PRIMARY KEY (ilid);


--
-- TOC entry 3271 (class 2606 OID 16932)
-- Name: ilac ilac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilac
    ADD CONSTRAINT ilac_pkey PRIMARY KEY (ilacid);


--
-- TOC entry 3276 (class 2606 OID 16944)
-- Name: ilacfirma ilacfirma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacfirma
    ADD CONSTRAINT ilacfirma_pkey PRIMARY KEY (firmaid);


--
-- TOC entry 3273 (class 2606 OID 16946)
-- Name: ilackategori ilackategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilackategori
    ADD CONSTRAINT ilackategori_pkey PRIMARY KEY (kategorid);


--
-- TOC entry 3267 (class 2606 OID 16950)
-- Name: ilacrecete ilacrecete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacrecete
    ADD CONSTRAINT ilacrecete_pkey PRIMARY KEY (receteid, ilacid);


--
-- TOC entry 3285 (class 2606 OID 17070)
-- Name: ilce ilce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT ilce_pkey PRIMARY KEY (ilceno);


--
-- TOC entry 3287 (class 2606 OID 17079)
-- Name: iletisim iletisim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim
    ADD CONSTRAINT iletisim_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 17086)
-- Name: kisiler kisiler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT kisiler_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 17355)
-- Name: kisiler tcnoUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT "tcnoUnique" UNIQUE (tcno) INCLUDE (tcno);


--
-- TOC entry 3264 (class 1259 OID 16962)
-- Name: fki_R; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_R" ON public.ilacrecete USING btree (receteid);


--
-- TOC entry 3292 (class 1259 OID 17338)
-- Name: fki_depoidFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_depoidFK" ON public.depocalisan USING btree (depoid);


--
-- TOC entry 3279 (class 1259 OID 17317)
-- Name: fki_eczaneidFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_eczaneidFK" ON public.fatura USING btree (eczaneid);


--
-- TOC entry 3268 (class 1259 OID 17305)
-- Name: fki_firmaFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_firmaFK" ON public.ilac USING btree (firmaid);


--
-- TOC entry 3299 (class 1259 OID 17376)
-- Name: fki_hastaidFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_hastaidFK" ON public.recete USING btree (hastaid);


--
-- TOC entry 3274 (class 1259 OID 17311)
-- Name: fki_iletisimidFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_iletisimidFK" ON public.ilacfirma USING btree (iletisimid);


--
-- TOC entry 3283 (class 1259 OID 17288)
-- Name: fki_ilnoFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ilnoFK" ON public.ilce USING btree (ilno);


--
-- TOC entry 3269 (class 1259 OID 16968)
-- Name: fki_kategoriFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_kategoriFK" ON public.ilac USING btree (kategori);


--
-- TOC entry 3280 (class 1259 OID 17046)
-- Name: fki_receteidFK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_receteidFK" ON public.fatura USING btree (receteid);


--
-- TOC entry 3265 (class 1259 OID 16956)
-- Name: fki_İ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_İ" ON public.ilacrecete USING btree (ilacid);


--
-- TOC entry 3315 (class 2620 OID 17027)
-- Name: ilacrecete aratoplamekle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER aratoplamekle AFTER INSERT ON public.ilacrecete FOR EACH ROW EXECUTE FUNCTION public.aratoplam();


--
-- TOC entry 3316 (class 2620 OID 17282)
-- Name: ilac raporekle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER raporekle AFTER INSERT OR DELETE OR UPDATE ON public.ilac FOR EACH ROW EXECUTE FUNCTION public.raporlama();


--
-- TOC entry 3319 (class 2620 OID 17390)
-- Name: recete tarihekle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tarihekle BEFORE INSERT ON public.recete FOR EACH ROW EXECUTE FUNCTION public.zaman();


--
-- TOC entry 3317 (class 2620 OID 17060)
-- Name: fatura tariheklefatura; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tariheklefatura BEFORE INSERT ON public.fatura FOR EACH ROW EXECUTE FUNCTION public.tarihekleme();


--
-- TOC entry 3318 (class 2620 OID 17048)
-- Name: fatura toplamtutarekle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplamtutarekle AFTER INSERT ON public.fatura FOR EACH ROW EXECUTE FUNCTION public.toplamtutar();


--
-- TOC entry 3310 (class 2606 OID 17333)
-- Name: depocalisan depoidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depocalisan
    ADD CONSTRAINT "depoidFK" FOREIGN KEY (depoid) REFERENCES public.depo(depoid) NOT VALID;


--
-- TOC entry 3305 (class 2606 OID 17312)
-- Name: fatura eczaneidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura
    ADD CONSTRAINT "eczaneidFK" FOREIGN KEY (eczaneid) REFERENCES public.eczane(eczaneid) NOT VALID;


--
-- TOC entry 3311 (class 2606 OID 17339)
-- Name: eczanecalisan eczaneidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eczanecalisan
    ADD CONSTRAINT "eczaneidFK" FOREIGN KEY (eczaneid) REFERENCES public.eczane(eczaneid) NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 17300)
-- Name: ilac firmaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilac
    ADD CONSTRAINT "firmaFK" FOREIGN KEY (firmaid) REFERENCES public.ilacfirma(firmaid) NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 16951)
-- Name: ilacrecete ilacidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacrecete
    ADD CONSTRAINT "ilacidFK" FOREIGN KEY (ilacid) REFERENCES public.ilac(ilacid) NOT VALID;


--
-- TOC entry 3308 (class 2606 OID 17289)
-- Name: iletisim ilceidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iletisim
    ADD CONSTRAINT "ilceidFK" FOREIGN KEY (ilceid) REFERENCES public.ilce(ilceno) NOT VALID;


--
-- TOC entry 3304 (class 2606 OID 17306)
-- Name: ilacfirma iletisimidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacfirma
    ADD CONSTRAINT "iletisimidFK" FOREIGN KEY (iletisimid) REFERENCES public.iletisim(id) NOT VALID;


--
-- TOC entry 3313 (class 2606 OID 17318)
-- Name: eczane iletisimidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eczane
    ADD CONSTRAINT "iletisimidFK" FOREIGN KEY (iletisimid) REFERENCES public.iletisim(id) NOT VALID;


--
-- TOC entry 3312 (class 2606 OID 17323)
-- Name: depo iletisimidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depo
    ADD CONSTRAINT "iletisimidFK" FOREIGN KEY (iletisimid) REFERENCES public.iletisim(id) NOT VALID;


--
-- TOC entry 3309 (class 2606 OID 17328)
-- Name: kisiler iletisimidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT "iletisimidFK" FOREIGN KEY (iletisim) REFERENCES public.iletisim(id) NOT VALID;


--
-- TOC entry 3307 (class 2606 OID 17283)
-- Name: ilce ilnoFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT "ilnoFK" FOREIGN KEY (ilno) REFERENCES public.il(ilid) NOT VALID;


--
-- TOC entry 3303 (class 2606 OID 16963)
-- Name: ilac kategoriFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilac
    ADD CONSTRAINT "kategoriFK" FOREIGN KEY (kategori) REFERENCES public.ilackategori(kategorid) NOT VALID;


--
-- TOC entry 3314 (class 2606 OID 17366)
-- Name: recete receteidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recete
    ADD CONSTRAINT "receteidFK" FOREIGN KEY (receteid) REFERENCES public.hasta(receteid) NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 17377)
-- Name: ilacrecete receteidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilacrecete
    ADD CONSTRAINT "receteidFK" FOREIGN KEY (receteid) REFERENCES public.hasta(receteid) NOT VALID;


--
-- TOC entry 3306 (class 2606 OID 17382)
-- Name: fatura receteidFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fatura
    ADD CONSTRAINT "receteidFK" FOREIGN KEY (receteid) REFERENCES public.hasta(receteid) NOT VALID;


-- Completed on 2022-12-27 12:41:39

--
-- PostgreSQL database dump complete
--

