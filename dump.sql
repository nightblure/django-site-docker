--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
    slug character varying(150) NOT NULL
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
    author_id bigint NOT NULL,
    slug character varying(250) NOT NULL
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
21efa7612cba3f6b6f15f9717650cb9fb598526a	2023-03-18 12:14:32.277742+00	1
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
21	2022-11-09 10:49:47.922062+00	54	Добавл	3		8	1
22	2022-11-09 10:49:47.926674+00	53	Добавл	3		8	1
23	2022-11-09 10:49:47.929685+00	51	Asynchronous Tasks Wit	3		8	1
24	2022-11-09 10:49:47.931684+00	50	celery acks latecelery acks late	3		8	1
25	2022-11-09 10:49:47.934684+00	49	Категория: Synths	3		8	1
26	2022-11-09 10:49:47.936685+00	48	System check identified no issues (0 silenced). System check identified no issues (0 silenced).	3		8	1
27	2022-11-09 10:49:47.938685+00	47	System check identified no issues (0 silenced).	3		8	1
28	2022-11-09 10:49:47.941684+00	46	News!	3		8	1
29	2022-11-09 10:49:47.943685+00	45	ss] C:\\Users\\nightblure\\AppData\\Local\\pypoetry\\Cache\\virtualenvs\\djangosite-tUvSqBmH-py3.10\\lib\\site-packages \\celery\\fixups\\django.py:203: UserWarnin	3		8	1
30	2022-11-09 10:49:47.945686+00	44	end_mass_mail()¶ send_mass_mail(datatuple, fail_silentlend_mass_mail()¶ send_mass_mail(datatuple, fail_silentl	3		8	1
31	2022-11-09 10:49:47.947685+00	43	end_mass_mail()¶ send_mass_mail(datatuple, fail_silentl	3		8	1
32	2022-11-09 10:49:47.949685+00	42	гория: SynthsКатегория: Syntгория: SynthsКатегория: Synt	3		8	1
33	2022-11-09 10:49:47.952685+00	41	Категория: SynthsКатегория: Synths	3		8	1
34	2022-11-09 10:49:47.954685+00	40	g2]args=[arg1, ar	3		8	1
35	2022-11-09 10:49:47.956685+00	39	arg1, arg2]args=[arg1, arg2]args=[	3		8	1
36	2022-11-09 10:49:47.958687+00	38	] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2]args=[	3		8	1
37	2022-11-09 10:49:47.960685+00	37	] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2] args=[arg1, arg2]args=[] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]	3		8	1
38	2022-11-09 10:49:47.963685+00	36	celery -A project worker -l info -P solocelery -A project worker -l info -P solocelery -A project worker -l info -P solo	3		8	1
39	2022-11-09 10:49:47.965684+00	35	dsafsdfddsafsdfd	3		8	1
40	2022-11-09 10:49:47.967684+00	34	dsafsdfddsafsdfddsafsdfddsafsdfddsafsdfddsafsdfddsafsdfd	3		8	1
41	2022-11-09 10:49:47.969684+00	33	sdfsfsdfsf	3		8	1
42	2022-11-09 10:49:47.971685+00	32	sdfsfsdfsfsdfsf	3		8	1
43	2022-11-09 10:49:47.973684+00	31	Добавление новостиДобавление новости	3		8	1
44	2022-11-09 10:49:47.975685+00	30	ssssssssssssssssssddddddd	3		8	1
45	2022-11-09 10:49:47.977685+00	29	Категория: VST PluginsКатегория: VST Plugins	3		8	1
46	2022-11-09 10:49:47.979695+00	28	args=[arg1, arg2] args=[arg1, arg2]args=[arg1, arg2] args=[arg1, arg2]	3		8	1
47	2022-11-09 10:49:47.981693+00	27	args=[arg1, arg2]args=[arg1, arg2]args=[arg1, arg2]	3		8	1
48	2022-11-09 10:49:47.983701+00	26	args=[arg1, arg2]	3		8	1
49	2022-11-09 10:49:47.985693+00	25	args=[arg1, arg2]	3		8	1
50	2022-11-09 10:49:47.987694+00	24	args=[arg1, arg2]	3		8	1
51	2022-11-09 10:49:47.990685+00	23	sfsdfsf	3		8	1
52	2022-11-09 10:49:47.992685+00	22	import requestsimport requests	3		8	1
53	2022-11-09 10:49:47.994684+00	21	import requests	3		8	1
54	2022-11-09 10:49:47.996685+00	20	sender = 'vanobel159@gmail.com'sdf	3		8	1
55	2022-11-09 10:49:47.997698+00	19	dddddddddd	3		8	1
56	2022-11-09 10:49:47.999695+00	18	sss	3		8	1
57	2022-11-09 10:49:48.001685+00	17	sdff	3		8	1
58	2022-11-09 10:49:48.003686+00	16	вапв	3		8	1
59	2022-11-09 10:49:48.005699+00	15	ssdf	3		8	1
60	2022-11-09 10:49:48.0077+00	13	sdf	3		8	1
61	2022-11-09 10:49:48.009687+00	12	dfgfg	3		8	1
62	2022-11-09 10:49:48.011698+00	11	fffff	3		8	1
63	2022-11-09 10:49:48.013699+00	9	fghfh	3		8	1
64	2022-11-09 10:49:48.015693+00	7	News x	3		8	1
65	2022-11-09 10:49:48.017685+00	2	News 12	3		8	1
66	2022-11-09 11:09:45.903437+00	7	Effects	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	7	1
67	2022-11-09 11:16:11.711891+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
68	2022-11-09 11:16:29.327919+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
69	2022-11-09 11:16:45.971709+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
70	2022-11-09 11:16:58.475808+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
71	2022-11-09 11:17:33.319889+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
72	2022-11-09 11:17:50.087184+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
73	2022-11-09 11:19:31.968327+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[]	8	1
74	2022-11-09 11:20:20.673053+00	9	Other news	1	[{"added": {}}]	7	1
75	2022-11-09 11:20:25.468395+00	60	iZotope launches Audiolens track referencing software, FREE for limited time	1	[{"added": {}}]	8	1
76	2022-11-09 11:20:43.729462+00	60	iZotope launches Audiolens track referencing software, FREE for limited time	2	[{"changed": {"fields": ["Image"]}}]	8	1
77	2022-11-09 11:22:24.90405+00	61	Klevgrand updates Grand Finale audio finalizer to v2.0	2	[{"changed": {"fields": ["content", "Image", "User"]}}]	8	1
78	2022-11-09 11:22:49.71798+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
79	2022-11-09 11:25:02.175639+00	10	Instruments	1	[{"added": {}}]	7	1
80	2022-11-09 11:25:22.353391+00	62	Native Instruments Kontakt 7: New browser & library, now available	1	[{"added": {}}]	8	1
81	2022-11-09 11:25:42.016647+00	62	Native Instruments Kontakt 7: New browser & library, now available	2	[{"changed": {"fields": ["content"]}}]	8	1
82	2022-11-09 11:26:05.261229+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["content"]}}]	8	1
83	2022-11-09 11:26:45.961624+00	63	Save 40% on Smooth Operator effect plugin by Baby Audio	1	[{"added": {}}]	8	1
84	2022-11-09 11:33:45.489826+00	56	Save 33% on ShaperBox 3 + Lifeline Console Lite Bundle	2	[{"changed": {"fields": ["Title", "content", "Image"]}}]	8	1
85	2022-11-09 11:34:58.354993+00	57	Voxengo updates SPAN to v3.15	2	[{"changed": {"fields": ["content"]}}]	8	1
86	2022-11-09 11:36:24.980653+00	58	Save 62% on Infinite Color Bundle for RC-20 by D-Fused Sounds	2	[{"changed": {"fields": ["content", "Image"]}}]	8	1
87	2023-03-19 09:59:36.978272+00	63	Save 40% on Smooth Operator effect plugin by Baby Audio	2	[]	8	1
88	2023-03-19 09:59:41.55227+00	62	Native Instruments Kontakt 7: New browser & library, now available	2	[]	8	1
89	2023-03-19 09:59:43.756317+00	61	Klevgrand updates Grand Finale audio finalizer to v2.0	2	[]	8	1
90	2023-03-19 09:59:46.088545+00	60	iZotope launches Audiolens track referencing software, FREE for limited time	2	[]	8	1
91	2023-03-19 09:59:48.325417+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[]	8	1
92	2023-03-19 09:59:50.693636+00	58	Save 62% on Infinite Color Bundle for RC-20 by D-Fused Sounds	2	[]	8	1
93	2023-03-19 09:59:53.265934+00	57	Voxengo updates SPAN to v3.15	2	[]	8	1
94	2023-03-19 09:59:56.778494+00	56	Save 33% on ShaperBox 3 + Lifeline Console Lite Bundle	2	[]	8	1
95	2023-03-19 10:08:55.876221+00	63	Save 40% on Smooth Operator effect plugin by Baby Audio	2	[]	8	1
96	2023-03-19 10:38:38.695734+00	65	sdgg	2	[{"changed": {"fields": ["Title", "content", "Slug"]}}]	8	1
97	2023-03-19 10:42:39.928264+00	69	fdffdf	2	[{"changed": {"fields": ["Title", "content", "Slug"]}}]	8	1
98	2023-03-19 10:46:37.118807+00	71	ыва	3		8	1
99	2023-03-21 18:08:36.384735+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["Is published"]}}]	8	1
100	2023-03-21 18:08:48.117923+00	59	Excite Audio launches KSHMR Chain plugin chain utility	2	[{"changed": {"fields": ["Is published"]}}]	8	1
101	2023-03-21 18:59:16.71698+00	72	Test News	1	[{"added": {}}]	8	1
102	2023-03-21 19:24:43.446739+00	74	test tt	2	[{"changed": {"fields": ["content", "Category"]}}]	8	1
103	2023-03-21 19:27:17.436453+00	74	test tt	3		8	1
104	2023-03-21 20:03:52.685011+00	2	nightxx	2	[{"changed": {"fields": ["Staff status"]}}]	6	1
105	2023-03-21 20:11:10.339261+00	2	nightxx	2	[{"changed": {"fields": ["Staff status"]}}]	6	1
106	2023-03-21 20:22:09.506204+00	79	testsx	1	[{"added": {}}]	8	1
107	2023-03-22 13:46:39.743826+00	140	sdf	3		8	1
108	2023-03-22 14:24:50.33543+00	11	testcat	3		7	1
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
29	newsapp	0008_alter_user_is_subscriber	2022-11-01 11:43:36.644795+00
30	newsapp	0009_alter_user_is_subscriber	2022-11-01 11:44:06.098351+00
31	newsapp	0010_alter_user_is_subscriber	2022-11-01 11:48:34.081601+00
32	newsapp	0011_news_slug	2023-03-19 09:57:46.458232+00
33	newsapp	0012_rename_user_news_author	2023-03-19 09:57:46.489232+00
34	newsapp	0013_alter_news_slug	2023-03-19 09:59:30.517239+00
35	newsapp	0014_alter_category_slug_alter_news_slug	2023-03-19 10:01:27.3425+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
851d7lx3wse5wxslrl4vr0tjacg0a1ep	.eJxVjMsOwiAQRf-FtSFDH4zj0n2_gQwwSNVAUtqV8d-1SRe6veec-1KOtzW7rcni5qguyqjT7-Y5PKTsIN653KoOtazL7PWu6IM2PdUoz-vh_h1kbvlbE8ceeQSyEjqUvgMDJBYQ-2BGT4nQB8I0SAKKg2XwZzuIEKBAgk69P9HwN4I:1omwaO:N6aiNWpfClybR5lhp0hSlMam6WCBPNiqRgykppcp9UM	2022-11-07 12:29:44.932762+00
t3x5x6hjvrf1i6wies1hewgnuu99abii	.eJxVjEEOgjAQRe_StWlmKHTEpXvP0HQ6U4saSCisjHcXEha6_e-9_zYhrksJa9U5DGIuBs3pd-OYnjruQB5xvE82TeMyD2x3xR602tsk-roe7t9BibVsddMR-KyM0AMRJokesxMQYKeOlB2fqWs3kNBLajM0DXtFoN4lUjSfL9pYN7c:1onFmq:j1TGad9YYzqNrwwh6xnpXNskdZzc1sRHJ744uVvM3KE	2022-11-08 08:59:52.959488+00
hi6h2itumnjpkic2f7uurfr5cinlyosy	.eJxVjEEOwiAQRe_C2hAodEpduvcMZJiZStVAUtqV8e7apAvd_vfef6mI25rj1mSJM6uzsur0uyWkh5Qd8B3LrWqqZV3mpHdFH7Tpa2V5Xg737yBjy9-aEiIgWJYw8SiBJAzeW_QCCYfJwci9YNcBeWYjGIAcgzNsbMAenHp_ABwsOMA:1omzA3:HHWJ5wp_56NKF3lGMGzWKvOg-NGoAWj383d66J3PYyA	2022-11-07 15:14:43.522404+00
uxbzqg9p5ll752wcfx7bl63g11x9732k	.eJxVjMsKwjAURP8lawlNYl4u3fsN5b4wVUmgaVfiv9tCF7oamHNm3mqEdSnj2mUeJ1YXZdTpt0Ogp9Qd8APqvWlqdZkn1LuiD9r1rbG8rof7d1Cgl22NATC4QD6wWGfdOUaMxmaigCGz3dI7YsHMQ8KUDCJKHjyQT17Iqc8X61Y4Zg:1ooi3X:9UUiq6F_uk9sSzniBoHs_wT2ZEhVG4uSVF73XFeUHeo	2022-11-12 09:23:07.737807+00
5nvdavssg73ni5p68o6851xghz5bip3f	.eJxVjMsKwjAURP8lawlNYl4u3fsN5b4wVUmgaVfiv9tCF7oamHNm3mqEdSnj2mUeJ1YXZdTpt0Ogp9Qd8APqvWlqdZkn1LuiD9r1rbG8rof7d1Cgl22NATC4QD6wWGfdOUaMxmaigCGz3dI7YsHMQ8KUDCJKHjyQT17Iqc8X61Y4Zg:1osjCJ:4iffLszigW5eOM0hmWQdis6ILeV3zC9yqyy6A-QXbBc	2022-11-23 11:24:47.42416+00
n1q6hndy0vw3c1i3h1wjg7mw05swzhqm	.eJxVjDsOwyAQBe9CHSEWMIiU6XMGtMuugpMIJH8qK3ePLblI2jczb1MZ16XmdZYpj6yuCtTldyMsL2kH4Ce2R9elt2UaSR-KPums753lfTvdv4OKc91r66Mla5I3zosADAZYQgLCZA1TGhy7GBFKQQ6RMWKgIGAS78iwU58vv8E3WQ:1peiEG:Bk61qMAbBSW65Ngu3Qfm1Ayw6xvmW31O0bE8uDCxAX4	2023-04-04 20:05:08.965152+00
\.


--
-- Data for Name: newsapp_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_category (id, title, slug) FROM stdin;
1	VST Plugins	vst-plugins
2	Synths	synths
6	Sample Packs	sample-packs
8	Sales and promotions	sales-and-promotions
7	Effects	effects
9	Other news	other-news
10	Instruments	instruments
\.


--
-- Data for Name: newsapp_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_comment (id, text, updated, created, news_id, user_id) FROM stdin;
24	wow!      	2022-11-09 11:05:36.445179+00	2022-11-09 11:05:36.445179+00	56	1
25	           cool!	2022-11-09 11:23:31.033785+00	2022-11-09 11:23:31.033785+00	61	1
26	thanks!	2022-11-09 11:24:14.018562+00	2022-11-09 11:24:14.018562+00	61	2
\.


--
-- Data for Name: newsapp_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_like (id, news_id, user_id) FROM stdin;
87	57	1
89	61	1
91	58	1
\.


--
-- Data for Name: newsapp_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_news (id, title, content, created_at, updated_at, image, is_published, views_count, category_id, author_id, slug) FROM stdin;
58	Save 62% on Infinite Color Bundle for RC-20 by D-Fused Sounds	<p>VST Buzz has launched a two-week promotion on the Infinite Color Bundle by D-Fused Sounds, a collection of 5 preset packs for the&nbsp;<a href="https://www.pluginboutique.com/product/2-Effects/44-Saturation/3016-RC-20-Retro-Color?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">RC-20 Retro Color</a>&nbsp;plugin by XLN Audio.</p>\r\n\r\n<p>This is an extra-large collection loaded with 223 presets to cover all of your needs from distortion, lo-fi, fluttering, flanging and chorusing effects. You&rsquo;ll get a palette of infinite colors for add nuance to your drum one shot, guitar riffs or entire bus channels!</p>\r\n\r\n<p>The bundle is priced only 29 EUR until November 22nd, 2022 (regular value 77 EUR). Prices ex. VAT in EU.</p>\r\n\r\n<p>More information:&nbsp;<a href="https://vstbuzz.com/?ref=3" rel="noopener nofollow" target="_blank">VST Buzz</a></p>	2022-11-09 11:08:50.969338+00	2023-03-19 09:59:50.691635+00	images/2022/11/09/VST-Buzz-Infinite-Color-Bundle.jpg	t	10	8	1	save-62-on-infinite-color-bundle-for-rc-20-by-d-fused-sounds
57	Voxengo updates SPAN to v3.15	<p>Voxengo has announced an update to the popular&nbsp;<strong>SPAN</strong>&nbsp;free real-time &ldquo;fast Fourier transform&rdquo; audio spectrum analyzer plugin for Windows and Mac.</p>\r\n\r\n<p>SPAN provides you with a very flexible &ldquo;mode&rdquo; system which you can use to setup your spectrum analyzer preferences. You may specify Fourier block size in samples, FFT window overlap percentage, spectrum&rsquo;s visual slope. Beside that you can choose to display secondary spectrum of a desired type (e.g. real-time maximum, all-time maximum). Spectrum can be smoothed out visually for an easier examination.</p>\r\n\r\n<p><strong>Changes in SPAN v3.13</strong></p>\r\n\r\n<ul>\r\n\t<li>Added the &ldquo;Large Cursor Readouts&rdquo; plug-in setting which enables larger mouse position readouts, useful when the plug-in is placed on a distant dedicated monitor.</li>\r\n\t<li>Fixed a drawing bug with the &ldquo;Flat Panels&rdquo; global switch disabled.</li>\r\n\t<li>Improved overall graphics drawing performance.</li>\r\n\t<li>Improved anti-aliased line rendering of the secondary spectrum.</li>\r\n\t<li>Improved knob&rsquo;s renderings.</li>\r\n\t<li>By frequent user request, the &ldquo;Solo&rdquo; switch&rsquo;s state is now saved together with the preset (a part of the routing parameters). While this opens up a possibility of leaving the &ldquo;Solo&rdquo; switch enabled and forgotten, this provides more flexibility, e.g. when mid/side processing is used.</li>\r\n</ul>\r\n\r\n<p>Available in VST/VST3, AU and AAX plugin formats, SPAN is free to download at&nbsp;<a href="https://www.voxengo.com/product/span/" rel="noopener nofollow" target="_blank">Voxengo</a>&nbsp;and from&nbsp;<a href="https://www.pluginboutique.com/product/2-Effects/25-Spectral-Analysis/695-Voxengo-SPAN?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Plugin Boutique</a>.</p>	2022-11-09 11:06:59.119001+00	2023-03-19 09:59:53.261934+00	images/2022/11/09/Voxengo-SPAN-free-spectrum-analyzer.jpg	t	6	1	1	voxengo-updates-span-to-v315
60	iZotope launches Audiolens track referencing software, FREE for limited time	<p>iZotope has launched a new desktop app that analyzes audio from any streaming platform or audio source, without the need for downloading media files or setting up tedious audio routing setups.</p>\r\n\r\n<p>When paired with iZotope&rsquo;s AI-powered Assistant technology in Neutron and Ozone,&nbsp;<a href="https://www.pluginboutique.com/product/3-Studio-Tools/95-Referencing-Tools/9927-Audiolens?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Audiolens</a>&nbsp;completely transforms your mixing and mastering reference workflow.</p>\r\n\r\n<p>Play your chosen audio through the selected output of your device and the application will collect data on key sonic characteristics, helping you to visualize, compare, and match your favorite reference tracks and sounds.</p>\r\n\r\n<p>Save time by capturing the analysis from Audiolens as a reference track so that you can use it in mixing and mastering without the need for downloading media files or setting up tedious audio routing setups. Integrate seamlessly with iZotope plug-ins Ozone 10 and Neutron 4 where you can match to your references and fine-tune your sound using the AI Assistants.</p>\r\n\r\n<p>Regularly priced $99 USD, Audiolens for Windows and macOS is free to download at&nbsp;<a href="https://www.pluginboutique.com/product/3-Studio-Tools/95-Referencing-Tools/9927-Audiolens?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Plugin Boutique</a>&nbsp;and from the&nbsp;<a href="https://www.izotope.com/en/products/audiolens.html" rel="noopener nofollow" target="_blank">iZotope</a>&nbsp;website until November 22nd, 2022.</p>	2022-11-09 11:20:24.451196+00	2023-03-19 09:59:46.085547+00	images/2022/11/09/iZotope-Audiolens.jpg	t	7	9	2	izotope-launches-audiolens-track-referencing-software-free-for-limited-time
56	Save 33% on ShaperBox 3 + Lifeline Console Lite Bundle	<p>Plugin Boutique has launched an exclusive bundle offer on&nbsp;<a href="https://www.pluginboutique.com/product/2-Effects/39-FX-Bundle/9869-ShaperBox-3-Lifeline-Console-Lite-Bundle?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">ShaperBox 3 + Lifeline Console Lite</a>, offering a 33% discount on the two creative audio plugins by Cableguys and Excite Audio for the next few weeks.</p>\r\n\r\n<p>Push boundaries and find your sound with two incredible effects plugins in one special bundle.</p>\r\n\r\n<p>ShaperBox 3 is the go-to plugin for inspiration, musical motion and mixing magic with power-packed upgrades like Audio Triggering, Sidechain View in VolumeShaper, and the new LiquidShaper flanger/phaser. Lifeline Console Lite brings recordings to life with the warmth and charm of analogue audio processing.</p>\r\n\r\n<p>The bundle is priced $99 USD until November 29th, 2022.</p>\r\n\r\n<p>More information:&nbsp;<a href="https://www.pluginboutique.com/manufacturers/159-Exclusive-Bundles-?a_aid=4af297e055206&amp;s=published" rel="noopener nofollow" target="_blank">Plugin Boutique</a></p>	2022-11-09 10:56:44.836107+00	2023-03-19 09:59:56.776495+00	images/2022/11/09/PIB-Shaperbox-3-LifeLine-Console-Lite-Bundle.png	t	46	1	1	save-33-on-shaperbox-3-lifeline-console-lite-bundle
62	Native Instruments Kontakt 7: New browser & library, now available	<p>Native Instruments has released the latest version of its do-it-all instrument platform.&nbsp;<a href="https://rekkerd.org/out/native-instruments-kontakt/" rel="noopener nofollow" target="_blank">Kontakt 7</a>&nbsp;features a new resizable browser, an overhauled Factory Library, newly added effects, and under-the-hood audio improvements.</p>\r\n\r\n<p>KONTAKT is everything from instant inspiration for music makers to the industry&rsquo;s leading instrument-building tool. More than a sampler, this shapeshifting platform has powered two decades of blockbuster film scores and chart-topping hits, plus thousands of incredible instruments.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Kontakt 7 features</strong></p>\r\n\r\n<ul>\r\n\t<li>New Factory Library: The revamped Factory Library comes with new sounds, effects, added functionality, plus a HiDPI interface.</li>\r\n\t<li>7 Collections of brand-new instruments in the Factory Library: Anything from orchestral, acoustic, band, beats, choir, synth to vintage.</li>\r\n\t<li>Enhanced browsing experience: You can now search, filter, and audition sounds as well as viewing preset properties and editing tags.</li>\r\n\t<li>Improved engine: Updated time stretching algorithm and 2 new effects from Guitar Rig 6.</li>\r\n\t<li>Simpler instrument creation process: Instrument developers now have access to Creator Tools, a standalone application suite consisting of a Debugger, an Instrument Editor, and a GUI Designer.</li>\r\n</ul>\r\n\r\n<p>Kontakt 7 for Windows and Mac is available to purchase for 299 USD/EUR.</p>\r\n\r\n<p>Owners of a previous version of Kontakt can upgrade for 99 USD/EUR, while registered users of qualifying Kontakt Player products can crossgrade for 199 USD/EUR.</p>\r\n\r\n<p>More information:&nbsp;<a href="https://rekkerd.org/out/native-instruments/" rel="noopener nofollow" target="_blank">Native Instruments</a></p>	2022-11-09 11:25:21.339378+00	2023-03-19 10:06:31.044025+00	images/2022/11/09/Native-Instruments-Kontakt-7.jpg	t	13	10	2	native-instruments-kontakt-7-new-browser-library-now-available
61	Klevgrand updates Grand Finale audio finalizer to v2.0	<p>Klevgrand has recently released an update to its multi-effect plug-in designed for finalizing complete mixes, stems, buses and/or individual audio tracks. Version 2.0 of&nbsp;<a href="https://www.pluginboutique.com/product/2-Effects/50-Mastering-/8706-Grand-Finale?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Grand Finale</a>&nbsp;brings a major facelift and some extra horsepower under the hood.</p>\r\n\r\n<p>Grand Finale is now an even more powerful tool designed for quickly finalizing complete mixes, stems, buses and/or individual audio tracks.</p>\r\n\r\n<p>SO WHAT&rsquo;S NEW? First and foremost we gave the UI a complete overhaul. Our primary aim for this new look has been to make the workflow more fun and intuitive with a clear step by step approach. The new version includes a LUFS-meter with reset, a more full-fledged multiband compressor and a bunch of new presets. AND, in addition to all this, Grand Finale will now be available as an AUv3.</p>\r\n\r\n<p><strong>Grand Finale 2.0 features</strong></p>\r\n\r\n<ul>\r\n\t<li>High quality effects, trimmed for high-precision audio finalizing.</li>\r\n\t<li>LUFS and RMS output metering.</li>\r\n\t<li>Parallel signal in aligned phase.</li>\r\n\t<li>Additive signal path with distortion and/or compression.</li>\r\n\t<li>Revamped UI optimized for a quick and creative workflow.</li>\r\n\t<li>Stereo width enhancer.</li>\r\n\t<li>Multi-band compressor.</li>\r\n\t<li>Fine-tuned limiter.</li>\r\n\t<li>Collection of pre-made presets.</li>\r\n</ul>\r\n\r\n<p>Grand Finale for Windows and Mac (VST/AU/AAX) is available to purchase at&nbsp;<a href="https://www.pluginboutique.com/product/2-Effects/50-Mastering-/8706-Grand-Finale?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Plugin Boutique</a>&nbsp;and from the&nbsp;<a href="https://klevgrand.com/products/grandfinale" rel="noopener nofollow" target="_blank">Klevgrand</a>&nbsp;store for $69.99 USD.</p>\r\n\r\n<p>The iOS version is priced $9.99 USD at the&nbsp;<a href="https://apps.apple.com/us/app/grand-finale-2/id6444091341" rel="noopener nofollow" target="_blank">App Store</a>.</p>	2022-11-09 11:22:07.453211+00	2023-03-19 10:32:02.619655+00	images/2022/11/09/Klevgrand-Grand-Finale.jpg	t	23	1	2	klevgrand-updates-grand-finale-audio-finalizer-to-v20
59	Excite Audio launches KSHMR Chain plugin chain utility	<p>Excite Audio has announced the release of an innovative utility that instantly copies your plugin chain from one track to countless others, allowing you to spend your time and effort where it matters most while producing.</p>\r\n\r\n<p>Using a forward-thinking Leader / Follower concept,&nbsp;<a href="https://www.pluginboutique.com/product/3-Studio-Tools/72-Utility/9641-KSHMR-Chain?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">KSHMR Chain</a>&nbsp;lets you fine-tune the settings of multiple tracks with a single twist, and then hear the accumulative effect of that change in real time &ndash; great for working with vocal stacks or groups of instruments.</p>\r\n\r\n<p>The plugin has been developed in collaboration with KSHMR, whose philosophy is that &ldquo;an efficient workflow helps you to stay creative&rdquo;. With this in mind, the plugin also doubles up as an intuitive organizational tool, scanning and stocking all your plugins in easy-to-reach categories that make sense for producers.</p>\r\n\r\n<p><strong>KSHMR Chain features</strong></p>\r\n\r\n<ul>\r\n\t<li>Revolutionary Leader Follower Technology.</li>\r\n\t<li>Customizable effects chains.</li>\r\n\t<li>Automatic plugin categorization.</li>\r\n\t<li>Powerful macro control.</li>\r\n\t<li>Parallel processing and gain staging.</li>\r\n\t<li>Individual plugin bypass.</li>\r\n\t<li>Leader and Follower bypass modes.</li>\r\n\t<li>Plugin RMS metering.</li>\r\n</ul>\r\n\r\n<p>Available as a VST3, AU and AAX plugin for Windows and Mac, KSHMR Chain is on sale for the introduction price $29 USD instead of $49 USD of until October 31st, 2022.</p>\r\n\r\n<p>More information:&nbsp;<a href="https://www.pluginboutique.com/manufacturers/322-Excite-Audio?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Excite Audio</a></p>	2022-11-09 11:10:06.05581+00	2023-03-21 18:08:48.111924+00	images/2022/11/09/Excite-Audio-KSHMR-Chain.jpg	t	29	7	1	excite-audio-launches-kshmr-chain-plugin-chain-utility
63	Save 40% on Smooth Operator effect plugin by Baby Audio	<p>Plugin Boutique has announced an exclusive sale on Baby Audio&rsquo;s intelligent signal balancer plugin designed for bringing out clarity and smoothness across instruments, vocals and mix buses.</p>\r\n\r\n<p>Allowing for creative tone-shaping without artifacts or harsh resonances,&nbsp;<a href="https://www.pluginboutique.com/product/3-Studio-Tools/71-Dynamic-Processor/7565-Smooth-Operator?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Smooth Operator</a>&nbsp;features an intelligent algorithm that automatically detects and resolves fatigued frequencies.</p>\r\n\r\n<p>Smooth Operator combines equalization, spectral compression and resonance suppression into a singular creative experience that&rsquo;s instant and intuitive. Use it to perfect your tonal balance and add a touch of &lsquo;hi-fi&rsquo;.</p>\r\n\r\n<p>BABY Audio&rsquo;s spectral detection algorithm adapts to your audio 44,100 times per second and automatically eliminates fatigued frequencies. This gives you full control to shape your signal and bring out more definition.</p>\r\n\r\n<p>Smooth Operator for Windows and Mac (VST/VST3, AU and AAX) is on sale for $39 USD instead of $69 USD until November 13th, 2022.</p>\r\n\r\n<p>More information:&nbsp;<a href="https://www.pluginboutique.com/manufacturers/263-Baby-Audio?a_aid=4af297e055206" rel="noopener nofollow" target="_blank">Baby Audio</a></p>	2022-11-09 11:26:44.950199+00	2023-03-19 10:08:55.874221+00	images/2022/11/09/Baby-Audio-Smooth-Operator-950x500.jpg	t	10	8	2	save-40-on-smooth-operator-effect-plugin-by-baby-audio
\.


--
-- Data for Name: newsapp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newsapp_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, bio, avatar, is_subscriber) FROM stdin;
8	pbkdf2_sha256$390000$o4DsIQXdf4IcwOaeqDngrG$5BFF/BkSKnNxrY+8slLSwyFLJWjxAuOOyRuMNmDqfrM=	2022-10-28 13:03:12.333103+00	f	user			vanobel159@gmail.com	f	t	2022-10-28 11:58:50.815483+00			f
1	pbkdf2_sha256$390000$79usp45eKk8n7hQBxo3qOV$Gn0vhI1G4AvS9uRStT8Sr8EkFRUw4i5VF6FpYCSxX+Q=	2023-03-21 20:05:08.897101+00	t	admin			vanyabel13@gmail.com	t	t	2022-10-24 12:15:59+00		ly6sDhI35Yo.jpg	t
2	pbkdf2_sha256$390000$9e4fO9Zvy7sHnN5m7aainj$aF7bQE7Xvj2RNjQd8MzWb8LCIgCko4hj78+uy+8Rnow=	2023-03-21 20:02:35+00	f	nightxx			vanobel159@gmail.com	f	t	2022-10-24 14:47:55+00		background_for_BANDCAMP.jpg	t
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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 108, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: newsapp_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_category_id_seq', 11, true);


--
-- Name: newsapp_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_comment_id_seq', 27, true);


--
-- Name: newsapp_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_like_id_seq', 101, true);


--
-- Name: newsapp_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_news_id_seq', 142, true);


--
-- Name: newsapp_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_user_groups_id_seq', 1, false);


--
-- Name: newsapp_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.newsapp_user_id_seq', 13, true);


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
-- Name: newsapp_news newsapp_news_slug_a891fa23_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_slug_a891fa23_uniq UNIQUE (slug);


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
-- Name: newsapp_news_slug_a891fa23_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_news_slug_a891fa23_like ON public.newsapp_news USING btree (slug varchar_pattern_ops);


--
-- Name: newsapp_news_user_id_14eddac3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX newsapp_news_user_id_14eddac3 ON public.newsapp_news USING btree (author_id);


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
-- Name: newsapp_news newsapp_news_author_id_7ae1c7b1_fk_newsapp_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_author_id_7ae1c7b1_fk_newsapp_user_id FOREIGN KEY (author_id) REFERENCES public.newsapp_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: newsapp_news newsapp_news_category_id_4dd5cca6_fk_newsapp_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newsapp_news
    ADD CONSTRAINT newsapp_news_category_id_4dd5cca6_fk_newsapp_category_id FOREIGN KEY (category_id) REFERENCES public.newsapp_category(id) DEFERRABLE INITIALLY DEFERRED;


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

