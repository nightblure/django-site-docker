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
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
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
    user_id bigint NOT NULL,
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
-- Name: newsapp_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_comment (
    id bigint NOT NULL,
    text text NOT NULL,
    updated timestamp with time zone NOT NULL,
    created timestamp with time zone NOT NULL,
    news_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.newsapp_comment OWNER TO postgres;

--
-- Name: newsapp_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_comment_id_seq OWNER TO postgres;

--
-- Name: newsapp_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_comment_id_seq OWNED BY public.newsapp_comment.id;


--
-- Name: newsapp_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_like (
    id bigint NOT NULL,
    news_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.newsapp_like OWNER TO postgres;

--
-- Name: newsapp_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_like_id_seq OWNER TO postgres;

--
-- Name: newsapp_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_like_id_seq OWNED BY public.newsapp_like.id;


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
    views_count integer NOT NULL,
    category_id bigint NOT NULL,
    user_id bigint NOT NULL
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
-- Name: newsapp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    bio text NOT NULL,
    avatar character varying(100),
    is_subscriber boolean NOT NULL
);


ALTER TABLE public.newsapp_user OWNER TO postgres;

--
-- Name: newsapp_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.newsapp_user_groups OWNER TO postgres;

--
-- Name: newsapp_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_user_groups_id_seq OWNER TO postgres;

--
-- Name: newsapp_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_user_groups_id_seq OWNED BY public.newsapp_user_groups.id;


--
-- Name: newsapp_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_user_id_seq OWNER TO postgres;

--
-- Name: newsapp_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_user_id_seq OWNED BY public.newsapp_user.id;


--
-- Name: newsapp_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newsapp_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.newsapp_user_user_permissions OWNER TO postgres;

--
-- Name: newsapp_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.newsapp_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.newsapp_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: newsapp_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.newsapp_user_user_permissions_id_seq OWNED BY public.newsapp_user_user_permissions.id;


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
-- Name: newsapp_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_category ALTER COLUMN id SET DEFAULT nextval('public.newsapp_category_id_seq'::regclass);


--
-- Name: newsapp_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_comment ALTER COLUMN id SET DEFAULT nextval('public.newsapp_comment_id_seq'::regclass);


--
-- Name: newsapp_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_like ALTER COLUMN id SET DEFAULT nextval('public.newsapp_like_id_seq'::regclass);


--
-- Name: newsapp_news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news ALTER COLUMN id SET DEFAULT nextval('public.newsapp_news_id_seq'::regclass);


--
-- Name: newsapp_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user ALTER COLUMN id SET DEFAULT nextval('public.newsapp_user_id_seq'::regclass);


--
-- Name: newsapp_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_groups ALTER COLUMN id SET DEFAULT nextval('public.newsapp_user_groups_id_seq'::regclass);


--
-- Name: newsapp_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.newsapp_user_user_permissions_id_seq'::regclass);


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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add Категория	7	add_category
26	Can change Категория	7	change_category
27	Can delete Категория	7	delete_category
28	Can view Категория	7	view_category
29	Can add Новость	8	add_news
30	Can change Новость	8	change_news
31	Can delete Новость	8	delete_news
32	Can view Новость	8	view_news
33	Can add Лайк	9	add_like
34	Can change Лайк	9	change_like
35	Can delete Лайк	9	delete_like
36	Can view Лайк	9	view_like
37	Can add Token	10	add_token
38	Can change Token	10	change_token
39	Can delete Token	10	delete_token
40	Can view Token	10	view_token
41	Can add token	11	add_tokenproxy
42	Can change token	11	change_tokenproxy
43	Can delete token	11	delete_tokenproxy
44	Can view token	11	view_tokenproxy
45	Can add comment	12	add_comment
46	Can change comment	12	change_comment
47	Can delete comment	12	delete_comment
48	Can view comment	12	view_comment
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-10-24 12:16:36.907175+00	1	VST Plugins	1	[{"added": {}}]	7	1
2	2022-10-24 12:16:41.108743+00	2	Synths	1	[{"added": {}}]	7	1
3	2022-10-24 14:30:37.837684+00	2	Comment object (2)	3		12	1
4	2022-10-24 14:30:37.845683+00	1	Comment object (1)	3		12	1
5	2022-10-24 14:30:50.270959+00	4	Comment object (4)	1	[{"added": {}}]	12	1
6	2022-10-24 15:00:06.366261+00	1	admin	2	[{"changed": {"fields": ["Email address"]}}]	6	1
7	2022-10-24 15:15:07.330433+00	2	nightxx	2	[{"changed": {"fields": ["Avatar"]}}]	6	1
8	2022-10-24 15:16:41.688465+00	1	admin	2	[{"changed": {"fields": ["Avatar"]}}]	6	1
9	2022-10-28 08:39:31.617772+00	4	userTest	3		6	1
10	2022-10-28 08:46:49.508552+00	5	userTest	3		6	1
11	2022-10-28 08:47:15.454837+00	6	usertest	3		6	1
12	2022-10-28 11:54:42.893332+00	3	user	3		6	1
13	2022-10-28 11:58:25.373416+00	7	user	3		6	1
14	2022-10-28 14:14:58.909585+00	10	fghf	3		8	1
15	2022-10-28 14:15:22.850568+00	3	fsdff	3		7	1
16	2022-10-28 14:19:09.893454+00	11	fffff	2	[{"changed": {"fields": ["Category"]}}]	8	1
17	2022-10-28 14:19:09.903455+00	9	fghfh	2	[{"changed": {"fields": ["Category"]}}]	8	1
18	2022-10-28 14:19:16.955245+00	5	fghfghyy	3		7	1
19	2022-10-28 14:19:16.960768+00	4	fdh	3		7	1
20	2022-10-29 09:28:43.816107+00	1	admin	2	[{"changed": {"fields": ["Email address"]}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	newsapp	user
7	newsapp	category
8	newsapp	news
9	newsapp	like
10	authtoken	token
11	authtoken	tokenproxy
12	newsapp	comment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-10-24 12:15:17.567184+00
2	contenttypes	0002_remove_content_type_name	2022-10-24 12:15:17.583184+00
3	auth	0001_initial	2022-10-24 12:15:17.653672+00
4	auth	0002_alter_permission_name_max_length	2022-10-24 12:15:17.66367+00
5	auth	0003_alter_user_email_max_length	2022-10-24 12:15:17.673089+00
6	auth	0004_alter_user_username_opts	2022-10-24 12:15:17.683634+00
7	auth	0005_alter_user_last_login_null	2022-10-24 12:15:17.69297+00
8	auth	0006_require_contenttypes_0002	2022-10-24 12:15:17.699974+00
9	auth	0007_alter_validators_add_error_messages	2022-10-24 12:15:17.708969+00
10	auth	0008_alter_user_username_max_length	2022-10-24 12:15:17.719957+00
11	auth	0009_alter_user_last_name_max_length	2022-10-24 12:15:17.730309+00
12	auth	0010_alter_group_name_max_length	2022-10-24 12:15:17.740573+00
13	auth	0011_update_proxy_permissions	2022-10-24 12:15:17.750573+00
14	auth	0012_alter_user_first_name_max_length	2022-10-24 12:15:17.761573+00
15	newsapp	0001_initial	2022-10-24 12:15:17.925485+00
16	admin	0001_initial	2022-10-24 12:15:17.974213+00
17	admin	0002_logentry_remove_auto_add	2022-10-24 12:15:17.990215+00
18	admin	0003_logentry_add_action_flag_choices	2022-10-24 12:15:18.010216+00
19	authtoken	0001_initial	2022-10-24 12:15:18.076759+00
20	authtoken	0002_auto_20160226_1747	2022-10-24 12:15:18.134643+00
21	authtoken	0003_tokenproxy	2022-10-24 12:15:18.146609+00
22	sessions	0001_initial	2022-10-24 12:15:18.183623+00
23	newsapp	0002_comment	2022-10-24 13:37:31.724484+00
24	newsapp	0003_alter_like_news_alter_like_user	2022-10-25 08:34:03.813218+00
25	newsapp	0004_user_is_subscriber	2022-10-28 08:35:13.98234+00
26	newsapp	0005_alter_user_is_subscriber	2022-10-28 08:43:45.206058+00
27	newsapp	0006_alter_user_is_subscriber	2022-10-28 08:45:51.297125+00
28	newsapp	0007_alter_user_avatar	2022-10-28 11:58:06.458133+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
851d7lx3wse5wxslrl4vr0tjacg0a1ep	.eJxVjMsOwiAQRf-FtSFDH4zj0n2_gQwwSNVAUtqV8d-1SRe6veec-1KOtzW7rcni5qguyqjT7-Y5PKTsIN653KoOtazL7PWu6IM2PdUoz-vh_h1kbvlbE8ceeQSyEjqUvgMDJBYQ-2BGT4nQB8I0SAKKg2XwZzuIEKBAgk69P9HwN4I:1omwaO:N6aiNWpfClybR5lhp0hSlMam6WCBPNiqRgykppcp9UM	2022-11-07 12:29:44.932762+00
t3x5x6hjvrf1i6wies1hewgnuu99abii	.eJxVjEEOgjAQRe_StWlmKHTEpXvP0HQ6U4saSCisjHcXEha6_e-9_zYhrksJa9U5DGIuBs3pd-OYnjruQB5xvE82TeMyD2x3xR602tsk-roe7t9BibVsddMR-KyM0AMRJokesxMQYKeOlB2fqWs3kNBLajM0DXtFoN4lUjSfL9pYN7c:1onFmq:j1TGad9YYzqNrwwh6xnpXNskdZzc1sRHJ744uVvM3KE	2022-11-08 08:59:52.959488+00
hi6h2itumnjpkic2f7uurfr5cinlyosy	.eJxVjEEOwiAQRe_C2hAodEpduvcMZJiZStVAUtqV8e7apAvd_vfef6mI25rj1mSJM6uzsur0uyWkh5Qd8B3LrWqqZV3mpHdFH7Tpa2V5Xg737yBjy9-aEiIgWJYw8SiBJAzeW_QCCYfJwci9YNcBeWYjGIAcgzNsbMAenHp_ABwsOMA:1omzA3:HHWJ5wp_56NKF3lGMGzWKvOg-NGoAWj383d66J3PYyA	2022-11-07 15:14:43.522404+00
uxbzqg9p5ll752wcfx7bl63g11x9732k	.eJxVjMsKwjAURP8lawlNYl4u3fsN5b4wVUmgaVfiv9tCF7oamHNm3mqEdSnj2mUeJ1YXZdTpt0Ogp9Qd8APqvWlqdZkn1LuiD9r1rbG8rof7d1Cgl22NATC4QD6wWGfdOUaMxmaigCGz3dI7YsHMQ8KUDCJKHjyQT17Iqc8X61Y4Zg:1ooi3X:9UUiq6F_uk9sSzniBoHs_wT2ZEhVG4uSVF73XFeUHeo	2022-11-12 09:23:07.737807+00
\.


--
-- Data for Name: newsapp_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_category (id, title, slug) FROM stdin;
1	VST Plugins	vst-plugins
2	Synths	synths
6	Sample Packs	sample-packs
7	dd	dd
\.


--
-- Data for Name: newsapp_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_comment (id, text, updated, created, news_id, user_id) FROM stdin;
5	                sdfsdf	2022-10-24 15:11:17.525604+00	2022-10-24 15:11:17.525604+00	2	2
13	                sdfffffffffff	2022-10-24 16:15:54.431586+00	2022-10-24 16:15:54.431586+00	2	2
17	                vcv	2022-10-25 08:31:27.170382+00	2022-10-25 08:31:27.170382+00	2	2
\.


--
-- Data for Name: newsapp_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_like (id, news_id, user_id) FROM stdin;
\.


--
-- Data for Name: newsapp_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_news (id, title, content, created_at, updated_at, image, is_published, views_count, category_id, user_id) FROM stdin;
28	args=[arg1, arg2] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]	args=[arg1, arg2]\r\nargs=[arg1, arg2]args=[arg1, arg2]\r\nargs=[arg1, arg2]args=[arg1, arg2]\r\nargs=[arg1, arg2]	2022-10-28 20:53:23.56481+00	2022-10-28 20:53:23.56481+00		t	1	1	2
9	fghfh	ghjhj	2022-10-28 14:13:47.899299+00	2022-10-28 14:19:09.899457+00		t	3	1	1
7	News x	Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и фор	2022-10-28 12:16:19.540831+00	2022-10-28 12:16:19.540831+00		t	29	1	8
12	dfgfg	dddd	2022-10-28 14:20:50.260945+00	2022-10-28 14:20:50.260945+00		t	1	7	1
29	Категория: VST PluginsКатегория: VST Plugins	Категория: VST PluginsКатегория: VST PluginsКатегория: VST PluginsКатегория: VST Plugins	2022-10-28 20:55:02.012141+00	2022-10-28 20:55:02.012141+00		t	2	1	2
2	News 12	Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.	2022-10-24 13:20:04.429703+00	2022-10-28 14:00:07.713349+00	images/2022/10/24/background_for_BANDCAMP.jpg	t	278	1	1
11	fffff	fghf	2022-10-28 14:16:01.266132+00	2022-10-28 14:19:09.878628+00		t	4	2	1
13	sdf	ssss	2022-10-28 15:12:12.310892+00	2022-10-28 15:12:12.310892+00		t	1	1	2
36	celery -A project worker -l info -P solocelery -A project worker -l info -P solocelery -A project worker -l info -P solo	celery -A project worker -l info -P solocelery -A project worker -l info -P solocelery -A project worker -l info -P solo	2022-10-29 09:31:00.56486+00	2022-10-29 09:31:00.56486+00		t	1	1	1
14	sdf	ssss	2022-10-28 15:12:14.365022+00	2022-10-28 15:12:14.365022+00		t	1	1	2
15	ssdf	dfdfdfdfd	2022-10-28 15:13:42.453148+00	2022-10-28 15:13:42.453148+00		t	2	7	2
37	] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2]args=[] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]	] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]\r\nargs=[arg1, arg2] args=[arg1, arg2]args=[] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]\r\nargs=[arg1, arg2] args=[arg1, arg2]args=[	2022-10-29 14:31:50.753829+00	2022-10-29 14:31:50.753829+00		t	1	1	1
16	вапв	авпвп	2022-10-28 15:17:27.062287+00	2022-10-28 15:17:27.062287+00		t	2	1	2
17	sdff	sdf	2022-10-28 15:18:40.217844+00	2022-10-28 15:18:40.217844+00		t	1	1	2
18	sss	sfefef	2022-10-28 15:20:45.478434+00	2022-10-28 15:20:45.479435+00		t	1	1	2
19	dddddddddd	ddfgdg	2022-10-28 15:37:34.340797+00	2022-10-28 15:37:34.340797+00		t	1	1	2
20	sender = 'vanobel159@gmail.com'sdf	sender = 'vanobel159@gmail.com'	2022-10-28 15:39:57.24523+00	2022-10-28 15:39:57.24523+00		t	1	1	2
21	import requests	import requests	2022-10-28 15:43:10.694858+00	2022-10-28 15:43:10.694858+00		t	1	1	2
22	import requestsimport requests	import requests\r\nimport requests\r\nimport requests	2022-10-28 15:43:32.109101+00	2022-10-28 15:43:32.109101+00		t	1	2	2
23	sfsdfsf	sfsdfsfsfsdfsfsfsdfsf	2022-10-28 17:20:34.462443+00	2022-10-28 17:20:34.462443+00		t	1	1	2
24	args=[arg1, arg2]	args=[arg1, arg2]	2022-10-28 17:20:53.455482+00	2022-10-28 17:20:53.455482+00		t	1	1	2
31	Добавление новостиДобавление новости	Добавление новостиДобавление новостиДобавление новостиДобавление новости	2022-10-28 20:57:32.562645+00	2022-10-28 20:57:32.562645+00		t	3	1	2
30	ssssssssssssssssssddddddd	ssssssssssssssssssdddddddssssssssssssssssssddddddd	2022-10-28 20:56:19.022603+00	2022-10-28 20:56:19.022603+00		t	2	1	2
25	args=[arg1, arg2]	args=[arg1, arg2]	2022-10-28 17:21:30.788934+00	2022-10-28 17:21:30.788934+00		t	3	1	2
32	sdfsfsdfsfsdfsf	sdfsfsdfsf	2022-10-29 09:18:15.830455+00	2022-10-29 09:18:15.830455+00		t	1	1	2
26	args=[arg1, arg2]	args=[arg1, arg2]	2022-10-28 20:44:26.936581+00	2022-10-28 20:44:26.936581+00		t	3	1	2
27	args=[arg1, arg2]args=[arg1, arg2]args=[arg1, arg2]	args=[arg1, arg2]args=[arg1, arg2]args=[arg1, arg2]	2022-10-28 20:50:03.994519+00	2022-10-28 20:50:03.994519+00		t	2	1	2
33	sdfsfsdfsf	sdfsfsdfsf	2022-10-29 09:18:44.72643+00	2022-10-29 09:18:44.72643+00		t	1	1	2
34	dsafsdfddsafsdfddsafsdfddsafsdfddsafsdfddsafsdfddsafsdfd	dsafsdfddsafsdfddsafsdfddsafsdfddsafsdfd	2022-10-29 09:20:23.978765+00	2022-10-29 09:20:23.978765+00		t	1	1	2
35	dsafsdfddsafsdfd	dsafsdfddsafsdfddsafsdfddsafsdfd	2022-10-29 09:20:58.071578+00	2022-10-29 09:20:58.071578+00		t	1	1	2
38	] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2]args=[	] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]\r\nargs=[arg1, arg2] args=[arg1, arg2]args=[	2022-10-29 14:32:16.304239+00	2022-10-29 14:32:16.304239+00		t	1	1	1
39	arg1, arg2]args=[arg1, arg2]args=[	arg1, arg2]args=[arg1, arg2]args=[	2022-10-29 14:41:28.448547+00	2022-10-29 14:41:28.448547+00		t	1	1	1
42	гория: SynthsКатегория: Syntгория: SynthsКатегория: Synt	гория: SynthsКатегория: Syntгория: SynthsКатегория: Synt	2022-10-30 10:07:18.472514+00	2022-10-30 10:07:18.472514+00		t	2	1	1
40	g2]args=[arg1, ar	g2]args=[arg1, ar	2022-10-30 09:58:15.746206+00	2022-10-30 09:58:15.746206+00		t	2	2	1
41	Категория: SynthsКатегория: Synths	Категория: SynthsКатегория: Synths	2022-10-30 10:04:39.181425+00	2022-10-30 10:04:39.181425+00		t	1	1	1
43	end_mass_mail()¶ send_mass_mail(datatuple, fail_silentl	end_mass_mail()¶\r\nsend_mass_mail(datatuple, fail_silentl	2022-10-30 10:12:00.607748+00	2022-10-30 10:12:00.607748+00		t	1	1	1
44	end_mass_mail()¶ send_mass_mail(datatuple, fail_silentlend_mass_mail()¶ send_mass_mail(datatuple, fail_silentl	end_mass_mail()¶\r\nsend_mass_mail(datatuple, fail_silentl	2022-10-30 10:12:59.928711+00	2022-10-30 10:12:59.928711+00		t	1	1	1
45	ss] C:\\Users\\nightblure\\AppData\\Local\\pypoetry\\Cache\\virtualenvs\\djangosite-tUvSqBmH-py3.10\\lib\\site-packages \\celery\\fixups\\django.py:203: UserWarnin	ss] C:\\Users\\nightblure\\AppData\\Local\\pypoetry\\Cache\\virtualenvs\\djangosite-tUvSqBmH-py3.10\\lib\\site-packages\r\n\\celery\\fixups\\django.py:203: UserWarning: Using settings.DEBUG leads to a memory\r\n            leak, never use this setting in production environments!	2022-10-30 10:20:45.645686+00	2022-10-30 10:20:45.645686+00		t	1	1	1
46	News!	News!News!	2022-10-30 10:23:52.848533+00	2022-10-30 10:23:52.848533+00		t	4	1	1
47	System check identified no issues (0 silenced).	System check identified no issues (0 silenced).	2022-10-30 10:26:53.975133+00	2022-10-30 10:26:53.975133+00		t	1	1	1
48	System check identified no issues (0 silenced). System check identified no issues (0 silenced).	System check identified no issues (0 silenced).\r\nSystem check identified no issues (0 silenced).	2022-10-30 10:27:50.66572+00	2022-10-30 10:27:50.66572+00		t	2	1	1
49	Категория: Synths	Категория: Synths	2022-10-30 10:51:17.591643+00	2022-10-30 10:51:17.591643+00		t	2	1	1
50	celery acks latecelery acks late	celery acks latecelery acks late	2022-10-30 10:54:08.72124+00	2022-10-30 10:54:08.72124+00		t	3	1	1
51	Asynchronous Tasks Wit	Asynchronous Tasks Wit	2022-10-30 11:00:11.44199+00	2022-10-30 11:00:11.44199+00		t	1	1	1
\.


--
-- Data for Name: newsapp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, bio, avatar, is_subscriber) FROM stdin;
8	pbkdf2_sha256$390000$o4DsIQXdf4IcwOaeqDngrG$5BFF/BkSKnNxrY+8slLSwyFLJWjxAuOOyRuMNmDqfrM=	2022-10-28 13:03:12.333103+00	f	user			vanobel159@gmail.com	f	t	2022-10-28 11:58:50.815483+00			f
2	pbkdf2_sha256$390000$9e4fO9Zvy7sHnN5m7aainj$aF7bQE7Xvj2RNjQd8MzWb8LCIgCko4hj78+uy+8Rnow=	2022-10-28 15:07:13.281074+00	f	nightxx			vanobel159@gmail.com	f	t	2022-10-24 14:47:55+00		ly6sDhI35Yo_gSagc8t.jpg	t
1	pbkdf2_sha256$390000$ogLgYH6VHLRRsHskvQZ0ud$dGYrOvnsHEDXMCg9my4gybSfaHsrNZizTZ5gcz0Vp2U=	2022-10-29 09:23:07+00	t	admin			vanyabel13@gmail.com	t	t	2022-10-24 12:15:59+00		ly6sDhI35Yo_fMWLSgb.jpg	t
\.


--
-- Data for Name: newsapp_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: newsapp_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_user_user_permissions (id, user_id, permission_id) FROM stdin;
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
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 20, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: newsapp_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_category_id_seq', 7, true);


--
-- Name: newsapp_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_comment_id_seq', 20, true);


--
-- Name: newsapp_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_like_id_seq', 60, true);


--
-- Name: newsapp_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_news_id_seq', 51, true);


--
-- Name: newsapp_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_user_groups_id_seq', 1, false);


--
-- Name: newsapp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_user_id_seq', 8, true);


--
-- Name: newsapp_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_user_user_permissions_id_seq', 1, false);


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
-- Name: newsapp_comment newsapp_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_comment
    ADD CONSTRAINT newsapp_comment_pkey PRIMARY KEY (id);


--
-- Name: newsapp_like newsapp_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_like
    ADD CONSTRAINT newsapp_like_pkey PRIMARY KEY (id);


--
-- Name: newsapp_news newsapp_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_pkey PRIMARY KEY (id);


--
-- Name: newsapp_user_groups newsapp_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_groups
    ADD CONSTRAINT newsapp_user_groups_pkey PRIMARY KEY (id);


--
-- Name: newsapp_user_groups newsapp_user_groups_user_id_group_id_810ef2f7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_groups
    ADD CONSTRAINT newsapp_user_groups_user_id_group_id_810ef2f7_uniq UNIQUE (user_id, group_id);


--
-- Name: newsapp_user newsapp_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user
    ADD CONSTRAINT newsapp_user_pkey PRIMARY KEY (id);


--
-- Name: newsapp_user_user_permissions newsapp_user_user_permis_user_id_permission_id_b4c0444f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_user_permissions
    ADD CONSTRAINT newsapp_user_user_permis_user_id_permission_id_b4c0444f_uniq UNIQUE (user_id, permission_id);


--
-- Name: newsapp_user_user_permissions newsapp_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_user_permissions
    ADD CONSTRAINT newsapp_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: newsapp_user newsapp_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user
    ADD CONSTRAINT newsapp_user_username_key UNIQUE (username);


--
-- Name: newsapp_like unique_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_like
    ADD CONSTRAINT unique_constraint UNIQUE (user_id, news_id);


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
-- Name: newsapp_comment_news_id_0735db4d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_comment_news_id_0735db4d ON public.newsapp_comment USING btree (news_id);


--
-- Name: newsapp_comment_user_id_9722fd9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_comment_user_id_9722fd9b ON public.newsapp_comment USING btree (user_id);


--
-- Name: newsapp_like_news_id_251412bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_like_news_id_251412bf ON public.newsapp_like USING btree (news_id);


--
-- Name: newsapp_like_user_id_1de182dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_like_user_id_1de182dd ON public.newsapp_like USING btree (user_id);


--
-- Name: newsapp_news_category_id_4dd5cca6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_news_category_id_4dd5cca6 ON public.newsapp_news USING btree (category_id);


--
-- Name: newsapp_news_user_id_14eddac3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_news_user_id_14eddac3 ON public.newsapp_news USING btree (user_id);


--
-- Name: newsapp_user_groups_group_id_f3c076b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_user_groups_group_id_f3c076b6 ON public.newsapp_user_groups USING btree (group_id);


--
-- Name: newsapp_user_groups_user_id_52b47a9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_user_groups_user_id_52b47a9b ON public.newsapp_user_groups USING btree (user_id);


--
-- Name: newsapp_user_user_permissions_permission_id_b492f3cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_user_user_permissions_permission_id_b492f3cd ON public.newsapp_user_user_permissions USING btree (permission_id);


--
-- Name: newsapp_user_user_permissions_user_id_4f9d225c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_user_user_permissions_user_id_4f9d225c ON public.newsapp_user_user_permissions USING btree (user_id);


--
-- Name: newsapp_user_username_10c8b9e7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_user_username_10c8b9e7_like ON public.newsapp_user USING btree (username varchar_pattern_ops);


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
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_newsapp_user_id FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_newsapp_user_id FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_comment newsapp_comment_news_id_0735db4d_fk_newsapp_news_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_comment
    ADD CONSTRAINT newsapp_comment_news_id_0735db4d_fk_newsapp_news_id FOREIGN KEY (news_id) REFERENCES public.newsapp_news(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_comment newsapp_comment_user_id_9722fd9b_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_comment
    ADD CONSTRAINT newsapp_comment_user_id_9722fd9b_fk_newsapp_user_id FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_like newsapp_like_news_id_251412bf_fk_newsapp_news_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_like
    ADD CONSTRAINT newsapp_like_news_id_251412bf_fk_newsapp_news_id FOREIGN KEY (news_id) REFERENCES public.newsapp_news(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_like newsapp_like_user_id_1de182dd_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_like
    ADD CONSTRAINT newsapp_like_user_id_1de182dd_fk_newsapp_user_id FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_news newsapp_news_category_id_4dd5cca6_fk_newsapp_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_category_id_4dd5cca6_fk_newsapp_category_id FOREIGN KEY (category_id) REFERENCES public.newsapp_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_news newsapp_news_user_id_14eddac3_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_user_id_14eddac3_fk_newsapp_user_id FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_user_groups newsapp_user_groups_group_id_f3c076b6_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_groups
    ADD CONSTRAINT newsapp_user_groups_group_id_f3c076b6_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_user_groups newsapp_user_groups_user_id_52b47a9b_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_groups
    ADD CONSTRAINT newsapp_user_groups_user_id_52b47a9b_fk_newsapp_user_id FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_user_user_permissions newsapp_user_user_pe_permission_id_b492f3cd_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_user_permissions
    ADD CONSTRAINT newsapp_user_user_pe_permission_id_b492f3cd_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_user_user_permissions newsapp_user_user_pe_user_id_4f9d225c_fk_newsapp_u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_user_user_permissions
    ADD CONSTRAINT newsapp_user_user_pe_user_id_4f9d225c_fk_newsapp_u FOREIGN KEY (user_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

