--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: categorySector1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."categorySector1" (
    id integer NOT NULL,
    "categoryId" integer NOT NULL,
    sector1id integer NOT NULL
);


--
-- Name: categorySector1_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."categorySector1_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categorySector1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."categorySector1_id_seq" OWNED BY public."categorySector1".id;


--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    url text NOT NULL,
    "productId" integer NOT NULL
);


--
-- Name: photos_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.photos_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: photos_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.photos_temp_id_seq OWNED BY public.photos.id;


--
-- Name: productCategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."productCategory" (
    id integer NOT NULL,
    "productId" integer NOT NULL,
    "categoryId" integer NOT NULL
);


--
-- Name: productCategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."productCategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: productCategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."productCategory_id_seq" OWNED BY public."productCategory".id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    value integer NOT NULL,
    "userId" integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: sector1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sector1 (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: sector1_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sector1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sector1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sector1_id_seq OWNED BY public.sector1.id;


--
-- Name: sector1sector2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sector1sector2 (
    id integer NOT NULL,
    sector1id integer NOT NULL,
    sector2id integer NOT NULL
);


--
-- Name: sector1sector2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sector1sector2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sector1sector2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sector1sector2_id_seq OWNED BY public.sector1sector2.id;


--
-- Name: sector2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sector2 (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: sector2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sector2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sector2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sector2_id_seq OWNED BY public.sector2.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    cpf character varying(11) NOT NULL,
    "phoneNumber" character varying(11) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: categorySector1 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."categorySector1" ALTER COLUMN id SET DEFAULT nextval('public."categorySector1_id_seq"'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_temp_id_seq'::regclass);


--
-- Name: productCategory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."productCategory" ALTER COLUMN id SET DEFAULT nextval('public."productCategory_id_seq"'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: sector1 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1 ALTER COLUMN id SET DEFAULT nextval('public.sector1_id_seq'::regclass);


--
-- Name: sector1sector2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1sector2 ALTER COLUMN id SET DEFAULT nextval('public.sector1sector2_id_seq'::regclass);


--
-- Name: sector2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector2 ALTER COLUMN id SET DEFAULT nextval('public.sector2_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category VALUES (1, 'Quadros e Pôsteres');
INSERT INTO public.category VALUES (2, 'Almofadas e Capas');
INSERT INTO public.category VALUES (3, 'Tapetes e Carpetes');
INSERT INTO public.category VALUES (4, 'Objetos de Decoração');
INSERT INTO public.category VALUES (5, 'Sofás e Poltronas');
INSERT INTO public.category VALUES (6, 'Mesas e Cadeiras');
INSERT INTO public.category VALUES (7, 'Camas e Colchões');
INSERT INTO public.category VALUES (8, 'Armários e Estantes');
INSERT INTO public.category VALUES (9, 'Panelas e Frigideiras');
INSERT INTO public.category VALUES (10, 'Talheres e Louças');
INSERT INTO public.category VALUES (11, 'Utensílios de Cozinha');
INSERT INTO public.category VALUES (12, 'Acessórios para Servir');
INSERT INTO public.category VALUES (13, 'Caixas e Cestas');
INSERT INTO public.category VALUES (14, 'Prateleiras e Ganchos');
INSERT INTO public.category VALUES (15, 'Organizadores de Closet');
INSERT INTO public.category VALUES (16, 'Soluções para Espaços Pequenos');
INSERT INTO public.category VALUES (17, 'Geladeiras e Freezers');
INSERT INTO public.category VALUES (18, 'Máquinas de Lavar');
INSERT INTO public.category VALUES (19, 'Fornos e Micro-ondas');
INSERT INTO public.category VALUES (20, 'Aparelhos de Ar Condicionado');
INSERT INTO public.category VALUES (21, 'Blusas e Camisetas');
INSERT INTO public.category VALUES (22, 'Vestidos e Saias');
INSERT INTO public.category VALUES (23, 'Calças e Shorts');
INSERT INTO public.category VALUES (24, 'Casacos e Jaquetas');
INSERT INTO public.category VALUES (25, 'Tênis e Sneakers');
INSERT INTO public.category VALUES (26, 'Sandálias e Chinelos');
INSERT INTO public.category VALUES (27, 'Botas e Coturnos');
INSERT INTO public.category VALUES (28, 'Sapatos de Salto');
INSERT INTO public.category VALUES (29, 'Colares e Pingentes');
INSERT INTO public.category VALUES (30, 'Brincos e Anéis');
INSERT INTO public.category VALUES (31, 'Pulseiras e Braceletes');
INSERT INTO public.category VALUES (32, 'Relógios');
INSERT INTO public.category VALUES (33, 'Bolsas de Mão');
INSERT INTO public.category VALUES (34, 'Mochilas e Mochilas');
INSERT INTO public.category VALUES (35, 'Malas de Viagem');
INSERT INTO public.category VALUES (36, 'Bolsas de Ombro');
INSERT INTO public.category VALUES (37, 'Óculos de Sol Femininos');
INSERT INTO public.category VALUES (38, 'Óculos de Sol Masculinos');
INSERT INTO public.category VALUES (39, 'Óculos de Sol Esportivos');
INSERT INTO public.category VALUES (40, 'Óculos de Sol de Designer');
INSERT INTO public.category VALUES (41, 'Esteiras e Bicicletas Ergométricas');
INSERT INTO public.category VALUES (42, 'Pesos e Halteres');
INSERT INTO public.category VALUES (43, 'Acessórios para Treino');
INSERT INTO public.category VALUES (44, 'Equipamentos de Pilates e Yoga');
INSERT INTO public.category VALUES (45, 'Roupas de Academia');
INSERT INTO public.category VALUES (46, 'Roupas de Corrida');
INSERT INTO public.category VALUES (47, 'Roupas de Yoga');
INSERT INTO public.category VALUES (48, 'Roupas de Esportes Aquáticos');
INSERT INTO public.category VALUES (49, 'Suplementos Alimentares');
INSERT INTO public.category VALUES (50, 'Monitores de Frequência Cardíaca');
INSERT INTO public.category VALUES (51, 'Equipamentos de Fisioterapia');
INSERT INTO public.category VALUES (52, 'Produtos para Saúde Mental');
INSERT INTO public.category VALUES (53, 'Equipamentos de Camping');
INSERT INTO public.category VALUES (54, 'Equipamentos de Escalada');
INSERT INTO public.category VALUES (55, 'Equipamentos de Pesca');
INSERT INTO public.category VALUES (56, 'Equipamentos de Ciclismo');
INSERT INTO public.category VALUES (57, 'Massagadores e Aparelhos de Relaxamento');
INSERT INTO public.category VALUES (58, 'Aromaterapia');
INSERT INTO public.category VALUES (59, 'Máscaras de Dormir e Travesseiros');
INSERT INTO public.category VALUES (60, 'Smartphones');
INSERT INTO public.category VALUES (61, 'Tablets');
INSERT INTO public.category VALUES (62, 'Acessórios para Smartphones');
INSERT INTO public.category VALUES (63, 'Laptops e Notebooks');
INSERT INTO public.category VALUES (64, 'Desktops e All-in-One');
INSERT INTO public.category VALUES (65, 'Acessórios para Computadores');
INSERT INTO public.category VALUES (66, 'Cabos e Carregadores');
INSERT INTO public.category VALUES (67, 'Fones de Ouvido e Headsets');
INSERT INTO public.category VALUES (68, 'Capas e Cases');
INSERT INTO public.category VALUES (69, 'Assistente de Voz');
INSERT INTO public.category VALUES (70, 'Dispositivos de Casa Inteligente');
INSERT INTO public.category VALUES (71, 'Wearables (Dispositivos Vestíveis)');
INSERT INTO public.category VALUES (72, 'Fones de Ouvido');
INSERT INTO public.category VALUES (73, 'Caixas de Som Bluetooth');
INSERT INTO public.category VALUES (74, 'Home Theaters');
INSERT INTO public.category VALUES (75, 'Freios e Suspensão');
INSERT INTO public.category VALUES (76, 'Motor e Transmissão');
INSERT INTO public.category VALUES (77, 'Filtros e Fluidos');
INSERT INTO public.category VALUES (78, 'Tapetes e Capas');
INSERT INTO public.category VALUES (79, 'Racks e Bagageiros');
INSERT INTO public.category VALUES (80, 'Lanternas e Faróis');
INSERT INTO public.category VALUES (81, 'Ferramentas para Reparos');
INSERT INTO public.category VALUES (82, 'Equipamentos de Diagnóstico');
INSERT INTO public.category VALUES (83, 'Kits de Manutenção Básica');
INSERT INTO public.category VALUES (84, 'Sistemas de Som');
INSERT INTO public.category VALUES (85, 'Telas e DVDs Automotivos');
INSERT INTO public.category VALUES (86, 'Acessórios de Áudio');
INSERT INTO public.category VALUES (87, 'Chaves e Soquetes');
INSERT INTO public.category VALUES (88, 'Ferramentas Específicas');
INSERT INTO public.category VALUES (89, 'Macacos e Elevadores');
INSERT INTO public.category VALUES (90, 'Ração Seca');
INSERT INTO public.category VALUES (91, 'Ração Úmida');
INSERT INTO public.category VALUES (92, 'Petiscos');
INSERT INTO public.category VALUES (93, 'Coleiras e Peitorais');
INSERT INTO public.category VALUES (94, 'Guias e Correias');
INSERT INTO public.category VALUES (95, 'Brinquedos Interativos');
INSERT INTO public.category VALUES (96, 'Shampoos e Condicionadores');
INSERT INTO public.category VALUES (97, 'Escovas e Pentes');
INSERT INTO public.category VALUES (98, 'Produtos de Higiene Dental');
INSERT INTO public.category VALUES (99, 'Brinquedos de Pelúcia');
INSERT INTO public.category VALUES (100, 'Brinquedos para Mastigação');
INSERT INTO public.category VALUES (101, 'Brinquedos Intelectuais');
INSERT INTO public.category VALUES (102, 'Camas Acolchoadas');
INSERT INTO public.category VALUES (103, 'Casinhas e Toquinhas');
INSERT INTO public.category VALUES (104, 'Almofadas e Cobertores');


--
-- Data for Name: categorySector1; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."categorySector1" VALUES (1, 1, 1);
INSERT INTO public."categorySector1" VALUES (2, 2, 1);
INSERT INTO public."categorySector1" VALUES (3, 3, 1);
INSERT INTO public."categorySector1" VALUES (4, 4, 1);
INSERT INTO public."categorySector1" VALUES (5, 5, 2);
INSERT INTO public."categorySector1" VALUES (6, 6, 2);
INSERT INTO public."categorySector1" VALUES (7, 7, 2);
INSERT INTO public."categorySector1" VALUES (8, 8, 2);
INSERT INTO public."categorySector1" VALUES (9, 9, 3);
INSERT INTO public."categorySector1" VALUES (10, 10, 3);
INSERT INTO public."categorySector1" VALUES (11, 11, 3);
INSERT INTO public."categorySector1" VALUES (12, 12, 3);
INSERT INTO public."categorySector1" VALUES (13, 13, 4);
INSERT INTO public."categorySector1" VALUES (14, 14, 4);
INSERT INTO public."categorySector1" VALUES (15, 15, 4);
INSERT INTO public."categorySector1" VALUES (16, 16, 4);
INSERT INTO public."categorySector1" VALUES (17, 17, 5);
INSERT INTO public."categorySector1" VALUES (18, 18, 5);
INSERT INTO public."categorySector1" VALUES (19, 19, 5);
INSERT INTO public."categorySector1" VALUES (20, 20, 5);
INSERT INTO public."categorySector1" VALUES (21, 21, 6);
INSERT INTO public."categorySector1" VALUES (22, 22, 6);
INSERT INTO public."categorySector1" VALUES (23, 23, 6);
INSERT INTO public."categorySector1" VALUES (24, 24, 6);
INSERT INTO public."categorySector1" VALUES (25, 25, 7);
INSERT INTO public."categorySector1" VALUES (26, 26, 7);
INSERT INTO public."categorySector1" VALUES (27, 27, 7);
INSERT INTO public."categorySector1" VALUES (28, 28, 7);
INSERT INTO public."categorySector1" VALUES (29, 29, 8);
INSERT INTO public."categorySector1" VALUES (30, 30, 8);
INSERT INTO public."categorySector1" VALUES (31, 31, 8);
INSERT INTO public."categorySector1" VALUES (32, 32, 8);
INSERT INTO public."categorySector1" VALUES (33, 33, 9);
INSERT INTO public."categorySector1" VALUES (34, 34, 9);
INSERT INTO public."categorySector1" VALUES (35, 35, 9);
INSERT INTO public."categorySector1" VALUES (36, 36, 9);
INSERT INTO public."categorySector1" VALUES (37, 37, 10);
INSERT INTO public."categorySector1" VALUES (38, 38, 10);
INSERT INTO public."categorySector1" VALUES (39, 39, 10);
INSERT INTO public."categorySector1" VALUES (40, 40, 10);
INSERT INTO public."categorySector1" VALUES (41, 41, 11);
INSERT INTO public."categorySector1" VALUES (42, 42, 11);
INSERT INTO public."categorySector1" VALUES (43, 43, 11);
INSERT INTO public."categorySector1" VALUES (44, 44, 11);
INSERT INTO public."categorySector1" VALUES (45, 45, 12);
INSERT INTO public."categorySector1" VALUES (46, 46, 12);
INSERT INTO public."categorySector1" VALUES (47, 47, 12);
INSERT INTO public."categorySector1" VALUES (48, 48, 12);
INSERT INTO public."categorySector1" VALUES (49, 49, 13);
INSERT INTO public."categorySector1" VALUES (50, 50, 13);
INSERT INTO public."categorySector1" VALUES (51, 51, 13);
INSERT INTO public."categorySector1" VALUES (52, 52, 13);
INSERT INTO public."categorySector1" VALUES (53, 53, 14);
INSERT INTO public."categorySector1" VALUES (54, 54, 14);
INSERT INTO public."categorySector1" VALUES (55, 55, 14);
INSERT INTO public."categorySector1" VALUES (56, 56, 14);
INSERT INTO public."categorySector1" VALUES (57, 57, 15);
INSERT INTO public."categorySector1" VALUES (58, 58, 15);
INSERT INTO public."categorySector1" VALUES (59, 59, 15);
INSERT INTO public."categorySector1" VALUES (60, 60, 16);
INSERT INTO public."categorySector1" VALUES (61, 61, 16);
INSERT INTO public."categorySector1" VALUES (62, 62, 16);
INSERT INTO public."categorySector1" VALUES (63, 63, 17);
INSERT INTO public."categorySector1" VALUES (64, 64, 17);
INSERT INTO public."categorySector1" VALUES (65, 65, 17);
INSERT INTO public."categorySector1" VALUES (66, 66, 18);
INSERT INTO public."categorySector1" VALUES (67, 67, 18);
INSERT INTO public."categorySector1" VALUES (68, 68, 18);
INSERT INTO public."categorySector1" VALUES (69, 69, 19);
INSERT INTO public."categorySector1" VALUES (70, 70, 19);
INSERT INTO public."categorySector1" VALUES (71, 71, 19);
INSERT INTO public."categorySector1" VALUES (72, 72, 20);
INSERT INTO public."categorySector1" VALUES (73, 73, 20);
INSERT INTO public."categorySector1" VALUES (74, 74, 20);
INSERT INTO public."categorySector1" VALUES (75, 75, 21);
INSERT INTO public."categorySector1" VALUES (76, 76, 21);
INSERT INTO public."categorySector1" VALUES (77, 77, 21);
INSERT INTO public."categorySector1" VALUES (78, 78, 22);
INSERT INTO public."categorySector1" VALUES (79, 79, 22);
INSERT INTO public."categorySector1" VALUES (80, 80, 22);
INSERT INTO public."categorySector1" VALUES (81, 81, 23);
INSERT INTO public."categorySector1" VALUES (82, 82, 23);
INSERT INTO public."categorySector1" VALUES (83, 83, 23);
INSERT INTO public."categorySector1" VALUES (84, 84, 24);
INSERT INTO public."categorySector1" VALUES (85, 85, 24);
INSERT INTO public."categorySector1" VALUES (86, 86, 24);
INSERT INTO public."categorySector1" VALUES (87, 87, 25);
INSERT INTO public."categorySector1" VALUES (88, 88, 25);
INSERT INTO public."categorySector1" VALUES (89, 89, 25);
INSERT INTO public."categorySector1" VALUES (90, 90, 26);
INSERT INTO public."categorySector1" VALUES (91, 91, 26);
INSERT INTO public."categorySector1" VALUES (92, 92, 26);
INSERT INTO public."categorySector1" VALUES (93, 93, 27);
INSERT INTO public."categorySector1" VALUES (94, 94, 27);
INSERT INTO public."categorySector1" VALUES (95, 95, 27);
INSERT INTO public."categorySector1" VALUES (96, 96, 28);
INSERT INTO public."categorySector1" VALUES (97, 97, 28);
INSERT INTO public."categorySector1" VALUES (98, 98, 28);
INSERT INTO public."categorySector1" VALUES (99, 99, 29);
INSERT INTO public."categorySector1" VALUES (100, 100, 29);
INSERT INTO public."categorySector1" VALUES (101, 101, 29);
INSERT INTO public."categorySector1" VALUES (102, 102, 30);
INSERT INTO public."categorySector1" VALUES (103, 103, 30);
INSERT INTO public."categorySector1" VALUES (104, 104, 30);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.photos VALUES (5, 'https://m.media-amazon.com/images/I/61d48gnYXJL._AC_SL1004_.jpg', 8);


--
-- Data for Name: productCategory; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."productCategory" VALUES (8, 8, 32);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES (8, 'relogio de bolso', 'para maquinistas de trens', 30000, 1, true, '2023-08-14 03:02:04.338');


--
-- Data for Name: sector1; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sector1 VALUES (1, 'Decoração');
INSERT INTO public.sector1 VALUES (2, 'Móveis');
INSERT INTO public.sector1 VALUES (3, 'Utensílios Domésticos');
INSERT INTO public.sector1 VALUES (4, 'Organização');
INSERT INTO public.sector1 VALUES (5, 'Eletrodomésticos');
INSERT INTO public.sector1 VALUES (6, 'Roupas');
INSERT INTO public.sector1 VALUES (7, 'Calçados');
INSERT INTO public.sector1 VALUES (8, 'Joias');
INSERT INTO public.sector1 VALUES (9, 'Bolsas e Malas');
INSERT INTO public.sector1 VALUES (10, 'Óculos de Sol');
INSERT INTO public.sector1 VALUES (11, 'Equipamentos de Exercício');
INSERT INTO public.sector1 VALUES (12, 'Vestuário Esportivo');
INSERT INTO public.sector1 VALUES (13, 'Produtos de Saúde');
INSERT INTO public.sector1 VALUES (14, 'Atividades ao Ar Livre');
INSERT INTO public.sector1 VALUES (15, 'Produtos de Relaxamento');
INSERT INTO public.sector1 VALUES (16, 'Smartphones e Tablets');
INSERT INTO public.sector1 VALUES (17, 'Computadores e Laptops');
INSERT INTO public.sector1 VALUES (18, 'Acessórios Eletrônicos');
INSERT INTO public.sector1 VALUES (19, 'Dispositivos Inteligentes');
INSERT INTO public.sector1 VALUES (20, 'Equipamentos de Áudio');
INSERT INTO public.sector1 VALUES (21, 'Peças de Reposição');
INSERT INTO public.sector1 VALUES (22, 'Acessórios Automotivos');
INSERT INTO public.sector1 VALUES (23, 'Equipamentos de Manutenção');
INSERT INTO public.sector1 VALUES (24, 'Som e Entretenimento para Carros');
INSERT INTO public.sector1 VALUES (25, 'Ferramentas para Automóveis');
INSERT INTO public.sector1 VALUES (26, 'Alimentos para Animais');
INSERT INTO public.sector1 VALUES (27, 'Acessórios para Animais');
INSERT INTO public.sector1 VALUES (28, 'Produtos de Higiene e Cuidados');
INSERT INTO public.sector1 VALUES (29, 'Brinquedos para Animais');
INSERT INTO public.sector1 VALUES (30, 'Camas e Abrigos');


--
-- Data for Name: sector1sector2; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sector1sector2 VALUES (1, 1, 1);
INSERT INTO public.sector1sector2 VALUES (2, 2, 1);
INSERT INTO public.sector1sector2 VALUES (3, 3, 1);
INSERT INTO public.sector1sector2 VALUES (4, 4, 1);
INSERT INTO public.sector1sector2 VALUES (5, 5, 1);
INSERT INTO public.sector1sector2 VALUES (6, 6, 2);
INSERT INTO public.sector1sector2 VALUES (7, 7, 2);
INSERT INTO public.sector1sector2 VALUES (8, 8, 2);
INSERT INTO public.sector1sector2 VALUES (9, 9, 2);
INSERT INTO public.sector1sector2 VALUES (10, 10, 2);
INSERT INTO public.sector1sector2 VALUES (11, 11, 3);
INSERT INTO public.sector1sector2 VALUES (12, 12, 3);
INSERT INTO public.sector1sector2 VALUES (13, 13, 3);
INSERT INTO public.sector1sector2 VALUES (14, 14, 3);
INSERT INTO public.sector1sector2 VALUES (15, 15, 3);
INSERT INTO public.sector1sector2 VALUES (16, 16, 4);
INSERT INTO public.sector1sector2 VALUES (17, 17, 4);
INSERT INTO public.sector1sector2 VALUES (18, 18, 4);
INSERT INTO public.sector1sector2 VALUES (19, 19, 4);
INSERT INTO public.sector1sector2 VALUES (20, 20, 4);
INSERT INTO public.sector1sector2 VALUES (21, 21, 5);
INSERT INTO public.sector1sector2 VALUES (22, 22, 5);
INSERT INTO public.sector1sector2 VALUES (23, 23, 5);
INSERT INTO public.sector1sector2 VALUES (24, 24, 5);
INSERT INTO public.sector1sector2 VALUES (25, 25, 5);
INSERT INTO public.sector1sector2 VALUES (26, 26, 6);
INSERT INTO public.sector1sector2 VALUES (27, 27, 6);
INSERT INTO public.sector1sector2 VALUES (28, 28, 6);
INSERT INTO public.sector1sector2 VALUES (29, 29, 6);
INSERT INTO public.sector1sector2 VALUES (30, 30, 6);


--
-- Data for Name: sector2; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sector2 VALUES (1, 'Para Sua Casa');
INSERT INTO public.sector2 VALUES (2, 'Moda e Acessórios');
INSERT INTO public.sector2 VALUES (3, 'Esporte e Bem-Estar');
INSERT INTO public.sector2 VALUES (4, 'Eletro e Eletrônicos');
INSERT INTO public.sector2 VALUES (5, 'Para Automóveis');
INSERT INTO public.sector2 VALUES (6, 'Para Animais');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '20e0c514-b69a-422f-86f8-25af2dc01ff7', '2023-08-13 16:07:50.966024');
INSERT INTO public.sessions VALUES (2, 1, '40100b0b-832f-4ebd-93c7-3f45ce00b2de', '2023-08-13 22:53:36.716177');
INSERT INTO public.sessions VALUES (3, 1, '7af47a4e-b341-4b02-899b-64c207309369', '2023-08-14 00:13:28.277494');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'thiago', 'thiago@driven.com', '$2b$10$MUVq.E5fIXvhaeY.lLOQAOlwQx80LjABMo3fGwCWN.7WoXIWaY0HS', '12345678900', '86999198044', '2023-08-13 16:07:46.654455');


--
-- Name: categorySector1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."categorySector1_id_seq"', 104, true);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 104, true);


--
-- Name: photos_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.photos_temp_id_seq', 5, true);


--
-- Name: productCategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."productCategory_id_seq"', 8, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: sector1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sector1_id_seq', 30, true);


--
-- Name: sector1sector2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sector1sector2_id_seq', 30, true);


--
-- Name: sector2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sector2_id_seq', 6, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: categorySector1 categorySector1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."categorySector1"
    ADD CONSTRAINT "categorySector1_pkey" PRIMARY KEY (id);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: photos photos_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_temp_pkey PRIMARY KEY (id);


--
-- Name: productCategory productCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."productCategory"
    ADD CONSTRAINT "productCategory_pkey" PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sector1 sector1_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1
    ADD CONSTRAINT sector1_name_key UNIQUE (name);


--
-- Name: sector1 sector1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1
    ADD CONSTRAINT sector1_pkey PRIMARY KEY (id);


--
-- Name: sector1sector2 sector1sector2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1sector2
    ADD CONSTRAINT sector1sector2_pkey PRIMARY KEY (id);


--
-- Name: sector2 sector2_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector2
    ADD CONSTRAINT sector2_name_key UNIQUE (name);


--
-- Name: sector2 sector2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector2
    ADD CONSTRAINT sector2_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: categorySector1 categorySector1_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."categorySector1"
    ADD CONSTRAINT "categorySector1_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.category(id);


--
-- Name: categorySector1 categorySector1_sector1id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."categorySector1"
    ADD CONSTRAINT "categorySector1_sector1id_fkey" FOREIGN KEY (sector1id) REFERENCES public.sector1(id);


--
-- Name: photos photos_temp_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photos_temp_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: productCategory productCategory_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."productCategory"
    ADD CONSTRAINT "productCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.category(id);


--
-- Name: productCategory productCategory_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."productCategory"
    ADD CONSTRAINT "productCategory_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id);


--
-- Name: products products_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sector1sector2 sector1sector2_sector1id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1sector2
    ADD CONSTRAINT sector1sector2_sector1id_fkey FOREIGN KEY (sector1id) REFERENCES public.sector1(id);


--
-- Name: sector1sector2 sector1sector2_sector2id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sector1sector2
    ADD CONSTRAINT sector1sector2_sector2id_fkey FOREIGN KEY (sector2id) REFERENCES public.sector2(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

