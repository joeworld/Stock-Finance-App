--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-10-01 18:04:42

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

DROP DATABASE stock_trading;
--
-- TOC entry 2999 (class 1262 OID 16574)
-- Name: stock_trading; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE stock_trading WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE stock_trading OWNER TO postgres;

\connect stock_trading

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

SET default_with_oids = false;

--
-- TOC entry 222 (class 1259 OID 24578)
-- Name: api_apikeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_apikeys (
    id integer NOT NULL,
    public_key text NOT NULL,
    secret_key text NOT NULL
);


ALTER TABLE public.api_apikeys OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24576)
-- Name: api_apikeys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_apikeys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_apikeys_id_seq OWNER TO postgres;

--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 221
-- Name: api_apikeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_apikeys_id_seq OWNED BY public.api_apikeys.id;


--
-- TOC entry 218 (class 1259 OID 16776)
-- Name: app_usermodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_usermodel (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    transaction_id bigint NOT NULL,
    summary text NOT NULL,
    wallet bigint NOT NULL
);


ALTER TABLE public.app_usermodel OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16774)
-- Name: app_usermodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_usermodel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usermodel_id_seq OWNER TO postgres;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_usermodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_usermodel_id_seq OWNED BY public.app_usermodel.id;


--
-- TOC entry 220 (class 1259 OID 16787)
-- Name: app_userstock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_userstock (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    stock_symbol character varying(100) NOT NULL,
    created date NOT NULL
);


ALTER TABLE public.app_userstock OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16785)
-- Name: app_userstock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_userstock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_userstock_id_seq OWNER TO postgres;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 219
-- Name: app_userstock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_userstock_id_seq OWNED BY public.app_userstock.id;


--
-- TOC entry 215 (class 1259 OID 16726)
-- Name: app_usertransaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_usertransaction (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    transaction_id bigint NOT NULL,
    summary text NOT NULL,
    created date NOT NULL
);


ALTER TABLE public.app_usertransaction OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16724)
-- Name: app_usertransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_usertransaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usertransaction_id_seq OWNER TO postgres;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 214
-- Name: app_usertransaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_usertransaction_id_seq OWNED BY public.app_usertransaction.id;


--
-- TOC entry 203 (class 1259 OID 16606)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16604)
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
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 16616)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16614)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 16598)
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
-- TOC entry 200 (class 1259 OID 16596)
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
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 16624)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16634)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16632)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 16622)
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
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 16642)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16640)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 213 (class 1259 OID 16702)
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
-- TOC entry 212 (class 1259 OID 16700)
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
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 16588)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16586)
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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 16577)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16575)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 216 (class 1259 OID 16744)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2781 (class 2604 OID 24581)
-- Name: api_apikeys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_apikeys ALTER COLUMN id SET DEFAULT nextval('public.api_apikeys_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 16779)
-- Name: app_usermodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usermodel ALTER COLUMN id SET DEFAULT nextval('public.app_usermodel_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 16790)
-- Name: app_userstock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_userstock ALTER COLUMN id SET DEFAULT nextval('public.app_userstock_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 16729)
-- Name: app_usertransaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usertransaction ALTER COLUMN id SET DEFAULT nextval('public.app_usertransaction_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 16609)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 16619)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 16601)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 16627)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 16637)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 16645)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 16705)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 16591)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 16580)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2993 (class 0 OID 24578)
-- Dependencies: 222
-- Data for Name: api_apikeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.api_apikeys (id, public_key, secret_key) VALUES (1, 'pk_67gt454543e3s542677898678grfrytty', 'sk_675767gff5r65554645reyt456455f4f5');
INSERT INTO public.api_apikeys (id, public_key, secret_key) VALUES (2, 'pk_65555544664d5r546g554t65677', 'sk_67767665t5y67g556t565654544');
INSERT INTO public.api_apikeys (id, public_key, secret_key) VALUES (3, 'pk_5666576defetrf4e4453d6576', 'sk_6765fr554ef33342332467678');


--
-- TOC entry 2989 (class 0 OID 16776)
-- Dependencies: 218
-- Data for Name: app_usermodel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_usermodel (id, user_id, transaction_id, summary, wallet) VALUES (3, 1, 2, 'Your wallet was updated after purchasing (Associated Capital Group, Inc.) 2019-09-30 22:17:21.933481', 254);
INSERT INTO public.app_usermodel (id, user_id, transaction_id, summary, wallet) VALUES (5, 8, 2, 'Wallet created at 2019-09-29 23:21:41.783889', 2000);
INSERT INTO public.app_usermodel (id, user_id, transaction_id, summary, wallet) VALUES (9, 9, 2, 'Wallet created at 2019-09-29 23:36:18.132579', 2000);
INSERT INTO public.app_usermodel (id, user_id, transaction_id, summary, wallet) VALUES (8, 5, 2, 'Wallet updated at 2019-09-30 04:00:18.861825', 0);


--
-- TOC entry 2991 (class 0 OID 16787)
-- Dependencies: 220
-- Data for Name: app_userstock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (1, 1, 'se', '2019-09-29');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (2, 1, 'ACAM', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (3, 1, 'Y', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (4, 1, 'JT', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (5, 1, 'H', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (6, 1, 'BK', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (9, 1, 'SAM', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (10, 5, 'AB', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (12, 4, 'EE', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (11, 9, 'RE', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (13, 1, 'acam', '2019-09-30');
INSERT INTO public.app_userstock (id, user_id, stock_symbol, created) VALUES (14, 2, 'ac', '2019-09-30');


--
-- TOC entry 2986 (class 0 OID 16726)
-- Dependencies: 215
-- Data for Name: app_usertransaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (14, 1, 3, 'Wallet updated at 29th September 2019 17:28', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (15, 1, 3, 'Wallet updated at 29th September 2019 19:43', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (16, 8, 3, 'Wallet updated at 29th September 2019 22:18', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (17, 8, 3, 'Wallet updated at 29th September 2019 22:18', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (18, 5, 3, 'Wallet updated at 29th September 2019 22:22', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (19, 5, 3, 'Wallet updated at 29th September 2019 22:25', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (20, 5, 3, 'Wallet updated at 29th September 2019 22:35', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (21, 9, 3, 'Wallet updated at 29th September 2019 22:36', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (22, 9, 3, 'Wallet updated at 29th September 2019 22:36', '2019-09-29');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (23, 1, 5, 'Your wallet was updated after purchasing BK ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (24, 1, 5, 'Your wallet was updated after purchasing (Boston Beer Co., Inc.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (25, 1, 3, 'Wallet updated at 30th September 2019 00:36', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (26, 5, 5, 'Your wallet was updated after purchasing (AllianceBernstein Holding LP) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (27, 5, 3, 'Wallet updated at 30th September 2019 00:44', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (28, 5, 5, 'Your wallet was updated after purchasing (Everest Re Group Ltd.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (29, 5, 5, 'Your wallet was updated after purchasing (Everest Re Group Ltd.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (30, 5, 5, 'Your wallet was updated after purchasing (Everest Re Group Ltd.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (31, 5, 5, 'Your wallet was updated after purchasing (El Paso Electric Co.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (32, 5, 6, 'You sold your stock El Paso Electric Co. to toyin', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (33, 4, 6, 'You got a stock (El Paso Electric Co.) from rachel', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (34, 5, 6, 'You sold your stock Everest Re Group Ltd. to newtest', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (35, 9, 6, 'You got a stock (Everest Re Group Ltd.) from rachel', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (36, 5, 3, 'Wallet updated at 30th September 2019 02:56', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (37, 5, 3, 'Wallet updated at 30th September 2019 03:00', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (38, 1, 3, 'Wallet was updated at 2019-09-30 19:33:23.962644', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (39, 1, 5, 'Your wallet was updated after purchasing (Acamar Partners Acquisition Corp.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (40, 1, 5, 'Your wallet was updated after purchasing (Associated Capital Group, Inc.) ', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (41, 1, 6, 'You sold your stock Associated Capital Group, Inc. to princess', '2019-09-30');
INSERT INTO public.app_usertransaction (id, user_id, transaction_id, summary, created) VALUES (42, 2, 6, 'You got a stock (Associated Capital Group, Inc.) from joseph', '2019-09-30');


--
-- TOC entry 2974 (class 0 OID 16606)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2976 (class 0 OID 16616)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2972 (class 0 OID 16598)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add user transaction', 7, 'add_usertransaction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change user transaction', 7, 'change_usertransaction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete user transaction', 7, 'delete_usertransaction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view user transaction', 7, 'view_usertransaction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add user model', 8, 'add_usermodel');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change user model', 8, 'change_usermodel');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete user model', 8, 'delete_usermodel');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view user model', 8, 'view_usermodel');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add user stock', 9, 'add_userstock');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change user stock', 9, 'change_userstock');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete user stock', 9, 'delete_userstock');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view user stock', 9, 'view_userstock');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add api keys', 10, 'add_apikeys');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change api keys', 10, 'change_apikeys');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete api keys', 10, 'delete_apikeys');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view api keys', 10, 'view_apikeys');


--
-- TOC entry 2978 (class 0 OID 16624)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (9, 'pbkdf2_sha256$150000$SGevyM0K3sWe$P7V8EL2XiAoYTc343wGCvyrKHZfe8vOnfX+w4zdkBNw=', '2019-09-29 22:36:43.331567+00', false, 'newtest', '', '', 'newtest@gmail.com', false, true, '2019-09-29 22:35:55.886284+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$150000$vICehjBm8JWK$Sm8pwChHLXJ+btqAb66Gyqxun58bUbeFrRBULxHehOo=', NULL, false, 'princess', '', '', 'akaninyeneprincess@gmail.com', false, true, '2019-09-28 07:04:37.419417+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$150000$yprSGr2Gqagt$dM/WFyO1biJaXapP/k26Uy8MFLy3Aw9A0tDZ1iIqI9s=', NULL, false, 'toyin', '', '', 'toyinojo@gmail.com', false, true, '2019-09-28 07:06:02.195856+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (6, 'pbkdf2_sha256$150000$5d127L8IJ0e2$gmFbJ0mCEAinUXBjliMrMl/FHxV3IGGJ1enH4Aak73U=', NULL, false, 'joshua', '', '', 'joshua@iamjoestack.com', false, true, '2019-09-28 09:03:57.626891+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (7, 'pbkdf2_sha256$150000$JfmshUjDQlaF$pV/Ilrwm+rbSPIJWZR7Nui5xy0HQRyi+7AVpvAaQaHI=', NULL, false, 'new_user', '', '', 'new_user@example.com', false, true, '2019-09-28 11:03:59.637284+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (5, 'pbkdf2_sha256$150000$zzmJhp1a4sFK$TQHWja9nJhfj328tMG5KjAinny5sL0U2ASDDqh30dDo=', '2019-09-30 01:51:26.995003+00', false, 'rachel', '', '', 'rachel@iamjoestack.com', false, true, '2019-09-28 09:03:10.387298+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (14, 'pbkdf2_sha256$150000$5F0pnxhOnt9K$4x0v2/oBVSzS9HOfi+rptm4U64gcRA2/MOvum1IXLIw=', NULL, false, 'daisy', '', '', 'daisy@gmail.com', false, true, '2019-09-30 14:40:51.141585+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (15, 'pbkdf2_sha256$150000$ZGHhsFMa7XPr$ov8OBFRda0eTWH3XlqlUWEFU/7yh9L6fMs/OcmKI7us=', NULL, false, 'daisy_oop', '', '', 'daisy_oop@gmail.com', false, true, '2019-09-30 17:04:47.76372+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (8, 'pbkdf2_sha256$150000$C91VtQVtXo1q$6AD5eSukRrlSAHoj4bxhPyL3cWnbzgq3S34WINWqUyI=', '2019-09-29 22:10:09.39468+00', false, 'joshua119', '', '', 'joshua119@iamjoestack.com', false, true, '2019-09-29 22:10:01.682578+00');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$150000$1yfsY6q8UUs8$pSV351As2wub6TFNuFI4ec4k9RI+2oEae2WFrtQXbPE=', '2019-10-01 01:01:17.408546+00', true, 'joseph', '', '', 'iamjoestack@gmail.com', true, true, '2019-09-28 04:02:08.863942+00');


--
-- TOC entry 2980 (class 0 OID 16634)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2982 (class 0 OID 16642)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2984 (class 0 OID 16702)
-- Dependencies: 213
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2019-09-28 04:04:20.08625+00', '1', 'userTransaction object (1)', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2019-09-28 06:33:20.647749+00', '1', 'userTransaction object (1)', 2, '[]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2019-09-28 06:33:48.852106+00', '2', 'userTransaction object (2)', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2019-09-28 06:34:29.568594+00', '3', 'userTransaction object (3)', 1, '[{"added": {}}]', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2019-09-29 08:28:42.390557+00', '3', 'userModel object (3)', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2019-09-29 08:52:48.23835+00', '3', 'userModel object (3)', 2, '[]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2019-09-29 08:53:03.48093+00', '4', 'userModel object (4)', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2019-09-29 08:54:15.276307+00', '4', 'userModel object (4)', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2019-09-29 17:17:24.250517+00', '1', 'userTransaction object (1)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2019-09-29 17:17:31.090884+00', '2', 'userTransaction object (2)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2019-09-29 17:17:35.107038+00', '3', 'userTransaction object (3)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2019-09-29 17:17:39.190451+00', '4', 'userTransaction object (4)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2019-09-29 17:17:43.389156+00', '5', 'userTransaction object (5)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2019-09-29 17:17:52.613498+00', '12', 'userTransaction object (12)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2019-09-29 17:17:52.621496+00', '11', 'userTransaction object (11)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2019-09-29 17:17:52.625495+00', '10', 'userTransaction object (10)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2019-09-29 17:17:52.625495+00', '9', 'userTransaction object (9)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2019-09-29 17:17:52.629498+00', '8', 'userTransaction object (8)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2019-09-29 17:17:52.629498+00', '7', 'userTransaction object (7)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2019-09-29 17:17:52.629498+00', '6', 'userTransaction object (6)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2019-09-29 17:27:36.322863+00', '13', 'userTransaction object (13)', 3, '', 7, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2019-09-29 22:02:35.175821+00', '1', 'userStock object (1)', 1, '[{"added": {}}]', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2019-09-29 22:22:57.229397+00', '6', 'userModel object (6)', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2019-09-29 22:25:36.046366+00', '7', 'userModel object (7)', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2019-09-30 00:28:03.555511+00', '7', 'userStock object (7)', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2019-09-30 00:34:27.809942+00', '8', 'userStock object (8)', 3, '', 9, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2019-09-30 13:20:41.06272+00', '1', 'apiKeys object (1)', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2019-09-30 13:20:59.766803+00', '2', 'apiKeys object (2)', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2019-09-30 13:21:16.770213+00', '3', 'apiKeys object (3)', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (30, '2019-09-30 14:37:39.894528+00', '10', 'daisy', 3, '', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (31, '2019-09-30 14:38:36.147095+00', '11', 'daisy', 3, '', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (32, '2019-09-30 14:39:03.41664+00', '12', 'daisy', 3, '', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (33, '2019-09-30 14:39:22.665756+00', '13', 'daisy', 3, '', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (34, '2019-10-01 01:01:39.971933+00', '16', 'registerUser', 3, '', 4, 1);


--
-- TOC entry 2970 (class 0 OID 16588)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'app', 'usertransaction');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'app', 'usermodel');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'app', 'userstock');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'api', 'apikeys');


--
-- TOC entry 2968 (class 0 OID 16577)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2019-09-28 04:00:45.373382+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2019-09-28 04:00:45.925215+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2019-09-28 04:00:46.952083+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-09-28 04:00:47.128012+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-09-28 04:00:47.152004+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'app', '0001_initial', '2019-09-28 04:00:47.283965+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2019-09-28 04:00:47.335949+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2019-09-28 04:00:47.347946+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0003_alter_user_email_max_length', '2019-09-28 04:00:47.371937+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0004_alter_user_username_opts', '2019-09-28 04:00:47.395939+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0005_alter_user_last_login_null', '2019-09-28 04:00:47.423921+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0006_require_contenttypes_0002', '2019-09-28 04:00:47.427923+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2019-09-28 04:00:47.451912+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0008_alter_user_username_max_length', '2019-09-28 04:00:47.531885+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2019-09-28 04:00:47.547884+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0010_alter_group_name_max_length', '2019-09-28 04:00:47.567876+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'auth', '0011_update_proxy_permissions', '2019-09-28 04:00:47.587869+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2019-09-28 04:00:47.663846+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'app', '0002_auto_20190929_0858', '2019-09-29 08:03:17.822326+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'api', '0001_initial', '2019-09-30 13:16:31.099554+00');


--
-- TOC entry 2987 (class 0 OID 16744)
-- Dependencies: 216
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('hnc3k76k65dt6f8hooyotdi26z3ljowt', 'NGQzNzQ3MTEyNjQ0MTVhNGJiNjBhNDlhOGY3YjU2NGY2ZWQyMDY3ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYmQ0OTg0ZWU2M2JlNDUxNGQ3OGRiZGFhNjQ4ZGNlZGQyMDc2NjZhIn0=', '2019-10-15 01:01:17.387558+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('xk3avxl91g40jjt3y4jm0d6k5g5z21hv', 'NGQzNzQ3MTEyNjQ0MTVhNGJiNjBhNDlhOGY3YjU2NGY2ZWQyMDY3ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYmQ0OTg0ZWU2M2JlNDUxNGQ3OGRiZGFhNjQ4ZGNlZGQyMDc2NjZhIn0=', '2019-10-15 01:01:17.412543+00');


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 221
-- Name: api_apikeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_apikeys_id_seq', 3, true);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 217
-- Name: app_usermodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_usermodel_id_seq', 9, true);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 219
-- Name: app_userstock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_userstock_id_seq', 14, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 214
-- Name: app_usertransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_usertransaction_id_seq', 42, true);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 16, true);


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 34, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- TOC entry 2836 (class 2606 OID 24586)
-- Name: api_apikeys api_apikeys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_apikeys
    ADD CONSTRAINT api_apikeys_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 16784)
-- Name: app_usermodel app_usermodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usermodel
    ADD CONSTRAINT app_usermodel_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 16792)
-- Name: app_userstock app_userstock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_userstock
    ADD CONSTRAINT app_userstock_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 16734)
-- Name: app_usertransaction app_usertransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usertransaction
    ADD CONSTRAINT app_usertransaction_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 16742)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2800 (class 2606 OID 16668)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2803 (class 2606 OID 16621)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 16611)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 16654)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2792 (class 2606 OID 16603)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 16639)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 16683)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2805 (class 2606 OID 16629)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 16647)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 16697)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2808 (class 2606 OID 16736)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2823 (class 2606 OID 16711)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 16595)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2787 (class 2606 OID 16593)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 16585)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 16751)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2793 (class 1259 OID 16743)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2798 (class 1259 OID 16669)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2801 (class 1259 OID 16670)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2788 (class 1259 OID 16655)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2809 (class 1259 OID 16685)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2812 (class 1259 OID 16684)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2815 (class 1259 OID 16699)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2818 (class 1259 OID 16698)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2806 (class 1259 OID 16737)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2821 (class 1259 OID 16722)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2824 (class 1259 OID 16723)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2827 (class 1259 OID 16753)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2830 (class 1259 OID 16752)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2839 (class 2606 OID 16662)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2838 (class 2606 OID 16657)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2837 (class 2606 OID 16648)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2841 (class 2606 OID 16677)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2840 (class 2606 OID 16672)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2843 (class 2606 OID 16691)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2842 (class 2606 OID 16686)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2844 (class 2606 OID 16712)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2845 (class 2606 OID 16717)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-10-01 18:04:42

--
-- PostgreSQL database dump complete
--

