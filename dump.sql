--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

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
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO postgres;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


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
-- Name: newsapp_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_category (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.newsapp_category OWNER TO postgres;

--
-- Name: newsapp_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_category_id_seq OWNER TO postgres;

--
-- Name: newsapp_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_category_id_seq OWNED BY public.newsapp_category.id;


--
-- Name: newsapp_news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_news (
    id bigint NOT NULL,
    title character varying(150) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    image character varying(100),
    is_published boolean NOT NULL,
    category_id bigint NOT NULL,
    views_count integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.newsapp_news OWNER TO postgres;

--
-- Name: newsapp_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_news_id_seq OWNER TO postgres;

--
-- Name: newsapp_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_news_id_seq OWNED BY public.newsapp_news.id;


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
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: newsapp_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_category ALTER COLUMN id SET DEFAULT nextval('public.newsapp_category_id_seq'::regclass);


--
-- Name: newsapp_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news ALTER COLUMN id SET DEFAULT nextval('public.newsapp_news_id_seq'::regclass);


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
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add Новость	8	add_news
30	Can change Новость	8	change_news
31	Can delete Новость	8	delete_news
32	Can view Новость	8	view_news
33	Can add crontab	9	add_crontabschedule
34	Can change crontab	9	change_crontabschedule
35	Can delete crontab	9	delete_crontabschedule
36	Can view crontab	9	view_crontabschedule
37	Can add interval	10	add_intervalschedule
38	Can change interval	10	change_intervalschedule
39	Can delete interval	10	delete_intervalschedule
40	Can view interval	10	view_intervalschedule
41	Can add periodic task	11	add_periodictask
42	Can change periodic task	11	change_periodictask
43	Can delete periodic task	11	delete_periodictask
44	Can view periodic task	11	view_periodictask
45	Can add periodic tasks	12	add_periodictasks
46	Can change periodic tasks	12	change_periodictasks
47	Can delete periodic tasks	12	delete_periodictasks
48	Can view periodic tasks	12	view_periodictasks
49	Can add solar event	13	add_solarschedule
50	Can change solar event	13	change_solarschedule
51	Can delete solar event	13	delete_solarschedule
52	Can view solar event	13	view_solarschedule
53	Can add clocked	14	add_clockedschedule
54	Can change clocked	14	change_clockedschedule
55	Can delete clocked	14	delete_clockedschedule
56	Can view clocked	14	view_clockedschedule
57	Can add Token	15	add_token
58	Can change Token	15	change_token
59	Can delete Token	15	delete_token
60	Can view Token	15	view_token
61	Can add token	16	add_tokenproxy
62	Can change token	16	change_tokenproxy
63	Can delete token	16	delete_tokenproxy
64	Can view token	16	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$320000$bg8Tee0XDKbKBCLa8Czg1p$6tKyBcwSVlc5zEqtOc5AHnFnTYw7Qg4ZMjxQDZqQv7w=	2022-07-11 17:28:20.957639+00	f	u2			vanobel159@gmail.com	f	t	2022-07-10 13:13:11.379988+00
4	pbkdf2_sha256$320000$kKIYeK96yrCmHlMMhisrM0$FDcCHbJ+yLsWbSgp6uVk0MQYY4W0keE+dNNIWO6p6ik=	2022-07-11 17:31:24.000829+00	f	u3			vanobel159@gmail.com	f	t	2022-07-11 17:31:17.628604+00
1	pbkdf2_sha256$320000$9MoFtty76mrwEVfRfvLYsK$0TTeLAhG1FIS/uMk3iqe02AcBmLMBuFPy9eZ9nObAnA=	2022-09-14 18:32:34.666334+00	t	admin			p@p.com	t	t	2022-05-24 15:15:33.2725+00
2	pbkdf2_sha256$320000$UOxpI2GQoY3JLcJF1HGZ5I$753EIduXgipWoUOaotBTFE2wKrF+tNH1cfb5Ylj65CE=	2022-09-14 20:39:30.118573+00	f	ivan				f	t	2022-07-10 12:07:30.29945+00
5	pbkdf2_sha256$320000$GDp0YLgqX48t7ccIUV2fvM$Cu7qf03PFAjmS0+EJ8ToSa/WFrsEQU2RRzuysAhRkrs=	2022-09-15 09:57:55.649004+00	f	tokenuser			a@a.com	f	t	2022-09-14 17:10:03.346535+00
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
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
df43fa915a3065690aede39ad753e894d632dd14	2022-09-14 17:12:11.41411+00	5
909daa0cb97c711a2ba88e1f6c31898e7698e272	2022-09-14 20:35:59.356064+00	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-24 15:16:48.682979+00	1	1	1	[{"added": {}}]	8	1
2	2022-05-24 15:20:19.876116+00	1	Category object (1)	1	[{"added": {}}]	7	1
3	2022-05-24 15:20:23.284113+00	2	Category object (2)	1	[{"added": {}}]	7	1
4	2022-05-24 15:20:26.784358+00	3	Category object (3)	1	[{"added": {}}]	7	1
5	2022-05-24 15:20:30.325884+00	4	Category object (4)	1	[{"added": {}}]	7	1
6	2022-05-24 15:20:33.954579+00	5	Category object (5)	1	[{"added": {}}]	7	1
7	2022-05-24 15:20:42.056179+00	6	Category object (6)	1	[{"added": {}}]	7	1
8	2022-05-24 15:21:36.113223+00	1	1	2	[{"changed": {"fields": ["Category id"]}}]	8	1
9	2022-05-24 15:21:37.513438+00	1	1	2	[]	8	1
10	2022-05-24 15:26:57.164966+00	1	1	2	[{"changed": {"fields": ["Is published"]}}]	8	1
11	2022-05-24 15:26:59.804896+00	1	1	2	[{"changed": {"fields": ["Is published"]}}]	8	1
12	2022-05-24 15:49:44.481885+00	2	Новость 2	1	[{"added": {}}]	8	1
13	2022-05-24 15:49:59.986192+00	1	Новость 1	2	[{"changed": {"fields": ["Title", "Content"]}}]	8	1
14	2022-05-28 08:42:12.762486+00	2	Новость 2	2	[{"changed": {"fields": ["Image"]}}]	8	1
15	2022-05-28 08:42:55.702528+00	1	Новость 1	2	[{"changed": {"fields": ["Image"]}}]	8	1
16	2022-06-17 09:48:33.193464+00	3	sf	2	[{"changed": {"fields": ["Image"]}}]	8	1
17	2022-06-17 09:52:46.18961+00	2	Новость 2	2	[{"changed": {"fields": ["Category"]}}]	8	1
18	2022-06-17 09:52:46.197952+00	1	Новость 1	2	[{"changed": {"fields": ["Category"]}}]	8	1
19	2022-06-17 15:12:06.261591+00	4	ммчм	3		8	1
20	2022-06-17 15:24:05.101339+00	6	dsfsf	2	[{"changed": {"fields": ["Category"]}}]	8	1
21	2022-06-17 15:24:05.109357+00	5	sdfsf	2	[{"changed": {"fields": ["Category"]}}]	8	1
22	2022-06-18 06:09:31.640546+00	7	ывавыав	2	[{"changed": {"fields": ["Is published"]}}]	8	1
23	2022-06-18 06:09:31.652547+00	5	sdfsf	2	[{"changed": {"fields": ["Is published"]}}]	8	1
24	2022-06-18 06:09:31.661953+00	2	Новость 2	2	[{"changed": {"fields": ["Is published"]}}]	8	1
25	2022-06-18 06:10:27.75543+00	7	ывавыав	2	[{"changed": {"fields": ["Is published"]}}]	8	1
26	2022-06-18 06:10:27.764429+00	5	sdfsf	2	[{"changed": {"fields": ["Is published"]}}]	8	1
27	2022-06-18 06:10:27.773569+00	2	Новость 2	2	[{"changed": {"fields": ["Is published"]}}]	8	1
28	2022-06-18 06:53:58.609952+00	1	Новость 1	2	[{"changed": {"fields": ["Content"]}}]	8	1
29	2022-07-06 15:37:02.532797+00	12	dfgdf	2	[]	8	1
30	2022-07-06 15:38:46.504976+00	12	dfgdf	2	[{"changed": {"fields": ["Image"]}}]	8	1
31	2022-07-11 18:09:11.257169+00	13	qwe	2	[{"changed": {"fields": ["content"]}}]	8	1
32	2022-07-11 18:11:01.056613+00	13	qwe	2	[{"changed": {"fields": ["content"]}}]	8	1
33	2022-07-11 18:19:55.448909+00	13	qwe	2	[{"changed": {"fields": ["content"]}}]	8	1
34	2022-07-26 18:13:50.19635+00	4	Информационные технологии	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f", "Slug"]}}]	7	1
35	2022-07-26 18:18:45.279639+00	1	Культура	2	[{"changed": {"fields": ["Slug"]}}]	7	1
36	2022-07-26 18:18:49.35442+00	5	Музыка	2	[{"changed": {"fields": ["Slug"]}}]	7	1
37	2022-07-26 18:18:57.345472+00	5	Музыка	2	[]	7	1
38	2022-07-26 18:19:03.479447+00	6	Наука	2	[{"changed": {"fields": ["Slug"]}}]	7	1
39	2022-07-26 18:19:06.876154+00	3	Политика	2	[{"changed": {"fields": ["Slug"]}}]	7	1
40	2022-07-26 18:19:09.847365+00	2	Спорт	2	[{"changed": {"fields": ["Slug"]}}]	7	1
41	2022-07-27 15:18:45.609986+00	7	cat test	1	[{"added": {}}]	7	1
42	2022-07-27 15:22:14.951003+00	7	cat test 2	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	7	1
43	2022-07-27 15:22:27.469819+00	8	catt	1	[{"added": {}}]	7	1
44	2022-07-27 15:39:57.273919+00	10	sdf	1	[{"added": {}}]	7	1
45	2022-09-12 18:46:47.895635+00	15	Новость api test	3		8	1
46	2022-09-12 18:47:18.841301+00	17	Новость api test	3		8	1
47	2022-09-14 09:16:32.722571+00	10	sdf	3		7	1
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
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
7	newsapp	category
8	newsapp	news
9	django_celery_beat	crontabschedule
10	django_celery_beat	intervalschedule
11	django_celery_beat	periodictask
12	django_celery_beat	periodictasks
13	django_celery_beat	solarschedule
14	django_celery_beat	clockedschedule
15	authtoken	token
16	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-24 15:13:35.392784+00
2	auth	0001_initial	2022-05-24 15:13:35.488612+00
3	admin	0001_initial	2022-05-24 15:13:35.515269+00
4	admin	0002_logentry_remove_auto_add	2022-05-24 15:13:35.523265+00
5	admin	0003_logentry_add_action_flag_choices	2022-05-24 15:13:35.531264+00
6	contenttypes	0002_remove_content_type_name	2022-05-24 15:13:35.545286+00
7	auth	0002_alter_permission_name_max_length	2022-05-24 15:13:35.553286+00
8	auth	0003_alter_user_email_max_length	2022-05-24 15:13:35.561577+00
9	auth	0004_alter_user_username_opts	2022-05-24 15:13:35.568577+00
10	auth	0005_alter_user_last_login_null	2022-05-24 15:13:35.577577+00
11	auth	0006_require_contenttypes_0002	2022-05-24 15:13:35.580958+00
12	auth	0007_alter_validators_add_error_messages	2022-05-24 15:13:35.587958+00
13	auth	0008_alter_user_username_max_length	2022-05-24 15:13:35.598972+00
14	auth	0009_alter_user_last_name_max_length	2022-05-24 15:13:35.607819+00
15	auth	0010_alter_group_name_max_length	2022-05-24 15:13:35.615819+00
16	auth	0011_update_proxy_permissions	2022-05-24 15:13:35.62382+00
17	auth	0012_alter_user_first_name_max_length	2022-05-24 15:13:35.632219+00
18	newsapp	0001_initial	2022-05-24 15:13:35.653316+00
19	sessions	0001_initial	2022-05-24 15:13:35.672882+00
20	newsapp	0002_alter_news_category_id	2022-05-24 15:16:35.452923+00
21	newsapp	0003_alter_category_options_remove_news_category_id_and_more	2022-06-17 08:36:47.7468+00
22	newsapp	0004_alter_news_category_alter_news_content_and_more	2022-06-17 15:48:56.890892+00
23	newsapp	0005_news_views_count	2022-07-05 16:41:06.616066+00
24	django_celery_beat	0001_initial	2022-07-21 18:30:44.694759+00
25	django_celery_beat	0002_auto_20161118_0346	2022-07-21 18:30:44.711758+00
26	django_celery_beat	0003_auto_20161209_0049	2022-07-21 18:30:44.720758+00
27	django_celery_beat	0004_auto_20170221_0000	2022-07-21 18:30:44.724758+00
28	django_celery_beat	0005_add_solarschedule_events_choices	2022-07-21 18:30:44.72976+00
29	django_celery_beat	0006_auto_20180322_0932	2022-07-21 18:30:44.747758+00
30	django_celery_beat	0007_auto_20180521_0826	2022-07-21 18:30:44.755758+00
31	django_celery_beat	0008_auto_20180914_1922	2022-07-21 18:30:44.765757+00
32	django_celery_beat	0006_auto_20180210_1226	2022-07-21 18:30:44.772759+00
33	django_celery_beat	0006_periodictask_priority	2022-07-21 18:30:44.779759+00
34	django_celery_beat	0009_periodictask_headers	2022-07-21 18:30:44.786758+00
35	django_celery_beat	0010_auto_20190429_0326	2022-07-21 18:30:44.850548+00
36	django_celery_beat	0011_auto_20190508_0153	2022-07-21 18:30:44.866548+00
37	django_celery_beat	0012_periodictask_expire_seconds	2022-07-21 18:30:44.872547+00
38	django_celery_beat	0013_auto_20200609_0727	2022-07-21 18:30:44.877547+00
39	django_celery_beat	0014_remove_clockedschedule_enabled	2022-07-21 18:30:44.883547+00
40	django_celery_beat	0015_edit_solarschedule_events_choices	2022-07-21 18:30:44.887547+00
41	django_celery_beat	0016_alter_crontabschedule_timezone	2022-07-21 18:30:44.892547+00
42	newsapp	0006_category_slug	2022-07-26 17:59:48.960903+00
43	newsapp	0007_alter_category_slug	2022-07-26 18:24:29.887834+00
44	newsapp	0008_news_user	2022-09-14 10:19:06.409446+00
45	newsapp	0009_alter_news_user	2022-09-14 10:51:21.204769+00
46	authtoken	0001_initial	2022-09-14 16:57:07.742629+00
47	authtoken	0002_auto_20160226_1747	2022-09-14 16:57:07.779769+00
48	authtoken	0003_tokenproxy	2022-09-14 16:57:07.787066+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
af49q6a6icxk766625taaactj87v0ue9	.eJxVjMsOwiAQRf-FtSEFOkJduu83kJlhkKqBpI-V8d-1SRe6veec-1IRt7XEbZE5TkldlFGn342QH1J3kO5Yb01zq-s8kd4VfdBFjy3J83q4fwcFl_Kt2TIbi46D6YLvrTB4nzukDtA7Goz0TCkbA0KOXZAUBjizB2JOAFm9P-1iOIc:1ntWG3:1pAr-DbPibjvJ8JT3da6-WwBP2VbM5ncZsmhv9gC_s8	2022-06-07 15:15:39.230335+00
a5siun9bs7kfszpu213wz33yaek1ulav	.eJxVjMsOwiAQRf-FtSEFOkJduu83kJlhkKqBpI-V8d-1SRe6veec-1IRt7XEbZE5TkldlFGn342QH1J3kO5Yb01zq-s8kd4VfdBFjy3J83q4fwcFl_Kt2TIbi46D6YLvrTB4nzukDtA7Goz0TCkbA0KOXZAUBjizB2JOAFm9P-1iOIc:1nzfvN:_3j53Tg3dO3S1EWWTuf_ukxkB9i5unZrgXPYpM6IxvY	2022-06-24 14:47:45.589704+00
nffgwpycj5rqifk42n6ulxok4vkktw2d	.eJxVjDkOwjAUBe_iGlm28SZKes5g_c04gBwpSxVxd4iUAto3M29TBdallXWWqQysLsqp0--GQE_pO-AH9PuoaezLNKDeFX3QWd9Gltf1cP8OGsztWxvjMROGFBMDBMpiHTtHHqtDS5nFA9uAuYoYEu8hpSjxXGsIKdms3h8AbjiR:1oGPpp:znULhatsTe8Cm-pW00snS3zr_ob9oYxeuWetkkCiVGk	2022-07-26 19:03:28.335685+00
54t6ut9hgeqxex0u4zy9e0igfnnm8nim	.eJxVjDkOwjAUBe_iGlm28SZKes5g_c04gBwpSxVxd4iUAto3M29TBdallXWWqQysLsqp0--GQE_pO-AH9PuoaezLNKDeFX3QWd9Gltf1cP8OGsztWxvjMROGFBMDBMpiHTtHHqtDS5nFA9uAuYoYEu8hpSjxXGsIKdms3h8AbjiR:1oYYc9:ao4zoZG5d1p2MJJPKhuNCh5_sSAxFry089RZ7v91fH4	2022-09-28 20:04:05.880012+00
tpinoe54zbiwze9d60qhndmk17ha46a3	.eJxVjMsOwiAQRf-FtSEFOkJduu83kJlhkKqBpI-V8d-1SRe6veec-1IRt7XEbZE5TkldlFGn342QH1J3kO5Yb01zq-s8kd4VfdBFjy3J83q4fwcFl_Kt2TIbi46D6YLvrTB4nzukDtA7Goz0TCkbA0KOXZAUBjizB2JOAFm9P-1iOIc:1oYRGK:Jb5Zd79GsUJykylS5PfApKEi3-zMT4-k6goz8L5QdmA	2022-09-28 12:13:04.933634+00
\.


--
-- Data for Name: newsapp_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_category (id, title, slug) FROM stdin;
4	Информационные технологии	informacionnye-tehnologii
1	Культура	kultura
5	Музыка	muzyka
6	Наука	nauka
3	Политика	politika
2	Спорт	sport
\.


--
-- Data for Name: newsapp_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_news (id, title, content, created_at, updated_at, image, is_published, category_id, views_count, user_id) FROM stdin;
3	sf	sff	2022-06-17 08:37:50.082257+00	2022-06-17 09:48:33.159288+00	images/2022/06/17/background_for_BANDCAMP.jpg	t	5	0	1
7	ывавыав	sdf	2022-06-17 15:30:59.296384+00	2022-06-18 06:10:27.744547+00		t	4	0	1
5	sdfsf	sdf	2022-06-17 15:21:27.642154+00	2022-06-18 06:10:27.760432+00		t	5	0	1
2	Новость 2	это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.	2022-05-24 15:49:44.480886+00	2022-06-18 06:10:27.769425+00	images/2022/05/28/Screenshot_1.png	t	6	0	1
1	Новость 1	Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).	2022-05-24 15:16:48.680979+00	2022-06-18 06:53:58.607944+00	images/2022/05/28/Screenshot_1_s0f0G9J.png	t	5	0	1
8	picnews	sdfdsf	2022-06-17 15:34:38.756593+00	2022-06-17 15:34:38.756593+00	images/2022/06/17/matt-antonioli-397046-unsplash.jpg	t	4	0	1
6	dsfsf	sdf	2022-06-17 15:23:38.694867+00	2022-06-17 15:24:05.094354+00		t	1	0	1
9	ssss	dsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsfdsfsfdsfdfsfsf	2022-06-18 08:34:09.397874+00	2022-06-18 08:34:09.397874+00		t	2	0	1
10	red	redredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredredred	2022-06-18 08:34:26.656257+00	2022-06-18 08:34:26.656257+00		t	3	0	1
11	ыыыыыыыыыы	ыыыыыыыыыы	2022-06-18 08:37:36.85553+00	2022-06-18 08:37:36.85553+00		t	3	0	1
13	qwe	<p><em>Давно выяснено, что при оценке диз</em>айна и композиции читаемый текст мешает сосредоточиться. <em><strong>Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблон</strong></em>а, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации &quot;Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..&quot; Многие программ<em><strong>ы электронной вёрстки </strong></em>и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам &quot;lorem ipsum&quot; сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации &quot;Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..&quot; Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам &quot;lorem ipsum&quot; сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации &quot;Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..&quot; Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам &quot;lorem ipsum&quot; сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации &quot;Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст..&quot; Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам &quot;lorem ipsum&quot; сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>	2022-06-24 15:15:37.345828+00	2022-07-11 18:19:55.399347+00		t	4	0	1
12	dfgdf	gdfg	2022-06-24 15:02:04.520658+00	2022-07-06 15:38:46.502975+00		t	4	0	1
16	Новость api test 16	test	2022-09-12 20:16:01.668285+00	2022-09-13 10:43:00.590484+00		t	5	0	2
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 47, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 48, true);


--
-- Name: newsapp_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_category_id_seq', 10, true);


--
-- Name: newsapp_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_news_id_seq', 21, true);


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
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


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
-- Name: newsapp_category newsapp_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_category
    ADD CONSTRAINT newsapp_category_pkey PRIMARY KEY (id);


--
-- Name: newsapp_category newsapp_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_category
    ADD CONSTRAINT newsapp_category_slug_key UNIQUE (slug);


--
-- Name: newsapp_news newsapp_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_pkey PRIMARY KEY (id);


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
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: newsapp_category_slug_00657ac6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_category_slug_00657ac6_like ON public.newsapp_category USING btree (slug varchar_pattern_ops);


--
-- Name: newsapp_news_category_id_4dd5cca6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_news_category_id_4dd5cca6 ON public.newsapp_news USING btree (category_id);


--
-- Name: newsapp_news_user_id_14eddac3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_news_user_id_14eddac3 ON public.newsapp_news USING btree (user_id);


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
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_news newsapp_news_category_id_4dd5cca6_fk_newsapp_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_category_id_4dd5cca6_fk_newsapp_category_id FOREIGN KEY (category_id) REFERENCES public.newsapp_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_news newsapp_news_user_id_14eddac3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_user_id_14eddac3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_publication; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION category_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION category_publication OWNER TO postgres;

--
-- Name: category_publication newsapp_category; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION category_publication ADD TABLE ONLY public.newsapp_category;


--
-- PostgreSQL database dump complete
--

