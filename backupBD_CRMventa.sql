--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18
-- Dumped by pg_dump version 10.18

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
-- Name: DATABASE "CRMventa"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "CRMventa" IS 'BD aplicación para la gestión simple de un equipo de ventas';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Oportunidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Oportunidad" (
    id bigint NOT NULL,
    nombre character varying(300) NOT NULL,
    monto double precision NOT NULL,
    estado character varying(1) NOT NULL,
    contacto_id bigint,
    empresa_id bigint
);


ALTER TABLE public."Oportunidad" OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id bigint NOT NULL,
    nit integer NOT NULL,
    nom_cliente character varying(300) NOT NULL,
    nom_comercial_cliente character varying(300) NOT NULL,
    direccion character varying(300) NOT NULL,
    telefono integer NOT NULL,
    correo character varying(300) NOT NULL,
    web character varying(200) NOT NULL,
    empresa_id bigint,
    pais_id bigint,
    image character varying(100) NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- Name: cliente_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cliente_id_seq OWNER TO postgres;

--
-- Name: cliente_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: contacto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacto (
    id bigint NOT NULL,
    nombre character varying(300) NOT NULL,
    apellido character varying(300) NOT NULL,
    telefono integer NOT NULL,
    correo character varying(300) NOT NULL,
    celular integer NOT NULL,
    cliente_id bigint,
    image character varying(100) NOT NULL,
    usuario_contacto_id integer
);


ALTER TABLE public.contacto OWNER TO postgres;

--
-- Name: contacto_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacto_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacto_contacto_id_seq OWNER TO postgres;

--
-- Name: contacto_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacto_contacto_id_seq OWNED BY public.contacto.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id bigint NOT NULL,
    nit integer NOT NULL,
    nom_empresa character varying(300) NOT NULL,
    nom_comercial character varying(300) NOT NULL,
    direccion character varying(300) NOT NULL,
    telefono integer NOT NULL,
    correo character varying(150) NOT NULL,
    web character varying(200) NOT NULL,
    pais_id bigint,
    image character varying(100) NOT NULL,
    propietario_id integer
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- Name: empresa_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_empresa_id_seq OWNER TO postgres;

--
-- Name: empresa_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_empresa_id_seq OWNED BY public.empresa.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id bigint NOT NULL,
    nombre character varying(200) NOT NULL,
    pais_id bigint
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- Name: oportunidad_oportunidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oportunidad_oportunidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oportunidad_oportunidad_id_seq OWNER TO postgres;

--
-- Name: oportunidad_oportunidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oportunidad_oportunidad_id_seq OWNED BY public."Oportunidad".id;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pais (
    id bigint NOT NULL,
    nombre character varying(200) NOT NULL
);


ALTER TABLE public.pais OWNER TO postgres;

--
-- Name: pais_estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pais_estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_estado_id_seq OWNER TO postgres;

--
-- Name: pais_estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pais_estado_id_seq OWNED BY public.estado.id;


--
-- Name: pais_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pais_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_pais_id_seq OWNER TO postgres;

--
-- Name: pais_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pais_pais_id_seq OWNED BY public.pais.id;


--
-- Name: Oportunidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oportunidad" ALTER COLUMN id SET DEFAULT nextval('public.oportunidad_oportunidad_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_cliente_id_seq'::regclass);


--
-- Name: contacto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto ALTER COLUMN id SET DEFAULT nextval('public.contacto_contacto_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id SET DEFAULT nextval('public.empresa_empresa_id_seq'::regclass);


--
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.pais_estado_id_seq'::regclass);


--
-- Name: pais id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais ALTER COLUMN id SET DEFAULT nextval('public.pais_pais_id_seq'::regclass);


--
-- Data for Name: Oportunidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Oportunidad" (id, nombre, monto, estado, contacto_id, empresa_id) FROM stdin;
1	Oportunidad Mercadeo	6	p	1	2
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add empresa	7	add_empresa
26	Can change empresa	7	change_empresa
27	Can delete empresa	7	delete_empresa
28	Can view empresa	7	view_empresa
29	Can add cliente	8	add_cliente
30	Can change cliente	8	change_cliente
31	Can delete cliente	8	delete_cliente
32	Can view cliente	8	view_cliente
33	Can add contacto	9	add_contacto
34	Can change contacto	9	change_contacto
35	Can delete contacto	9	delete_contacto
36	Can view contacto	9	view_contacto
37	Can add oportunidad	10	add_oportunidad
38	Can change oportunidad	10	change_oportunidad
39	Can delete oportunidad	10	delete_oportunidad
40	Can view oportunidad	10	view_oportunidad
41	Can add pais	11	add_pais
42	Can change pais	11	change_pais
43	Can delete pais	11	delete_pais
44	Can view pais	11	view_pais
45	Can add estado	12	add_estado
46	Can change estado	12	change_estado
47	Can delete estado	12	delete_estado
48	Can view estado	12	view_estado
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$260000$oKTcRTIm73991saaV6rCzl$ucaLGEM5LPrJrnWwBM3mhfr8hTvo/w32xEesCMaHaro=	2021-10-09 18:41:18.474984-05	f	mperez1990				f	t	2021-10-09 16:53:36.250626-05
2	pbkdf2_sha256$260000$pkqXhLbPjUTj7bJSdijuLR$whqhlLBhcKif+Mal2DCPbbj4Wk27nAKL/q6Kal/FL5Q=	2021-10-10 16:32:15.639841-05	f	lgonzalez				f	t	2021-10-09 16:48:32.347997-05
7	pbkdf2_sha256$260000$0yfvvJMX9vZgJIqoh5HPT5$/S2SNUisOiPbs/FjDMAm9N+7EsV6OLu0w/fHnTalo2Y=	2021-10-11 17:42:42.811824-05	f	lucho_vaca				f	t	2021-10-11 17:42:42.491233-05
8	pbkdf2_sha256$260000$mHVba8lkQYOwfovPKsVcRk$ESAT1qs81wzla7sC+G5ntXxtmM8ENQ8zNZpRnpFCczY=	2021-10-11 17:44:58.499409-05	f	tigreOchoa				f	t	2021-10-11 17:44:58.165983-05
9	pbkdf2_sha256$260000$qG22gCK835bRlcJ5WCTPUD$887RBHMcWbKwqmHZIW6C+EY8siR1rpD+GwhsHy5p49M=	2021-10-11 17:46:10.541118-05	f	miranda90				f	t	2021-10-11 17:46:10.218196-05
6	pbkdf2_sha256$260000$S7Vgkjx45XtsL5zDTaqDgm$PZXpgUbu8LG3Nq2YWNqxfOVBvyAntNLU1xTP4DE8eRQ=	2021-10-11 22:11:43.291701-05	f	danyPerea				f	t	2021-10-11 17:40:49.388209-05
1	pbkdf2_sha256$260000$0WbZIK8D905J6d9WBOm2eH$bUG/Nks9Ss1uS5cb7SCWLm2tUIFXH4qdbgDCYpCnd7U=	2021-10-11 22:26:41.126434-05	f	jmarulanda				f	t	2021-10-09 16:41:57.011473-05
4	pbkdf2_sha256$260000$MjakyWVilWnNkA39ZY7ekb$Ciew65JEcRdRQyklTJoQJkUA7qeUeMMg7F2OvXdZVuk=	2021-10-11 22:43:39.313697-05	f	marcela28				f	t	2021-10-09 17:35:22.238316-05
5	pbkdf2_sha256$260000$RevRnmHB6Gpw9GJtlXMjwK$aMauo8kEYiRP9eAK/KTg0kqyPyg/PnE4yhv7Elky8Rg=	2021-10-11 22:46:21.354223-05	t	adminCRM			jhonmaruloo2012@gmail.com	t	t	2021-10-10 15:20:51.569595-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, nit, nom_cliente, nom_comercial_cliente, direccion, telefono, correo, web, empresa_id, pais_id, image) FROM stdin;
1	345189000	Juan Valdez	Juan Valdez cafe	Carrerra 129 # 56-99	3345671	juanvaldezcafe@gmail.com	https://www.juanvaldezcafe.com/	1	82	cliente/56bb5bb322d90.gif
\.


--
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacto (id, nombre, apellido, telefono, correo, celular, cliente_id, image, usuario_contacto_id) FROM stdin;
1	Marcela Andrea	Perez Diaz	3345129	marcediaz@gmail.com	300123456	1	contacto/descarga_2.png	4
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-10 18:33:47.931383-05	3	ffff	1	[{"added": {}}]	7	5
2	2021-10-10 20:19:48.388249-05	1	jmarulanda	2	[{"changed": {"fields": ["password"]}}]	4	5
3	2021-10-11 13:16:55.366428-05	1	zzzzzzzzzzz	2	[{"changed": {"fields": ["Image"]}}]	8	5
4	2021-10-11 13:27:32.001335-05	1	ttttttttt	2	[{"changed": {"fields": ["Image"]}}]	9	5
5	2021-10-11 18:06:34.410593-05	1	Alpina	2	[{"changed": {"fields": ["Nit", "Nom empresa", "Nom comercial", "Direccion", "Telefono", "Correo", "Web", "Pais", "Image"]}}]	7	5
6	2021-10-11 18:06:44.825561-05	1	Alpina	2	[{"changed": {"fields": ["Image"]}}]	7	5
7	2021-10-11 18:08:20.037028-05	1	Alpina	2	[{"changed": {"fields": ["Propietario"]}}]	7	5
8	2021-10-11 18:45:57.491393-05	2	ty	2	[{"changed": {"fields": ["Image"]}}]	7	5
9	2021-10-11 18:48:28.451863-05	2	Bimbo	2	[{"changed": {"fields": ["Nom empresa", "Nom comercial", "Direccion", "Telefono", "Correo", "Web", "Image"]}}]	7	5
10	2021-10-11 18:49:25.954187-05	3	ffff	2	[{"changed": {"fields": ["Image"]}}]	7	5
11	2021-10-11 18:50:04.141191-05	4	xxxxx	2	[{"changed": {"fields": ["Image"]}}]	7	5
12	2021-10-11 18:53:16.626433-05	3	Producto Postobon	2	[{"changed": {"fields": ["Nit", "Nom empresa", "Nom comercial", "Direccion", "Telefono", "Correo", "Web", "Image"]}}]	7	5
13	2021-10-11 18:53:41.001052-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
14	2021-10-11 18:53:48.839475-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
15	2021-10-11 18:54:23.193508-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
16	2021-10-11 18:54:34.512379-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
17	2021-10-11 18:55:43.273141-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
18	2021-10-11 18:55:54.279905-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
19	2021-10-11 18:56:49.855296-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
20	2021-10-11 18:56:57.890978-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
21	2021-10-11 18:57:15.396327-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
22	2021-10-11 19:46:02.516803-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
23	2021-10-11 19:46:14.763717-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
24	2021-10-11 19:47:34.366318-05	1	opor1	2	[{"changed": {"fields": ["Empresa"]}}]	10	5
25	2021-10-11 19:47:56.378691-05	1	opor1	2	[{"changed": {"fields": ["Empresa"]}}]	10	5
26	2021-10-11 19:50:12.281386-05	2	Bimbo	2	[{"changed": {"fields": ["Propietario"]}}]	7	5
27	2021-10-11 19:50:31.114906-05	3	Producto Postobon	2	[{"changed": {"fields": ["Propietario"]}}]	7	5
28	2021-10-11 19:52:59.079076-05	1	opor1	2	[{"changed": {"fields": ["Empresa"]}}]	10	5
29	2021-10-11 19:53:07.514524-05	4	xxxxx	3		7	5
30	2021-10-11 19:54:40.672624-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
31	2021-10-11 19:54:49.169139-05	3	Producto Postobon	2	[{"changed": {"fields": ["Image"]}}]	7	5
32	2021-10-11 19:58:24.545748-05	1	Juan Valdez	2	[{"changed": {"fields": ["Nom cliente", "Nom comercial cliente", "Direccion", "Telefono", "Correo", "Web", "Pais"]}}]	8	5
33	2021-10-11 19:59:52.070751-05	1	Juan Valdez	2	[{"changed": {"fields": ["Nit"]}}]	8	5
34	2021-10-11 20:03:40.683204-05	1	Marcela Andrea Perez Diaz	2	[{"changed": {"fields": ["Nombre", "Apellido", "Telefono", "Correo", "Celular"]}}]	9	5
35	2021-10-11 20:04:05.459073-05	1	Marcela Andrea Perez Diaz	2	[{"changed": {"fields": ["Celular"]}}]	9	5
36	2021-10-11 20:05:05.473831-05	1	Oportunidad Mercadeo	2	[{"changed": {"fields": ["Nombre"]}}]	10	5
37	2021-10-11 22:32:44.770835-05	1	Marcela Andrea Perez Diaz	2	[{"changed": {"fields": ["Usuario contacto"]}}]	9	5
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	empresa	empresa
8	cliente	cliente
9	contacto	contacto
10	oportunidad	oportunidad
11	pais	pais
12	pais	estado
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-09 15:36:40.45873-05
2	auth	0001_initial	2021-10-09 15:36:40.598566-05
3	admin	0001_initial	2021-10-09 15:36:40.62864-05
4	admin	0002_logentry_remove_auto_add	2021-10-09 15:36:40.638547-05
5	admin	0003_logentry_add_action_flag_choices	2021-10-09 15:36:40.64854-05
6	contenttypes	0002_remove_content_type_name	2021-10-09 15:36:40.673708-05
7	auth	0002_alter_permission_name_max_length	2021-10-09 15:36:40.683733-05
8	auth	0003_alter_user_email_max_length	2021-10-09 15:36:40.688768-05
9	auth	0004_alter_user_username_opts	2021-10-09 15:36:40.698671-05
10	auth	0005_alter_user_last_login_null	2021-10-09 15:36:40.718623-05
11	auth	0006_require_contenttypes_0002	2021-10-09 15:36:40.718623-05
12	auth	0007_alter_validators_add_error_messages	2021-10-09 15:36:40.728564-05
13	auth	0008_alter_user_username_max_length	2021-10-09 15:36:40.748559-05
14	auth	0009_alter_user_last_name_max_length	2021-10-09 15:36:40.758427-05
15	auth	0010_alter_group_name_max_length	2021-10-09 15:36:40.768614-05
16	auth	0011_update_proxy_permissions	2021-10-09 15:36:40.778725-05
17	auth	0012_alter_user_first_name_max_length	2021-10-09 15:36:40.793596-05
18	sessions	0001_initial	2021-10-09 15:36:40.815792-05
19	pais	0001_initial	2021-10-10 13:22:57.412895-05
20	empresa	0001_initial	2021-10-10 13:22:57.459766-05
21	cliente	0001_initial	2021-10-10 13:22:57.506639-05
22	contacto	0001_initial	2021-10-10 13:22:57.537889-05
23	oportunidad	0001_initial	2021-10-10 13:22:57.569139-05
24	cliente	0002_auto_20211010_1455	2021-10-10 14:55:43.36386-05
25	contacto	0002_auto_20211010_1455	2021-10-10 14:55:43.379487-05
26	empresa	0002_auto_20211010_1455	2021-10-10 14:55:43.457611-05
27	oportunidad	0002_auto_20211010_1455	2021-10-10 14:55:43.488855-05
28	pais	0002_auto_20211010_1455	2021-10-10 14:55:43.504481-05
29	empresa	0003_auto_20211010_1810	2021-10-10 18:19:20.020699-05
30	empresa	0004_auto_20211010_1905	2021-10-10 19:05:19.205608-05
31	empresa	0005_auto_20211010_1914	2021-10-10 19:14:16.613103-05
32	empresa	0006_auto_20211010_1921	2021-10-10 19:21:52.32658-05
33	empresa	0007_auto_20211010_1948	2021-10-10 19:48:34.523688-05
34	empresa	0008_auto_20211010_1949	2021-10-10 19:49:25.367765-05
35	cliente	0003_cliente_image	2021-10-11 12:36:13.731237-05
36	contacto	0003_contacto_image	2021-10-11 12:36:13.772752-05
37	contacto	0004_contacto_usuario_contacto	2021-10-11 22:30:50.084166-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qkgso0feu0flsvts09c5vacn1oawy0wn	.eJxVjEEOwiAURO_C2hAKHwSX7nsGwueDVA0kpV0Z764kXehqknlv5sV82Lfi955WvxC7MM1Ovx2G-Eh1ALqHems8trqtC_Kh8IN2PjdKz-vh_h2U0MtYC-MmmRPmsxVOUNQ5EUQXQKLAKUIWSqI1Boy0SmqXvwgIRhgFkb0_6wI3rA:1ma8k9:XAoyTn3yxPMtYCvj3R3mhtegF6_3GMfBYj8ig2k7Djc	2021-10-25 22:46:21.35619-05
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (id, nit, nom_empresa, nom_comercial, direccion, telefono, correo, web, pais_id, image, propietario_id) FROM stdin;
2	1	Bimbo S.A.S	Bimbo	Calle 13 # 09-123	3345678	grupobimbo@hotmail.com	https://www.grupobimbo.com	5	empresa/bimbo_logo.jpg	6
3	23456123	Postobon S.A	Producto Postobon	Carrerra 123 # 56-9	3451237	postobon@gmail.com	https://www.postobon.com/	11	empresa/logo_post-278x300.png	2
1	9256781	Alpina S.A	Alpina	Cr 45 # 25-11	3345678	alpina@gmail.com	https://www.alpina.com/	82	empresa/images.jfif	1
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estado (id, nombre, pais_id) FROM stdin;
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pais (id, nombre) FROM stdin;
1	Australia
2	Austria
3	Azerbaiyán
4	Anguilla
5	Argentina
6	Armenia
7	Bielorrusia
8	Belice
9	Bélgica
10	Bermudas
11	Bulgaria
12	Brasil
13	Reino Unido
14	Hungría
15	Vietnam
16	Haiti
17	Guadalupe
18	Alemania
19	Países Bajos, Holanda
20	Grecia
21	Georgia
22	Dinamarca
23	Egipto
24	Israel
25	India
26	Irán
27	Irlanda
28	España
29	Italia
30	Kazajstán
31	Camerún
32	Canadá
33	Chipre
34	Kirguistán
35	China
36	Costa Rica
37	Kuwait
38	Letonia
39	Libia
40	Lituania
41	Luxemburgo
42	México
43	Moldavia
44	Mónaco
45	Nueva Zelanda
46	Noruega
47	Polonia
48	Portugal
49	Reunión
50	Rusia
51	El Salvador
52	Eslovaquia
53	Eslovenia
54	Surinam
55	Estados Unidos
56	Tadjikistan
57	Turkmenistan
58	Islas Turcas y Caicos
59	Turquía
60	Uganda
61	Uzbekistán
62	Ucrania
63	Finlandia
64	Francia
65	República Checa
66	Suiza
67	Suecia
68	Estonia
69	Corea del Sur
70	Japón
71	Croacia
72	Rumanía
73	Hong Kong
74	Indonesia
75	Jordania
76	Malasia
77	Singapur
78	Taiwan
79	Bosnia y Herzegovina
80	Bahamas
81	Chile
82	Colombia
83	Islandia
84	Corea del Norte
85	Macedonia
86	Malta
87	Pakistán
88	Papúa-Nueva Guinea
89	Perú
90	Filipinas
91	Arabia Saudita
92	Tailandia
93	Emiratos árabes Unidos
94	Groenlandia
95	Venezuela
96	Zimbabwe
97	Kenia
98	Algeria
99	Líbano
100	Botsuana
101	Tanzania
102	Namibia
103	Ecuador
104	Marruecos
105	Ghana
106	Siria
107	Nepal
108	Mauritania
109	Seychelles
110	Paraguay
111	Uruguay
112	Congo (Brazzaville)
113	Cuba
114	Albania
115	Nigeria
116	Zambia
117	Mozambique
119	Angola
120	Sri Lanka
121	Etiopía
122	Túnez
123	Bolivia
124	Panamá
125	Malawi
126	Liechtenstein
127	Bahrein
128	Barbados
130	Chad
131	Man, Isla de
132	Jamaica
133	Malí
134	Madagascar
135	Senegal
136	Togo
137	Honduras
138	República Dominicana
139	Mongolia
140	Irak
141	Sudáfrica
142	Aruba
143	Gibraltar
144	Afganistán
145	Andorra
147	Antigua y Barbuda
149	Bangladesh
151	Benín
152	Bután
154	Islas Virgenes Británicas
155	Brunéi
156	Burkina Faso
157	Burundi
158	Camboya
159	Cabo Verde
164	Comores
165	Congo (Kinshasa)
166	Cook, Islas
168	Costa de Marfil
169	Djibouti, Yibuti
171	Timor Oriental
172	Guinea Ecuatorial
173	Eritrea
175	Feroe, Islas
176	Fiyi
178	Polinesia Francesa
180	Gabón
181	Gambia
184	Granada
185	Guatemala
186	Guernsey
187	Guinea
188	Guinea-Bissau
189	Guyana
193	Jersey
195	Kiribati
196	Laos
197	Lesotho
198	Liberia
200	Maldivas
201	Martinica
202	Mauricio
205	Myanmar
206	Nauru
207	Antillas Holandesas
208	Nueva Caledonia
209	Nicaragua
210	Níger
212	Norfolk Island
213	Omán
215	Isla Pitcairn
216	Qatar
217	Ruanda
218	Santa Elena
219	San Cristobal y Nevis
220	Santa Lucía
221	San Pedro y Miquelón
222	San Vincente y Granadinas
223	Samoa
224	San Marino
225	San Tomé y Príncipe
226	Serbia y Montenegro
227	Sierra Leona
228	Islas Salomón
229	Somalia
232	Sudán
234	Swazilandia
235	Tokelau
236	Tonga
237	Trinidad y Tobago
239	Tuvalu
240	Vanuatu
241	Wallis y Futuna
242	Sáhara Occidental
243	Yemen
246	Puerto Rico
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 9, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cliente_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cliente_id_seq', 1, true);


--
-- Name: contacto_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacto_contacto_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 37, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- Name: empresa_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_empresa_id_seq', 4, true);


--
-- Name: oportunidad_oportunidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oportunidad_oportunidad_id_seq', 1, true);


--
-- Name: pais_estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pais_estado_id_seq', 1, false);


--
-- Name: pais_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pais_pais_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cliente cliente_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cliente_pkey PRIMARY KEY (id);


--
-- Name: contacto contacto_contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_contacto_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: empresa empresa_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_empresa_pkey PRIMARY KEY (id);


--
-- Name: Oportunidad oportunidad_oportunidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oportunidad"
    ADD CONSTRAINT oportunidad_oportunidad_pkey PRIMARY KEY (id);


--
-- Name: estado pais_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT pais_estado_pkey PRIMARY KEY (id);


--
-- Name: pais pais_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pais_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cliente_cliente_empresa_id_25db0031; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cliente_cliente_empresa_id_25db0031 ON public.cliente USING btree (empresa_id);


--
-- Name: cliente_cliente_pais_id_e586654a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cliente_cliente_pais_id_e586654a ON public.cliente USING btree (pais_id);


--
-- Name: contacto_contacto_cliente_id_e5c8b095; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacto_contacto_cliente_id_e5c8b095 ON public.contacto USING btree (cliente_id);


--
-- Name: contacto_usuario_contacto_id_aec0c59e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacto_usuario_contacto_id_aec0c59e ON public.contacto USING btree (usuario_contacto_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: empresa_empresa_pais_id_ea240691; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX empresa_empresa_pais_id_ea240691 ON public.empresa USING btree (pais_id);


--
-- Name: empresa_propietario_id_b8e1224d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX empresa_propietario_id_b8e1224d ON public.empresa USING btree (propietario_id);


--
-- Name: oportunidad_oportunidad_contacto_id_293737dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oportunidad_oportunidad_contacto_id_293737dc ON public."Oportunidad" USING btree (contacto_id);


--
-- Name: oportunidad_oportunidad_empresa_id_a1a809d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oportunidad_oportunidad_empresa_id_a1a809d2 ON public."Oportunidad" USING btree (empresa_id);


--
-- Name: pais_estado_pais_id_df5d6a2b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pais_estado_pais_id_df5d6a2b ON public.estado USING btree (pais_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cliente cliente_cliente_empresa_id_25db0031_fk_empresa_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cliente_empresa_id_25db0031_fk_empresa_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cliente cliente_cliente_pais_id_e586654a_fk_pais_pais_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cliente_pais_id_e586654a_fk_pais_pais_id FOREIGN KEY (pais_id) REFERENCES public.pais(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacto contacto_contacto_cliente_id_e5c8b095_fk_cliente_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_contacto_cliente_id_e5c8b095_fk_cliente_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacto contacto_usuario_contacto_id_aec0c59e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_usuario_contacto_id_aec0c59e_fk_auth_user_id FOREIGN KEY (usuario_contacto_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: empresa empresa_empresa_pais_id_ea240691_fk_pais_pais_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_empresa_pais_id_ea240691_fk_pais_pais_id FOREIGN KEY (pais_id) REFERENCES public.pais(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: empresa empresa_propietario_id_b8e1224d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_propietario_id_b8e1224d_fk_auth_user_id FOREIGN KEY (propietario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Oportunidad oportunidad_oportuni_contacto_id_293737dc_fk_contacto_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oportunidad"
    ADD CONSTRAINT oportunidad_oportuni_contacto_id_293737dc_fk_contacto_ FOREIGN KEY (contacto_id) REFERENCES public.contacto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Oportunidad oportunidad_oportuni_empresa_id_a1a809d2_fk_empresa_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Oportunidad"
    ADD CONSTRAINT oportunidad_oportuni_empresa_id_a1a809d2_fk_empresa_e FOREIGN KEY (empresa_id) REFERENCES public.empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: estado pais_estado_pais_id_df5d6a2b_fk_pais_pais_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT pais_estado_pais_id_df5d6a2b_fk_pais_pais_id FOREIGN KEY (pais_id) REFERENCES public.pais(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

