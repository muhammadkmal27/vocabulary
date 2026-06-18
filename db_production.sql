--
-- PostgreSQL database dump
--

\restrict eEDmCCoypcEMIrcGbyAkBKjDHoUVWxTzHrjDTnGwSabxmRjXHKg89oQGbRQSwLC

-- Dumped from database version 16.14
-- Dumped by pg_dump version 16.14

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
-- Name: cache; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO vocabulary;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO vocabulary;

--
-- Name: coupon_redemptions; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.coupon_redemptions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    coupon_id uuid NOT NULL,
    redeemed_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.coupon_redemptions OWNER TO vocabulary;

--
-- Name: coupons; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.coupons (
    id uuid NOT NULL,
    code character varying(50) NOT NULL,
    description text,
    discount_percent smallint NOT NULL,
    duration_days integer NOT NULL,
    max_uses integer,
    current_uses integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.coupons OWNER TO vocabulary;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO vocabulary;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: vocabulary
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO vocabulary;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vocabulary
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO vocabulary;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO vocabulary;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: vocabulary
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO vocabulary;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vocabulary
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.languages (
    id uuid NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    flag character varying(10),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.languages OWNER TO vocabulary;

--
-- Name: levels; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.levels (
    id uuid NOT NULL,
    language_id uuid NOT NULL,
    "order" integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.levels OWNER TO vocabulary;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO vocabulary;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: vocabulary
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO vocabulary;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vocabulary
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO vocabulary;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id uuid NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO vocabulary;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: vocabulary
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO vocabulary;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vocabulary
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: quiz_answers; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.quiz_answers (
    id uuid NOT NULL,
    session_id uuid NOT NULL,
    sentence_id uuid NOT NULL,
    user_answer text,
    is_correct boolean DEFAULT false NOT NULL,
    revealed boolean DEFAULT false NOT NULL,
    answered_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.quiz_answers OWNER TO vocabulary;

--
-- Name: quiz_sessions; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.quiz_sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    language_id uuid NOT NULL,
    level_id uuid NOT NULL,
    status character varying(20) DEFAULT 'in_progress'::character varying NOT NULL,
    total_questions smallint DEFAULT '20'::smallint NOT NULL,
    correct_count smallint DEFAULT '0'::smallint NOT NULL,
    started_at timestamp(0) without time zone NOT NULL,
    completed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.quiz_sessions OWNER TO vocabulary;

--
-- Name: sentences; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.sentences (
    id uuid NOT NULL,
    level_id uuid NOT NULL,
    source_text text NOT NULL,
    target_text text NOT NULL,
    tags text,
    difficulty smallint DEFAULT '1'::smallint NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sentences OWNER TO vocabulary;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id uuid,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO vocabulary;

--
-- Name: subscription_plans; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.subscription_plans (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(50) NOT NULL,
    price_myr numeric(10,2) NOT NULL,
    stripe_price_id character varying(255),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    member_limit integer,
    duration_months integer
);


ALTER TABLE public.subscription_plans OWNER TO vocabulary;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.subscriptions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    plan_id uuid NOT NULL,
    stripe_subscription_id character varying(255) NOT NULL,
    stripe_status character varying(50) NOT NULL,
    auto_renew boolean DEFAULT true NOT NULL,
    ends_at timestamp(0) without time zone,
    trial_ends_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_gateway character varying(255) DEFAULT 'stripe'::character varying NOT NULL,
    is_lifetime boolean DEFAULT false NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO vocabulary;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.transactions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    stripe_invoice_id character varying(255) NOT NULL,
    subscription_id uuid,
    amount numeric(10,2) NOT NULL,
    currency character varying(3) DEFAULT 'myr'::character varying NOT NULL,
    status character varying(50) NOT NULL,
    paid_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_gateway character varying(255) DEFAULT 'stripe'::character varying NOT NULL
);


ALTER TABLE public.transactions OWNER TO vocabulary;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vocabulary
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255),
    role character varying(20) DEFAULT 'user'::character varying NOT NULL,
    stripe_id character varying(255),
    pm_type character varying(255),
    pm_last_four character varying(4),
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO vocabulary;

--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: coupon_redemptions; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.coupon_redemptions (id, user_id, coupon_id, redeemed_at) FROM stdin;
019e7d46-73dd-71dc-b89b-62b09f0fd159	019e7d20-734e-70a4-8324-2e7509ef6c12	019e7bf0-2ccb-70a0-a28a-d133450fa70f	2026-05-31 09:03:49
019e80b2-34cc-7376-9626-5628b57c35e4	019e80af-126e-7219-876e-919580a5048d	019e80b0-07db-70c0-ae02-0c72d467411d	2026-06-01 01:00:23
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.coupons (id, code, description, discount_percent, duration_days, max_uses, current_uses, is_active, expires_at, created_at, updated_at) FROM stdin;
019e7bf0-2ccb-70a0-a28a-d133450fa70f	FREE2026AA	\N	100	3650	1	1	t	\N	2026-05-31 02:49:58	2026-05-31 09:03:49
019e80b0-07db-70c0-ae02-0c72d467411d	FREE2026BB	\N	100	3650	1	1	t	\N	2026-06-01 00:58:00	2026-06-01 01:00:23
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.languages (id, code, name, flag, is_active, created_at, updated_at) FROM stdin;
019e71d6-c6c2-717c-9caa-af2f471cb44c	en	English	EN	t	2026-05-29 03:46:01	2026-05-29 03:46:01
019e71d7-1221-71e7-930e-a5d0643c1c7e	gm	German	GM	t	2026-05-29 03:46:20	2026-05-29 03:46:20
\.


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.levels (id, language_id, "order", name, created_at, updated_at) FROM stdin;
019e71d7-71e3-71b8-8003-6b0e9ed89ef9	019e71d6-c6c2-717c-9caa-af2f471cb44c	1	L1	2026-05-29 03:46:45	2026-05-29 03:46:45
019e71e2-45f2-7038-9aa5-7b4bffcdc765	019e71d7-1221-71e7-930e-a5d0643c1c7e	1	L1	2026-05-29 03:58:34	2026-05-29 03:58:34
019e720d-251d-70c9-859b-dbad677ca8bc	019e71d6-c6c2-717c-9caa-af2f471cb44c	2	L2	2026-05-29 04:45:24	2026-05-29 04:45:24
019e720d-5252-70fc-bed5-16a997fd50f2	019e71d6-c6c2-717c-9caa-af2f471cb44c	3	L3	2026-05-29 04:45:36	2026-05-29 04:45:36
019e77fd-ea28-71d0-9d94-a0c18b8a418e	019e71d6-c6c2-717c-9caa-af2f471cb44c	4	L4	2026-05-30 08:26:29	2026-05-30 08:26:29
019e77fe-0aae-73a8-8cbc-ef043131f6ea	019e71d6-c6c2-717c-9caa-af2f471cb44c	5	L5	2026-05-30 08:26:38	2026-05-30 08:26:38
019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	019e71d7-1221-71e7-930e-a5d0643c1c7e	2	L2	2026-05-31 01:22:30	2026-05-31 01:22:30
019e7ba0-396c-7259-99a4-91c443b3e4f4	019e71d7-1221-71e7-930e-a5d0643c1c7e	3	L3	2026-05-31 01:22:38	2026-05-31 01:22:38
019e7ba0-5936-70a6-8841-0b7031b36332	019e71d7-1221-71e7-930e-a5d0643c1c7e	4	L4	2026-05-31 01:22:46	2026-05-31 01:22:46
019e7ba0-90ec-7340-b7e8-a9d7188ce518	019e71d7-1221-71e7-930e-a5d0643c1c7e	5	L5	2026-05-31 01:23:00	2026-05-31 01:23:00
019e7cda-8953-7306-b15b-1df831470d8a	019e71d6-c6c2-717c-9caa-af2f471cb44c	6	L6	2026-05-31 07:05:57	2026-05-31 07:05:57
019e7cda-a2e1-7354-a433-5f119e57ba21	019e71d6-c6c2-717c-9caa-af2f471cb44c	7	L7	2026-05-31 07:06:03	2026-05-31 07:06:03
019e7cda-bf7e-7056-8a29-ecdabcebee69	019e71d6-c6c2-717c-9caa-af2f471cb44c	8	L8	2026-05-31 07:06:11	2026-05-31 07:06:11
019e7cda-d8e8-703f-940a-1d6087ab6dc3	019e71d6-c6c2-717c-9caa-af2f471cb44c	9	L9	2026-05-31 07:06:17	2026-05-31 07:06:17
019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	019e71d6-c6c2-717c-9caa-af2f471cb44c	10	L10	2026-05-31 07:06:26	2026-05-31 07:06:26
019e7ce1-ef8c-71aa-9535-c73a17837d74	019e71d7-1221-71e7-930e-a5d0643c1c7e	6	L6	2026-05-31 07:14:02	2026-05-31 07:14:02
019e7ce2-0839-7023-92f7-dd91960265e2	019e71d7-1221-71e7-930e-a5d0643c1c7e	7	L7	2026-05-31 07:14:08	2026-05-31 07:14:08
019e7ce2-2335-71b3-b1e5-e952362ffcef	019e71d7-1221-71e7-930e-a5d0643c1c7e	8	L8	2026-05-31 07:14:15	2026-05-31 07:14:15
019e7ce2-3737-72c6-bf3f-365b2693356d	019e71d7-1221-71e7-930e-a5d0643c1c7e	9	L9	2026-05-31 07:14:20	2026-05-31 07:14:20
019e7ce2-7c82-7252-971e-b0bf17d42bf5	019e71d7-1221-71e7-930e-a5d0643c1c7e	10	L10	2026-05-31 07:14:38	2026-05-31 07:14:38
019e865e-e466-71a2-88eb-238ba8dd32ab	019e71d6-c6c2-717c-9caa-af2f471cb44c	11	L11	2026-06-02 03:27:06	2026-06-02 03:27:27
019e8660-815c-739c-b143-abbbe4c35c02	019e71d6-c6c2-717c-9caa-af2f471cb44c	12	L12	2026-06-02 03:28:52	2026-06-02 03:28:52
019e8660-a777-734d-9e75-0d5007463fb1	019e71d6-c6c2-717c-9caa-af2f471cb44c	13	L13	2026-06-02 03:29:01	2026-06-02 03:29:01
019e8660-bfce-726a-9b1a-91ed8fa57632	019e71d6-c6c2-717c-9caa-af2f471cb44c	14	L14	2026-06-02 03:29:08	2026-06-02 03:29:08
019e8660-d50d-7278-b630-c3586babcf71	019e71d6-c6c2-717c-9caa-af2f471cb44c	15	L15	2026-06-02 03:29:13	2026-06-02 03:29:13
019e8660-efc4-705c-a666-3dd34556d4f8	019e71d6-c6c2-717c-9caa-af2f471cb44c	16	L16	2026-06-02 03:29:20	2026-06-02 03:29:20
019e8661-0b15-7008-8f4f-e527ea492d4a	019e71d6-c6c2-717c-9caa-af2f471cb44c	17	L17	2026-06-02 03:29:27	2026-06-02 03:29:27
019e8661-212a-71ce-9281-dba09436e383	019e71d6-c6c2-717c-9caa-af2f471cb44c	18	L18	2026-06-02 03:29:32	2026-06-02 03:29:32
019e8661-31a0-7221-b666-2d4327bb2cb5	019e71d6-c6c2-717c-9caa-af2f471cb44c	19	L19	2026-06-02 03:29:37	2026-06-02 03:29:37
019e8661-46ce-7395-8698-7e8833de16bc	019e71d6-c6c2-717c-9caa-af2f471cb44c	20	L20	2026-06-02 03:29:42	2026-06-02 03:29:42
019e8661-9df5-72f2-b377-bc266e7baeac	019e71d7-1221-71e7-930e-a5d0643c1c7e	11	L11	2026-06-02 03:30:04	2026-06-02 03:30:04
019e8661-ac77-72e9-8330-5e9deb107f20	019e71d7-1221-71e7-930e-a5d0643c1c7e	12	L12	2026-06-02 03:30:08	2026-06-02 03:30:08
019e8661-c90a-71e6-bd13-abc26c40b47e	019e71d7-1221-71e7-930e-a5d0643c1c7e	14	L14	2026-06-02 03:30:15	2026-06-02 03:30:15
019e8661-d71d-72ca-88a0-e04c9585e77f	019e71d7-1221-71e7-930e-a5d0643c1c7e	15	L15	2026-06-02 03:30:19	2026-06-02 03:30:19
019e8661-eef9-7300-ac92-1cd27b454749	019e71d7-1221-71e7-930e-a5d0643c1c7e	16	L16	2026-06-02 03:30:25	2026-06-02 03:30:25
019e8661-fc4e-7106-b27c-576f54e8b66a	019e71d7-1221-71e7-930e-a5d0643c1c7e	17	L17	2026-06-02 03:30:29	2026-06-02 03:30:29
019e8662-141b-71a7-8a72-d1965f854414	019e71d7-1221-71e7-930e-a5d0643c1c7e	18	L18	2026-06-02 03:30:35	2026-06-02 03:30:35
019e8662-2583-713a-9e42-56896185f95f	019e71d7-1221-71e7-930e-a5d0643c1c7e	19	L19	2026-06-02 03:30:39	2026-06-02 03:30:39
019e8662-3a3c-73f1-ac0a-a39512236e43	019e71d7-1221-71e7-930e-a5d0643c1c7e	20	L20	2026-06-02 03:30:44	2026-06-02 03:30:44
019e8661-b91d-71d1-ad0a-016d61b5128c	019e71d7-1221-71e7-930e-a5d0643c1c7e	13	L13	2026-06-02 03:30:11	2026-06-02 03:30:54
019e8b75-2405-71d6-b5e8-66088f26b38d	019e71d6-c6c2-717c-9caa-af2f471cb44c	21	L21	2026-06-03 03:09:30	2026-06-03 03:09:37
019e8b75-96fd-7204-a2c8-4feacd4ca269	019e71d7-1221-71e7-930e-a5d0643c1c7e	21	L21	2026-06-03 03:09:59	2026-06-03 03:09:59
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_05_24_094723_create_languages_table	1
5	2026_05_24_095604_create_levels_table	1
6	2026_05_24_095605_create_sentences_table	1
7	2026_05_24_100000_create_subscription_plans_table	1
8	2026_05_24_100100_create_subscriptions_table	1
9	2026_05_24_100200_create_coupons_table	1
10	2026_05_24_100300_create_coupon_redemptions_table	1
11	2026_05_24_100400_create_quiz_sessions_table	1
12	2026_05_24_100500_create_quiz_answers_table	1
13	2026_05_24_100600_create_transactions_table	1
14	2026_05_24_101810_create_personal_access_tokens_table	1
15	2026_05_27_073002_add_toyyibpay_fields_to_subscriptions_table	1
16	2026_05_27_081234_add_member_limit_to_subscription_plans_table	1
17	2026_05_29_170000_add_duration_months_to_subscription_plans_table	2
18	2026_06_03_033145_make_password_column_nullable_in_users_table	3
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
11	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	9c060ac9cf5a7c1fe064f600c46a536065074759edb5448050bcbbb490068de7	["*"]	2026-06-03 05:38:47	\N	2026-06-03 05:38:41	2026-06-03 05:38:47
1	App\\Models\\User	019e73af-7105-714e-8d4f-0658f4579a11	auth-token	dc647bca874cf65378fb8b0a0ec3dc0e05905467bc7b34f8adfded4dca582a49	["*"]	2026-05-29 12:22:24	\N	2026-05-29 12:22:18	2026-05-29 12:22:24
6	App\\Models\\User	019e73af-7105-714e-8d4f-0658f4579a11	auth-token	035b1780f3a236eac31d191986b7275683d22d6c67a45232c2973cc7f50789cf	["*"]	2026-06-05 04:55:03	\N	2026-05-29 12:40:42	2026-06-05 04:55:03
2	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	3f3d3bacb8865ff554cf2d11d73329595f8c3d21107615dc59bd4cad4b25f6e4	["*"]	2026-05-29 12:24:31	\N	2026-05-29 12:23:21	2026-05-29 12:24:31
4	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	0c63baeb4cab74cc1984ec98d0fe4164ad5f1968db670d9dd713baec878ab2ac	["*"]	2026-05-29 20:53:14	\N	2026-05-29 12:29:49	2026-05-29 20:53:14
8	App\\Models\\User	019e7d20-734e-70a4-8324-2e7509ef6c12	auth-token	86e91b4fb3c57e77c55e6ee4a41c9399597102e5cc132eae07f0089734475cee	["*"]	2026-06-09 09:11:58	\N	2026-05-31 08:22:19	2026-06-09 09:11:58
7	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	0a51290771d7c234678c33b96845664ff44dcdc506a2084db916cc56633bfa8e	["*"]	2026-06-11 15:34:06	\N	2026-05-30 08:23:35	2026-06-11 15:34:06
13	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	1224356491ad2fcad81e4f486d97e9c19f181a9aff4b0b77ba073b74b607ddb8	["*"]	2026-06-12 04:31:22	\N	2026-06-04 10:08:42	2026-06-12 04:31:22
14	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	27362fb3ddcd37a342963b50a374ce13a874bf88ade84c541f9618490a5cb35b	["*"]	2026-06-12 09:49:18	\N	2026-06-05 04:55:34	2026-06-12 09:49:18
5	App\\Models\\User	019e73af-7105-714e-8d4f-0658f4579a11	auth-token	37165d6ea872d9241e274a85429794bc041992e13dad412cb0336cf201a53858	["*"]	\N	\N	2026-05-29 12:38:53	2026-05-29 12:38:53
3	App\\Models\\User	019e73af-7105-714e-8d4f-0658f4579a11	auth-token	2e022cb70da1bbfa21463c34a3014851874172f04476b2f66ac36bfe15746fcc	["*"]	2026-05-29 12:40:27	\N	2026-05-29 12:25:24	2026-05-29 12:40:27
9	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	2ab02da3d309be77c7bdf3643bc6abf916c4313dd6579731f204de080dae1712	["*"]	2026-06-01 03:19:54	\N	2026-06-01 00:56:57	2026-06-01 03:19:54
10	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	eaf81626fb574be7ce8664f1c0735493b44ab11207f593f40c636e37777967cd	["*"]	2026-06-03 04:25:34	\N	2026-06-01 03:20:03	2026-06-03 04:25:34
12	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	7812ccd0149d7eb74c1e8d13d899f598cf97e4607cb9be1deccf30300472cc08	["*"]	2026-06-04 07:17:44	\N	2026-06-03 05:39:17	2026-06-04 07:17:44
\.


--
-- Data for Name: quiz_answers; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.quiz_answers (id, session_id, sentence_id, user_answer, is_correct, revealed, answered_at) FROM stdin;
019e73c3-11a6-7002-a1f8-113fca5fddce	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-29 12:43:44
019e73c3-11a8-70bb-ae22-8b432854dae9	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-29 12:43:44
019e73c3-11a9-70f4-85a5-9956f9823f2a	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-29 12:43:44
019e73c3-11ab-71ac-8229-8d3003acf2b9	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-05-29 12:43:44
019e73c3-11ac-7050-9e6b-712a7ce0e100	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-29 12:43:44
019e73c3-11ad-7068-848b-d6ff752d6321	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-29 12:43:44
019e73c3-11af-706b-a9ae-34badafe7a44	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-29 12:43:44
019e73c3-11b0-7083-a1c3-85b4e0df8998	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-05-29 12:43:44
019e73c3-11b1-72da-bec5-2ce6da82c864	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-05-29 12:43:44
019e73c3-11b3-70bd-b669-9ce1f84d60d6	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-29 12:43:44
019e73c3-11b4-7210-8ced-ae0a13e9bdde	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-29 12:43:44
019e73c3-11b5-72cd-a97b-dae23aefdef4	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-29 12:43:44
019e73c3-11b7-7345-9349-e5421d02bdf7	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-29 12:43:44
019e73c3-11b8-72b2-aa47-16617df131c0	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-29 12:43:44
019e73c3-11b9-73a1-9296-199ad1f3cbff	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-05-29 12:43:44
019e73c3-11bb-7391-acbc-3f4d4a1925af	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-29 12:43:44
019e73c3-11bc-709b-af32-b07853fce2e0	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-29 12:43:44
019e73c3-11bd-700c-9539-1ea23485c141	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-29 12:43:44
019e73c3-11bf-7014-bb99-d23ffc709ee0	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-05-29 12:43:44
019e73c3-11c0-7263-a0c8-036f2f6d9c82	019e73c3-11a3-7107-a2dc-f82d97a31f06	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-29 12:43:44
019e73c3-6168-73fc-a571-ca1c7c75ae94	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-29 12:44:04
019e73c3-6169-7164-9287-168179a16631	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-29 12:44:04
019e73c3-616b-7247-8525-740eba8dfb74	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-29 12:44:04
019e73c3-616c-721b-98e9-610927c6b144	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-29 12:44:04
019e73c3-616d-71c0-bdfe-a1db636c841c	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-29 12:44:04
019e73c3-616e-71fd-9d4d-639b9b055792	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-29 12:44:04
019e73c3-6170-7251-a4f7-d691a333af08	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-29 12:44:04
019e73c3-6171-734c-8165-bcac504eadfd	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-29 12:44:04
019e73c3-6172-73c7-ac8d-3204e7d5a5bf	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-05-29 12:44:04
019e73c3-6173-708a-b34a-8fadf484ad0a	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-29 12:44:04
019e73c3-6174-71ed-a9bd-d191a43be964	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-29 12:44:04
019e73c3-6176-7036-8db4-681e822aa475	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-29 12:44:04
019e73c3-6177-73d3-aa79-428125d23a92	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-29 12:44:04
019e73c3-6178-7243-82a7-529ff9956bde	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-29 12:44:04
019e73c3-6179-72b7-b889-5d014885b719	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-29 12:44:04
019e73c3-617a-731b-9541-a60e770d6fac	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-05-29 12:44:04
019e73c3-617b-70b6-8659-e024478379f8	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-29 12:44:04
019e73c3-617c-7049-9bd0-155269363726	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-05-29 12:44:04
019e73c3-617d-70c2-9aaf-e99113fa610e	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-05-29 12:44:04
019e73c3-6166-72fa-8a25-8ba35a0e2030	019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	t	2026-05-29 12:44:04
019e7bf4-5c4f-70b7-bc63-ca26cda68c51	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c51-71e4-99ac-4b095526f6b5	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c52-7220-b8fc-f51ffb6f0f69	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c53-70bf-a058-1ac82581b89d	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c54-7051-a6ca-c748539a6c02	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c56-7059-92e5-7491a3e97a5d	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c57-725b-bd8f-a4f4882334a6	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c58-73d4-8a39-95ce9e30d4e1	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c59-73a8-9dff-557c24818dc4	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c5a-7062-9c8f-f25185c10168	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c5c-72b2-b329-c46030256d8f	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c5d-712a-96df-27af7695d1d7	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c5e-710f-b93b-14fb198e54e2	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c5f-7135-806b-6e9e58719abd	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c60-73ac-9cf4-5f12a6ce6844	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c62-7207-b99d-918a650ccbc4	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c63-7146-9af4-7b9b74c26cb2	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c64-7226-a0a5-d7525c7a082f	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-05-31 02:54:32
019e7bf4-5c4c-70c4-ab9a-6c3f825b941f	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-326b-72db-83f5-77053c15a6f1	welcome	f	f	2026-05-31 02:54:32
019e7bf4-5c4e-7132-bf2f-200383ee0374	019e7bf4-5c49-716f-948e-229576fcecac	019e71e1-327d-739e-b4c9-7e19f212ff0b	i have to go now	f	f	2026-05-31 02:54:32
019e7c04-125a-7202-98e7-fc7f81d4a324	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-05-31 03:11:42
019e7c04-125b-7395-b9b8-2fdb566642bb	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-05-31 03:11:42
019e7c04-125c-72f9-b257-e0d9d1f00372	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-05-31 03:11:42
019e7c04-125d-7027-944a-3c88caa9b961	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-05-31 03:11:42
019e7c04-125f-70c2-86fb-b5dc64736b9d	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-05-31 03:11:42
019e7c04-1260-7178-8e77-8797f20fc348	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-05-31 03:11:42
019e7c04-1261-72d2-8af3-b3c0b30a78ca	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-05-31 03:11:42
019e7c04-1262-73e8-87e9-605264684aba	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-05-31 03:11:42
019e7c04-1264-7358-857b-1f17dc762e89	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-05-31 03:11:42
019e7c04-1265-73f6-a15d-f8cd44b49301	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-05-31 03:11:42
019e7c04-1266-72da-812f-5633bf041b24	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-05-31 03:11:42
019e7c04-1267-73ee-b6dd-c4aa66bbdaf9	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-05-31 03:11:42
019e7c04-1268-72fe-91b7-d710bfeb62dd	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-05-31 03:11:42
019e7c04-126a-727b-9683-93486e0eb540	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-05-31 03:11:42
019e7c04-126b-7178-a8de-1895f6ef610b	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-05-31 03:11:42
019e7c04-1253-7145-9311-a8b0da196654	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im buzzy now	f	f	2026-05-31 03:11:42
019e7c04-1255-71e9-b801-1e74555d1b40	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	t	2026-05-31 03:11:42
019e7c04-1256-7232-ad2c-331435885fa7	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-05-31 03:11:42
019e8323-4248-7199-864c-1ce21da29d59	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:23:06
019e7c04-1257-7102-a07f-6a5a7f1a67b9	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-327e-72b7-9b50-f40528ac67e7	hi, finally you are here	f	f	2026-05-31 03:11:42
019e7c04-1258-72c5-bd9a-10139dacbfac	019e7c04-1250-71f5-ad71-f454c71cdcbe	019e71e1-3278-7246-a23e-10370ffbd291	what do you think	f	f	2026-05-31 03:11:42
019e7c93-a47f-7083-af7e-3c5b89c50f80	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-05-31 05:48:31
019e7c93-a480-7347-8966-aae2f8a1d77e	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-05-31 05:48:31
019e7c93-a482-71ef-96a0-0c7689963871	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-05-31 05:48:31
019e7c93-a483-73de-ac89-6b5dc94a3f3c	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-05-31 05:48:31
019e7c93-a484-70ec-b87d-d528b3edd7ca	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-05-31 05:48:31
019e7c93-a485-702b-ae98-59a997d33a1c	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-05-31 05:48:31
019e7c93-a487-70b6-beb4-833e28d23158	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-05-31 05:48:31
019e7c93-a488-73c2-b3e5-670d0945ae47	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-05-31 05:48:31
019e7c93-a489-7327-ac44-74aa840b015b	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-05-31 05:48:31
019e7c93-a48a-701f-b38c-8fdbf737cd5d	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-05-31 05:48:31
019e7c93-a48c-7122-8b41-4efee57b4879	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-05-31 05:48:31
019e7c93-a48d-72c0-9d69-d529c0e01274	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-05-31 05:48:31
019e7c93-a48e-7337-810e-058662bfc46a	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-05-31 05:48:31
019e7c93-a48f-7077-acda-da256a9a85f7	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-05-31 05:48:31
019e7c93-a491-7190-8f94-e047ae45c56b	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-05-31 05:48:31
019e7c93-a491-7190-8f94-e047aef76531	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-05-31 05:48:31
019e7c93-a493-71b9-b671-89384ccc042b	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-05-31 05:48:31
019e7c93-a494-73f3-bdaf-0bb9be5c3642	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-05-31 05:48:31
019e7c93-a495-72c8-a594-c4c7121318db	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-05-31 05:48:31
019e7c93-a47d-717a-8736-38f57aa2f26b	019e7c93-a479-7259-a661-dc28e5d8ca53	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how are you	t	f	2026-05-31 05:48:31
019e7d20-a2e2-735c-8ac4-2362d8c0355b	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-31 08:22:31
019e7d20-a2e3-73e6-ab6f-4ac7d0816cc4	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-31 08:22:31
019e7d20-a2e4-717c-8877-eb1afd087333	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-31 08:22:31
019e7d20-a2e5-7357-a271-3814e7238f61	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-31 08:22:31
019e7d20-a2e7-7011-883a-bebeec7419b0	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-05-31 08:22:31
019e7d20-a2e8-7131-97f3-e35a83e77eee	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-31 08:22:31
019e7d20-a2e9-708e-b9da-a53c2dd64fc1	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-31 08:22:31
019e7d20-a2ea-7350-8627-1dded25252d2	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-31 08:22:31
019e7d20-a2ec-7341-b3b8-da0302d24b79	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-31 08:22:31
019e7d20-a2ed-71fc-9d15-563b907f79c6	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-05-31 08:22:31
019e7d20-a2ee-71cd-b5d2-960eb626f0cf	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-05-31 08:22:31
019e7d20-a2ef-703d-852c-d20ecff158f4	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-05-31 08:22:31
019e7d20-a2f0-705e-8371-333005b796ea	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-31 08:22:31
019e7d20-a2f1-7220-84b1-387167c31bc5	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-31 08:22:31
019e7d20-a2f3-72a5-a8ee-0b456e258c9b	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-31 08:22:31
019e7d20-a2f4-7055-91e1-1c5721d5a108	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-31 08:22:31
019e7d20-a2dc-728a-83ad-8a811442dadb	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71eb-cf91-7206-a413-ba626f474318	\N	f	t	2026-05-31 08:22:31
019e7d20-a2de-729b-9550-a7c8fea40503	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71ef-d074-71d8-8604-3a676061ba94	Moechtest du jetzt einen Kaffee trinken	f	f	2026-05-31 08:22:31
019e7d20-a2df-70da-93a8-fa1f883a7469	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	t	2026-05-31 08:22:31
019e7d20-a2e0-7050-8dea-456e5e87e0d2	019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e71ef-d06e-715d-8d24-37e223338848	\N	f	t	2026-05-31 08:22:31
019e7d25-5948-7106-9ad5-9e4881329997	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-05-31 08:27:40
019e7d25-594a-70a8-ac99-0d919b84e7e2	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-31 08:27:40
019e7d25-594b-7202-abe6-35e4add8fa66	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-31 08:27:40
019e7d25-594c-7286-b00c-e80d97c664b4	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-31 08:27:40
019e7d25-594d-701b-a4f5-e4eb56524e95	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-31 08:27:40
019e7d25-594f-70ad-8037-afe7e3d831cf	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-31 08:27:40
019e7d25-5950-7040-ac03-e5effca2fef3	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-31 08:27:40
019e7d25-5951-7103-8e2a-0cebea616abe	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-31 08:27:40
019e7d25-5952-731b-b45b-b6a2b2781980	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-31 08:27:40
019e7d25-5953-7239-855f-e53d7b9af2ab	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-31 08:27:40
019e7d25-5955-7376-a547-600632403164	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-05-31 08:27:40
019e7d25-5956-7170-87da-0ecaf8c3f67b	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-31 08:27:40
019e7d25-5957-7158-b25a-62250209cc96	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-31 08:27:40
019e7d25-5959-7309-b402-06fab85e5b34	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-31 08:27:40
019e7d25-595a-71b2-8804-a959b2a61da1	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-31 08:27:40
019e7d25-595b-714a-9d27-8be74b73bb80	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-31 08:27:40
019e7d25-595c-7019-96eb-53c684242e04	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-05-31 08:27:40
019e7d25-595e-728b-ba01-95f302f2db22	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-05-31 08:27:40
019e7d25-5945-715a-99f7-1c385db3935f	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	t	2026-05-31 08:27:40
019e7d25-5947-735d-89df-5aea61386e8c	019e7d25-5942-73e3-858c-f442d5f26c1b	019e71ef-d070-729c-b759-759475f881e4	\N	f	t	2026-05-31 08:27:40
019e7d45-5657-7212-9272-4acd85ea08cd	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-31 09:02:36
019e7d45-5659-7126-826b-a828fb364124	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-31 09:02:36
019e7d45-565a-7113-91cf-f01f906d7351	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-31 09:02:36
019e7d45-565c-7376-ac3f-d7cd623fd31f	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-31 09:02:36
019e7d45-565d-702a-829d-acf02ccb515b	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-31 09:02:36
019e7d45-565f-700b-8b7a-982e2bd8b15a	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-05-31 09:02:36
019e7d45-5660-73cc-89ea-68110df9b33d	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-05-31 09:02:36
019e7d45-5661-706f-a21b-c8d145b14a90	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-05-31 09:02:36
019e7d45-5662-7307-9116-10355b40da14	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-31 09:02:36
019e7d45-5664-7371-b164-e63d7ac03301	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-05-31 09:02:36
019e7d45-5665-723c-a410-3170ae20660c	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-31 09:02:36
019e7d45-5666-7289-9b1a-9c8006e0610c	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-31 09:02:36
019e7d45-5667-70bd-ba60-c9a36db49b90	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-31 09:02:36
019e7d45-5669-7272-a755-97431294099e	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-31 09:02:36
019e7d45-566a-7104-ba75-c96b688fe759	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-31 09:02:36
019e7d45-566b-709e-b477-3838a772e264	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-31 09:02:36
019e7d45-566d-71c3-b673-e8556651f5c7	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-05-31 09:02:36
019e7d45-566e-72c3-9557-5dfe6722e5ac	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-31 09:02:36
019e7d45-566f-7172-9db5-56917a1dbe0d	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-31 09:02:36
019e7d45-5671-71e1-bae3-9f6478a10e06	019e7d45-5654-716e-883d-5c92efd4c4f8	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-31 09:02:36
019e8323-424a-72ab-b52d-6f7e70980327	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:23:06
019e7d47-22e4-7199-9f08-1cc4d85c867c	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba4-8538-7225-8650-67c64c2206fc	\N	f	f	2026-05-31 09:04:34
019e7d47-22e5-7283-b716-c8beb9bb5c6c	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba1-d075-71b5-99b3-c8e610478a91	\N	f	f	2026-05-31 09:04:34
019e7d47-22e6-7126-adb7-882cbfcf8b3e	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba2-c1a3-7268-98cc-78b0170327b2	\N	f	f	2026-05-31 09:04:34
019e7d47-22e7-72b0-8c3c-56e8b3c0442b	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba4-8537-72f1-a0fd-f0ce86e4a5c0	\N	f	f	2026-05-31 09:04:34
019e7d47-22e8-722e-944c-6e1e883121ef	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba3-af30-71e5-b8bc-b36461be0640	\N	f	f	2026-05-31 09:04:34
019e7d47-22ea-721b-acd2-08ffd53bb68a	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba1-d07a-704f-ae4f-013fabe6b0ce	\N	f	f	2026-05-31 09:04:34
019e7d47-22eb-710c-8267-b3ca97d8b3a2	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba3-af2d-7015-b766-7fd4460c2995	\N	f	f	2026-05-31 09:04:34
019e7d47-22ec-713f-b908-2c99f3f1cf92	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba4-8536-70a6-83ec-b654f1c2d40c	\N	f	f	2026-05-31 09:04:34
019e7d47-22dd-721b-a6f0-ce764218c1f6	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba2-c19e-7299-b681-6ef367725490	\N	f	t	2026-05-31 09:04:34
019e7d47-22df-709d-919d-0e7c8d33a5bf	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba1-d078-73d9-9b2e-be0c3b17839f	\N	f	t	2026-05-31 09:04:34
019e7d47-22e0-739b-b690-ce10a8e6769f	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba2-c1a0-718a-80e4-07a09d5920dd	\N	f	t	2026-05-31 09:04:34
019e7d47-22e2-70df-942b-b13ccaeaa75d	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba2-c1a4-72da-abf8-5868a3464bea	\N	f	t	2026-05-31 09:04:34
019e7d47-22ed-72a4-bf90-88ccd12be39e	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba3-af33-72fb-9ac8-9c5c613266f1	\N	f	f	2026-05-31 09:04:34
019e7d47-22ee-73e9-8d9a-d3ee70192490	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba4-8534-7179-9ab5-ab7ba99cda74	\N	f	f	2026-05-31 09:04:34
019e7d47-22f0-7399-9fbb-68aaef27594d	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba4-8539-72e0-af77-dabb5a4e7650	\N	f	f	2026-05-31 09:04:34
019e7d47-22f1-7015-8ee6-60145f6f631b	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba2-c1a1-72b3-ac27-becd0cf5391e	\N	f	f	2026-05-31 09:04:34
019e7d47-22f2-72a7-ab43-e86b41698542	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba3-af32-71e0-ad52-5ddae2aa9158	\N	f	f	2026-05-31 09:04:34
019e7d47-22f3-7345-b4d2-47e80aed61e8	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba1-d07b-705b-b1c0-6962bba22f43	\N	f	f	2026-05-31 09:04:34
019e7d47-22f5-7220-b246-5bfebebdfb72	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba3-af2f-716d-8b79-dac3525698b0	\N	f	f	2026-05-31 09:04:34
019e7d47-22db-72cd-a352-7d5eaeba6147	019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7ba1-d077-72ff-8822-5698665663d7	\N	f	t	2026-05-31 09:04:34
019e7d4a-5cd2-7012-be58-dd56402e7ba4	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cd3-718c-a2e6-6e3707771a11	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cd5-71f9-a52b-9813928b5b0a	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cd6-7148-90a6-c76dcc1dd3e1	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cd8-71c5-9b68-3a844c78e99e	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cd9-7107-96b8-220d87d14167	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cda-71a3-84c0-3548de8bb6f0	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cdb-724f-9596-e66e8e943891	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cdc-734a-af41-2fd82a647289	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cde-732b-922c-f5a38323f036	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-31 09:08:05
019e7d4a-5cdf-722f-a87f-dd1a2f7b0eaf	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce0-70e3-b3bb-2eecdcbb82eb	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce2-7295-97e4-6067e9b1dbf3	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce3-70d2-9b8e-55ed91f6228c	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce4-705b-9c7d-575ac8734765	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce6-71bf-94cb-a6cf8109a23c	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce7-7372-95e1-51fe6cc4f871	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ce8-7103-b343-e26c923b1ba1	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-31 09:08:05
019e7d4a-5ccf-723a-b26c-cb073bbb84bb	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	t	2026-05-31 09:08:05
019e7d4a-5cd1-7141-858b-36b5ccbfeabc	019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	t	2026-05-31 09:08:05
019e7d4e-cd69-71a4-b7c3-f75726d50bc9	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd6a-73c2-8a59-8e4404e0e44f	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd6b-7337-9ead-d0013ea7bb08	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd6d-72e1-9f94-0801ed387297	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd6e-7313-872e-7df6569bf654	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd6f-734e-bebe-5e2b3a8789ac	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd70-716c-98d9-2928653846b3	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd71-7107-8f7e-79931f084bf6	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd73-7327-a048-0a937c09e3e8	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd74-722f-883b-9e995fca7ff9	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd75-704f-9e90-7a5cb1cb9ad1	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd76-73f5-8874-85d4f78d15bf	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd77-716a-a6ad-c9e891563a2c	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd79-72d5-b944-5ee0944d9a56	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd7a-72d6-b1b9-b18c0bdb6ed0	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd7b-714b-bad7-c278250515fd	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd7d-7283-834b-e551f6bca238	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-31 09:12:56
019e7d4e-cd64-73ef-b9ef-37338c16a245	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	t	2026-05-31 09:12:56
019e7d4e-cd66-7101-b9a2-20abfd7451c3	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	t	2026-05-31 09:12:56
019e7d4e-cd67-7127-8f46-58a8434cc4c7	019e7d4e-cd61-73d5-b08f-a395daad5b28	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	t	2026-05-31 09:12:56
019e7d4f-1e0e-7167-b6eb-f1b4c1e6a6b4	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e10-72c6-ab83-49dff3f6116e	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e11-73af-b5be-a41f6400d0ae	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e12-7188-b3fa-4cd7de43bc89	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e14-731e-8856-cb52cfbeb7e3	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e15-7118-8ce0-4d1894e86bf1	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e16-725e-bf80-691b606b645e	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e18-73b2-b5cf-82d30b7c52de	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e19-7142-b583-169c7494d816	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e1a-7040-96c1-14a169093cae	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e1b-72e9-a43e-28c2a9f9d2cc	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e1c-7000-966c-65f65f0be329	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e1e-73f2-b3ef-594075b66bb3	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e1f-722f-848f-deb7bdefc7fc	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-05-31 09:13:17
019e7d4f-1e06-7364-b138-4decc30ebfcc	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71eb-cf90-723d-b039-382d41219cf6	sehr gerne	f	f	2026-05-31 09:13:17
019e7d4f-1e08-73d5-9a02-abe5600b5c5e	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71ef-d070-729c-b759-759475f881e4	\N	f	t	2026-05-31 09:13:17
019e7d4f-1e09-7160-9838-5077d6171720	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	t	2026-05-31 09:13:17
019e7d4f-1e0a-7274-850a-ab7f896ddf72	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71eb-cf91-7206-a413-ba626f474318	\N	f	t	2026-05-31 09:13:17
019e7d4f-1e0c-70b5-9ef4-c8d67758f6b3	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	t	2026-05-31 09:13:17
019e7d4f-1e0d-73de-a4ca-afd75e699c97	019e7d4f-1e03-70bb-8a55-55207196d5da	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	t	2026-05-31 09:13:17
019e80bf-46ae-70e7-90cf-5a42f67f0d32	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-327e-72b7-9b50-f40528ac67e7	hi finally you are here	f	f	2026-06-01 01:14:39
019e80bf-46b1-7044-8256-85100a384148	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-326a-7367-b316-afb7232fe48c	thak you so much	f	f	2026-06-01 01:14:39
019e80bf-46b2-7318-8726-eb4e1a03bc6f	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-327c-71e1-9d58-b2fe6426441a	it is already 1130 pm	t	f	2026-06-01 01:14:39
019e80bf-46b4-73f9-ab13-6e8df9d08524	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-01 01:14:39
019e80bf-46b5-7390-88cc-ba9733e02763	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how are you	t	f	2026-06-01 01:14:39
019e80bf-46b6-70a0-afae-3ea60f32de2e	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-01 01:14:39
019e80bf-46b7-70bf-96d8-44f0c8c16bb2	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-326f-71da-ad92-48800b1c008e	do you understand what i mean	t	f	2026-06-01 01:14:39
019e80bf-46b8-7393-a2bd-254becda4dcb	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-01 01:14:39
019e80bf-46b9-705f-8654-5fc458d4b24c	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-327b-70a4-a7ad-d11703dd3c66	where is my key	t	f	2026-06-01 01:14:39
019e8323-424b-731a-ace7-3ed7a05019aa	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:23:06
019e8323-424d-70ce-b17a-f83ab69863e6	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:23:06
019e8323-424e-7161-acc8-6a410e9233d7	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:23:06
019e8323-4250-72b2-b3d4-b941d1b17bdc	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:23:06
019e8323-4251-733f-b191-72a2e5135dac	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:23:06
019e8323-4252-7130-9b8c-821a25eec956	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:23:06
019e8323-4253-7083-9920-663e757942e7	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:23:06
019e8323-4254-730d-b184-58a208acba37	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:23:06
019e8323-4256-7361-901a-f5c17981d101	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:23:06
019e80bf-46ba-709a-86d8-b35891ceb073	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-326b-72db-83f5-77053c15a6f1	youre welcome	t	f	2026-06-01 01:14:39
019e80bf-46bb-7294-8f9b-defa7708b3a4	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-326c-7287-8e58-6efb81d2293f	oh im so sorry	t	f	2026-06-01 01:14:39
019e80bf-46bd-719e-ab8f-1655567a1959	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-01 01:14:39
019e80bf-46be-70e6-862e-9ee42d1d53ad	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-01 01:14:39
019e80bf-46bf-73cb-b6be-e4fb09a6369c	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3276-7022-9eea-b52898a285bc	alright i have to go now	t	f	2026-06-01 01:14:39
019e80bf-46c0-7297-bdd6-f6d2ca6ec7a9	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-327a-73f4-9a63-092cefb1aabf	im agree	f	f	2026-06-01 01:14:39
019e80bf-46c2-7228-81ec-e4fb8d3a27a2	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3270-72c4-a123-4fd4e2837da1	i dont understand	t	f	2026-06-01 01:14:39
019e80bf-46c3-7202-a2de-9b1c87f35218	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3278-7246-a23e-10370ffbd291	what do you think about this idea	t	f	2026-06-01 01:14:39
019e80bf-46c4-700d-ac75-4444df22783c	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3277-7245-8397-2b95ecf990d9	see you	f	f	2026-06-01 01:14:39
019e80bf-46c5-73c5-a245-69ab1ecfa921	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	fine thank you	t	f	2026-06-01 01:14:39
019e80bf-46c6-7250-90b9-a371d451a1d1	019e80bf-46aa-730b-808e-ae9f6e04b151	019e71e1-326e-708c-8deb-5b611d1fca9b	its okay	t	f	2026-06-01 01:14:39
019e80da-df1e-70f4-8eb2-cd6af9638c60	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how are you	t	f	2026-06-01 01:44:48
019e80da-df20-7369-a134-caf7cce9ddc9	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-326f-71da-ad92-48800b1c008e	do you understand what i mean	t	f	2026-06-01 01:44:48
019e80da-df21-7060-8717-bbcea8b8fc04	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-326e-708c-8deb-5b611d1fca9b	its okay	t	f	2026-06-01 01:44:48
019e80da-df22-7266-b8dd-64e6a1dc3265	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3278-7246-a23e-10370ffbd291	what do you think about this idea	t	f	2026-06-01 01:44:48
019e80da-df23-7027-a2ab-275fca2858ee	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-01 01:44:48
019e80da-df25-70fb-b58f-1e89546cf8d6	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3270-72c4-a123-4fd4e2837da1	i dont understand	t	f	2026-06-01 01:44:48
019e80da-df26-718b-bf87-ea542f800a11	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3276-7022-9eea-b52898a285bc	alright i have to go now	t	f	2026-06-01 01:44:48
019e80da-df27-70f1-8635-25e72bdb0ba8	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3277-7245-8397-2b95ecf990d9	see you later	t	f	2026-06-01 01:44:48
019e80da-df28-7222-883f-296008c7e9bf	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-327a-73f4-9a63-092cefb1aabf	i agree	t	f	2026-06-01 01:44:48
019e80da-df2a-70ae-b5b8-63ad9eebb396	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-326a-7367-b316-afb7232fe48c	thank you so much	t	f	2026-06-01 01:44:48
019e80da-df2b-7130-b8d8-b27d35d0c8ad	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-327d-739e-b4c9-7e19f212ff0b	im going to bed	t	f	2026-06-01 01:44:48
019e80da-df2c-7283-bc1b-e55e08ecf872	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-327e-72b7-9b50-f40528ac67e7	hi you are finally here	t	f	2026-06-01 01:44:48
019e80da-df2d-73c8-ba47-e555dbd7bc58	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-326c-7287-8e58-6efb81d2293f	oh im so sorry	t	f	2026-06-01 01:44:48
019e80da-df2f-720b-89dd-9ebe92a4c046	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3273-7288-ac2e-40fac328fb6d	hey do you want to grab some coffee now	t	f	2026-06-01 01:44:48
019e80da-df30-73b1-b058-cc1a0ef19889	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-327c-71e1-9d58-b2fe6426441a	it is already 1130 pm	t	f	2026-06-01 01:44:48
019e80da-df31-71a6-a9e3-e97131580520	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-326b-72db-83f5-77053c15a6f1	youre welcome	t	f	2026-06-01 01:44:48
019e80da-df32-7215-be47-8c871f12a337	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-327b-70a4-a7ad-d11703dd3c66	where is my key	t	f	2026-06-01 01:44:48
019e80da-df34-7103-8ec3-d3be4785701c	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	fine thank you	t	f	2026-06-01 01:44:48
019e80da-df35-7341-a686-bb760b8d45b1	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-01 01:44:48
019e80da-df36-7205-97b1-869fb29ba587	019e80da-df1b-719f-acfb-570091a3286c	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-01 01:44:48
019e80e2-f309-7021-a68e-af43da789c97	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 01:53:37
019e80e2-f30b-73b4-926c-6416d5d9967b	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 01:53:37
019e80e2-f30c-712d-8fa3-e7228b02e0c1	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 01:53:37
019e80e2-f30e-701b-9f25-fac094acc295	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 01:53:37
019e80e2-f30f-7390-acb9-4c538d466b60	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 01:53:37
019e80e2-f310-709b-83cd-acf4cbf6c6ce	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 01:53:37
019e80e2-f312-7089-b493-35b162ee0148	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 01:53:37
019e80e2-f313-724e-817e-b1ea881808a8	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 01:53:37
019e80e2-f314-7071-b2b8-2502de2af734	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 01:53:37
019e80e2-f316-7190-8a41-2e3bec211c13	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 01:53:37
019e80e2-f317-73e2-8c54-5ff81ec06536	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 01:53:37
019e80e2-f318-7354-856d-ad44262301cf	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 01:53:37
019e80e2-f31a-704b-8bba-43f422d57838	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 01:53:37
019e80e2-f31b-73dc-8ab4-eb3540380267	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 01:53:37
019e80e2-f31c-70f4-adf5-7de9890abee3	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 01:53:37
019e80e2-f31e-708c-969f-1853a08dca8a	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 01:53:37
019e80e2-f31f-712c-bd4c-7230df783d65	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 01:53:37
019e80e2-f320-7334-85bd-99e98c153782	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 01:53:37
019e80e2-f321-7140-98f0-0e75b5ba6509	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 01:53:37
019e80e2-f323-7242-bb0d-678abee7f7b8	019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 01:53:37
019e8131-db3c-7036-a1a5-c6d101168ccd	019e8131-db38-72b8-8dac-c6c65184662f	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 03:19:48
019e8131-db3e-7100-8b8f-7ca4efd4a6ec	019e8131-db38-72b8-8dac-c6c65184662f	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 03:19:48
019e8131-db3f-7071-97e2-985450588320	019e8131-db38-72b8-8dac-c6c65184662f	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 03:19:48
019e8131-db41-70d1-a510-d291c82ea22a	019e8131-db38-72b8-8dac-c6c65184662f	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 03:19:48
019e8131-db42-72a2-b717-3f614e203918	019e8131-db38-72b8-8dac-c6c65184662f	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 03:19:48
019e8131-db43-7107-b021-5b3dfcab4ebc	019e8131-db38-72b8-8dac-c6c65184662f	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 03:19:48
019e8131-db45-7246-bab2-4bc99a5903ce	019e8131-db38-72b8-8dac-c6c65184662f	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 03:19:48
019e8131-db46-7373-a061-b132a6c9b351	019e8131-db38-72b8-8dac-c6c65184662f	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 03:19:48
019e8131-db47-72ac-ba6b-cc55cf529358	019e8131-db38-72b8-8dac-c6c65184662f	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 03:19:48
019e8131-db48-73dd-aa9e-b647a7646966	019e8131-db38-72b8-8dac-c6c65184662f	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 03:19:48
019e8131-db49-7128-ab3f-636faf211214	019e8131-db38-72b8-8dac-c6c65184662f	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 03:19:48
019e8131-db4a-7309-8c47-6acf6845dfee	019e8131-db38-72b8-8dac-c6c65184662f	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 03:19:48
019e8131-db4b-736a-94e6-2581e6d9cc3a	019e8131-db38-72b8-8dac-c6c65184662f	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 03:19:48
019e8131-db4c-7371-845d-a40852b34d99	019e8131-db38-72b8-8dac-c6c65184662f	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 03:19:48
019e8131-db4d-7355-a073-bff94d59e130	019e8131-db38-72b8-8dac-c6c65184662f	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 03:19:48
019e8131-db4f-70f5-8ac6-6711c57f09e7	019e8131-db38-72b8-8dac-c6c65184662f	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 03:19:48
019e8131-db50-730f-afd4-c41a275d69b3	019e8131-db38-72b8-8dac-c6c65184662f	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 03:19:48
019e8131-db51-7150-84cf-4a540c14e203	019e8131-db38-72b8-8dac-c6c65184662f	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 03:19:48
019e8131-db52-731d-a93a-1848b04d87cf	019e8131-db38-72b8-8dac-c6c65184662f	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 03:19:48
019e8131-db54-7341-acd1-3e36b29e5bbe	019e8131-db38-72b8-8dac-c6c65184662f	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 03:19:48
019e8132-2b4a-72fd-9fe1-2c903cbb2c41	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 03:20:09
019e8132-2b4c-731f-9ae1-ba742fa3acb5	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 03:20:09
019e8132-2b4d-7143-9781-c8746e741637	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 03:20:09
019e8132-2b4f-702e-ab25-bfd5226d914f	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 03:20:09
019e8132-2b50-704b-a486-5e404ef516c1	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 03:20:09
019e8132-2b51-73fd-aca3-3e40754196ec	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 03:20:09
019e8132-2b53-73d5-9f34-3f32b5e6b5f4	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 03:20:09
019e8132-2b54-710f-ba76-94894ff8fac2	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 03:20:09
019e8132-2b55-7257-b146-227842cace74	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 03:20:09
019e8132-2b56-7260-afbc-fae0aea272cd	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 03:20:09
019e8132-2b57-7292-87b6-7b017e70a2f6	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 03:20:09
019e8132-2b58-7126-8710-6348b6c211d3	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 03:20:09
019e8132-2b59-72cb-8663-941dfc3e69fd	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 03:20:09
019e8132-2b5b-7173-b922-9d1dae3dd23d	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 03:20:09
019e8132-2b5c-7102-b58b-c70db63347b5	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 03:20:09
019e8132-2b5d-703e-8016-36093ba62f75	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 03:20:09
019e8132-2b5e-7253-8eaa-51d4ae9ddc78	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 03:20:09
019e8132-2b60-7107-91e0-07eb66a40b9b	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 03:20:09
019e8132-2b61-7297-87b4-3914a4b46a6e	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 03:20:09
019e8132-2b62-717b-8f79-cdf8b37aa1cd	019e8132-2b47-7049-91d7-4f27b33f994d	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 03:20:09
019e81db-2975-73da-89e1-881d00f8d414	019e81db-2967-73f7-a304-243be6324fed	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 06:24:44
019e81db-2976-70cf-87bf-2547cfc02f6f	019e81db-2967-73f7-a304-243be6324fed	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 06:24:44
019e81db-2977-7251-8d5f-49d15b79d7ce	019e81db-2967-73f7-a304-243be6324fed	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 06:24:44
019e81db-2979-72bc-baa4-020575221544	019e81db-2967-73f7-a304-243be6324fed	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 06:24:44
019e81db-297a-71f5-b705-4a305b69b56d	019e81db-2967-73f7-a304-243be6324fed	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 06:24:44
019e81db-297b-725b-a4d8-37a260c9a5ca	019e81db-2967-73f7-a304-243be6324fed	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 06:24:44
019e81db-297c-73c4-b024-619151ff3347	019e81db-2967-73f7-a304-243be6324fed	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 06:24:44
019e81db-297d-71c0-9f05-c1391c45114e	019e81db-2967-73f7-a304-243be6324fed	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 06:24:44
019e81db-297f-704a-869a-087477777eff	019e81db-2967-73f7-a304-243be6324fed	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 06:24:44
019e81db-2980-7206-b9a6-e38d22fe1caf	019e81db-2967-73f7-a304-243be6324fed	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 06:24:44
019e81db-2981-72c0-9a34-7d6a3b52ca97	019e81db-2967-73f7-a304-243be6324fed	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 06:24:44
019e81db-2969-7053-8573-e163d3a575c7	019e81db-2967-73f7-a304-243be6324fed	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-01 06:24:44
019e81db-296b-73eb-88de-eda37177e92d	019e81db-2967-73f7-a304-243be6324fed	019e7b92-2869-724f-a3c4-4cbfe8941117	hurry up	t	f	2026-06-01 06:24:44
019e81db-296d-70ff-b0d0-7c37ff8d8bd4	019e81db-2967-73f7-a304-243be6324fed	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-01 06:24:44
019e81db-296e-7248-b317-5173a0689f1c	019e81db-2967-73f7-a304-243be6324fed	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	t	2026-06-01 06:24:44
019e81db-2970-7031-baa1-831e9374bf3e	019e81db-2967-73f7-a304-243be6324fed	019e7b95-30d3-706c-b753-39c2c9cd6e27	i dont know	t	f	2026-06-01 06:24:44
019e81db-2971-7248-bf88-89e90d33edae	019e81db-2967-73f7-a304-243be6324fed	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-01 06:24:44
019e81db-2972-7287-b27e-ba513b093766	019e81db-2967-73f7-a304-243be6324fed	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-01 06:24:44
019e81db-2973-71f8-ae02-afc49ae0b0ae	019e81db-2967-73f7-a304-243be6324fed	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-01 06:24:44
019e81fc-172e-7231-8a07-27878b77bfaf	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 07:00:42
019e81fc-172f-70e5-a360-b27323cd97ff	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 07:00:42
019e81fc-1730-73cb-a3ea-5fb0447a8176	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 07:00:42
019e81fc-1732-70a1-8eab-ad54ef1e8520	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 07:00:42
019e81fc-1733-739a-bcc9-6ab6bc0ea752	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 07:00:42
019e81fc-1734-712a-b180-cbe9660a7691	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 07:00:42
019e81fc-1735-706d-969c-8d6eb28011d3	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 07:00:42
019e81fc-1736-71b9-b467-91b7e336935f	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 07:00:42
019e81fc-1738-70d2-ab65-ed58eb278845	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 07:00:42
019e81fc-1739-724a-9e4f-3b9bf9ff5758	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 07:00:42
019e81fc-173a-7182-b950-00a362fe04ff	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 07:00:42
019e81fc-173b-7220-a272-6b7032a9966f	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 07:00:42
019e81fc-173d-733c-8d20-df86e1e6f657	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 07:00:42
019e81fc-173e-7057-bc52-d957b21211cf	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 07:00:42
019e81fc-173f-7247-893f-be7cc9838b6c	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 07:00:42
019e81fc-1740-7213-8156-61cb2c10f399	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 07:00:42
019e81fc-1742-726b-a188-6b3349376efc	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 07:00:42
019e81fc-172a-7053-9465-b1117b1ffeb5	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-01 07:00:42
019e81fc-172c-73c5-8965-c6317da73c80	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-01 07:00:42
019e81fc-172d-71d9-ac3b-db4774bcc808	019e81fc-1725-70dc-8e47-04c6c40fcc64	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-01 07:00:42
019e8206-4a6d-7072-aeb4-f1e1d3d1b262	019e8206-4a63-704c-bac6-3670fe444541	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-06-01 07:11:50
019e8206-4a6e-7034-a0a4-ad9d5e4a29e4	019e8206-4a63-704c-bac6-3670fe444541	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-06-01 07:11:50
019e8206-4a6f-73fd-9755-16971485ea1c	019e8206-4a63-704c-bac6-3670fe444541	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-06-01 07:11:50
019e8206-4a71-7313-b8a5-d6efdb07b635	019e8206-4a63-704c-bac6-3670fe444541	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-06-01 07:11:50
019e8206-4a72-72c4-8bcf-8fb9b298969b	019e8206-4a63-704c-bac6-3670fe444541	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-06-01 07:11:50
019e8206-4a73-7053-aeb0-d13aba13f4ca	019e8206-4a63-704c-bac6-3670fe444541	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-06-01 07:11:50
019e8206-4a74-7223-8ca9-f17e03a38d1f	019e8206-4a63-704c-bac6-3670fe444541	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-06-01 07:11:50
019e8206-4a75-708d-ac74-e5ec97e8ad95	019e8206-4a63-704c-bac6-3670fe444541	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-06-01 07:11:50
019e8206-4a76-710d-9181-9345bb140170	019e8206-4a63-704c-bac6-3670fe444541	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-06-01 07:11:50
019e8206-4a78-7080-b22d-e17ee9dc9dd9	019e8206-4a63-704c-bac6-3670fe444541	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-06-01 07:11:50
019e8206-4a79-71cf-aae5-1ab5649dd9e3	019e8206-4a63-704c-bac6-3670fe444541	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-06-01 07:11:50
019e8206-4a7a-71aa-a0ab-d88f60e2a911	019e8206-4a63-704c-bac6-3670fe444541	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-06-01 07:11:50
019e8206-4a7b-7262-a594-58ce2c232d6e	019e8206-4a63-704c-bac6-3670fe444541	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-06-01 07:11:50
019e8206-4a7c-716a-a58f-cec042103930	019e8206-4a63-704c-bac6-3670fe444541	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-06-01 07:11:50
019e8206-4a7d-714f-b0a6-16ad36d6c216	019e8206-4a63-704c-bac6-3670fe444541	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-06-01 07:11:50
019e820e-425f-72ff-bb04-3ce388aadf9e	019e820e-425c-7368-b1d6-21bbe500c64a	019e71ef-d073-73e8-b243-ce6e2d57a1cf	hughj	f	f	2026-06-01 07:20:33
019e81db-2974-720e-9c87-c1fb5d2ee159	019e81db-2967-73f7-a304-243be6324fed	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-01 06:24:44
019e8206-4a69-7354-b157-f507683d14b4	019e8206-4a63-704c-bac6-3670fe444541	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	t	2026-06-01 07:11:50
019e8206-4a6a-71f9-a7aa-842121f7bdd2	019e8206-4a63-704c-bac6-3670fe444541	019e71f3-a9a8-713c-ba1e-29e897876c75	hxkz	f	f	2026-06-01 07:11:50
019e8206-4a6c-73b8-941a-2a10a17530ae	019e8206-4a63-704c-bac6-3670fe444541	019e71ef-d074-71d8-8604-3a676061ba94	hsjdhc	f	f	2026-06-01 07:11:50
019e8206-4a65-7378-8991-da4f78934dda	019e8206-4a63-704c-bac6-3670fe444541	019e71ef-d070-729c-b759-759475f881e4	hdjxhx	f	t	2026-06-01 07:11:50
019e8206-4a68-7197-b51a-54cf5bd1c9fa	019e8206-4a63-704c-bac6-3670fe444541	019e71f4-ad1a-7399-ac55-390ae67dfe03	ghgghjh	f	t	2026-06-01 07:11:50
019e820e-4261-73f6-8aa2-9c9da974ac6d	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-06-01 07:20:33
019e820e-4262-725b-aee5-5276a4787c51	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-06-01 07:20:33
019e820e-4263-7368-83bd-64c560e96ff7	019e820e-425c-7368-b1d6-21bbe500c64a	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-06-01 07:20:33
019e820e-4264-739f-86d5-bad0eb71657f	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-06-01 07:20:33
019e820e-4265-70bb-9aa9-ecf76b52a182	019e820e-425c-7368-b1d6-21bbe500c64a	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-06-01 07:20:33
019e820e-4267-7318-b5f9-f9cb7061b6a8	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-06-01 07:20:33
019e820e-4268-72fb-8ec7-0245af3ee9ff	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-06-01 07:20:33
019e820e-4269-739b-b1aa-d78110b0203c	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-06-01 07:20:33
019e820e-426a-7134-9ccb-dd6b50e169c2	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-06-01 07:20:33
019e820e-426c-73e9-bd11-9d5a9428e33f	019e820e-425c-7368-b1d6-21bbe500c64a	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-06-01 07:20:33
019e8323-4257-73f0-93e1-4876955c45c4	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:23:06
019e8323-4258-72cf-8dc6-8dc7ebc7ca66	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:23:06
019e8323-425a-718e-bef0-17cc19192e28	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:23:06
019e8323-425b-734f-874f-3b0204e63541	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:23:06
019e8323-425c-7097-ae80-7806e9360089	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:23:06
019e8323-425d-7226-9e5d-530d2863fe3b	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:23:06
019e8323-425e-71aa-b014-aed454cd7193	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:23:06
019e820e-426d-70c1-84d1-2bc4508ebbcc	019e820e-425c-7368-b1d6-21bbe500c64a	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-06-01 07:20:33
019e820e-426e-7325-b299-f839a6a728a2	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-06-01 07:20:33
019e820e-426f-73d6-a4c3-b31c61471dda	019e820e-425c-7368-b1d6-21bbe500c64a	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-06-01 07:20:33
019e820e-4271-7009-a8c2-0b16265b1091	019e820e-425c-7368-b1d6-21bbe500c64a	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-06-01 07:20:33
019e820e-4272-7364-885b-6388eb89344b	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-06-01 07:20:33
019e820e-4273-71a0-b1cf-4866484d8df9	019e820e-425c-7368-b1d6-21bbe500c64a	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-06-01 07:20:33
019e820e-4274-72d9-9851-ed64ffe1f6de	019e820e-425c-7368-b1d6-21bbe500c64a	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-06-01 07:20:33
019e820e-4275-722b-9af7-f79387249f7b	019e820e-425c-7368-b1d6-21bbe500c64a	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-06-01 07:20:33
019e820e-4276-7386-b561-6d167af45157	019e820e-425c-7368-b1d6-21bbe500c64a	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-06-01 07:20:33
019e8212-3d33-71b7-9ac8-63fb24565964	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 07:24:53
019e8212-3d35-701e-a699-de3854df39af	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 07:24:53
019e8212-3d36-7301-aba9-1c304ebbf5b8	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 07:24:53
019e8212-3d37-7266-bc53-dfc7329936a5	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 07:24:53
019e8212-3d39-7378-bd95-e154a7df8a6e	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 07:24:53
019e8212-3d3a-7107-8c1a-1166f3f0c9e9	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 07:24:53
019e8212-3d3b-710d-afdb-e87ee2965b78	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 07:24:53
019e8212-3d3c-713d-a286-0e8328af6536	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 07:24:53
019e8212-3d3d-7345-bfdd-ab43ebbae0e1	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 07:24:53
019e8212-3d3e-713c-be9c-d74bb229faf3	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 07:24:53
019e8212-3d40-70fc-8612-f67d6baa7fc3	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 07:24:53
019e8212-3d41-7356-a008-80820104ae39	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 07:24:53
019e8212-3d42-7047-8415-72b98ab1168d	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 07:24:53
019e8212-3d43-70f0-b634-7b872da97b8a	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 07:24:53
019e8212-3d44-713b-be81-e29cb5ee470e	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 07:24:53
019e8212-3d45-72c1-931f-9d237fcdbb21	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 07:24:53
019e8212-3d47-71a1-9f6c-77aca7156089	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 07:24:53
019e8212-3d48-7196-a7d4-c1a876d84fcc	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 07:24:53
019e8212-3d49-7296-8fe7-edec8b40b89b	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 07:24:53
019e8212-3d4a-73ad-9625-7719b7aa88a4	019e8212-3d30-72f7-8a92-d70952aabbd6	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 07:24:53
019e8212-52a5-70c6-a303-f0ec17e12d1b	019e8212-52a2-734c-a293-0b120336a013	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 07:24:59
019e8212-52a7-70cf-9e10-cb62cd1e6e89	019e8212-52a2-734c-a293-0b120336a013	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 07:24:59
019e8212-52a9-7156-8766-ac6ef2e678c3	019e8212-52a2-734c-a293-0b120336a013	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 07:24:59
019e8212-52aa-70a3-9ce4-5ac37c17b2bc	019e8212-52a2-734c-a293-0b120336a013	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 07:24:59
019e8212-52ab-7288-be78-5d8bf815ceb0	019e8212-52a2-734c-a293-0b120336a013	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 07:24:59
019e8212-52ac-70ef-82b9-8c6617211fac	019e8212-52a2-734c-a293-0b120336a013	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 07:24:59
019e8212-52ae-7193-8f84-e521746d7ee9	019e8212-52a2-734c-a293-0b120336a013	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 07:24:59
019e8212-52af-739d-a8c5-1c4b55e087a3	019e8212-52a2-734c-a293-0b120336a013	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 07:24:59
019e8212-52b0-7092-b7ac-0c20c935d2d0	019e8212-52a2-734c-a293-0b120336a013	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 07:24:59
019e8212-52b1-734c-8d4b-962e06f361c6	019e8212-52a2-734c-a293-0b120336a013	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 07:24:59
019e8212-52b3-723c-8a4c-09d528178684	019e8212-52a2-734c-a293-0b120336a013	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 07:24:59
019e8212-52b4-7186-8d22-34d5065c8d91	019e8212-52a2-734c-a293-0b120336a013	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 07:24:59
019e8212-52b5-718c-bc70-e3b870749bb9	019e8212-52a2-734c-a293-0b120336a013	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 07:24:59
019e8212-52b6-70ac-bd05-1a305d581fc0	019e8212-52a2-734c-a293-0b120336a013	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 07:24:59
019e8212-52b8-7270-b583-ff19ef99ef89	019e8212-52a2-734c-a293-0b120336a013	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 07:24:59
019e8212-52b9-7358-af26-a33e1d0f3376	019e8212-52a2-734c-a293-0b120336a013	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 07:24:59
019e8212-52ba-734d-a7e8-99f45a799e5a	019e8212-52a2-734c-a293-0b120336a013	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 07:24:59
019e8212-52bb-7296-bf81-ccf013c05434	019e8212-52a2-734c-a293-0b120336a013	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 07:24:59
019e8212-52bd-71a0-9ea7-30a2ae74ad7b	019e8212-52a2-734c-a293-0b120336a013	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 07:24:59
019e8212-52be-7247-8603-9b237f8237d1	019e8212-52a2-734c-a293-0b120336a013	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 07:24:59
019e8323-4260-72fa-b652-76701dae885f	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:23:06
019e8212-bd81-7044-8420-8d4ec6763b3c	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 07:25:26
019e8212-bd82-7006-98b5-271bfe5bb117	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 07:25:26
019e8212-bd83-734c-83ba-d093191b7fee	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 07:25:26
019e8212-bd85-718f-9890-17e3a8aebe50	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 07:25:26
019e8212-bd86-70ae-84fb-6733a7db1a32	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 07:25:26
019e8212-bd87-71e3-88b7-4235e4fcb08a	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 07:25:26
019e8212-bd88-727c-be43-d641ec4c5354	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 07:25:26
019e8212-bd8a-7384-b946-4152d7e9dce2	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 07:25:26
019e8212-bd8b-7201-85b9-ddc22080d9fc	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 07:25:26
019e8212-bd8c-71a3-8891-ba42006893b7	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 07:25:26
019e8212-bd8d-70ab-8186-708ccaa5239d	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 07:25:26
019e8212-bd8f-7014-8509-bddd7e1e58bc	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 07:25:26
019e8212-bd90-730a-bce3-aa43c32fa8b1	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 07:25:26
019e8212-bd91-719f-9493-c97a847f9c5d	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 07:25:26
019e8212-bd93-73c3-94a5-32c2f2f56c38	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 07:25:26
019e8212-bd7b-70db-b052-1271ac466b0e	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b93-72a4-719f-92fd-1bb01f8f151f	bill please	t	t	2026-06-01 07:25:26
019e8219-439a-732f-b325-8a940adf9b35	019e8219-4395-721e-bda1-78406fa20588	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-06-01 07:32:34
019e8219-439c-7301-92fe-c2ad77a74cc9	019e8219-4395-721e-bda1-78406fa20588	019e71ef-d06e-715d-8d24-37e223338848	\N	f	f	2026-06-01 07:32:34
019e8219-439d-7384-bcce-7316a4c5a74a	019e8219-4395-721e-bda1-78406fa20588	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-06-01 07:32:34
019e8219-439e-724c-bab6-6468a1fc4ac5	019e8219-4395-721e-bda1-78406fa20588	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-06-01 07:32:34
019e8219-43a0-7103-a3cf-5155a92d3c25	019e8219-4395-721e-bda1-78406fa20588	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-06-01 07:32:34
019e8219-43a1-7370-8e34-0fcf4c7d6353	019e8219-4395-721e-bda1-78406fa20588	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-06-01 07:32:34
019e8219-43a2-726c-9890-3da0dbf831c7	019e8219-4395-721e-bda1-78406fa20588	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-06-01 07:32:34
019e8219-43a4-7191-a22a-54fcf77e2dbd	019e8219-4395-721e-bda1-78406fa20588	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-06-01 07:32:34
019e8219-43a5-72c3-a44c-ad055184315d	019e8219-4395-721e-bda1-78406fa20588	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-06-01 07:32:34
019e8219-43a6-7117-87be-fb9a8e3e33ae	019e8219-4395-721e-bda1-78406fa20588	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-06-01 07:32:34
019e8219-43a7-734d-a768-47965871874d	019e8219-4395-721e-bda1-78406fa20588	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-06-01 07:32:34
019e8219-43a8-730a-9896-d54600dfb371	019e8219-4395-721e-bda1-78406fa20588	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-06-01 07:32:34
019e8219-43a9-739a-bd3b-e7bda462ef40	019e8219-4395-721e-bda1-78406fa20588	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-06-01 07:32:34
019e8219-43ab-7156-9745-36688e84164a	019e8219-4395-721e-bda1-78406fa20588	019e71eb-cf8e-710c-8318-da485ebe01db	\N	f	f	2026-06-01 07:32:34
019e8219-43ac-71a6-a393-98e24b7a7ab1	019e8219-4395-721e-bda1-78406fa20588	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-06-01 07:32:34
019e8219-43ad-7150-97d3-b553b7a6cd49	019e8219-4395-721e-bda1-78406fa20588	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-06-01 07:32:34
019e8219-43ae-7167-9832-ed90e980a21f	019e8219-4395-721e-bda1-78406fa20588	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-06-01 07:32:34
019e8219-4398-7058-a180-b005d8e7eaf5	019e8219-4395-721e-bda1-78406fa20588	019e71ef-d070-729c-b759-759475f881e4	gdjdhdb	f	f	2026-06-01 07:32:34
019e8212-bd7d-7362-a1bb-999c422ac1e8	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b96-cf85-709a-bd49-da5491997789	what if we go to the beach this weekend	t	f	2026-06-01 07:25:26
019e8212-bd7e-708c-87f0-6d384bad7790	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-01 07:25:26
019e8212-bd7f-738b-ba86-3626a92696f5	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	t	2026-06-01 07:25:26
019e8219-43b0-71e0-81bc-88fc9a2409f9	019e8219-4395-721e-bda1-78406fa20588	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-06-01 07:32:34
019e8219-43b1-70c2-a3ca-753521fb13d1	019e8219-4395-721e-bda1-78406fa20588	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-06-01 07:32:34
019e821a-5b13-72c5-8d88-82c35548f5f4	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 07:33:45
019e821a-5b15-7285-aeb3-e0e25853ab79	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 07:33:45
019e821a-5b16-724a-adb8-eb371977a847	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 07:33:45
019e821a-5b18-73a4-8894-19d3bd2e940d	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 07:33:45
019e821a-5b19-732a-bf27-3f8d95cd8af8	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 07:33:45
019e821a-5b1a-7327-b5a4-235f7357c3ba	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 07:33:45
019e821a-5b1c-7351-bd04-7f821fbff1ed	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 07:33:45
019e821a-5b1d-7009-94ce-cb2ca9828fc7	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 07:33:45
019e821a-5b1e-72a1-9c92-abf096bc39db	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 07:33:45
019e821a-5b20-7356-b7eb-bff1a29aee41	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 07:33:45
019e821a-5b21-73f0-a06f-0a74a5e920c6	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 07:33:45
019e821a-5b22-71bf-8575-a3c5dc4777c4	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 07:33:45
019e821a-5b24-7305-9374-5b491f5d16eb	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 07:33:45
019e821a-5b25-7341-9ae6-1ec5e61650f4	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 07:33:45
019e821a-5b26-7321-9ee2-3314941574f9	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 07:33:45
019e821a-5b28-7033-ab07-249d0dbe51f0	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 07:33:45
019e821a-5b29-7016-af67-fe00acdc7bdb	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 07:33:45
019e821a-5b2a-7398-afbb-3c94f2b99e32	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 07:33:45
019e821a-5b2b-7089-bacb-dc185bfb35e7	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 07:33:45
019e821a-5b2d-730e-9dee-db471474d75d	019e821a-5b10-73c2-95fe-bc64f43978e5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 07:33:45
019e821a-7ee7-71e5-a225-c0cbe375dbae	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 07:33:55
019e821a-7ee9-726b-be84-c736b52a71ba	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 07:33:55
019e821a-7eeb-7016-bd38-f3b6db366795	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 07:33:55
019e821a-7eed-72c9-b4fc-d76607a071f1	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 07:33:55
019e821a-7eee-7314-8a7e-bd513fa84f1d	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 07:33:55
019e821a-7eef-715b-a0e1-d10cc92079c1	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 07:33:55
019e821a-7ef0-7282-894d-c135f7948153	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 07:33:55
019e821a-7ef1-732b-8dbd-4ae522a1fb38	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 07:33:55
019e821a-7ef2-7125-81a7-14e40497f6e7	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 07:33:55
019e821a-7ef3-7049-95ee-134cfb2863da	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 07:33:55
019e821a-7ef5-70f8-86de-cf13cf905f1c	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 07:33:55
019e821a-7ef6-70c7-88b5-792fd10fce4f	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 07:33:55
019e821a-7ef7-7342-87d0-6ca9f921a363	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 07:33:55
019e821a-7ef8-70cb-8c23-9bf32ba81aa5	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 07:33:55
019e821a-7ef9-707a-aa93-eb6833d82516	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 07:33:55
019e821a-7efb-7228-a51e-94d73ad939b8	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 07:33:55
019e821a-7efc-7198-9657-8a002833fa84	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 07:33:55
019e821a-7efd-71f6-aae9-41f2b1ba5258	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 07:33:55
019e821a-7efe-71d9-8e69-4de28ca1394d	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 07:33:55
019e821a-7ee5-725f-b673-c3b274acdfdf	019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e71e1-326c-7287-8e58-6efb81d2293f	up jskdjs	f	f	2026-06-01 07:33:55
019e8212-bd79-7325-808a-ef20774ed248	019e8212-bd76-73fc-9510-8fe9d2752f65	019e7b95-30d2-70b7-8a4a-8380976f5294	do you know where the pos office is	f	t	2026-06-01 07:25:26
019e8237-5a7a-7001-860f-d8a713bad98e	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 08:05:26
019e8237-5a7c-735e-8efc-ded45740b403	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 08:05:26
019e8237-5a7d-705b-a41c-75e86f765062	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:05:26
019e8237-5a7e-7316-a195-f89ea5d4faac	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 08:05:26
019e8237-5a80-70f4-9e8e-e9c26e7adb89	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:05:26
019e8237-5a81-71c4-b357-26ca9d9c3ad3	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 08:05:26
019e8237-5a82-729b-b6b0-28bfb8e65f43	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:05:26
019e8237-5a83-70a7-a670-6f73d25eac7c	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:05:26
019e8237-5a84-7143-a3f2-9c57b56cf906	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:05:26
019e8237-5a86-7395-a94a-7071f6ba16b4	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 08:05:26
019e8237-5a87-707b-8a29-618c9628342a	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 08:05:26
019e8237-5a88-730a-abbe-cad5135ecb1d	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:05:26
019e8237-5a8a-702e-abfe-cb4dafb44e57	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:05:26
019e8237-5a8b-7215-a52c-33be4e7839e1	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:05:26
019e8237-5a8c-7355-a549-b6b8266c270e	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 08:05:26
019e8237-5a8d-7369-9b81-c70651478691	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:05:26
019e8237-5a8e-718c-bc4b-71d6dc603b8a	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:05:26
019e8237-5a90-7024-a53a-7776cc62afdb	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 08:05:26
019e8237-5a91-727f-98b0-f4e366c36b4c	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 08:05:26
019e8237-5a92-7035-b420-b9061bb5293a	019e8237-5a77-738f-a39e-98627209ae04	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:05:26
019e8238-8a33-73ca-bcd2-af9566b76f6d	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 08:06:44
019e8238-8a35-7056-b081-7b0bb2512a78	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 08:06:44
019e8238-8a36-738b-b853-088deb1fa495	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:06:44
019e8238-8a37-733f-98f2-2cc91dcb47e0	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:06:44
019e8238-8a39-716f-b158-9fc6de45543d	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 08:06:44
019e8238-8a3a-72d4-8243-e893891f08f3	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:06:44
019e8238-8a3b-72ef-9cb6-989e5757f555	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:06:44
019e8238-8a3c-712a-aa01-5ac91127aa3d	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 08:06:44
019e8238-8a3e-7136-a36b-16d78118dc6d	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:06:44
019e8238-8a3f-7295-b8d1-54c2abf2e34a	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:06:44
019e8238-8a40-72bd-a8ab-4cf9e8815622	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 08:06:44
019e8238-8a41-70dd-8149-4780452e4551	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:06:44
019e8238-8a43-714b-83f8-72acd60dcf07	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 08:06:44
019e8238-8a44-70d4-ac6f-8457cb143303	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:06:44
019e8238-8a45-72f3-835c-732a6c6f294c	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 08:06:44
019e8238-8a46-7102-98e1-ccb902d2ae2f	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 08:06:44
019e8238-8a48-70a4-b005-38f7e2dfb7e5	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:06:44
019e8238-8a49-72f8-bb3a-21d313e76f0b	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 08:06:44
019e8238-8a4a-7397-922c-4f52045cdfab	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:06:44
019e8238-8a4b-707b-8179-295beae0f136	019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:06:44
019e8323-4261-7171-8163-926b57bf4824	019e8323-4244-7088-8a55-5b63d0e793ce	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:23:06
019e824d-9b83-71e6-aced-7706f2e4b0da	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-01 08:29:44
019e824d-9b84-715e-b115-16183eab8db6	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	t	2026-06-01 08:29:44
019e824d-9b86-70b2-85a2-95c7ce3bb7f2	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-01 08:29:44
019e824d-9b87-70c6-a293-fd7f849d6454	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-01 08:29:44
019e824d-9b8a-70c6-ad43-2e264fe2ba8d	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:29:44
019e824d-9b8b-726b-aa05-5c2aa8613d00	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:29:44
019e824d-9b8c-7246-a8cd-f7af4604c6ee	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 08:29:44
019e824d-9b8d-727b-9b4c-db3873d2716d	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:29:44
019e824d-9b8f-72b8-b4de-ea59868a5a32	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:29:44
019e824d-9b90-734b-88ef-dd7b10bcd9a3	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:29:44
019e824d-9b91-73ea-953a-1b3ad78eff79	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:29:44
019e824d-9b92-7317-952b-60bf04c0d51a	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:29:44
019e824d-9b94-720d-8041-6323414676fc	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:29:44
019e824d-9b95-71d0-8057-538037c8381f	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:29:44
019e824d-9b96-7155-bea0-f6e6999e2a05	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 08:29:44
019e824d-9b98-71ed-ad2f-0a1b9d182bc0	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:29:44
019e824d-9b99-721e-9a94-c530468a01e7	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 08:29:44
019e824d-9b9a-7203-8040-b61f3b22018a	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:29:44
019e824d-9b81-71f6-bfe9-75173024dbf9	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-01 08:29:44
019e824d-9b88-71fe-b5a5-c58d8934c391	019e824d-9b7e-732b-995b-c1705b512bf7	019e71e1-3270-72c4-a123-4fd4e2837da1	i don't understand.	t	f	2026-06-01 08:29:44
019e8251-35b4-70a5-9cec-9efc9607cbe2	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 08:33:40
019e8251-35b5-71d2-bae7-c4a8715b57e7	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:33:40
019e8251-35b7-71ad-8681-2831e83e212d	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:33:40
019e8251-35b8-71b1-98cd-f9665dd4953b	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:33:40
019e8251-35b9-7048-81cb-64b4e1b5fad3	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 08:33:40
019e8251-35bb-7294-a41b-8d1d1b92b57e	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 08:33:40
019e8251-35bc-7188-8522-1c8552e5a54d	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 08:33:40
019e8251-35bd-7065-bc84-02fe14810685	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 08:33:40
019e8251-35be-7352-a592-c23cba9ddd10	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:33:40
019e8251-35c0-7026-9124-f2d7f4a55585	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 08:33:40
019e8251-35c1-7086-a136-8217a066f871	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:33:40
019e8251-35c2-7319-a44a-1da2e2a20401	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:33:40
019e8251-35c4-7170-b52f-92496baaf19c	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:33:40
019e8251-35c5-736c-b0bc-f24443f17495	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 08:33:40
019e8251-35c6-7350-8abf-2b2c7a68467e	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:33:40
019e8251-35c7-7007-a826-3bc1a3578d39	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 08:33:40
019e8251-35c9-738b-911e-b5e7ff4f7d0a	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:33:40
019e8251-35ca-73c5-94f9-9944b747e4d6	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:33:40
019e8251-35cb-707b-9fa5-95738d4c0d23	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:33:40
019e8251-35b2-7362-87a0-2b8fc9a883ae	019e8251-35b0-732a-b08e-7fd560354bc6	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-01 08:33:40
019e8255-c6cc-729b-af22-c8b44dc27d25	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:38:40
019e8255-c6ce-72a2-9c34-70ac0e9fff55	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:38:40
019e8255-c6cf-7032-951b-45cc7bdcd2dc	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:38:40
019e8255-c6d0-706f-86a9-6cf1001392d1	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 08:38:40
019e8255-c6d2-71bd-9f73-0ca60a9ff5de	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 08:38:40
019e8255-c6d3-71f5-aff9-b64f1033875a	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 08:38:40
019e8255-c6d4-7180-abb1-eda32941a96e	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:38:40
019e8255-c6d5-707e-aa08-73a66574bd19	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:38:40
019e8255-c6d6-7369-b430-a298906a7454	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:38:40
019e8255-c6d7-72c6-ba7c-1dc7e9c42e8c	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:38:40
019e8255-c6d8-72e0-9c00-c1eb03559b27	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 08:38:40
019e8255-c6d9-7293-afba-09f6d8edae0b	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:38:40
019e8255-c6da-7371-8aac-63c8f9120e14	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 08:38:40
019e8255-c6dc-719c-a7b7-1abe06ada177	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 08:38:40
019e8255-c6dd-7300-ab32-8af1aa6a4882	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 08:38:40
019e8255-c6de-72f6-bfbd-f2bdfdbba82c	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:38:40
019e8255-c6df-735a-9a84-77d44dfae868	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:38:40
019e8255-c6e0-70e6-8d83-6b321124c126	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 08:38:40
019e8255-c6e2-7359-a60c-976e7cf632b7	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:38:40
019e8255-c6cb-71db-aa44-9e031e92beda	019e8255-c6c8-7399-8863-9a6164d947f8	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-01 08:38:40
019e825a-34a1-71e7-99fd-5b97db6dcb6f	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 08:43:30
019e825a-34a2-7038-9848-0c705b898a70	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:43:30
019e825a-34a4-7393-be65-1be9658ba218	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 08:43:30
019e825a-34a5-7259-ab2f-753cbb263b67	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 08:43:30
019e825a-34a6-736e-aea3-9de4c95e5dce	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 08:43:30
019e825a-34a7-7115-9f17-3cabb1240f41	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:43:30
019e825a-34a9-70da-8e5b-43fc42f4d37d	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:43:30
019e825a-34aa-71c9-95d3-761c3730894e	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:43:30
019e825a-34ab-7299-a098-39ed95d97bc2	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:43:30
019e825a-34ac-72fb-ab83-d2977da3b72d	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:43:30
019e825a-34ae-73c2-b4e3-07b89ff66243	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:43:30
019e825a-34af-7360-af46-9278f3b9b0ad	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 08:43:30
019e825a-34b0-7286-b356-3737593ce436	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:43:30
019e825a-34b1-73be-aa69-630d79019afe	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 08:43:30
019e825a-34b2-72df-9c7b-6c28adcbda90	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:43:30
019e825a-34b4-70b8-a95b-336a57ae9a00	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:43:30
019e825a-34b5-7149-8d67-ea7576d3fe34	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 08:43:30
019e825a-34b6-72cb-9645-e68275555c10	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:43:30
019e825a-349e-73ca-8283-55557661a4cb	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	t	2026-06-01 08:43:30
019e825a-34a0-7335-a576-ef903ed9e4b5	019e825a-349b-7307-901e-cf2a2b3c01f9	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-01 08:43:30
019e825b-bcdf-71ea-9111-bfaa918384e6	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 08:45:10
019e825b-bce1-7246-9f12-ddb28bf9c468	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 08:45:10
019e825b-bce3-72d4-8949-431284d4c1be	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 08:45:10
019e825b-bce4-73fd-8782-5b5d9e51d7bc	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 08:45:10
019e825b-bce6-7065-a802-4f557df93808	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 08:45:10
019e825b-bce7-712a-b755-92d757ac2142	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 08:45:10
019e825b-bce8-70df-961f-d56a80296845	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 08:45:10
019e825b-bcea-73f0-90a1-b794fb1313a5	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 08:45:10
019e825b-bceb-73c5-b5a1-c3085e03be78	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 08:45:10
019e825b-bcec-7061-8bf3-1c42e89e87a2	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 08:45:10
019e825b-bced-7346-b6e0-59f232432249	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 08:45:10
019e825b-bcee-70c4-af25-0ed811531de4	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 08:45:10
019e825b-bcf0-70fb-82d2-e6c658953e1e	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 08:45:10
019e825b-bcf2-715a-aee8-d24058acea61	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 08:45:10
019e825b-bcf3-7113-b696-11c3656dcb7b	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 08:45:10
019e825b-bcf4-709e-b636-75013313e525	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 08:45:10
019e825b-bcf5-72d1-bca3-de2e111a519a	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 08:45:10
019e825b-bcf6-70d6-99d5-d8ff1c8a4afb	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 08:45:10
019e825b-bcf7-7017-a78c-f814184b0c6d	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 08:45:10
019e825b-bcf9-7238-82cc-68fa3da21d86	019e825b-bcdc-7167-9076-def1c5a89815	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 08:45:10
019e8278-5076-73c2-90fd-6ebde3c9c0c4	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:23
019e8278-5078-71a5-ac5e-f41fc661cc69	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:23
019e8278-507a-710f-a5d6-bf40161b64c6	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:23
019e8278-507b-712d-9ed3-d9892c040857	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:23
019e8278-507c-72d5-8cdf-e1a3bdf9b238	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:16:23
019e8278-507e-732c-8b58-1a0f411ce178	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:23
019e8278-507f-71e6-9362-c2f3b22c8a1c	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:23
019e8278-5080-7213-b332-f06f55e96abc	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:23
019e8278-5081-7295-860f-13de6dce52ab	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:23
019e8278-5082-736d-8dee-b77257470489	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:23
019e8278-5084-7172-834c-66c465360e6d	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:23
019e8278-5085-7064-9228-82e65e9bc54a	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:16:23
019e8278-5086-713a-b368-d053262ac6b5	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:23
019e8278-5087-7359-8246-948ab36a1030	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:23
019e8278-5088-70d4-9e02-aa632a975cc0	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:23
019e8278-508a-7121-8b93-e94fd4578e24	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:23
019e8278-508b-73d4-bd4a-4e8be6c41368	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:23
019e8278-508c-7298-8272-e6af06c33bf0	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:23
019e8278-508d-73ac-9cd6-bf54e45c9174	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:23
019e8278-508e-7289-a3f2-acce5cee1391	019e8278-5073-71d4-b401-b670e3f13933	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:23
019e8278-8348-7300-a1b9-262d569edc71	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:36
019e8278-834a-7167-89a8-944f231db554	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:36
019e8278-834b-7202-a786-fb44b3b44921	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:36
019e8278-834d-702c-96e0-060f84248c5e	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:36
019e8278-834e-72ba-b26a-fdbbdb9c305d	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:36
019e8278-834f-73fb-9b12-6a0bf8b771dd	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:36
019e8278-8351-719a-97ef-19157a21bb6d	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:16:36
019e8278-8352-7122-98d8-add11ae8fd9a	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:36
019e8278-8353-70fe-b95d-9c574d51852c	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:36
019e8278-8354-70fc-b1b9-c6474528cc06	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:36
019e8278-8355-7235-9a59-8fc6276b8a87	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:36
019e8278-8356-720c-a42b-08cd858d72aa	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:36
019e8278-8358-7245-9980-7c60c623d1f2	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:36
019e8278-8359-7118-bea8-9441cbbac9ba	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:16:36
019e8278-835a-73bf-a558-e935784b84e9	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:36
019e8278-835b-7117-ac38-573a44aa9ed2	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:36
019e8278-835d-71a9-839f-8a7f8eefe343	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:36
019e8278-835e-7366-82cd-2caa8c287523	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:36
019e8278-835f-73c4-8f5f-3a790956310e	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:36
019e8278-8360-7157-8bce-77f6dedd6567	019e8278-8345-7229-904f-e27fd9b54725	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:36
019e8278-8ad7-7334-a630-82adc1822ba5	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:16:38
019e8278-8ad9-700c-ac35-6a37a93c0a94	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:38
019e8278-8ada-7089-938a-d03647800b58	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:38
019e8278-8adb-7282-9300-f580e339ed00	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:38
019e8278-8add-7384-99a8-5d95f0c8f192	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:38
019e8278-8ade-71af-8acd-50166d0cba10	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:38
019e8278-8adf-7085-a2d2-0055f732e212	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:38
019e8278-8ae0-734e-9d95-6533ab8b16a1	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:38
019e8278-8ae2-7255-bbb8-2b573308e2ab	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:38
019e8278-8ae3-72a0-ac29-cc09d25fa625	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:38
019e8278-8ae4-70bb-b43d-4524962bf7b7	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:16:38
019e8278-8ae5-7098-8419-484dd690525f	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:38
019e8278-8ae7-725f-8512-51f282fae9e6	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:38
019e8278-8ae8-73a7-9aae-d0dc8d572836	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:38
019e8278-8ae9-720f-8082-d4ac80b96ed5	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:38
019e8278-8aea-73f5-9528-012148cd0bbc	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:38
019e8278-8aeb-70dd-8391-adb632f405d0	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:38
019e8278-8aed-70e0-929c-66544bdf1b3f	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:38
019e8278-8aee-737f-acb9-4c5075ff089b	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:38
019e8278-8aef-727f-a771-20f217001bee	019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:38
019e8278-90c8-719f-9561-7b0d46091751	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:40
019e8278-90ca-72e3-875c-dc581b82b2e0	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:40
019e8278-90cb-72e8-bb1d-a447d7639624	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:40
019e8278-90cd-702d-bab0-83b80d9f7f78	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:16:40
019e8278-90ce-7325-8b1c-6e1939a556b9	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:40
019e8278-90d0-704e-89ee-896bfb84144b	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:40
019e8278-90d1-720b-b4ab-3db11c21fc8e	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:40
019e8278-90d2-7123-bd99-e93fe52143c5	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:40
019e8278-90d3-72f4-b005-6fa30ae5d967	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:40
019e8278-90d5-7321-8e62-5b728fef6f81	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:40
019e8278-90d6-71b1-84e7-3f14f59d7502	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:40
019e8278-90d7-72da-8d77-43bf3c2bb89c	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:16:40
019e8278-90d8-7362-be3b-f01a4e0e3640	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:40
019e8278-90d9-72f6-aa24-51bcdc32c067	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:40
019e8278-90db-73cd-a70f-363169281c3d	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:40
019e8278-90dc-73a1-993e-1ead5ac7c66e	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:40
019e8278-90dd-7228-89a2-a9ce555b3972	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:40
019e8278-90de-711d-8a2f-8367d69f8161	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:40
019e8278-90e0-70f8-bd7f-d5adb4cccaba	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:40
019e8278-90e1-702c-9e62-7c7914c9dd7f	019e8278-90c5-71cb-a713-41830447f99c	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:40
019e8278-b40e-70e1-bc91-d67bd9725579	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:49
019e8278-b40f-722e-b314-f5b60638da21	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:49
019e8278-b411-70ee-807e-d2271cb9b3ef	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:49
019e8278-b412-72ed-9011-fd5194c47042	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:49
019e8278-b413-70f4-8fa6-adb1b5d68aea	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:49
019e8278-b415-7239-b3c4-c8476308bef5	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:49
019e8278-b416-7216-97e0-ad1c7a68873f	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:16:49
019e8278-b417-729f-ae44-e50c074d1872	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:49
019e8278-b419-729a-a5c5-ee1ca3047101	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:49
019e8278-b41a-7149-95eb-7e8038c80bae	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:49
019e8278-b41b-714f-9735-43a8d49c9abf	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:49
019e8278-b41c-71fc-a985-0e9fb02c4636	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:49
019e8278-b41e-727a-bcd5-d040ff6eb971	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:49
019e8278-b41f-7070-b1ea-c00d95d5a9df	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:49
019e8278-b420-7244-979b-057d16fb5a2e	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:49
019e8278-b421-72f2-acfd-b870b4bc2fba	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:49
019e8278-b423-70da-bc8f-45b7a482a8d9	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:49
019e8278-b424-70b3-9c31-4b8fb89e882d	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:16:49
019e8278-b425-7299-a58a-088c74818d71	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:49
019e8278-b426-73a7-9855-9eb321481762	019e8278-b40b-73c4-ad79-b66cf3741318	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:49
019e8278-bd51-70ca-ac15-b15c87e40c50	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:16:51
019e8278-bd52-7004-955b-d1dc8f651da4	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:51
019e8278-bd54-73bc-8ff9-a2d1079f7ea4	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:51
019e8278-bd55-7392-86b8-04539483b23b	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:51
019e8278-bd56-71e1-b5ca-028a6cceaf2b	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:51
019e8278-bd57-7357-9a06-2bba9f477e4d	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:51
019e8278-bd59-72c0-bc76-f4350a128eee	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:51
019e8278-bd5a-71e6-a3f8-2cb6d52336f1	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:51
019e8278-bd5b-71a5-8bfe-3a18367bd138	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:51
019e8278-bd5c-73e6-b7b0-5f6f3ce96214	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:51
019e8278-bd5d-7380-90cd-05bf812f2ebc	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:51
019e8278-bd5f-71c4-ac95-8e127d583c15	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:51
019e8278-bd60-7371-a538-2f04280b3067	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:51
019e8278-bd61-700d-a43e-b628246f97e0	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:51
019e8278-bd63-72db-88d1-e81e91792552	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:51
019e8278-bd64-70a6-8dae-498866cecd91	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:51
019e8278-bd65-72fd-be4f-f6ef063f7caa	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:51
019e8278-bd66-731d-ba3f-35cce40af7dc	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:51
019e8278-bd67-7392-88c2-fbc2580cfaad	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:51
019e8278-bd4f-72d4-a9f9-1ac86b8bf9ac	019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-01 09:16:51
019e8278-d66a-70ba-a5a1-598322fcb069	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:16:57
019e8278-d66c-7119-96e9-558ebf17f519	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:16:57
019e8278-d66d-7151-b967-5c6540bcbd10	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:16:57
019e8278-d66e-719c-9606-b2167b6f17d6	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:16:57
019e8278-d670-720e-ba95-6ba996074ea2	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:16:57
019e8278-d671-710c-a58a-13e4c2f8932a	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:16:57
019e8278-d672-70af-acdf-c5aaba639525	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:16:57
019e8278-d674-71f1-86e7-ac50211d0678	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:16:57
019e8278-d675-73c0-a7f8-52dae2532481	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:16:57
019e8278-d676-70b6-bda3-f17aa8f31eca	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:16:57
019e8278-d677-72d7-b8d8-f422f0d28ddd	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:16:57
019e8278-d679-70aa-ad04-43dc436e9aaa	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:16:57
019e8278-d67a-7176-9eb0-f19525c63253	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:16:57
019e8278-d67b-71d4-a3bb-abe54ec578e2	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:16:57
019e8278-d67c-73f4-9782-cd7c8450e1fd	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:16:57
019e8278-d67e-7105-88eb-c6dd4d0b1583	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:16:57
019e8278-d67f-73ce-820d-de71882a7775	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:16:57
019e8278-d680-7362-a356-917b4ce00553	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:16:57
019e8278-d681-716e-bfff-b17b5bd6a476	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:16:57
019e8278-d668-735a-8ac0-2b6bffc20bc6	019e8278-d665-72e2-978c-a8afd7ebe2f5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-01 09:16:57
019e827a-fb12-7129-8e1f-9fb1ced89d28	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:19:18
019e827a-fb13-71f6-9a3f-7f84ab441b69	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:19:18
019e827a-fb15-72ab-92b7-3c8d98838ac5	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:19:18
019e827a-fb16-73e0-8a5b-9e43ababf64b	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:19:18
019e827a-fb17-71bd-9a55-507cf095af86	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:19:18
019e827a-fb18-73ed-9aa3-68f39341dd9b	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:19:18
019e827a-fb1a-7321-8d2c-f17c8829f799	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:19:18
019e827a-fb1b-713c-b628-db167b62135b	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:19:18
019e827a-fb1c-7065-bfaf-38c474bced07	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:19:18
019e827a-fb1d-7038-bd89-7b696cf88f5d	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:19:18
019e827a-fb1e-7305-8fef-4cd7861f4ec4	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:19:18
019e827a-fb20-73ae-afef-3d0f3fbadf12	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:19:18
019e827a-fb21-7303-95b6-aa000cebd215	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:19:18
019e827a-fb22-7243-ab7c-ae9cb3064eb8	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:19:18
019e827a-fb23-70f5-acae-e97ac2939fde	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:19:18
019e827a-fb24-70a0-a5cd-b0d1842b8151	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:19:18
019e827a-fb25-72b5-9123-024d9895206a	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:19:18
019e827a-fb27-72ad-8b1a-3b191866947b	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:19:18
019e827a-fb28-70c8-bde7-ce3fd212127e	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:19:18
019e827a-fb10-705d-999a-748721854af9	019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-01 09:19:18
019e827b-0d1b-7023-8058-4666dd5e404a	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:19:22
019e827b-0d1c-734b-98c5-29db498e7464	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:19:22
019e827b-0d1e-71ed-92a6-c9a864bb0166	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:19:22
019e827b-0d1f-733f-a142-990bdae64668	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:19:22
019e827b-0d20-71a8-a319-54b18789f326	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:19:22
019e827b-0d22-72ad-ba04-e5349d007ba3	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:19:22
019e827b-0d23-706e-9fc5-aae4036016a4	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:19:22
019e827b-0d24-73d3-a5ef-c74acff8ffbe	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:19:22
019e827b-0d25-71df-9425-6d9269292501	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:19:22
019e827b-0d26-709f-bf24-88f3a05053e7	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:19:22
019e827b-0d27-7236-bbbb-3d206f9127cb	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:19:22
019e827b-0d29-73c0-b4c0-eda5cb840980	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:19:22
019e827b-0d2a-73a8-93e8-39564501474f	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:19:22
019e827b-0d2a-73a8-93e8-395645e8e727	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:19:22
019e827b-0d2c-722e-a921-4c5424632216	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:19:22
019e827b-0d2d-7287-8b44-c23daa2cacc8	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:19:22
019e827b-0d2e-7399-97ef-39162fd13f4f	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:19:22
019e827b-0d2f-70e0-af1f-a9d8bf677d0e	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:19:22
019e827b-0d30-7225-8b94-d14fdd5690fd	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:19:22
019e827b-0d19-7200-b519-eab55e387bb8	019e827b-0d16-70ed-8491-4f0d086b9ae9	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-01 09:19:22
019e827b-49e6-7143-9f0d-d6b793aa0d2b	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:19:38
019e827b-49e8-71d1-b3d7-c63548f44e5b	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:19:38
019e827b-49e9-7291-8481-d0bb8b694b6f	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:19:38
019e827b-49ea-7008-b830-131ceeb460ae	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:19:38
019e827b-49eb-7081-a16d-3ac13188387a	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:19:38
019e827b-49ec-723b-b792-2e058df87932	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:19:38
019e827b-49ee-7077-9396-c5c456b11e48	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:19:38
019e827b-49ef-71b8-b4e8-4e62efe97a5a	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:19:38
019e827b-49f0-736f-b82d-630efa44b7d9	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:19:38
019e827b-49f1-7075-b0ca-ad3982523fe5	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:19:38
019e827b-49f3-71a2-962c-2125a785fc57	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:19:38
019e827b-49f4-7035-9c0a-9f5bef22e4aa	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:19:38
019e827b-49f5-717e-9791-11f596312d30	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:19:38
019e827b-49f6-7064-8f3d-0f420da4ed98	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:19:38
019e827b-49f7-7299-bc43-61eef504d498	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:19:38
019e827b-49f9-7041-a91a-1415c88876a1	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:19:38
019e827b-49fa-72bc-886b-06e6a20fbe93	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:19:38
019e827b-49fb-722c-af9c-a4c855564a47	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:19:38
019e827b-49fc-7057-ba1a-26413b3c96a8	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:19:38
019e827b-49fd-73de-b715-263c273899ba	019e827b-49e2-7285-bf0d-b1d97d77033a	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:19:38
019e827d-fb5a-7030-9df1-9feb6771b936	019e827d-fb54-7322-8666-404778194696	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:22:34
019e827d-fb5b-71d8-9232-ee4e690ff61b	019e827d-fb54-7322-8666-404778194696	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:22:34
019e827d-fb5c-7283-af33-d9364f54b100	019e827d-fb54-7322-8666-404778194696	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:22:34
019e827d-fb5d-7305-be10-21da540f2e8d	019e827d-fb54-7322-8666-404778194696	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:22:34
019e827d-fb5f-7002-8b97-ca9c94189552	019e827d-fb54-7322-8666-404778194696	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:22:34
019e827d-fb60-70ac-a006-1e89f04c3f65	019e827d-fb54-7322-8666-404778194696	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:22:34
019e827d-fb61-72ab-a139-59f8a0b56394	019e827d-fb54-7322-8666-404778194696	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:22:34
019e827d-fb62-7163-8776-5bc479eba6b5	019e827d-fb54-7322-8666-404778194696	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:22:34
019e827d-fb63-73db-8e6e-841c7e3becc0	019e827d-fb54-7322-8666-404778194696	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:22:34
019e827d-fb64-7319-ae38-b8aa638c7b94	019e827d-fb54-7322-8666-404778194696	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:22:34
019e827d-fb66-706e-9e10-aff152a89f3d	019e827d-fb54-7322-8666-404778194696	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:22:34
019e827d-fb67-7024-b639-72758088ffbb	019e827d-fb54-7322-8666-404778194696	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:22:34
019e827d-fb68-7376-b2d5-cc29de6efa46	019e827d-fb54-7322-8666-404778194696	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:22:34
019e827d-fb69-737a-8d45-2d12499c41f6	019e827d-fb54-7322-8666-404778194696	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:22:34
019e827d-fb6a-7265-85f2-81fe29a4f968	019e827d-fb54-7322-8666-404778194696	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:22:34
019e827d-fb6b-70d4-99b9-4890463fe35a	019e827d-fb54-7322-8666-404778194696	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:22:34
019e827d-fb6c-7304-bbcf-acaee694c51c	019e827d-fb54-7322-8666-404778194696	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:22:34
019e827d-fb6d-708b-bd5f-e2ad6f3048f9	019e827d-fb54-7322-8666-404778194696	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:22:34
019e827d-fb57-7180-9708-10db5472a3ad	019e827d-fb54-7322-8666-404778194696	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-01 09:22:34
019e827d-fb58-73a5-a379-d402752ca2e1	019e827d-fb54-7322-8666-404778194696	019e71e1-327a-73f4-9a63-092cefb1aabf	bdnndnndjd	f	f	2026-06-01 09:22:34
019e8290-6355-7125-b151-36878beaa065	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:42:41
019e8290-6357-730f-b8a0-b4a1fee40aff	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:42:41
019e8290-6358-73e3-8ece-377d3d55c418	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:42:41
019e8290-635a-738d-bd7d-8c75a905de94	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:42:41
019e8290-635b-72ce-a90c-2a1b93822f7c	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:42:41
019e8290-635c-7063-b157-81f405511c13	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:42:41
019e8290-635d-73e5-85dc-13e6e9744893	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:42:41
019e8290-635e-7306-8f45-ebec2d8202e9	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:42:41
019e8290-635f-71ef-8cf3-5ac62c05eadd	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:42:41
019e8290-6360-727a-a413-3faecdc29fc8	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:42:41
019e8290-6361-7340-a211-818185e205cc	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:42:41
019e8290-6362-735f-81d2-9e1703d039a1	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:42:41
019e8290-6364-7181-9bb8-66e183fbde62	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:42:41
019e8290-6365-725d-9a07-ea032e9d3b3e	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:42:41
019e8290-6366-736b-9f22-345b443a37f1	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:42:41
019e8290-6367-72c8-825f-d8d959ee3701	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:42:41
019e8290-6368-7001-a23e-00c2e8f9d856	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:42:41
019e8290-6369-70ec-8d1d-2499c30e166c	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:42:41
019e8290-636b-70ee-b51d-e0afc4e04b74	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:42:41
019e8290-6354-7148-bad2-b1a773ecd066	019e8290-6350-7061-80ab-b89b95dadc97	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-01 09:42:41
019e8290-db6b-70b0-bf2f-5162496e1103	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:43:11
019e8290-db6c-70ec-a5af-2a08eb0a7d2f	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:43:11
019e8290-db6e-71f4-8dff-c93156735bdb	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:43:11
019e8290-db6f-7062-ba42-87178ae15c25	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:43:11
019e8290-db70-703e-aa5b-13ef0e2255a5	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:43:11
019e8290-db71-70b9-a780-52b772b84396	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:43:11
019e8290-db72-73a8-a121-b6f3aebfaf1f	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:43:11
019e8290-db73-7221-ab7c-62c559888a2a	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:43:11
019e8290-db74-73e3-8fec-64f4aaac0a0b	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:43:11
019e8290-db75-7221-bef5-6a257b9fb123	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:43:11
019e8290-db69-724b-8a8b-7433f88a648a	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-01 09:43:11
019e8324-3471-719c-be58-26c71fb3d8c6	019e8324-3468-7132-8090-721db3e72153	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-01 12:24:08
019e8324-3472-701d-b797-18eff830992d	019e8324-3468-7132-8090-721db3e72153	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	t	2026-06-01 12:24:08
019e8290-db76-70f6-84dd-3520f123ce11	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 09:43:11
019e8290-db78-7271-b959-1381011b067e	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:43:11
019e8290-db79-735a-b4bc-aca666c3eebf	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:43:11
019e8290-db7a-72bb-8f03-6ec6e60750df	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:43:11
019e8290-db7b-7346-9a9c-60153d3cb5da	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:43:11
019e8290-db7c-7120-b0c3-b807a8cb81c7	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:43:11
019e8290-db7d-73b5-b930-b167c531a6b8	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:43:11
019e8290-db7f-73f7-9489-18b17b1e7c58	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:43:11
019e8290-db80-7106-a78e-c29aa21843ca	019e8290-db66-7238-9545-fbb48b5d1dd6	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:43:12
019e8297-61ee-723d-b020-b2a60548efc9	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 09:50:19
019e8297-61ef-712f-9557-c35fe7d12d30	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 09:50:19
019e8297-61f0-73d5-bb44-7f80609ad0a4	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 09:50:19
019e8297-61f1-7252-9f1f-6f8f7d1475ab	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 09:50:19
019e8297-61f3-731c-86cf-79ec607d8ccd	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 09:50:19
019e8297-61f4-7127-a9a0-5f398a3f930c	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 09:50:19
019e8297-61f5-723b-ab2d-44e35eb95ccc	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 09:50:19
019e8297-61f6-724c-8d01-a2c2a42a9bef	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 09:50:19
019e8297-61f8-72da-ad38-3871b7f80356	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 09:50:19
019e8297-61f9-73f0-b225-a1fb824510fc	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 09:50:19
019e8297-61fa-73a1-9268-fa0f19c97f85	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 09:50:19
019e8297-61fb-72e7-b80c-c97f660ee6bc	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 09:50:19
019e8297-61fc-7389-aa64-b0cc7728d848	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 09:50:19
019e8297-61fe-73bd-bfd5-5ed0bc93ae76	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 09:50:19
019e8297-61ff-72eb-aba2-47234b91cfce	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 09:50:19
019e8297-6201-7000-8820-79f5b1618944	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 09:50:19
019e8297-6202-7144-8523-b07f9da3ff65	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 09:50:19
019e8297-6203-72fd-95c8-6ac9a39718f2	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 09:50:19
019e8297-6205-726b-a537-88a3180bdeb9	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 09:50:19
019e8297-61ec-7342-9fa7-e6f614089101	019e8297-61e8-723f-854e-24bbc3f98e51	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-01 09:50:19
019e82a1-9089-717d-8ec0-d640e6e4595e	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:01:26
019e82a1-908b-73bf-be5f-ed7eb3b02b09	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:01:26
019e82a1-908c-73aa-90e1-a0b8caf3c29f	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:01:26
019e82a1-908d-7274-9ae0-6691162c9a1e	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:01:26
019e82a1-908e-71e5-99ef-e61ea05ff44e	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:01:26
019e82a1-9090-712a-a240-7b4ba6c83888	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:01:26
019e82a1-9091-71d8-b7be-2c7038df5c25	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:01:26
019e82a1-9092-7129-904c-8a1b0b3c9922	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:01:26
019e82a1-9093-702f-ba31-baa01835e1cb	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:01:26
019e82a1-9094-7182-b017-4625b079b29e	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:01:26
019e82a1-9095-7108-865f-dabb6ad80981	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:01:26
019e82a1-9097-7254-a166-03f25aa3a9eb	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:01:26
019e82a1-9098-738d-aea5-30b98df29cde	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:01:26
019e82a1-9099-718a-b5a4-c43ffeb918d7	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:01:26
019e82a1-909a-72af-9eee-18d9edc6a33d	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:01:26
019e82a1-909c-734e-b1b9-e3d7edc79720	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:01:26
019e82a1-909d-721d-9bdc-e9f59e437f93	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:01:26
019e82a1-909e-7004-9c15-5156c69d0cf6	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:01:26
019e82a1-909f-7286-9eb1-87540a7555c9	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:01:26
019e82a1-90a0-720d-bb58-67b23ff5eec2	019e82a1-9086-71be-9fdc-4fcd86d00425	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:01:26
019e82a1-a6f6-7390-9cf2-0b1f43cfd984	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:01:32
019e82a1-a6f7-71f8-9955-2975c8089274	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:01:32
019e82a1-a6f9-70a1-8423-20a768a2ec4c	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:01:32
019e82a1-a6fa-70de-9219-c9af18d85c98	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:01:32
019e82a1-a6fb-71d1-927d-0ba7a9b12f41	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:01:32
019e82a1-a6fd-72d3-bb1c-b341492bd9d6	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:01:32
019e82a1-a6fe-71db-b934-ddcc1afa1033	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:01:32
019e82a1-a6ff-7000-9b7b-65e55f2f9d8e	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:01:32
019e82a1-a700-7180-a043-9a293860658a	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:01:32
019e82a1-a702-7055-8172-ecb149873f93	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:01:32
019e82a1-a703-73a6-9466-73be01fad32e	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:01:32
019e82a1-a704-72c0-b7a6-9e98e5205297	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:01:32
019e82a1-a705-711e-ba3b-a7e9169f71ec	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:01:32
019e82a1-a707-7377-b5f0-a21a3f5c9278	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:01:32
019e82a1-a708-725f-977f-b5b4d2848010	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:01:32
019e82a1-a709-723f-9fc9-6b314ed2e26d	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:01:32
019e82a1-a70a-70fb-826e-165996ee524c	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:01:32
019e82a1-a70c-7197-bb9d-257c549db71f	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:01:32
019e82a1-a70d-7005-81f4-9c014a70134e	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:01:32
019e82a1-a6f4-705d-9ec1-a196eae4236d	019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-01 10:01:32
019e82a1-e871-72d3-bd2a-b0f0b027132b	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:01:49
019e82a1-e872-738b-be1f-d7858f7ac525	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:01:49
019e82a1-e874-73e0-93d4-cac62cccc219	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:01:49
019e82a1-e875-7213-8f60-bc386071531f	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:01:49
019e82a1-e876-72ba-9225-aac7e052380b	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:01:49
019e82a1-e877-7141-8116-5bc0f7bcc3b1	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:01:49
019e82a1-e878-7363-94a3-23fed799d22a	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:01:49
019e82a1-e879-71fd-93b5-534c3bcb42cf	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:01:49
019e82a1-e87b-7260-bf4e-0c7817a21005	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:01:49
019e82a1-e87c-708c-b58f-4a0a3f5db3ef	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:01:49
019e82a1-e87d-7314-af4b-4b4e4b7f9b4e	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:01:49
019e82a1-e87f-7281-a8b6-6bef809424e1	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:01:49
019e82a1-e880-717b-b924-ce0c1f3bf204	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:01:49
019e82a1-e881-73f5-bcfa-a1d446be56f2	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:01:49
019e82a1-e882-73d9-9de0-f18de1e8ae2e	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:01:49
019e82a1-e86e-7276-8599-120e1d4c85d3	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-01 10:01:49
019e82a1-e870-7034-9022-2310d3890cb1	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	t	2026-06-01 10:01:49
019e8324-3474-70f4-b786-b811dcd9dc0b	019e8324-3468-7132-8090-721db3e72153	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-01 12:24:08
019e82a1-e883-71a1-b9ef-dc8fc1683a8f	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:01:49
019e82a1-e884-7034-b96a-5a58fdb6a678	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:01:49
019e82a1-e885-71d4-8adc-f9a440536958	019e82a1-e86b-72a2-a4a3-b814fe111424	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:01:49
019e82b4-52d9-71e2-9c78-c4e1730b298d	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:21:56
019e82b4-52db-70dc-903e-a2298b025061	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:21:56
019e82b4-52dc-72e8-9a3e-e760d25db377	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:21:56
019e82b4-52dd-7333-8992-a1e26bff45d3	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:21:56
019e82b4-52de-702d-9dd4-4dce86ccce89	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:21:56
019e82b4-52e0-71b6-9d7e-52ba34e71d03	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:21:56
019e82b4-52e1-7152-891b-10bba6928f1e	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:21:56
019e82b4-52e2-739b-b2af-0d2549396706	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:21:56
019e82b4-52e3-7376-aab0-354c497fa37f	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:21:56
019e82b4-52e5-73df-8491-333ed7858628	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:21:56
019e82b4-52e6-723c-9039-85cb1382e6dc	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:21:56
019e82b4-52e7-70fb-a4d7-42bdcf04420d	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:21:56
019e82b4-52e9-72c2-9722-c6de245f1e29	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:21:56
019e82b4-52ea-70d6-9707-cf1164da67f8	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:21:56
019e82b4-52eb-71f0-831a-dee919b027c8	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:21:56
019e82b4-52ec-7331-b5eb-d3dd6326c8fd	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:21:56
019e82b4-52ed-70d2-8e50-74c258a45b66	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:21:56
019e82b4-52ef-70f1-b411-dcce8fe41ae6	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:21:56
019e82b4-52f0-71f4-a4a3-1a7e51bac8d9	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:21:56
019e82b4-52d7-7096-b0cd-dd37681fb350	019e82b4-52d4-725e-ba27-9c4afd5ababe	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-01 10:21:56
019e82b4-9288-70b7-a6b9-3a8278915f96	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:22:12
019e82b4-928a-7210-a2c6-aaec25f6cdd1	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:22:12
019e82b4-928b-7287-9315-0038439d6d28	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:22:12
019e82b4-928c-7309-94ec-18d2c33dd426	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:22:12
019e82b4-928d-7059-8d79-1d68694bd404	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:22:12
019e82b4-928e-713b-bad8-23f59aaf2282	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:22:12
019e82b4-9290-7304-9e11-e06817c9cf64	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:22:12
019e82b4-9291-73a2-a14b-97cc77637f99	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:22:12
019e82b4-9292-70e5-ad37-e368963e330e	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:22:12
019e82b4-9293-71a9-8cec-629527e4e315	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:22:12
019e82b4-9294-73e9-8d66-4d65d426d5e9	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:22:12
019e82b4-9295-7047-84a7-0dbff6f1b78f	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:22:12
019e82b4-9296-7374-b5e2-ce3bcf8cfea9	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:22:12
019e82b4-9298-7168-8822-2919e19dee60	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:22:12
019e82b4-9299-70d3-aca6-1be42105eef3	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:22:12
019e82b4-929a-715d-8847-d2cb6ca0883b	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:22:12
019e82b4-929c-73b7-b970-325166c8e60d	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:22:12
019e82b4-929d-7346-b44c-d02cb29f6a3b	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:22:12
019e82b4-929e-739b-b8fe-8e2006d432b8	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:22:12
019e82b4-92a0-732f-8999-108cf622d6a2	019e82b4-9285-70fc-aa4d-d405b0349001	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:22:12
019e82b5-6d24-721e-bbfd-d6aed9499be8	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:23:08
019e82b5-6d25-7121-a25c-bffbd635b8b2	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:23:08
019e82b5-6d27-7341-9087-af61461bcfd1	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:23:08
019e82b5-6d28-7379-b103-b661d8eb1d19	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:23:08
019e82b5-6d29-720d-b121-389dbfd7c126	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:23:08
019e82b5-6d2a-7272-977c-2f0c345a3168	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:23:08
019e82b5-6d2b-717a-b65b-da9c8a6dedc9	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:23:08
019e82b5-6d2c-724f-a6f8-daba38fb7df0	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:23:08
019e82b5-6d2d-710e-9a8e-8f732e2e5db7	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:23:08
019e82b5-6d2e-727a-b40f-4cb9e4789903	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:23:08
019e82b5-6d30-7088-8347-4de7b5430930	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:23:08
019e82b5-6d31-7155-8bc2-37f1a72ffb92	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:23:08
019e82b5-6d32-72ea-9e13-51d8fd546340	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:23:08
019e82b5-6d34-72c3-9003-dfbf9747618d	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:23:08
019e82b5-6d35-708e-a07a-8736043de407	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:23:08
019e82b5-6d36-736b-b437-9015919fe697	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:23:08
019e82b5-6d38-7259-bada-5ea81de65a29	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:23:08
019e82b5-6d39-709f-a8d8-f4014e68aaed	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:23:08
019e82b5-6d3a-71f9-a7b8-a2a15fb10531	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:23:08
019e82b5-6d22-7005-bf72-37f96fa4839f	019e82b5-6d1f-7154-9cdf-19d20329097b	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	t	2026-06-01 10:23:08
019e82b5-be5d-7063-aa9c-7c2125f2a1b7	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:23:29
019e82b5-be5e-730f-a13e-ccd41a62df3f	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:23:29
019e82b5-be5f-71f2-a43f-d251929e7943	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:23:29
019e82b5-be61-73bb-a5da-4f91ca65e16b	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:23:29
019e82b5-be62-72af-871a-fc1b80e2f7dd	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:23:29
019e82b5-be63-735b-ba13-327b926f089a	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:23:29
019e82b5-be64-7160-9487-64236e760c6e	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:23:29
019e82b5-be65-7151-9226-ff78f621c510	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:23:29
019e82b5-be67-72ac-87c7-484de06daebf	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:23:29
019e82b5-be68-7184-8770-b77589c4e3f9	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:23:29
019e82b5-be69-738f-b218-5f58420799fb	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:23:29
019e82b5-be6a-7384-b4d8-9d51a32aae4b	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:23:29
019e82b5-be6b-705d-8dbc-0b5b4bdf1b6f	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:23:29
019e82b5-be6d-717c-8416-3292ca6b8976	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:23:29
019e82b5-be6e-7258-a029-d1fa0230b542	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:23:29
019e82b5-be56-7287-afb7-4de90c36e987	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-01 10:23:29
019e82b5-be58-73ee-b9c0-353d3a6c5d47	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	t	2026-06-01 10:23:29
019e82b5-be59-7353-988a-b71e3e3fe78a	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-01 10:23:29
019e82b5-be5a-70cb-8982-1324de0882e9	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-01 10:23:29
019e82b9-11b2-7340-898a-3a88f6f09a78	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:27:07
019e82b9-11b3-7060-a8ca-5e41438fab74	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:27:07
019e82b9-11b5-713b-914f-19f68b69e1d7	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:27:07
019e82b9-11b6-7276-a160-abb0054de8a5	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:27:07
019e82b5-be5c-7102-b111-e0136ecfc1ab	019e82b5-be53-73b6-9bd4-5fc520358648	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-01 10:23:29
019e82b9-11b7-705d-9128-5144ac46d929	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:27:07
019e82b9-11b9-71d6-9246-befbf77c5003	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:27:07
019e82b9-11ba-7189-9617-a99d4088d959	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:27:07
019e82b9-11bb-7094-962b-9178dcb803e8	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:27:07
019e82b9-11bc-723d-b93b-e465cddf71d2	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:27:07
019e82b9-11be-7064-a024-8737d393d96d	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:27:07
019e82b9-11bf-7346-a039-b2ac950dc196	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:27:07
019e82b9-11c0-7086-80a5-05407f7e12fe	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:27:07
019e82b9-11c1-70e9-b5f4-cb4de8ff2521	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:27:07
019e82b9-11c2-737b-a604-0ec2bfc4b442	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:27:07
019e82b9-11c4-714e-9a7d-d8398f6f416e	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:27:07
019e82b9-11c5-71fa-bc12-e286d0cfeb57	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:27:07
019e82b9-11c6-7312-9322-707b0614aae4	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:27:07
019e82b9-11c7-7188-a988-b505dd8ce04b	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:27:07
019e82b9-11c8-71dd-84b8-7e80bacb3a42	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:27:07
019e82b9-11b0-700a-902c-5af57eb0cbf0	019e82b9-11ad-7148-9ca0-fad420f3eca2	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-01 10:27:07
019e82c2-59c6-70b8-a53f-220907384fde	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:37:15
019e82c2-59c7-7222-a1a5-e2fd4f273cbb	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:37:15
019e82c2-59c9-71cb-93a9-e27e1d7dbdb0	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:37:15
019e82c2-59ca-7111-bde6-61bfa40bd84d	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:37:15
019e82c2-59cb-73b9-9e1c-89575e3da671	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:37:15
019e82c2-59cd-70c5-9e24-c23a63220da9	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:37:15
019e82c2-59ce-7210-8d2e-88f8889b221b	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:37:15
019e82c2-59d0-71ae-a4c9-22ebc80f3155	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:37:15
019e82c2-59d1-7070-b951-6b43e22a748b	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:37:15
019e82c2-59d2-71ec-a00b-0e347c9dadb8	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:37:15
019e82c2-59d3-70f3-a0d5-4027ae8e92b4	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:37:15
019e82c2-59d4-7281-8ff9-8776652d5728	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:37:15
019e82c2-59d5-73e0-9766-994793b8729b	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:37:15
019e82c2-59d6-736a-9808-98d94fad49c5	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:37:15
019e82c2-59d8-73d0-a162-8c1c3fcce06b	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:37:15
019e82c2-59d9-7114-8739-0f0666837015	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:37:15
019e82c2-59da-71d6-8be3-bb6b3a9227d3	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:37:15
019e82c2-59db-72ba-92cb-a49784627fde	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:37:15
019e82c2-59dc-7131-ab39-aecd31f87d9f	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:37:15
019e82c2-59de-720a-96f4-087a83694dcd	019e82c2-59c3-7051-bc9b-8ef28c66affa	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:37:15
019e82c2-6f86-712a-95ba-01285b3e449b	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:37:21
019e82c2-6f88-72b4-9de8-d27a3931b284	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:37:21
019e82c2-6f89-73f7-aff0-43d3f1fcd650	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:37:21
019e82c2-6f8a-703c-8657-c3087fbcedc3	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:37:21
019e82c2-6f8c-7082-adf5-e378d36c68f9	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:37:21
019e82c2-6f8d-7251-8bef-f7989251c2be	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:37:21
019e82c2-6f8e-72f3-b247-67c46d286cce	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:37:21
019e82c2-6f90-7311-badc-98ad8e26a1c7	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:37:21
019e82c2-6f91-734b-a31a-dd3ef398bf69	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:37:21
019e82c2-6f92-702b-8a28-de28e8447f44	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:37:21
019e82c2-6f93-73be-8f61-5c0edb30a117	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:37:21
019e82c2-6f94-72aa-8287-9d0265e51392	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:37:21
019e82c2-6f96-737c-b447-d7b1a8ded35f	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:37:21
019e82c2-6f97-7362-86a2-3a1d8354b4f1	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:37:21
019e82c2-6f98-706c-91d0-f22dc38b8e42	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:37:21
019e82c2-6f99-73e5-8a5c-fd75dff882db	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:37:21
019e82c2-6f9b-732a-b5c9-21695899db7a	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:37:21
019e82c2-6f9c-72ad-8db0-06b3d8dfa987	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:37:21
019e82c2-6f9d-70e6-b540-ae3a93d88854	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:37:21
019e82c2-6f85-71b2-8c1f-9997ca25c7f0	019e82c2-6f81-711f-822a-47c72d1fe066	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	t	2026-06-01 10:37:21
019e82c5-cab6-701a-bad3-cbac39c4b046	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:41:01
019e82c5-cab8-7302-853e-c0bc9909c9ca	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:41:01
019e82c5-cab9-7310-b9c2-51e2a88e7eea	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:41:01
019e82c5-caba-7319-8105-066ff67d2a84	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:41:01
019e82c5-cabb-73a0-8f64-95acec18f6d5	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:41:01
019e82c5-cabc-7175-9df3-1f8be4b90f14	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:41:01
019e82c5-cabd-7326-88ea-8b59a1aac56b	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:41:01
019e82c5-cabe-70e0-9730-6e827fe04357	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:41:01
019e82c5-cac0-71c5-80a0-07c5565aa762	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:41:01
019e82c5-cac1-7049-91b3-450d43f6d718	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:41:01
019e82c5-cac2-720d-be81-196ae50b52d5	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:41:01
019e82c5-cac3-731e-9f62-358263660981	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:41:01
019e82c5-cac4-701d-aa24-7dea3a927cc4	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:41:01
019e82c5-cac5-71b1-b191-01638bf2ad80	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:41:01
019e82c5-cac7-72dd-9a39-1c1dcfb88358	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:41:01
019e82c5-cac8-700d-acc1-6482ed48e39b	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:41:01
019e82c5-cac9-71bf-a7d6-86d17dc93a71	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:41:01
019e82c5-caca-71fe-b934-9f07b88fd77f	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:41:01
019e82c5-cacb-7144-b356-7c72613fce8c	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:41:01
019e82c5-cab5-7015-ae78-d2c09a0a527e	019e82c5-cab1-709b-be04-92feff4e7db3	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	t	2026-06-01 10:41:01
019e82c6-3e46-722c-b514-fce6559b529e	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:41:30
019e82c6-3e48-705b-8749-fd123744c94e	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:41:30
019e82c6-3e49-702f-bdea-8ed80844a8c9	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:41:30
019e82c6-3e4a-732f-ab15-6816fd7cffa5	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:41:30
019e82c6-3e4c-706e-b764-c53452ed6b00	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:41:30
019e82c6-3e4d-734b-865c-aa899e7b406b	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:41:30
019e82c6-3e4e-722e-971e-25048d84be7a	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:41:30
019e82c6-3e4f-7303-91a6-558611a985a3	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:41:30
019e82c6-3e51-701f-b7ca-0e57ccebd1e7	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:41:30
019e82c6-3e52-714a-88bc-88d301009080	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:41:30
019e8324-3478-70db-99e9-653106c307bb	019e8324-3468-7132-8090-721db3e72153	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-01 12:24:08
019e82c6-3e53-7234-8d56-c9f1f0d1743a	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:41:30
019e82c6-3e55-7293-bbc8-e389b17ae97f	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:41:30
019e82c6-3e56-7207-96c0-4da038c8aab3	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:41:30
019e82c6-3e57-712c-96c8-575d0bf31ab2	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:41:30
019e82c6-3e59-73a8-9ba4-068e5316086c	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:41:30
019e82c6-3e5a-7178-85d2-b8274c398b88	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:41:30
019e82c6-3e5b-7069-843b-9c099e4ae6b1	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:41:30
019e82c6-3e5c-733b-9f1a-a3a6badd6aa0	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:41:30
019e82c6-3e5d-7188-9a1a-99468dcd38cb	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:41:30
019e82c6-3e5f-71d3-a493-ce3f702dbb48	019e82c6-3e44-7144-9725-8b77c28b0b97	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:41:30
019e82c6-7b34-7094-8d9b-85465d93e32d	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:41:46
019e82c6-7b35-7107-86fc-56df04a3a816	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:41:46
019e82c6-7b37-7291-a985-31f0278375a6	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:41:46
019e82c6-7b38-7231-91ba-58e1f2523789	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:41:46
019e82c6-7b39-71cf-8648-c525e5d31342	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:41:46
019e82c6-7b3b-7003-aec7-f35559d0d0df	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:41:46
019e82c6-7b3c-70df-8cdd-bce5969bdc33	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:41:46
019e82c6-7b3d-73f2-a075-1bd0b444a1c0	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:41:46
019e82c6-7b3e-700d-87ae-8b62af7ab0f5	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:41:46
019e82c6-7b40-731f-aaae-b8f8991cbcb4	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:41:46
019e82c6-7b41-71bd-947c-e3772f64531f	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:41:46
019e82c6-7b42-73e4-9617-7d65bae18181	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:41:46
019e82c6-7b43-7320-b62f-b92604d4e7d2	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:41:46
019e82c6-7b45-724c-8b04-82a3c9227e7b	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:41:46
019e82c6-7b46-70aa-8243-efdc225f8cce	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:41:46
019e82c6-7b47-716f-95c4-bb67276fc36b	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:41:46
019e82c6-7b48-70c5-b11e-d9964dbd2fad	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:41:46
019e82c6-7b49-70b3-9df2-6a96515f9ced	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:41:46
019e82c6-7b4a-7344-aa06-1c036a2ddda1	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:41:46
019e82c6-7b4b-7092-a947-959264a21a2a	019e82c6-7b31-70d6-aef1-160ac4d631a8	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:41:46
019e82c7-8304-720a-9d7f-4c3bcf9bff3d	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:42:53
019e82c7-8305-717b-94ea-847caabe7222	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:42:53
019e82c7-8306-7070-a76f-a16f529b77ce	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:42:53
019e82c7-8308-739a-9069-8c8feb6952d9	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:42:53
019e82c7-8309-73b4-a11a-c6d4af2e9e62	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:42:53
019e82c7-830a-723b-835c-19919860fa5c	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:42:53
019e82c7-830b-7045-805e-c3200b7ac030	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:42:53
019e82c7-830d-7060-9f27-36b0be487f75	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:42:53
019e82c7-830e-730d-89cc-aab6b7c29033	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:42:53
019e82c7-830f-72f1-a7c7-6b4e86173d1c	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:42:53
019e82c7-8310-7232-9558-54c4a466fcfc	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:42:53
019e82c7-8311-72ca-bac3-42946e61c6eb	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:42:53
019e82c7-8313-7120-a7ea-71ba053d6efd	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 10:42:53
019e82c7-8314-706c-964f-83a8a8ce5084	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:42:53
019e82c7-8315-71e2-9c9d-4ea91c99c3dd	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:42:53
019e82c7-8316-73be-97a1-fb17a625d9ed	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:42:53
019e82c7-8317-7113-ba71-7acab8b1d683	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:42:53
019e82c7-8318-73c1-b55c-45e0e2f3dd23	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:42:53
019e82c7-8301-7251-a01d-95e208131b1e	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-01 10:42:53
019e82cc-f52f-70e5-ae4b-0b23ebb631f2	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 10:48:50
019e82cc-f532-71c9-98f0-5585b39f9205	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 10:48:50
019e82cc-f536-7243-a877-c22408c2a35a	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 10:48:50
019e82cc-f53b-71a4-9ac1-4ed06fc47e3d	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 10:48:50
019e82cc-f53c-70c3-8438-b267e8ef3546	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 10:48:50
019e82cc-f546-70e0-ba35-c70d3e9c51e6	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 10:48:50
019e82cc-f54c-7384-aefa-f33adc108640	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 10:48:50
019e82cc-f54f-73c1-bab4-961b780ca512	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 10:48:50
019e82cc-f551-7362-8f90-9c88ff295e29	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 10:48:50
019e82cc-f552-724a-89d2-f80b8a5ecc84	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 10:48:50
019e82cc-f553-7362-bac4-7fcfa5a89858	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 10:48:50
019e82cc-f555-715c-a3a4-aac5eb62d80d	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 10:48:50
019e82cc-f557-71c1-8398-ca07db7a1867	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 10:48:50
019e82cc-f558-7221-b0a4-15b7c5f5ffe1	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 10:48:50
019e82cc-f55c-71eb-879c-1ac37eaa418b	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 10:48:50
019e82cc-f55d-734b-9792-47433a40a315	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 10:48:50
019e82cc-f561-7060-a05a-98baded520ef	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 10:48:50
019e82cc-f564-7256-8cfe-4b8c22633245	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 10:48:50
019e82cc-f567-7110-823f-2aace9e4cb47	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 10:48:50
019e82d7-7ce4-7024-bf10-0525c449f11f	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-01 11:00:20
019e82cc-f524-706e-935c-79d96476da35	019e82cc-f4d6-7042-a2ca-afe4db90c338	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	t	2026-06-01 10:48:50
019e82d7-7ce6-722c-8110-db60ebb0db63	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:00:20
019e82d7-7ce7-7201-9b6e-7821db3ea34e	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:00:20
019e82d7-7ce8-70b3-92a3-4f2325236dfc	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:00:20
019e82d7-7cea-7055-b913-bec40ff2cd27	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:00:20
019e82d7-7ceb-71a8-b0be-97855c6d01e3	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:00:20
019e82d7-7cec-7360-8d60-36f47168cca1	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:00:20
019e82d7-7cee-73d3-9830-b44c433b592a	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:00:20
019e82d7-7cef-72e8-8671-ddc9eece5bf3	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf0-7036-aff7-7932c29ec5cc	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf1-7277-bce7-c4aecfdb23cd	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf3-73ba-86db-916f0c1d4278	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf4-7107-b881-479c25aedd5a	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf5-721b-adb4-c825fcab28c4	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf6-7328-bc53-ac8c1a5e6c9d	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:00:20
019e82c7-8302-7234-99ad-7137eef30cb4	019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e71e1-327d-739e-b4c9-7e19f212ff0b	ihdhcb	f	f	2026-06-01 10:42:53
019e8324-347c-71ff-b845-29e3b115efd8	019e8324-3468-7132-8090-721db3e72153	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:24:08
019e8324-347b-72d7-a99e-794dbe9e1b6b	019e8324-3468-7132-8090-721db3e72153	019e71e1-3271-7351-a397-1bfca7c3cebb	xhcghh	f	f	2026-06-01 12:24:08
019e82d7-7cf8-70da-8d16-6d9358bc1032	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:00:20
019e82d7-7cf9-725e-b23b-f03ec894ed5e	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:00:20
019e82d7-7cfc-7382-a6be-d03b3bbf1c8d	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:00:20
019e82d7-7cfd-729f-8711-a7e21b0a142d	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:00:20
019e82d7-7cfe-7014-aec1-20a3c0b9b081	019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:00:20
019e82db-96b9-71c2-898e-92636a751f64	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:04:49
019e82db-96bc-71a3-87a2-4bd2bb7b58f5	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:04:49
019e82db-96bd-71c3-a263-9c984c0d68e8	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:04:49
019e82db-96bf-7204-97cc-5df868d4450c	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:04:49
019e82db-96c0-707c-85d1-5c74025d319c	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:04:49
019e82db-96c1-700d-a31d-9a6dc494ea36	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:04:49
019e82db-96c3-728d-b5f5-b54b0265591b	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:04:49
019e82db-96c4-7108-9388-9555bc1aaed3	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:04:49
019e82db-96c5-716e-98ec-fc959487a72c	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:04:49
019e82db-96c6-7272-8cce-775b2efe0f00	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:04:49
019e82db-96c8-73e6-ac96-917c330872a2	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:04:49
019e82db-96c9-70c5-86ff-915cacb2831b	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:04:49
019e82db-96ca-7380-b4f7-9f895ff86549	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:04:49
019e82db-96cb-71dc-bd0f-336baacb5ff5	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:04:49
019e82db-96cc-7177-9b10-6eb972a67b4e	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:04:49
019e82db-96ce-72a2-a13e-92e4c1e84f4f	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:04:49
019e82db-96cf-7328-badd-b3b31b8855a1	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:04:49
019e82db-96d0-70c2-923f-10c86881fd5a	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:04:49
019e82db-96d1-73be-8f46-90ad18837319	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:04:49
019e82db-96d2-7061-9821-30563248dabb	019e82db-96b5-71f8-976c-4f08792fc128	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:04:49
019e82db-a3f3-71f9-9ec4-27111fe07e9f	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:04:52
019e82db-a3f4-7397-a4e0-fbf229561889	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:04:52
019e82db-a3f5-7053-b833-d1d9761464bc	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:04:52
019e82db-a3f7-733e-ac3f-457b218258e7	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:04:52
019e82db-a3f8-72bb-ab88-c51917e78ab3	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:04:52
019e82db-a3f9-7051-8dcf-74fcb311c7a6	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:04:52
019e82db-a3fa-72ee-8a75-ba63cf2936a5	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:04:52
019e82db-a3fc-7034-af0c-42858c5a8d07	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:04:52
019e82db-a3fd-713b-9158-90103411aff6	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:04:52
019e82db-a3fe-71db-bd5a-8c8eade86972	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:04:52
019e82db-a400-7320-a01e-c514314269a3	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:04:52
019e82db-a401-7260-93c9-a7a6d12073a0	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:04:52
019e82db-a402-70a9-a236-614aa2a9930a	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:04:52
019e82db-a403-729d-a5e6-99827eebb338	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:04:52
019e82db-a404-70f7-80e9-1e955bb7765b	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:04:52
019e82db-a406-71fb-b3e7-e2bd37b02b2f	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:04:52
019e82db-a3ed-712e-8af2-cc5928d5c2d5	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3273-7288-ac2e-40fac328fb6d	dhjzhf	f	f	2026-06-01 11:04:52
019e82db-a3ef-72c0-a1ce-5e4051f2e4c2	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3275-71ec-91d8-9f6937c785d8	dhzjhdjs	f	f	2026-06-01 11:04:52
019e82db-a3f0-71d7-8ee8-7fef5549eb3b	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3280-720c-8511-ed606ebc1ff9	jskdjsjks	f	f	2026-06-01 11:04:52
019e82db-a3f2-7117-9ec6-57b7781dd154	019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e71e1-3276-7022-9eea-b52898a285bc	bdkbd	f	f	2026-06-01 11:04:52
019e82e2-64be-7117-a186-266c5bb853a2	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:12:15
019e82e2-64bf-731e-a198-b5e2173dd845	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:12:15
019e82e2-64c1-700d-a694-02977da48413	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:12:15
019e82e2-64c2-73ff-87a6-bf601aa430f1	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:12:15
019e82e2-64c3-7137-8d6d-6a08d74f27bb	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:12:15
019e82e2-64c5-7167-934f-dcd0fdeb6c16	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:12:15
019e82e2-64c6-71fd-8b9c-88ada87c95d8	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:12:15
019e82e2-64c7-726b-9122-e77d1279ecea	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:12:15
019e82e2-64c9-72ad-90df-d45eb3e90573	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:12:15
019e82e2-64ca-7329-99a3-3fbc66eeba1c	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:12:15
019e82e2-64cb-70b0-8bba-72f983c2dc7a	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:12:15
019e82e2-64cc-73fc-b4f5-fc09ef113345	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:12:15
019e82e2-64ce-737e-8e60-74f389ba033c	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:12:15
019e82e2-64cf-719d-b8f3-5e93c54d69bd	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:12:15
019e82e2-64d0-7101-b66f-7921ac489dd1	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:12:15
019e82e2-64d2-72b7-adba-2b430352ce91	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:12:15
019e82e2-64d3-718b-bcff-48e93f2887e1	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:12:15
019e82e2-64d4-71b4-a646-a5ad88c59b69	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:12:15
019e82e2-64d5-7039-8da0-4c571ae14e63	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:12:15
019e82e2-64bc-72b9-9039-7ad0e065937d	019e82e2-64b9-738a-828c-d59bb827d1b3	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	hzjdhs	f	f	2026-06-01 11:12:15
019e82e3-1098-722a-90f5-893cd34e3613	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:12:59
019e82e3-109a-71f5-b9b0-66d82daa41c9	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:12:59
019e82e3-109b-7149-8210-20326dc9b35b	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:12:59
019e82e3-109c-72d9-98e0-3c3bf76e7fb7	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:12:59
019e82e3-109e-7229-847f-1815042f91d7	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:12:59
019e82e3-109f-7132-8168-a9658fda1a82	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:12:59
019e82e3-10a0-7207-90f3-e4206e92c8db	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:12:59
019e82e3-10a1-707f-ba1c-41b4d8fcb14a	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:12:59
019e82e3-10a3-734f-b11a-fae13a960096	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:12:59
019e82e3-10a4-72a3-92f9-54197f2973a8	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:12:59
019e82e3-10a5-71ca-b004-61ca5d04811d	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:12:59
019e82e3-10a6-7111-9828-4638a925ed37	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:12:59
019e82e3-10a8-711b-b47f-862af0c23e04	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:12:59
019e82e3-10a9-72c6-bff2-b8ba6f4565c5	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:12:59
019e82e3-10aa-714f-8cea-762923923b9f	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:12:59
019e82e3-10ab-71a3-bf4e-8ad8e4032502	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:12:59
019e82e3-10ad-7086-bd41-1534b2d66934	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:12:59
019e82e3-1097-7198-b45f-530c438d77b6	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-01 11:12:59
019e8324-347d-72ec-b053-6c9f1aa1427d	019e8324-3468-7132-8090-721db3e72153	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:24:08
019e8324-347f-73b8-a386-acc9801497b5	019e8324-3468-7132-8090-721db3e72153	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:24:08
019e8324-3480-7146-874c-918b695365fb	019e8324-3468-7132-8090-721db3e72153	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:24:08
019e8324-3481-7308-a5a1-92099b5b6fa2	019e8324-3468-7132-8090-721db3e72153	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:24:08
019e8324-3482-73f7-a0b5-31a62edcba36	019e8324-3468-7132-8090-721db3e72153	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:24:08
019e82e3-10ae-7309-b34c-a55b1d03bd5c	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:12:59
019e82e3-10af-70a6-9d03-c63c1bcfcaa7	019e82e3-1094-7399-99da-712ffa67f850	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:12:59
019e82e3-711f-71c5-afc2-122f6a4bb6cd	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:13:24
019e82e3-7121-72d0-827d-ce7727db1dcd	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:13:24
019e82e3-7122-703e-b84c-d64b02ac4ef5	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:13:24
019e82e3-7124-71e7-9e64-dafd3c391d72	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:13:24
019e82e3-7125-728c-8d36-51cfa57de2d2	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:13:24
019e82e3-7126-71c2-95e3-6e4cc5d6b7f0	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:13:24
019e82e3-7127-72a2-978c-addfebb31361	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:13:24
019e82e3-7129-72ac-aaff-507dde13cc73	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:13:24
019e82e3-712a-7120-91b6-adc45882628e	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:13:24
019e82e3-712b-70bf-bb33-61c459285275	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:13:24
019e82e3-712c-72bc-b6d6-7e24fcfe2afd	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:13:24
019e82e3-712d-7161-9318-9fef12d38133	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:13:24
019e82e3-712e-71f6-a2fb-a42931199238	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:13:24
019e82e3-712f-732a-b5ee-268706113c53	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:13:24
019e82e3-7130-7018-bf5d-dbc8f166c39b	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:13:24
019e82e3-7131-73df-94ec-a7be35a26abc	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:13:24
019e82e3-7132-7093-a495-31992cebad43	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:13:24
019e82e3-7133-715a-880e-787aa6686199	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:13:24
019e82e3-7135-70ee-907e-96d1e018870c	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:13:24
019e82e3-7136-7056-8c31-576a7465b321	019e82e3-711c-739f-b91d-3fc462b6766a	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:13:24
019e82e3-8b23-7300-b456-68b38e9eaae4	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:13:30
019e82e3-8b25-7012-85c0-86232e0e2095	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:13:30
019e82e3-8b26-727f-a82d-3f13c424a1dc	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:13:30
019e82e3-8b27-73cd-9bc1-f53dfdef6656	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:13:30
019e82e3-8b28-720e-aafd-55a32c73579f	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:13:30
019e82e3-8b2a-7109-b981-005b4bdda18d	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:13:30
019e82e3-8b2b-7062-a7f3-4c62beb7e571	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:13:30
019e82e3-8b2c-7234-aaf1-e48b59ae40ea	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:13:30
019e82e3-8b2d-7066-8ce8-989a4eded3c6	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:13:30
019e82e3-8b2e-725a-9e8e-5be44f6f88a2	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:13:30
019e82e3-8b30-7017-8dbb-f37d1a622c83	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:13:30
019e82e3-8b31-7367-92e9-7383266f8256	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:13:30
019e82e3-8b32-725c-8e83-0572b6cab141	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:13:30
019e82e3-8b33-73f5-8358-96463dd4a384	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:13:30
019e82e3-8b34-7030-9d3e-ffd0cea17c2e	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:13:30
019e82e3-8b35-70a3-9b01-888ad78e73b5	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:13:30
019e82e3-8b37-73b9-8b68-9b7511ea80f4	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:13:30
019e82e3-8b38-71fc-84ec-a83a7cb1cf5d	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:13:30
019e82e3-8b39-72fb-9e60-635c25f7dc09	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:13:30
019e82e3-8b3a-7084-bfb1-d99f1cb2e59d	019e82e3-8b1e-731b-b3da-93fae7157790	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:13:30
019e82e3-a5e0-73f6-910f-6ab629d0126c	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e1-70c6-9442-9c70972156b7	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e3-7073-8273-bebcc9db4fb0	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e4-700e-950b-e058b05ec542	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e5-721a-be1e-191111893dcd	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e6-733e-a904-f521893d6c0c	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e8-7173-9af9-dafcbe98e225	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:13:37
019e82e3-a5e9-71f8-9675-dff772ac1cd5	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:13:37
019e82e3-a5ea-72ce-8ace-edab9d56b33c	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:13:37
019e82e3-a5ec-72a3-b6ff-ca814ac7b0a2	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:13:37
019e82e3-a5ed-7272-808a-9c6774271aff	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:13:37
019e82e3-a5ee-7194-9d6d-f281c5b424d6	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:13:37
019e82e3-a5ef-7210-bae2-49819b3590ac	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:13:37
019e82e3-a5f1-71ba-acf5-b33c03afd1e5	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:13:37
019e82e3-a5f2-731f-ade3-9c5686dce457	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:13:37
019e82e3-a5f3-732f-978a-94345e9608fa	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:13:37
019e82e3-a5f5-7260-a530-2d72adc37a02	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:13:37
019e82e3-a5f6-73a9-8256-c2f4af0a93fc	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:13:37
019e82e3-a5f7-7231-97aa-496bc16aa14f	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:13:37
019e82e4-2f75-718a-8c79-6d95e33b11ba	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:14:12
019e82e4-2f77-7171-9b3b-2582650f99fe	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:14:12
019e82e4-2f78-710d-80b6-ce4ed179acc4	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:14:12
019e82e4-2f79-72ed-9fc8-356bd85c7428	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:14:12
019e82e4-2f7b-709b-96bc-5b37a5bbe21b	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:14:12
019e82e4-2f7c-7297-af92-c64b86c52f5d	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:14:12
019e82e4-2f7d-72d5-8dae-32934e3781a5	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:14:12
019e82e4-2f7e-7016-b222-87a0f7e47999	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:14:12
019e82e4-2f7f-7257-8b36-245b3c308208	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:14:12
019e82e4-2f81-72c7-b869-0b33fd057888	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:14:12
019e82e4-2f82-706b-b76f-e6135ddcf832	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:14:12
019e82e4-2f83-72bf-9654-a972c62816a9	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:14:12
019e82e4-2f84-731e-adcd-05f168c7e94e	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:14:12
019e82e4-2f85-73cf-960c-1d26d3f1dfa3	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:14:12
019e82e4-2f86-703f-a26d-8a51ead93d27	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:14:12
019e82e4-2f87-7282-8168-8948b5804db8	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:14:12
019e82e4-2f88-701c-8bdb-7e4430f17fe2	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:14:13
019e82e4-2f89-7267-a68f-e0acfb778813	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:14:13
019e82e4-2f8b-7299-af0c-7484dc5af688	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:14:13
019e82e4-2f73-7251-800a-5300cad3ea5d	019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-01 11:14:12
019e82e3-a5de-7059-8bb4-b8e8bb2f1478	019e82e3-a5db-7272-a17e-33bdbd05e190	019e71e1-3278-7246-a23e-10370ffbd291	hzkhx	f	f	2026-06-01 11:13:37
019e8324-3483-70a6-82cc-57c2083aa215	019e8324-3468-7132-8090-721db3e72153	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:24:08
019e82e9-fb35-702d-b675-6587295bd19b	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:20:32
019e82e9-fb37-7030-a1bd-5805e3da106f	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:20:32
019e82e9-fb38-72d5-9237-c5b7209da73b	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:20:32
019e82e9-fb39-7076-a526-7405744e50b2	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:20:32
019e82e9-fb34-70f4-a82f-5f062a3bab2f	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	haibdnzbbd	f	f	2026-06-01 11:20:32
019e82e9-fb3b-728b-8422-6dd05b4b7921	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:20:32
019e82e9-fb3c-704f-8e6d-c896af410be2	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:20:32
019e82e9-fb3e-7167-8a91-12b70e0beb04	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:20:32
019e82e9-fb3f-70e8-9fe5-ebfd357d9f59	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:20:32
019e82e9-fb40-7201-9b73-873bdde56315	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:20:32
019e82e9-fb42-7053-b6a4-7b65e8a927bf	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:20:32
019e82e9-fb43-731a-9f27-a53229386dc7	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:20:32
019e82e9-fb44-700a-aa5d-9b9ce4dad393	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:20:32
019e82e9-fb45-70b2-8d77-39b446c0dc8d	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:20:32
019e82e9-fb46-731e-bd57-387d8c1183fd	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:20:32
019e82e9-fb47-73fb-b2b1-5d1a87c2ae00	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:20:32
019e82e9-fb49-713c-a223-5ec618be1809	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:20:32
019e82e9-fb4a-72f7-a3be-301c1f23892b	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:20:32
019e82e9-fb4b-72d9-8c55-007d701663cf	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:20:32
019e82e9-fb32-71dd-9983-4b4b8151194b	019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e71e1-327e-72b7-9b50-f40528ac67e7	dhkfhhd	f	f	2026-06-01 11:20:32
019e82eb-8b8a-7241-9e85-264cd03b50d6	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:22:15
019e82eb-8b8c-7144-b1c6-28bad209c130	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:22:15
019e82eb-8b8d-71bc-93f9-4a7a452a30ab	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:22:15
019e82eb-8b8e-7282-8da2-ec80c16b4002	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:22:15
019e82eb-8b90-7305-9a6a-5051d6053cde	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:22:15
019e82eb-8b91-71f4-bde4-19907bf5f877	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:22:15
019e82eb-8b92-72b5-80a5-25532ad45f11	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:22:15
019e82eb-8b93-7201-97c3-077a2898cd01	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:22:15
019e82eb-8b94-7114-a241-46e96be7e160	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:22:15
019e82eb-8b95-7223-84ec-9131d5bf2a65	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:22:15
019e82eb-8b97-7126-8bd0-815beefbc4d0	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:22:15
019e82eb-8b98-73c1-a570-c20148ec13c0	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:22:15
019e82eb-8b99-72d9-98c1-3843bcf9f295	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:22:15
019e82eb-8b9a-7176-bdcf-d3e8ca9b09d6	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:22:15
019e82eb-8b9b-72c3-9084-1ae2f2c7d396	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:22:15
019e82eb-8b9d-70ee-aeaa-8af85b885834	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:22:15
019e82eb-8b9e-706c-8ec5-aaf40d84d973	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:22:15
019e82eb-8b9f-72cf-9139-932ef0d6ef06	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:22:15
019e82eb-8ba0-70a2-b3ae-8ba94ca91b8e	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:22:15
019e8324-3485-7244-8f52-69cb0034ffa4	019e8324-3468-7132-8090-721db3e72153	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:24:08
019e82eb-8b88-722e-84a9-0fdf1a9f9d31	019e82eb-8b85-7265-a847-0ef7d3b34122	019e71e1-3271-7351-a397-1bfca7c3cebb	hsjbfjd	f	f	2026-06-01 11:22:15
019e82ec-77d2-73a5-b6a6-54558b5ddc55	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:23:15
019e82ec-77d3-7255-98f5-0f1aeffb103f	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:23:15
019e82ec-77d5-73ae-989c-8e69892112ec	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:23:15
019e82ec-77d6-7249-a049-820e166081b8	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:23:15
019e82ec-77d7-710d-a166-1b45a48adc1f	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:23:15
019e82ec-77d9-7246-918c-27581a5b7533	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:23:15
019e82ec-77da-7172-bbe4-ba756dc6d3ea	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:23:15
019e82ec-77db-71f7-9741-6669a8e614a8	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:23:15
019e82ec-77dc-7149-a1b9-66e01f1a49e6	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:23:15
019e82ec-77de-7003-924a-979233c7e353	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:23:15
019e82ec-77df-7398-98a6-e194a590515d	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:23:15
019e82ec-77e0-70f7-b92c-2a42f25bae5e	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:23:15
019e82ec-77e1-731b-beba-ae7a1b5b7827	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:23:15
019e82ec-77e2-7312-9493-458b983ddd51	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:23:15
019e82ec-77e4-7280-bbb3-c94970ec99c2	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:23:15
019e82ec-77e5-73ea-aa43-09e22269cb9c	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:23:15
019e82ec-77e6-734c-83f9-4c2daa90e113	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:23:15
019e82ec-77e7-71f3-b1ec-e3235a7b0f2a	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:23:15
019e82ec-77e8-7044-94e1-e80843d79fb2	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:23:15
019e82ec-77d1-713a-8cbc-673cdbd7086f	019e82ec-77ce-735c-a1ad-56e3b803377a	019e71e1-327a-73f4-9a63-092cefb1aabf	jsksj	f	f	2026-06-01 11:23:15
019e82f9-003b-70e3-95ac-ef1969b38701	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 11:36:57
019e82f9-003d-7204-85ba-b91c5cca9257	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 11:36:57
019e82f9-003e-7226-a7f7-306abf7f0123	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 11:36:57
019e82f9-0040-73e8-8249-8fdcc1a5f03c	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 11:36:57
019e82f9-0041-739f-aa78-f78ca7d73c78	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 11:36:57
019e82f9-0042-73f1-b7d7-2ebd73b824b5	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 11:36:57
019e82f9-0044-73c4-b687-df4c1998c9ca	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 11:36:57
019e82f9-0045-7200-9958-9e295afb6d41	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 11:36:57
019e82f9-0046-737e-bfec-b5bed9a40a93	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 11:36:57
019e82f9-0047-7134-9c09-279732122a18	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 11:36:57
019e82f9-0048-7148-a849-5eb0c18b3160	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 11:36:57
019e82f9-0049-73ab-9736-7ddfde77c451	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 11:36:57
019e82f9-004a-723f-8a35-572899ede038	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 11:36:57
019e82f9-004b-729e-bce1-ab696844729b	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 11:36:57
019e82f9-004d-73fd-82e1-bb2ba3c33860	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 11:36:57
019e82f9-004e-73a8-b174-02541689d9b1	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 11:36:57
019e82f9-004f-7389-a996-10d0cf0767d0	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 11:36:57
019e82f9-0050-713d-a198-22610fa17fb8	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 11:36:57
019e82f9-0052-7096-abfd-89c74cf04772	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 11:36:57
019e82f9-0053-70d0-bb38-8d13e1082b58	019e82f9-0038-72c8-906c-d133f49d54a5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 11:36:57
019e8316-5184-7261-9f59-30ee85890165	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:08:58
019e8316-5186-735f-9572-1dca0e863bb6	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:08:58
019e8316-5187-7327-b741-510a3687aa06	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:08:58
019e8316-5188-7088-93b3-a44b1c35d60e	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:08:58
019e8316-518a-7120-8ff9-1c900a3504d8	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:08:58
019e8316-518b-71c4-bf27-f855e0c94b2b	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:08:58
019e8316-518c-72b1-be4f-f21729f1836f	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:08:58
019e8316-518d-7037-8e03-10e1894e9422	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:08:58
019e8316-518f-705c-98f0-c42aad1d1a8f	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:08:58
019e8316-5190-7163-9db2-4149265f8693	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:08:58
019e8324-346e-72ac-8229-6973a3d88a84	019e8324-3468-7132-8090-721db3e72153	019e71e1-327c-71e1-9d58-b2fe6426441a	zjjfjd	f	f	2026-06-01 12:24:08
019e8316-5191-71a5-aeda-4b95bea3bd70	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:08:58
019e8316-5193-70f9-8286-71a39d677374	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:08:58
019e8316-5194-73ef-890b-54f67818509e	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:08:58
019e8316-5195-7397-aee8-e6b80393acac	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:08:58
019e8316-5196-706c-8fc1-4c38d91eb131	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:08:58
019e8316-5197-7231-a6c5-a1170173f63e	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:08:58
019e8316-5199-707b-9a39-42aaf016e518	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:08:58
019e8316-519a-724a-96ba-eeda7f902968	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:08:58
019e8316-519b-731a-b3b4-427f51ebef5a	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:08:58
019e8316-519c-702e-8936-2275bc875f4b	019e8316-5180-7385-afaf-db9f6ec3dcd3	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:08:58
019e8327-5987-7137-a757-313548969e6e	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:27:34
019e8327-5989-73d1-aa6d-83c18afc402b	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:27:34
019e8327-598a-7207-ad13-70832d1cc174	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:27:34
019e8327-598b-7365-b457-d09afd42ca84	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:27:34
019e8327-598d-70be-a899-2461d873fff1	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:27:34
019e8327-598e-70e9-8bf8-b6602d2f676e	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:27:34
019e8327-598f-7060-b39f-d94dcc9a9942	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:27:34
019e8327-5990-725f-baec-5e98d6df1188	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:27:34
019e8327-5992-70cf-93c5-ac51cdbcb394	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:27:34
019e8327-5993-7001-ae0a-46e45370b8d2	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:27:34
019e8327-5994-73fa-8812-3c39ef741923	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:27:34
019e8327-5995-7030-902e-6c2dbc22cba5	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:27:34
019e8327-5996-7090-8b28-85227e477d06	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:27:34
019e8327-5998-7284-8474-3c739d34c247	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:27:34
019e8327-599a-722c-b348-750c338ecc40	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:27:34
019e8327-599b-7236-8a0c-80944433cebc	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:27:34
019e8327-599c-707d-a6ff-047bb7611f5d	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:27:34
019e8327-599d-7196-960c-823b0d4b6042	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:27:34
019e8327-599e-708e-8f7c-a6247d009377	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:27:34
019e8327-5985-702a-bd2c-7866dc0efe81	019e8327-5982-7330-aaa6-487237ab7d1c	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	t	2026-06-01 12:27:34
019e8327-8c91-71b9-921b-1343d254dfa6	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:27:47
019e8327-8c94-7271-80e4-b90211184de6	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:27:47
019e8327-8c95-722e-bf61-c7523fafacba	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:27:47
019e8327-8c96-7058-9a6f-1c128d13ecbb	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:27:47
019e8327-8c98-7179-8b62-da4f75f336a4	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:27:47
019e8327-8c99-7382-9933-33f756866e97	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:27:47
019e8327-8c9a-7000-8ae8-65dc4aa1fba0	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:27:47
019e8327-8c9b-717e-9561-40e21ba51f7e	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:27:47
019e8327-8c9c-71c2-a10e-c48af6f2b562	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:27:47
019e8327-8c9e-71c3-80b4-36dea38caa55	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:27:47
019e8327-8c9f-7290-ad90-6b16dbe0c9cf	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:27:47
019e8327-8ca0-71df-afc1-69982562436a	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:27:47
019e8327-8ca1-70a8-b1ae-a7e5d2cbb82b	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:27:47
019e8327-8ca2-71e1-834a-a8b6da4980f3	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:27:47
019e8327-8c8a-70af-b82e-44bff43231f4	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-01 12:27:47
019e8330-d371-72a6-adf9-ffb9ce8f4885	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-01 12:37:55
019e8327-8c8c-706f-97f2-e0851c181fa5	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-01 12:27:47
019e8327-8c8e-7382-bdec-d5dcf7cf9780	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-01 12:27:47
019e8327-8c8f-717b-b587-2e4d3acf939b	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	t	2026-06-01 12:27:47
019e8327-8c90-71b7-a637-550838ecb00a	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-327d-739e-b4c9-7e19f212ff0b	gkjgkj	f	f	2026-06-01 12:27:47
019e8327-8c93-7369-8757-c1c158c1b16a	019e8327-8c88-7107-a505-0f1e229933f1	019e71e1-3273-7288-ac2e-40fac328fb6d	jhhbnlj,	f	f	2026-06-01 12:27:47
019e8324-346f-73f5-8982-689fcd96909c	019e8324-3468-7132-8090-721db3e72153	019e71e1-3270-72c4-a123-4fd4e2837da1	jzjdj	f	t	2026-06-01 12:24:08
019e8330-d373-73cc-abf5-c542b312c7d5	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:37:55
019e8330-d374-70de-a162-98d560f8f918	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:37:55
019e8330-d375-733e-b901-481d122cfa02	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:37:55
019e8330-d376-7022-ace5-cdd8247bbfd1	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:37:55
019e8330-d378-700b-bf8e-5ea5ebadc8a9	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:37:55
019e8330-d379-7150-b71a-62921923ded1	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:37:55
019e8330-d37b-7380-899f-412e45eb6ef2	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:37:55
019e8330-d37c-72ba-a8d0-08894fbabf98	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:37:55
019e8330-d37d-71cf-8ede-447e5a6a8060	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:37:55
019e8330-d37e-7058-be3f-351234a3c069	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:37:55
019e8330-d37f-732f-a4ec-117be5fe0a0c	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:37:55
019e8330-d380-70c8-ad3c-ea8de491b3b0	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:37:55
019e8330-d381-72a6-b716-67dcc980205e	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:37:55
019e8330-d382-719e-acff-e6517f52f23d	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:37:55
019e8330-d383-709e-8bbf-7568f22ffbf7	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:37:55
019e8330-d384-721e-8208-b2c477827f12	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:37:55
019e8330-d386-7287-95d0-6a31fb417da9	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:37:55
019e8330-d387-73ac-828d-5e22f1ba1e5b	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:37:55
019e8330-d388-73c8-9177-306f0e10bc5d	019e8330-d36d-71e5-8af0-08a1dee2dd53	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:37:55
019e8331-303d-73df-a44d-255a7d1f632b	019e8331-3038-701d-b958-9fad182a080e	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 12:38:19
019e8331-303f-71d2-9240-b9ca7074dc4c	019e8331-3038-701d-b958-9fad182a080e	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 12:38:19
019e8331-3040-7095-ae39-e208d7e74d5d	019e8331-3038-701d-b958-9fad182a080e	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 12:38:19
019e8331-3042-71c1-a72e-3bb779ce054b	019e8331-3038-701d-b958-9fad182a080e	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 12:38:19
019e8331-3043-73ad-9776-c246ccefd8f1	019e8331-3038-701d-b958-9fad182a080e	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 12:38:19
019e8331-3044-7060-be76-980d36dd8638	019e8331-3038-701d-b958-9fad182a080e	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 12:38:19
019e8331-3045-702a-a1de-cfa1f7bfe7cd	019e8331-3038-701d-b958-9fad182a080e	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 12:38:19
019e8331-3047-7006-b9a3-56c1992cdfcd	019e8331-3038-701d-b958-9fad182a080e	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 12:38:19
019e8331-3048-72b2-8fb7-943678578838	019e8331-3038-701d-b958-9fad182a080e	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 12:38:19
019e8331-3049-7086-a2c5-ffda660632e6	019e8331-3038-701d-b958-9fad182a080e	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 12:38:19
019e8331-304a-7337-af77-bfbcd27e8429	019e8331-3038-701d-b958-9fad182a080e	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 12:38:19
019e8331-304b-7256-aeee-95b81dcf2056	019e8331-3038-701d-b958-9fad182a080e	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 12:38:19
019e8331-304c-7065-8148-d52b13b31b88	019e8331-3038-701d-b958-9fad182a080e	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 12:38:19
019e8331-304e-702c-a2c5-83fb254381e4	019e8331-3038-701d-b958-9fad182a080e	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 12:38:19
019e8331-303b-720e-8e1f-6a0e720a1112	019e8331-3038-701d-b958-9fad182a080e	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-01 12:38:19
019e8324-346b-70c2-9b68-dd5eb8efc0cc	019e8324-3468-7132-8090-721db3e72153	019e71e1-326e-708c-8deb-5b611d1fca9b	ciickvivi	f	t	2026-06-01 12:24:08
019e8331-304f-72f9-9de6-6b69cccaad7c	019e8331-3038-701d-b958-9fad182a080e	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 12:38:19
019e8331-3050-720a-8d45-fcaed4660ad9	019e8331-3038-701d-b958-9fad182a080e	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 12:38:19
019e8331-3051-71dc-991e-2c0da7c9eb3a	019e8331-3038-701d-b958-9fad182a080e	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 12:38:19
019e8331-3052-71b6-9b88-c617b1632bd3	019e8331-3038-701d-b958-9fad182a080e	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 12:38:19
019e8331-3053-7054-a63d-6ea7e46195b6	019e8331-3038-701d-b958-9fad182a080e	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 12:38:19
019e8324-3473-7034-8ca8-1fe360cf0972	019e8324-3468-7132-8090-721db3e72153	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-01 12:24:08
019e8324-3475-7198-8307-6cbfc8e5dc31	019e8324-3468-7132-8090-721db3e72153	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	t	2026-06-01 12:24:08
019e8324-3477-700a-91c5-90c2360a5fbf	019e8324-3468-7132-8090-721db3e72153	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-01 12:24:08
019e8324-3479-727f-88cf-42493eedaa05	019e8324-3468-7132-8090-721db3e72153	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	fhhh	f	f	2026-06-01 12:24:08
019e8335-34a8-716b-8a37-6abb8f85389c	019e8335-349f-712c-92bb-40acd516b996	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:42:42
019e8335-34a9-72a3-8c26-f9f54165cfba	019e8335-349f-712c-92bb-40acd516b996	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:42:42
019e8335-34aa-7027-bda6-1d8f981ff692	019e8335-349f-712c-92bb-40acd516b996	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:42:42
019e8335-34ab-704b-976e-d49c90e58583	019e8335-349f-712c-92bb-40acd516b996	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:42:42
019e8335-34ac-7175-a29f-e4b69f0cb6b2	019e8335-349f-712c-92bb-40acd516b996	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:42:42
019e8335-34ad-70e1-80f1-ce81d1c1a44c	019e8335-349f-712c-92bb-40acd516b996	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:42:42
019e8335-34ae-710d-8742-5dfff1e63d5b	019e8335-349f-712c-92bb-40acd516b996	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:42:42
019e8335-34af-7089-9570-020449bdb272	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:42:42
019e8335-34b0-704d-b6e7-ea156212b1a1	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:42:42
019e8335-34b1-70a4-b32d-9cfa9343851b	019e8335-349f-712c-92bb-40acd516b996	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:42:42
019e8335-34b2-7225-a4d9-120ddb76c742	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:42:42
019e8335-34b3-7317-9380-4c8a509397c4	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:42:42
019e8335-34b5-720a-8d4b-c581605c1839	019e8335-349f-712c-92bb-40acd516b996	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:42:42
019e8335-34b6-726c-bebc-81ad3565601c	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:42:42
019e8335-34b7-73ad-a134-e4e4659f5955	019e8335-349f-712c-92bb-40acd516b996	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:42:42
019e8335-34b8-7115-81b6-31d8e1e63f43	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:42:42
019e8344-ada0-7016-8451-e28c435a9e97	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:59:36
019e8335-34a4-7279-97cb-edc2d2d94d15	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	t	2026-06-01 12:42:42
019e8335-34a5-700c-ab8d-e16e20ebceb8	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3275-71ec-91d8-9f6937c785d8	cjvjvjvi	f	f	2026-06-01 12:42:42
019e8335-34a6-704f-8f98-1e2554d2171c	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-01 12:42:42
019e8344-ada1-725a-ac1b-3d457ac60c0b	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:59:36
019e8335-34a2-7081-85f7-fa7ee2ac7456	019e8335-349f-712c-92bb-40acd516b996	019e71e1-3270-72c4-a123-4fd4e2837da1	givigig	f	t	2026-06-01 12:42:42
019e8339-af42-70da-aed9-12357fdf116a	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:47:36
019e8339-af43-72e9-bd9e-b7ee8c8a0ef1	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:47:36
019e8339-af44-7128-b5d0-219ab4e5a956	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:47:36
019e8339-af45-71e6-add3-f3b1319b5583	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:47:36
019e8339-af46-73d8-92b3-56ca17a9ee6e	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:47:36
019e8339-af47-71d1-a5c0-a286e76546c5	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:47:36
019e8339-af48-7187-91b3-4e6549a893ce	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:47:36
019e8339-af49-7199-a7fe-b5d86f50132f	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:47:36
019e8339-af4a-7259-ab38-7f9707001f79	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:47:36
019e8339-af4c-71b9-af6a-d9f76dac30be	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:47:36
019e8339-af4d-7085-9776-71d20a38e5d9	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:47:36
019e8339-af4e-70a6-8395-cd258e6ddfbc	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:47:36
019e8339-af4f-71e5-9fac-c9bc7d79d313	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:47:36
019e8339-af50-713e-bb5d-ef56bd153cf9	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:47:36
019e8339-af3a-7214-95a7-76e1480f2d5c	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-01 12:47:36
019e8339-af3b-736e-b324-f2c37236c9cf	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-326f-71da-ad92-48800b1c008e	gzjsvdjhdjd	f	f	2026-06-01 12:47:36
019e8339-af3d-73a2-bb97-682bf683e79d	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-01 12:47:36
019e8344-ada3-71c9-9c9c-3bb9178b31e7	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:59:36
019e8339-af3e-71ff-bd19-42d58c81b4be	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-3267-734a-abc1-895dd8abaf31	hdkshdj	f	t	2026-06-01 12:47:36
019e8339-af3f-7149-a265-cbd0da349a08	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-327e-72b7-9b50-f40528ac67e7	gogovl	f	f	2026-06-01 12:47:36
019e8339-af41-709e-8ba3-05684554b14f	019e8339-af37-7379-9910-e303b7d8f4b1	019e71e1-326b-72db-83f5-77053c15a6f1	dgfghh	f	f	2026-06-01 12:47:36
019e8344-915b-72fd-9848-3131c492a48f	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:59:29
019e8344-915c-72b5-af51-346efab69bc6	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:59:29
019e8344-915e-701f-a074-56e4c8e09643	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:59:29
019e8344-915f-73d2-b9a9-adb91d2783d9	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:59:29
019e8344-9160-7039-98dc-830986062945	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:59:29
019e8344-9162-7229-b707-c4e8e02b06f1	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:59:29
019e8344-9163-738e-ab29-59ec973dbc0b	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:59:29
019e8344-9164-72c3-a986-4b3fced02c63	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 12:59:29
019e8344-9165-7091-9318-25d21eb8b9be	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 12:59:29
019e8344-9167-7310-b492-887daa5c6279	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:59:29
019e8344-9168-73e5-9426-09f73595adef	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:59:29
019e8344-9169-70e3-9a27-4a1fe3afb790	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 12:59:29
019e8344-916a-71b3-b6c2-dcdce0fc972d	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:59:29
019e8344-916b-716c-8029-536aae33f774	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:59:29
019e8344-916c-7085-a0e5-9d7aba2603d9	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:59:29
019e8344-916d-712d-9dd3-df831f11934d	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:59:29
019e8344-916f-73cf-8abb-3de1f224d4f9	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:59:29
019e8344-9170-709a-91f1-a477503049bb	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:59:29
019e8344-9171-711d-a177-93e77a2892a1	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:59:29
019e8344-9172-71bc-a347-95175391e5ef	019e8344-9158-7204-b9b7-2cc75eb853a6	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:59:29
019e8344-ada4-704f-bc28-1435eecf4ffa	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 12:59:36
019e8344-ada5-71e6-bc0e-2a5f08067029	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 12:59:36
019e8344-ada7-727a-8e05-778e7c5cc7a8	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 12:59:36
019e8344-ada8-7034-b8d2-579d774e6281	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 12:59:36
019e8344-ada9-7197-b145-81a197357eee	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 12:59:36
019e8344-adaa-728e-a0ab-11b8cca2fc21	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 12:59:36
019e8344-adac-7304-8866-8a8bf0e63efe	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 12:59:36
019e8344-adad-7189-8721-13e32bbe6ae5	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 12:59:36
019e8344-adae-73b7-88ca-bea1ea512380	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 12:59:36
019e8344-adaf-71f0-883a-15a2a94bc4d5	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 12:59:36
019e8344-adb1-7349-9473-4f9a9399e8dd	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 12:59:36
019e8344-adb2-7129-8791-207950b22c5b	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 12:59:36
019e8344-adb3-7225-9b06-676308cb2ef2	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 12:59:36
019e8344-adb5-70c1-934a-82da535d6531	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 12:59:36
019e8344-adb6-71f3-8322-98cebf1f6a47	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 12:59:36
019e8344-adb7-720d-b2c1-db17c2d1f802	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 12:59:36
019e8344-adb8-71d4-9867-ab38d3abf16e	019e8344-ad9c-7035-895a-8912c21b5189	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 12:59:36
019e834d-5b67-7181-af53-b5cdc6a90242	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 13:09:05
019e834d-5b69-70a9-b1ec-a71f02b6213a	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 13:09:05
019e834d-5b6a-721e-8f76-1c279fd8d060	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 13:09:05
019e834d-5b6c-738a-a0c8-22de0dc2ae6f	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 13:09:05
019e834d-5b6d-71e9-92a4-f1c3efeabad6	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 13:09:05
019e834d-5b6e-71f7-8f9c-9c3c98332e89	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 13:09:05
019e834d-5b70-7365-b896-cfea98d4d09f	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 13:09:05
019e834d-5b71-71ee-a580-b0862ad0f255	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 13:09:05
019e834d-5b72-7364-9da9-d9ff606a636c	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 13:09:05
019e834d-5b74-71f7-8f03-6ce8f103601d	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 13:09:05
019e834d-5b75-72f2-a307-203e64a0e61d	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 13:09:05
019e834d-5b76-7206-94e1-eb9d17397ab7	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 13:09:05
019e834d-5b77-7391-9f06-3d462e5c5d1c	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 13:09:05
019e834d-5b5e-72c6-8598-aa929e6e565b	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b93-72a4-719f-92fd-1bb01f8f151f	fsdbgdfbd	f	f	2026-06-01 13:09:05
019e836f-34de-73cb-b9a8-8e7f71e022d8	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-01 13:46:03
019e834d-5b60-7189-a06c-64582d6d9264	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	t	2026-06-01 13:09:05
019e834d-5b61-7012-8e27-1344c9809c4d	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-01 13:09:05
019e8350-50eb-7398-b35f-69c78650c121	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 13:12:19
019e8350-50ec-71e8-9226-c277858d8523	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 13:12:19
019e8350-50ed-720c-aecf-250a824fbe60	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 13:12:19
019e8350-50ee-7370-a971-8aad61151cf6	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 13:12:19
019e8350-50f0-7338-9888-0d9a29e35f02	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 13:12:19
019e8350-50f1-736a-827c-dbf023518da7	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 13:12:19
019e8350-50f2-723c-812c-77a0e106d55f	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 13:12:19
019e8350-50f3-72ff-83c7-df1d6a82325f	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 13:12:19
019e8350-50f4-7128-85c9-097dc88b4942	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 13:12:19
019e8350-50f6-72be-a2fe-2deb95b4773b	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 13:12:19
019e8350-50f7-7348-9443-b29514a480f7	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 13:12:19
019e8350-50f8-7257-81be-91919f66d192	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 13:12:19
019e8350-50f9-7022-b0a7-a2669a7a9b05	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 13:12:19
019e8350-50fa-718e-a1cb-776e8607cbab	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 13:12:19
019e8350-50fc-72ff-a077-d44da98aeb0b	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 13:12:19
019e8350-50fd-7054-a31a-e4b3f0e06c11	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 13:12:19
019e8350-50fe-7285-8417-d69720a1ccc8	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 13:12:19
019e8350-50ff-70f4-970d-c6c20e9951fc	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 13:12:19
019e8350-5100-7394-86e8-7a869d157d85	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 13:12:19
019e834d-5b63-71e2-804b-49a5c9f376c3	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-01 13:09:05
019e836f-34e1-700a-abd2-816c69040bae	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-01 13:46:03
019e834d-5b68-71ef-a1c9-b81aabef0499	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	t	2026-06-01 13:09:05
019e8350-50e9-726f-9005-0d827a92ef83	019e8350-50e6-729c-811f-1062da1dcc43	019e71e1-326e-708c-8deb-5b611d1fca9b	hsjghid	f	f	2026-06-01 13:12:19
019e8357-8482-7385-bc15-74c5c4584281	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 13:20:11
019e8357-8484-70d6-9437-87317186a726	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 13:20:11
019e8357-8485-718d-aa28-888f503f5ef1	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 13:20:11
019e8357-8486-7199-9339-1b70e226a8af	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 13:20:11
019e8357-8488-731b-affd-1e3d74a71cca	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 13:20:11
019e8357-8489-702c-93a9-9fc362873f57	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 13:20:11
019e8357-848a-7314-8b90-309663a2435a	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 13:20:11
019e8357-848b-73cc-b2b2-03aedcb1dac1	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 13:20:11
019e8357-848c-706b-b60c-984f8928ff0c	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 13:20:11
019e8357-848e-703e-9aa5-06c74f0fc5ca	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 13:20:11
019e8357-848f-73cf-a9c4-4bc2fef1c165	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 13:20:11
019e8357-8490-70ad-b819-b2bae023fc36	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 13:20:11
019e8357-8491-7311-b3a9-58b48c31c7ad	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 13:20:11
019e8357-8493-7153-82c8-e389febbfb85	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 13:20:11
019e8357-8494-7201-95c4-a58599ff5c86	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 13:20:11
019e8357-8495-720a-924a-ee45ce75d525	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 13:20:11
019e8357-8496-719d-85f6-749f4924f85a	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 13:20:11
019e8357-8497-71c3-a1a1-f9b796a0de14	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 13:20:11
019e8357-8499-73d0-8daa-640ab3d530e4	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 13:20:11
019e8357-8480-7201-afb7-c01eb80c4ae6	019e8357-847e-71cb-a1ac-705232b50899	019e71e1-326b-72db-83f5-77053c15a6f1	hzkfhhd	f	f	2026-06-01 13:20:11
019e834d-5b64-722d-9f1e-20053aa5433f	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-01 13:09:05
019e834d-5b65-70fd-b3e5-7c9238a24e09	019e834d-5b5b-735f-802f-b19c9f0cfb16	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-01 13:09:05
019e836f-34e2-7160-9008-246e1f26f4f2	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 13:46:03
019e836f-34e3-7040-99dc-1c361d228c81	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 13:46:03
019e836f-34e4-7355-a8dd-131dc35995f9	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 13:46:03
019e836f-34e6-712b-b527-964f36841869	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 13:46:03
019e836f-34e7-722d-916e-50e58d54d21d	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 13:46:03
019e836f-34e8-7114-8342-ad8eff2cacc1	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 13:46:03
019e836f-34e9-7370-a07f-dc38408d85bc	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 13:46:03
019e836f-34ea-7202-bc5e-6f4e3ed615d3	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 13:46:03
019e836f-34eb-73ba-bd3c-ae07bb897322	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 13:46:03
019e836f-34ec-7088-ba4c-5fcbfe717e6b	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 13:46:03
019e836f-34ee-716f-b365-2b66040152fd	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 13:46:03
019e836f-34f0-72ff-89a1-e7a2b02f466f	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 13:46:03
019e836f-34f1-73f1-8ed2-05aceec2ecbd	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 13:46:03
019e836f-34f2-7360-a5fa-68477e3d6ede	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 13:46:03
019e836f-34f4-71f7-979c-f8c9cda3da47	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 13:46:03
019e836f-34f5-736e-8697-c00d241364d1	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 13:46:03
019e836f-34f6-719a-8ca0-d259816350c4	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 13:46:03
019e836f-34f7-714d-815f-a2efdac86ee5	019e836f-34d9-7090-8975-772fcfc1a291	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 13:46:03
019e8385-aa82-7070-950d-8df3bd951ccd	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 14:10:35
019e8385-aa84-7124-8ba4-2492677f5d80	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 14:10:35
019e8385-aa85-7362-958d-b1cc5b54899c	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 14:10:35
019e8385-aa87-71cc-9a32-eb47ef263df3	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 14:10:35
019e8385-aa88-7062-9ef0-275eba00f477	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 14:10:35
019e8385-aa89-727b-a9e9-0863eb888fe4	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 14:10:35
019e8385-aa8a-733b-8f83-522c59331519	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 14:10:35
019e8385-aa8c-72b9-bf85-503474eee2d8	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 14:10:35
019e8385-aa8d-7165-8dbf-c2975ef2acd3	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 14:10:35
019e8385-aa8e-7082-ab82-fe4e79dc90a6	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 14:10:35
019e8385-aa8f-72fc-a92f-476d39e087f3	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 14:10:35
019e8385-aa90-7027-80ff-f72d1df05a7c	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 14:10:35
019e8385-aa91-70fe-9ca9-4a18eab366f4	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 14:10:35
019e8385-aa92-73ea-a0c7-6fae21ff9ac6	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 14:10:35
019e8385-aa93-72b1-8a3f-fceb282058ec	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 14:10:35
019e8385-aa95-72a7-a613-24e00641d12a	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 14:10:35
019e8385-aa96-7361-8ef2-1140f285e893	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 14:10:35
019e8385-aa97-71b4-8d03-182facd5091e	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 14:10:35
019e8385-aa98-711c-ab06-6acdf558a634	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 14:10:35
019e8385-aa99-73de-9803-77a81c60d9cf	019e8385-aa7e-71a3-b235-b9da7e64deb1	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 14:10:35
019e8385-fc0a-725d-9b11-200b7ae2bf04	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 14:10:56
019e8385-fc0b-73df-b072-5d7c9d131260	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 14:10:56
019e8385-fc0c-71ac-afe8-76bac001ee4e	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 14:10:56
019e8385-fc0e-701a-bf85-fe51250a8cc3	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 14:10:56
019e8385-fc0f-70db-8209-ec289590fb11	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 14:10:56
019e8385-fc10-7011-b8d7-482184a02aa1	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 14:10:56
019e8385-fc12-735e-8b14-55e7de5de0cd	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 14:10:56
019e8385-fc13-7397-9d22-691b6eedbf62	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 14:10:56
019e8385-fc14-73e0-8cda-8b66652f7d93	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 14:10:56
019e8385-fc15-73f3-b525-7ca80d420c7e	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 14:10:56
019e8385-fc17-7370-947d-90a5f981e9d5	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 14:10:56
019e8385-fc18-7311-8742-093a606fdcdd	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 14:10:56
019e8385-fc19-713d-a586-456e6b08f9a2	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 14:10:56
019e8385-fc1b-73f6-8a84-5e2655af0052	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 14:10:56
019e8385-fc1c-70d6-851e-396cb58ea3e5	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 14:10:56
019e8385-fc1e-70db-934f-454d7401a328	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 14:10:56
019e8385-fc1f-72d7-a61d-7b4073fbd558	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 14:10:56
019e8385-fc05-712a-88f1-bffa685362b1	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-01 14:10:56
019e8385-fc07-71f1-b7f9-0dbc920f589e	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-01 14:10:56
019e8385-fc08-70e3-834f-3b7ca09bb18a	019e8385-fc02-73c6-a053-86f4eb363a80	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-01 14:10:56
019e8387-e27e-714c-9bf1-9bf6b1d43273	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 14:13:01
019e8387-e27f-7320-aad1-c6cf4020a58c	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 14:13:01
019e8387-e281-7125-b7ed-1f5c64b7e535	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 14:13:01
019e8387-e282-71f4-9315-1150161ee912	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 14:13:01
019e8387-e283-706e-9d03-18e705bc23a0	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 14:13:01
019e8387-e284-70ee-8c23-0acc96e9f8a7	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 14:13:01
019e8387-e285-7280-b685-e1314373c32c	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 14:13:01
019e8387-e287-7115-8c89-2adcae7ee8f0	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 14:13:01
019e8387-e288-7352-86c1-2423a4bce7f3	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 14:13:01
019e8387-e289-7026-9df1-0f474e17c844	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 14:13:01
019e8387-e28a-7020-b543-8b6eba8c8487	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 14:13:01
019e8387-e28c-728e-8dcb-bf8cd8b06a77	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 14:13:01
019e8387-e28d-70db-b5aa-cbad9328b3d5	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 14:13:01
019e8387-e28e-724c-b9e9-c2d89b566723	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 14:13:01
019e8387-e28f-7008-996c-44cbace1e95b	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 14:13:01
019e8387-e291-71f3-ac3b-5b238582687a	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 14:13:01
019e8387-e278-738c-8fc4-8c0fa8b36c28	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-326a-7367-b316-afb7232fe48c	hskdhzd	f	f	2026-06-01 14:13:01
019e8387-e27a-73be-8888-4e738e634473	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3270-72c4-a123-4fd4e2837da1	hzkshxb	f	f	2026-06-01 14:13:01
019e8388-a2d5-70fe-9470-e8c57c0960b3	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:13:50
019e8388-a2d7-709d-9c50-dcc7153e7ca1	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:13:50
019e8388-a2d8-71ea-b587-fb181f629931	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:13:50
019e8388-a2da-7270-b7b8-53c43e0772b8	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:13:50
019e8388-a2db-70b1-9101-3ea670c99753	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:13:50
019e8388-a2dc-7153-a8b2-b08d5da2e36e	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:13:50
019e8388-a2dd-73d6-8b7a-72f033580eac	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:13:50
019e8388-a2de-7384-91ea-4f2c757612a9	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:13:50
019e8388-a2df-7026-89ec-39b94e0dbaa4	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:13:50
019e8388-a2e3-705c-97ac-e09a6a999fa4	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:13:50
019e8388-a2e5-72b0-bc0b-b2cf3954e117	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:13:50
019e8388-a2e6-726d-9375-89fd79071fb8	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:13:50
019e8388-a2e7-73ee-a024-a27784914f36	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:13:50
019e8388-a2e9-731b-893b-d1daa3e5dd86	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:13:50
019e8388-a2ea-731c-ba50-d39eac18e3bb	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:13:50
019e8388-a2eb-7034-a671-3da9d7984d5b	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:13:50
019e8388-a2ec-7152-8099-6421e025319e	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:13:50
019e8388-a2ed-733a-ae32-96c1f861a10a	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:13:50
019e8387-e27b-7155-bfa2-885e331726d8	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-01 14:13:01
019e8387-e27d-71a5-8d57-31ca6571059c	019e8387-e275-70d3-ab37-f6828e90f491	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-01 14:13:01
019e8388-a2ef-73ac-8269-fc9a3b04aafb	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:13:50
019e8388-a2f0-7147-9a06-5b122303ec39	019e8388-a2d2-72d5-8589-853a21ee061c	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:13:50
019e8388-a7b2-72ae-afa3-4c4a6b08853a	019e8388-a7af-733d-8068-557500bdcd30	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:13:51
019e8388-a7b4-703a-9dd1-f87fcfe6a33b	019e8388-a7af-733d-8068-557500bdcd30	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:13:51
019e8388-a7b5-70a5-898d-c0b9889c14b8	019e8388-a7af-733d-8068-557500bdcd30	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:13:51
019e8388-a7b6-7322-a30a-3a41cb06f1fa	019e8388-a7af-733d-8068-557500bdcd30	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:13:51
019e8388-a7b8-70e9-a135-c0145d540c27	019e8388-a7af-733d-8068-557500bdcd30	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:13:51
019e8388-a7b9-73f7-a718-1c0782249676	019e8388-a7af-733d-8068-557500bdcd30	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:13:51
019e8388-a7ba-72d2-b7bc-2bdf70efc23e	019e8388-a7af-733d-8068-557500bdcd30	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:13:51
019e8388-a7bc-71ec-a365-55733348222c	019e8388-a7af-733d-8068-557500bdcd30	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:13:51
019e8388-a7bd-70b8-9310-03ec57226772	019e8388-a7af-733d-8068-557500bdcd30	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:13:51
019e8388-a7be-72b4-8a7f-7ec2d024e029	019e8388-a7af-733d-8068-557500bdcd30	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:13:51
019e8388-a7bf-73ed-a1ff-42582f1630e9	019e8388-a7af-733d-8068-557500bdcd30	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:13:51
019e8388-a7c0-7054-8e9f-708c34051462	019e8388-a7af-733d-8068-557500bdcd30	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:13:51
019e8388-a7c1-7110-a410-afacd9b65628	019e8388-a7af-733d-8068-557500bdcd30	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:13:51
019e8388-a7c2-7033-8de3-c85a7f11db63	019e8388-a7af-733d-8068-557500bdcd30	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:13:51
019e8388-a7c4-7150-b770-d1b13e56e987	019e8388-a7af-733d-8068-557500bdcd30	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:13:51
019e8388-a7c5-71ae-bbd6-6ec8062d8c2c	019e8388-a7af-733d-8068-557500bdcd30	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:13:51
019e8388-a7c7-7369-b217-b8ce04ba2d27	019e8388-a7af-733d-8068-557500bdcd30	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:13:51
019e8388-a7c8-73d7-9e3e-83fb7b2c046a	019e8388-a7af-733d-8068-557500bdcd30	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:13:51
019e8388-a7c9-713f-b65a-fcbbc4bb73e1	019e8388-a7af-733d-8068-557500bdcd30	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:13:51
019e8388-a7ca-734e-91d0-8d618f65ef6c	019e8388-a7af-733d-8068-557500bdcd30	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:13:51
019e8388-ac0d-7047-9d3e-eab0a6c9fc8e	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:13:52
019e8388-ac0f-738f-a351-fb5e14ba202b	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:13:52
019e8388-ac10-71b7-9d5d-26cac9a4e1c1	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:13:52
019e8388-ac11-7278-8a95-b1a5e2b08295	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:13:52
019e8388-ac13-724b-9db6-0265315e67f3	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:13:52
019e8388-ac14-71f9-bddb-711167f3e30d	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:13:52
019e8388-ac15-7134-b611-f0aa9b19f323	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:13:52
019e8388-ac16-72d2-933a-f96acedfcb5b	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:13:52
019e8388-ac17-7173-945f-f63df1a4ff3b	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:13:52
019e8388-ac19-70e0-8904-926e43a66cad	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:13:52
019e8388-ac1a-7326-bd4a-2931dd271ffe	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:13:52
019e8388-ac1b-73a6-b1ed-f0ffdda34f73	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:13:52
019e8388-ac1c-71e6-bc7e-78e198260cf6	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:13:52
019e8388-ac1e-70d7-8a2c-40be8e3e87fb	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:13:52
019e8388-ac1f-71fb-9cc6-f5aa8f7afcac	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:13:52
019e8388-ac20-718e-b4da-02d7b6e9147f	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:13:52
019e8388-ac21-7365-ab0d-5159c0b53a3a	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:13:52
019e8388-ac22-730d-97ce-04e7d4881b73	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:13:52
019e8388-ac23-72c9-a52e-190592a54620	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:13:52
019e8388-ac24-72c2-9540-95d9078831b0	019e8388-ac0a-725a-a9b3-aa69d2b73514	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:13:52
019e8388-b7c5-70ed-a008-fdb2598a6b8f	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:13:55
019e8388-b7c6-7061-83d4-cd39aa0a7b76	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:13:55
019e8388-b7c8-7262-b9e1-1ad876ca0edc	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:13:55
019e8388-b7c9-70f3-be49-c26e8f83cfa1	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:13:55
019e8388-b7ca-731b-b101-562b680a5150	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:13:55
019e8388-b7cb-70bd-ac35-b19e5584c63e	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:13:55
019e8388-b7cc-72c1-905a-781b3ce6a6f3	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:13:55
019e8388-b7cd-73ae-aabb-8386681c9940	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:13:55
019e8388-b7ce-712e-836f-2e6c2a3c2155	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:13:55
019e8388-b7cf-7129-9226-25830a487fb0	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:13:55
019e8388-b7d1-7283-a719-127694674492	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:13:55
019e8388-b7d2-71a6-aabd-0135eeed1165	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:13:55
019e8388-b7d3-730e-b98a-cef02fcd9f2f	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:13:55
019e8388-b7d4-7332-b86a-eab634653108	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:13:55
019e8388-b7d5-72ce-9ff0-2aab0796b267	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:13:55
019e8388-b7d6-727d-b4da-2b7d3acf0ff6	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:13:55
019e8388-b7d7-716e-a71a-ec5b65435a1a	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:13:55
019e8388-b7c0-7163-a7b6-93768b358448	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-01 14:13:55
019e8388-b7c2-7059-8d29-8dbb1517e1bd	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b93-72a4-719f-92fd-1bb01f8f151f	dfgdh	f	f	2026-06-01 14:13:55
019e8388-b7c4-73ec-807e-27037b98a6cb	019e8388-b7bd-70f7-be45-afc11205ed22	019e7b92-2867-7295-bd89-eeffa7b5e9e5	fgbhgn	f	f	2026-06-01 14:13:55
019e8389-4629-700f-9fb5-55284c549979	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:14:32
019e8389-462b-728a-b8da-0a1cd90a3678	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:14:32
019e8389-462d-70da-a486-5b31d0504b01	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:14:32
019e8389-462e-72ee-91e1-08be09deae47	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:14:32
019e8389-4630-7347-b952-2540bf1b5e1c	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:14:32
019e8389-4631-7306-b716-ec3be24b94e9	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:14:32
019e8389-4632-730f-9d0b-e2f264ea794f	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:14:32
019e8389-4634-71b5-9f1d-700f2ba3bc0c	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:14:32
019e8389-4635-73ab-a97a-c7f4d924172d	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:14:32
019e8389-4636-73be-b2fc-2f0304a9ba22	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:14:32
019e8389-4637-70aa-8b57-aa1b42a08397	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:14:32
019e8389-4638-716c-8a47-af1591aa12e3	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:14:32
019e8389-4639-7367-bdeb-d0a5d2e2848b	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:14:32
019e8389-463a-72a0-b973-1d8664392387	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:14:32
019e8389-463c-73cf-be4c-32ceb26f1134	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:14:32
019e8389-463d-7112-b1dc-a5fea70c040a	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:14:32
019e8389-463e-73b8-9990-27e789463ef4	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:14:32
019e8389-4640-72b5-8f22-c6a2ea2ec573	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:14:32
019e8389-4641-7031-8f40-36d95711fd02	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:14:32
019e8389-4642-71ae-9f32-796a2d3fa25d	019e8389-4626-73b9-8a41-4924b90e2b76	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:14:32
019e8389-75df-72a1-9805-2073e6ba48c5	019e8389-75db-7119-b451-c6ef304adfe3	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:14:44
019e8389-75e1-72a4-ba69-02f7d7ef04f0	019e8389-75db-7119-b451-c6ef304adfe3	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:14:44
019e8389-75e2-73e6-ad1f-ae23aa0c915b	019e8389-75db-7119-b451-c6ef304adfe3	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:14:44
019e8389-75e3-70b0-8b60-21316bdb2eaa	019e8389-75db-7119-b451-c6ef304adfe3	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:14:44
019e8389-75e5-713c-8608-821ea98d4fbf	019e8389-75db-7119-b451-c6ef304adfe3	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:14:44
019e8389-75e6-7211-b41f-7fcf30860405	019e8389-75db-7119-b451-c6ef304adfe3	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:14:44
019e8389-75e7-701c-b51a-f0cf89c8dfb5	019e8389-75db-7119-b451-c6ef304adfe3	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:14:44
019e8389-75e9-7291-945c-09014c14bb9a	019e8389-75db-7119-b451-c6ef304adfe3	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:14:44
019e8389-75ea-70fc-87ab-9e3ac3be761f	019e8389-75db-7119-b451-c6ef304adfe3	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:14:44
019e8389-75eb-71ac-b818-92dae0fc08f5	019e8389-75db-7119-b451-c6ef304adfe3	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:14:44
019e8389-75ec-700d-8c75-133a04aaee14	019e8389-75db-7119-b451-c6ef304adfe3	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:14:44
019e8389-75ee-71d4-9dfc-6591aee35d19	019e8389-75db-7119-b451-c6ef304adfe3	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:14:44
019e8389-75ef-70b1-8cb0-eb5b2108018c	019e8389-75db-7119-b451-c6ef304adfe3	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:14:44
019e8389-75f0-731f-8f84-8db8b1792f1e	019e8389-75db-7119-b451-c6ef304adfe3	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:14:44
019e8389-75f2-7237-ba0b-9d1849fb2aca	019e8389-75db-7119-b451-c6ef304adfe3	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:14:44
019e8389-75f3-7200-af39-715fff9a82c2	019e8389-75db-7119-b451-c6ef304adfe3	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:14:44
019e8389-75f4-702d-bce9-025f90ca73ff	019e8389-75db-7119-b451-c6ef304adfe3	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:14:44
019e8389-75f6-716f-91cc-375d2676b0bb	019e8389-75db-7119-b451-c6ef304adfe3	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:14:44
019e8389-75f7-739a-a164-fd34ab66aec3	019e8389-75db-7119-b451-c6ef304adfe3	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:14:44
019e8389-75de-727a-9d44-e897e0bb710f	019e8389-75db-7119-b451-c6ef304adfe3	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-01 14:14:44
019e8389-851e-73fe-85f1-31e0ef26e3a1	019e8389-851b-702e-b78c-de9189b8bae9	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:14:48
019e8389-851f-7209-bce3-45e835860763	019e8389-851b-702e-b78c-de9189b8bae9	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:14:48
019e8389-8521-717b-b472-d87dbf212a25	019e8389-851b-702e-b78c-de9189b8bae9	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:14:48
019e8389-8522-71a4-89a8-2a89dd0f40d7	019e8389-851b-702e-b78c-de9189b8bae9	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:14:48
019e8389-8523-73c6-bf27-18842217586a	019e8389-851b-702e-b78c-de9189b8bae9	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:14:48
019e8389-8525-7117-bc8d-936b7a944be2	019e8389-851b-702e-b78c-de9189b8bae9	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:14:48
019e8389-8526-7382-b8f8-259afa1089a8	019e8389-851b-702e-b78c-de9189b8bae9	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:14:48
019e8389-8527-7100-a246-f800fac61484	019e8389-851b-702e-b78c-de9189b8bae9	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:14:48
019e8389-8528-73ed-9d05-38b83e9badb1	019e8389-851b-702e-b78c-de9189b8bae9	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:14:48
019e8389-8529-721f-a221-3d25dd904d18	019e8389-851b-702e-b78c-de9189b8bae9	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:14:48
019e8389-852b-7087-8cf5-ae32002c345b	019e8389-851b-702e-b78c-de9189b8bae9	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:14:48
019e8389-852c-707a-8978-5999ac0eb251	019e8389-851b-702e-b78c-de9189b8bae9	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:14:48
019e8389-852d-70e3-bd45-3e295aa30860	019e8389-851b-702e-b78c-de9189b8bae9	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:14:48
019e8389-852e-7306-9c30-e2487a696c51	019e8389-851b-702e-b78c-de9189b8bae9	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:14:48
019e8389-852f-7072-8c6b-0a0b06267217	019e8389-851b-702e-b78c-de9189b8bae9	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:14:48
019e8389-8530-7000-9d1e-0ecd4d384a7f	019e8389-851b-702e-b78c-de9189b8bae9	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:14:48
019e8389-8532-731a-bd52-6a33518ae520	019e8389-851b-702e-b78c-de9189b8bae9	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:14:48
019e8389-8533-7384-8fac-620c2f67f813	019e8389-851b-702e-b78c-de9189b8bae9	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:14:48
019e8389-8534-72ab-8e07-8922e3ec091c	019e8389-851b-702e-b78c-de9189b8bae9	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:14:48
019e8389-8535-720e-82d4-6e067e0c5eb8	019e8389-851b-702e-b78c-de9189b8bae9	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:14:48
019e8389-8f0b-727d-8469-077c89dee8b3	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:14:50
019e8389-8f0c-7116-871f-ad3e995ae730	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:14:50
019e8389-8f0e-7210-8239-568a1446d067	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:14:50
019e8389-8f0f-70e2-9835-ce24e883a063	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:14:50
019e8389-8f10-72a9-8fca-13522b7bdd0b	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:14:50
019e8389-8f11-72f8-938a-674849b5ece9	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:14:50
019e8389-8f13-70b3-b3b4-4c90832e3442	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:14:50
019e8389-8f14-70d1-8c15-5c6828ed10b5	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:14:50
019e8389-8f15-7188-969b-4a6e093fddd5	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:14:50
019e8389-8f16-70ed-aca1-d4b87ab7fdb7	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:14:50
019e8389-8f17-7336-ba9a-f89f1430f0ff	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:14:50
019e8389-8f19-7331-ab3d-31e303898164	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:14:50
019e8389-8f1a-7133-b43c-048d7bc0cb6b	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:14:50
019e8389-8f1b-72b1-b8f7-c8918c538d1d	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:14:50
019e8389-8f1c-737c-8d5b-df53f915caeb	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:14:50
019e8389-8f1d-724a-9635-d6851073653d	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:14:50
019e8389-8f1f-728b-a6c7-8e65b13525c1	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:14:50
019e8389-8f20-723d-8753-110256afcf62	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:14:50
019e8389-8f21-728b-b24f-bba1054e4129	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:14:50
019e8389-8f09-70fb-9ba6-02664b03ea7d	019e8389-8f06-72cf-a38c-27bf67765bce	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-01 14:14:50
019e8389-b22a-7374-9756-e1bc27a7971d	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:14:59
019e8389-b22c-7058-8ac3-a524b730008c	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:14:59
019e8389-b22d-73ac-a1e7-48bbfc83be24	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:14:59
019e8389-b22e-70ce-9b60-902341e30948	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:14:59
019e8389-b230-706b-be5d-2cc2908ceb8a	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:14:59
019e8389-b231-716d-b01e-a39833def1ac	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:14:59
019e8389-b232-7042-baf2-d599f20208b9	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:14:59
019e8389-b234-737f-9d5d-0bacb1ca93f0	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:14:59
019e8389-b235-70b0-8bf4-b0237f1c56e4	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:14:59
019e8389-b236-707f-8ed9-65afb7a5f430	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:14:59
019e8389-b237-7264-8864-296c7d87f31c	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:14:59
019e8389-b239-7179-b36a-bc64cacf136c	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:14:59
019e8389-b23a-736d-8f49-afa4383fa6c4	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:14:59
019e8389-b23b-7010-b9d7-d56649eab078	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:14:59
019e8389-b23c-7320-aa0d-05ee1e5d47f5	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:14:59
019e8389-b23d-704b-9c49-4e3083bf73aa	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:14:59
019e8389-b23f-70ad-8c35-11e72b1a53b8	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:14:59
019e8389-b240-703d-a6a0-9c1fe62041ad	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:14:59
019e8389-b241-7046-8748-db0c3f66a4cd	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:14:59
019e8389-b242-730d-9df4-cfee1cdb9873	019e8389-b227-7191-b4c3-b7b2cc15ceea	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:14:59
019e8389-ba04-719d-9c83-a7992e6484a1	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:01
019e8389-ba05-73d1-aa11-250fc4ac8c32	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:01
019e8389-ba06-72ad-a9f8-72d47893eee3	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:01
019e8389-ba08-707b-997e-73cab22f6b7f	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:01
019e8389-ba09-71f2-ad7d-f5a76f9c59c0	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:01
019e8389-ba0a-7285-97f9-b626cfd01ac1	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:01
019e8389-ba0b-713a-950f-71e47af8a05a	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:01
019e8389-ba0c-7057-9ec3-611b4cf334f5	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:01
019e8389-ba0d-715c-8473-17f2cd64630f	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:01
019e8389-ba0f-71d6-83bd-c170d61298ad	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:01
019e8389-ba10-711b-9302-6a6dac612236	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:01
019e8389-ba02-70e6-953a-431a3b0e1e8f	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-01 14:15:01
019e8389-ba11-73f8-a2d8-1ad11a99b11a	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:01
019e8389-ba12-7018-b956-9f41d62c86b4	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:01
019e8389-ba13-727f-b957-3f101b0d0b47	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:01
019e8389-ba14-729b-86d3-53bb5bbe5984	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:01
019e8389-ba15-731f-9e27-32d86f0cb669	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:01
019e8389-ba17-72fa-ae4d-cc6edb4cbf33	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:01
019e8389-ba18-7305-b5c4-52a49d0264ef	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:01
019e8389-ba19-7369-abd3-d1d1fe59c33c	019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:01
019e8389-d849-7013-ad3a-01374d3efd3d	019e8389-d846-71ef-b11e-1534c25a23df	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:09
019e8389-d84b-709e-be17-47a328f1e918	019e8389-d846-71ef-b11e-1534c25a23df	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:09
019e8389-d84c-7311-9867-9082a2ef5f87	019e8389-d846-71ef-b11e-1534c25a23df	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:09
019e8389-d84d-72ee-97d4-4fc519e3e0e2	019e8389-d846-71ef-b11e-1534c25a23df	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:09
019e8389-d84e-7110-a57c-efa07edc273f	019e8389-d846-71ef-b11e-1534c25a23df	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:09
019e8389-d84f-705c-9ccb-d0c85d102475	019e8389-d846-71ef-b11e-1534c25a23df	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:09
019e8389-d851-7073-8f20-a21ddaac8927	019e8389-d846-71ef-b11e-1534c25a23df	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:09
019e8389-d852-7393-9c5c-3182cb1f65f6	019e8389-d846-71ef-b11e-1534c25a23df	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:09
019e8389-d853-71ef-8ad8-57405d8eb4d8	019e8389-d846-71ef-b11e-1534c25a23df	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:09
019e8389-d854-715b-badb-7b574f85a414	019e8389-d846-71ef-b11e-1534c25a23df	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:09
019e8389-d856-7284-9a52-0075d62402cd	019e8389-d846-71ef-b11e-1534c25a23df	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:09
019e8389-d857-735a-ba4f-2fbf85cc5cbe	019e8389-d846-71ef-b11e-1534c25a23df	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:09
019e8389-d858-73a3-ab52-deb10f4d81dd	019e8389-d846-71ef-b11e-1534c25a23df	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:09
019e8389-d859-735b-895d-d3ed098205a2	019e8389-d846-71ef-b11e-1534c25a23df	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:09
019e8389-d85b-70e1-a680-c96b7e4f3b35	019e8389-d846-71ef-b11e-1534c25a23df	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:09
019e8389-d85c-729f-8706-3654f7a00e23	019e8389-d846-71ef-b11e-1534c25a23df	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:09
019e8389-d85d-7064-a09a-05482eb00e02	019e8389-d846-71ef-b11e-1534c25a23df	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:09
019e8389-d85e-70bc-9aeb-3191b1b3c00f	019e8389-d846-71ef-b11e-1534c25a23df	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:09
019e8389-d860-71e9-8fc8-5c4b317ea4c5	019e8389-d846-71ef-b11e-1534c25a23df	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:09
019e8389-d861-7335-9d5b-f325d5a255e3	019e8389-d846-71ef-b11e-1534c25a23df	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:09
019e8389-e7ed-72f5-bb20-fa48ca74e400	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:13
019e8389-e7ef-7182-82c7-a8de17e8073b	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:13
019e8389-e7f0-716e-8f3a-6d8640ae548f	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:13
019e8389-e7f1-72c3-973b-fa26aa018d01	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:13
019e8389-e7f3-71fc-af0d-76d1b2cc2919	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:13
019e8389-e7f4-7182-9e71-b93fdb08686b	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:13
019e8389-e7f5-73ca-a062-a4596ef8cc3d	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:13
019e8389-e7f7-7067-9ba0-59045b2b0c3f	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:13
019e8389-e7f8-72e2-9a89-79c0e860014d	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:13
019e8389-e7f9-701d-999a-ec2ba933e2bb	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:13
019e8389-e7fa-72f7-a9eb-c137cf662b33	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:13
019e8389-e7fc-7029-80c6-dea0ab02e7b1	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:13
019e8389-e7fd-7113-b9c1-72f53879e68b	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:13
019e8389-e7fe-7099-96d7-0ac990376b4b	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:13
019e8389-e800-711c-a003-261aae09ad20	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:13
019e8389-e801-7000-8b5e-7c6263a1f83f	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:13
019e8389-e802-72f4-a7f2-585245374d31	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:13
019e8389-e804-708f-a5a8-dd86cd847a3d	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:13
019e8389-e805-7219-b691-bf8c0b97ffdb	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:13
019e8389-e7eb-7120-9730-6bd54e09f2ae	019e8389-e7e8-7222-bd17-6b96ad2701f2	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-01 14:15:13
019e838a-07ba-73db-beb3-14eb24c047d8	019e838a-07b7-7036-b011-356bc24b94c8	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:21
019e838a-07bb-711d-8bdd-bd32ea0a23e5	019e838a-07b7-7036-b011-356bc24b94c8	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:21
019e838a-07bd-72ac-ba0d-b556b998a533	019e838a-07b7-7036-b011-356bc24b94c8	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:21
019e838a-07be-73be-af1e-38fd29d5a8a2	019e838a-07b7-7036-b011-356bc24b94c8	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:21
019e838a-07bf-72ac-9e18-71a56705c56d	019e838a-07b7-7036-b011-356bc24b94c8	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:21
019e838a-07c1-7347-9e41-7ea34e00c2cd	019e838a-07b7-7036-b011-356bc24b94c8	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:21
019e838a-07c2-7349-b6a7-e06134602d1f	019e838a-07b7-7036-b011-356bc24b94c8	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:21
019e838a-07c3-7198-a1e3-c38e8a4a4d69	019e838a-07b7-7036-b011-356bc24b94c8	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:21
019e838a-07c4-7372-9628-36ea60a0f847	019e838a-07b7-7036-b011-356bc24b94c8	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:21
019e838a-07c5-72e1-bcd3-2a88aacd2b71	019e838a-07b7-7036-b011-356bc24b94c8	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:21
019e838a-07c7-71f1-9975-c7be278b6e92	019e838a-07b7-7036-b011-356bc24b94c8	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:21
019e838a-07c8-70aa-921a-8a6b89928800	019e838a-07b7-7036-b011-356bc24b94c8	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:21
019e838a-07c9-708f-9375-c558fad6c2e0	019e838a-07b7-7036-b011-356bc24b94c8	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:21
019e838a-07ca-72e0-b258-c098dea81f75	019e838a-07b7-7036-b011-356bc24b94c8	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:21
019e838a-07cb-7138-8641-c94e035f1591	019e838a-07b7-7036-b011-356bc24b94c8	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:21
019e838a-07cd-7305-82fc-937f4eedd849	019e838a-07b7-7036-b011-356bc24b94c8	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:21
019e838a-07ce-7072-8d25-027ff9fec130	019e838a-07b7-7036-b011-356bc24b94c8	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:21
019e838a-07cf-72c5-9c79-ba7a426fd029	019e838a-07b7-7036-b011-356bc24b94c8	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:21
019e838a-07d0-7113-a955-a6b46a0d0407	019e838a-07b7-7036-b011-356bc24b94c8	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:21
019e838a-07d1-7107-8410-a122cbcd6456	019e838a-07b7-7036-b011-356bc24b94c8	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:21
019e838a-18cf-72be-b5df-f903db9d2721	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:26
019e838a-18d1-71ed-a58b-a27537c51dd1	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:26
019e838a-18d2-710e-984a-91238e8b63c3	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:26
019e838a-18d3-7291-81b5-b063d293b40f	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:26
019e838a-18d5-72c7-b1af-9e5585fadd24	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:26
019e838a-18d6-73e1-b662-a196454f1ce8	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:26
019e838a-18d7-735a-8d2b-09ba4c7fd4e4	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:26
019e838a-18d9-70fb-b0f1-90b0836ef116	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:26
019e838a-18da-73fa-b7b6-b620af009b99	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:26
019e838a-18db-72d8-9a53-bfd3e8dc087d	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:26
019e838a-18dc-705f-86fd-7735580816c3	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:26
019e838a-18de-7196-8b4c-0026d1951ffa	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:26
019e838a-18df-726c-956c-22edbf0e048e	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:26
019e838a-18e0-7101-9896-ad21d15fe8f4	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:26
019e838a-18e1-705a-9d24-106ea5a4de81	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:26
019e838a-18e2-719b-9cac-e05f58474490	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:26
019e838a-18e4-72b0-95d0-9caa9c8d02d5	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:26
019e838a-18e5-73e4-b278-3e3600d6dd90	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:26
019e838a-18cd-7090-8fb1-c315447040da	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-01 14:15:26
019e838a-18e6-7315-bdb6-0159cf136a1d	019e838a-18ca-72d6-b029-e517ede00c0e	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:26
019e838a-4347-7134-b91e-61626c2f5c98	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:37
019e838a-4349-73a3-beac-a894141caeda	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:37
019e838a-434a-72c0-ba33-2db3ddfe3a7d	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:37
019e838a-434c-736a-8e70-5e1233fb8ba4	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:37
019e838a-434d-7033-8f83-7bc34bb57132	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:37
019e838a-434e-727a-b2dd-801f12c5d3b1	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:37
019e838a-434f-72f8-868b-2c0f2744e10c	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:37
019e838a-4350-73e0-9e98-bd11b66e649e	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:37
019e838a-4351-70b9-82ee-a4ec97d92d72	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:37
019e838a-4352-7100-9e09-c5880bebad03	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:37
019e838a-4353-7040-9697-c2981821d31e	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:37
019e838a-4355-7297-b7b6-7bdbf93cb186	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:37
019e838a-4356-70df-a9ed-253d9d814275	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:37
019e838a-4357-7223-8a57-dd8ff2120753	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:37
019e838a-4359-7366-9b31-f008422886e7	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:37
019e838a-435a-7015-98ae-5e35ef0d41c2	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:37
019e838a-435b-704a-9fe7-7043d47eea6d	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:37
019e838a-435c-7398-8215-6990cf7fcb70	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:37
019e838a-435e-7192-87a1-015b44264541	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:37
019e838a-435f-71ba-a8cb-e46046645fb7	019e838a-4344-710d-aab4-9bcccff1c7bb	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:37
019e838a-4fbe-7131-96a4-4e2bf326acb1	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:40
019e838a-4fc0-7305-a3c4-22931940784c	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:40
019e838a-4fc1-70a1-8edc-6109d714d83a	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:40
019e838a-4fc2-72f6-80cb-2539841d6a7c	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:40
019e838a-4fc4-73ca-8630-e25055e60251	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:40
019e838a-4fc5-7363-80b8-14317ad5de69	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:40
019e838a-4fc6-7061-b892-79168d9f482d	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:40
019e838a-4fc7-714f-ba7a-2aa1b7cc0870	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:40
019e838a-4fc8-70c5-8d92-8bf9d9986094	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:40
019e838a-4fc9-734d-bacf-b179bec36613	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:40
019e838a-4fca-711e-8999-86504bfb2653	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:40
019e838a-4fcb-72c7-a16a-fd522d1300d4	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:40
019e838a-4fcc-7280-a36f-293ceeb5330a	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:40
019e838a-4fcd-7399-928b-795349307090	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:40
019e838a-4fcf-7124-9078-11a0a49c27cd	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:40
019e838a-4fd0-7047-b1b2-4b6281a5654d	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:40
019e838a-4fd1-7190-ad96-c07cc49f0ec2	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:40
019e838a-4fd2-709e-9b6f-267804d824fe	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:40
019e838a-4fd4-71ed-8a0c-7db42d9bf783	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:40
019e838a-4fbd-70a6-8d52-3a576a3aef98	019e838a-4fba-71f1-ad1a-a9254c547de5	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-01 14:15:40
019e838a-871f-70ec-9d31-7f602688e9dc	019e838a-871c-717c-8bc5-4f1079769fee	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:15:54
019e838a-8720-71a0-a9d8-93e5d84a4b74	019e838a-871c-717c-8bc5-4f1079769fee	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:15:54
019e838a-8722-72ce-9a62-5b101aa28129	019e838a-871c-717c-8bc5-4f1079769fee	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:15:54
019e838a-8723-7081-9d8f-b3f36731d5da	019e838a-871c-717c-8bc5-4f1079769fee	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:15:54
019e838a-8724-713c-b481-6328f9d8fd32	019e838a-871c-717c-8bc5-4f1079769fee	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:15:54
019e838a-8726-706d-8f57-d095de6b6b45	019e838a-871c-717c-8bc5-4f1079769fee	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:15:54
019e838a-8727-7017-85b0-fa71f3ce7a01	019e838a-871c-717c-8bc5-4f1079769fee	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:15:54
019e838a-8728-7304-8aca-8bd9b7a3dcaf	019e838a-871c-717c-8bc5-4f1079769fee	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:15:54
019e838a-8729-7004-9a83-2f33ee24d198	019e838a-871c-717c-8bc5-4f1079769fee	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:15:54
019e838a-872a-7060-94f3-c51905832828	019e838a-871c-717c-8bc5-4f1079769fee	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:15:54
019e838a-872b-73c8-ad64-e011be7d722d	019e838a-871c-717c-8bc5-4f1079769fee	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:15:54
019e838a-872d-71ad-8563-694550d045dc	019e838a-871c-717c-8bc5-4f1079769fee	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:15:54
019e838a-872e-72c0-ad6d-c264036cc964	019e838a-871c-717c-8bc5-4f1079769fee	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:15:54
019e838a-872f-70f6-8a7f-1b1b7363f3b7	019e838a-871c-717c-8bc5-4f1079769fee	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:15:54
019e838a-8730-7338-b92b-e35840015d24	019e838a-871c-717c-8bc5-4f1079769fee	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:15:54
019e838a-8731-73d8-8f26-b3bf0ebe3351	019e838a-871c-717c-8bc5-4f1079769fee	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:15:54
019e838a-8733-7081-bac8-910cf063eed9	019e838a-871c-717c-8bc5-4f1079769fee	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:15:54
019e838a-8734-71ac-b403-3b204506f23f	019e838a-871c-717c-8bc5-4f1079769fee	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:15:54
019e838a-8735-70ce-a1b1-971f8834c400	019e838a-871c-717c-8bc5-4f1079769fee	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:15:54
019e838a-8736-72e3-967e-17911578f52a	019e838a-871c-717c-8bc5-4f1079769fee	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:15:54
019e838a-a7d3-7262-b676-7ee8d6ab3806	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:16:02
019e838a-a7d5-724f-bd43-d15d867e52b4	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:16:02
019e838a-a7d6-729c-b4b3-2ae92e5b27a5	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:16:02
019e838a-a7d7-732a-ae4e-9a4080a76473	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:16:02
019e838a-a7d9-70b4-869e-b0d4fff1d328	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:16:02
019e838a-a7da-71f5-86b9-cf9f3b46bbb3	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:16:02
019e838a-a7db-72d5-8614-94356e43262d	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:16:02
019e838a-a7dc-7182-860e-ed1a8fea276d	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:16:02
019e838a-a7de-71ac-af5c-651d263733f2	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:16:02
019e838a-a7df-7312-8a22-89cdde87c536	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:16:02
019e838a-a7e0-71fd-912e-0dc26fd2f742	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:16:02
019e838a-a7e1-72d0-a9c0-a879dca58577	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:16:02
019e838a-a7e3-739c-bbd6-a1fcb1dbffad	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:16:02
019e838a-a7e4-7161-84b6-002b0866571a	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:16:02
019e838a-a7e5-71ba-acb0-0f25cf69d5ac	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:16:02
019e838a-a7e6-7233-bc2d-c636f73d9b63	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:16:02
019e838a-a7e7-726f-afa7-6ff9ccd26b31	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:16:02
019e838a-a7e8-7135-8c27-fa1eb9c742ea	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:16:02
019e838a-a7d0-7041-b0c0-1b91636c3649	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-01 14:16:02
019e838a-a7d2-70a0-bfba-9689ac4d3851	019e838a-a7cd-712f-a5a7-c34b65945af3	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-01 14:16:02
019e838b-0bc6-7320-b14a-7e48e2f8bc02	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:16:28
019e838b-0bc8-72fc-8405-fefcee238a03	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:16:28
019e838b-0bca-707d-80e5-a71dc9281d7e	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:16:28
019e838b-0bcb-738e-94ce-6e03b6417772	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:16:28
019e838b-0bcc-7385-b7dc-9f0cc1bdef40	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:16:28
019e838b-0bce-7363-a4d6-ead8aedaa2a1	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:16:28
019e838b-0bcf-71ff-8278-c6144afe95be	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:16:28
019e838b-0bd0-73d2-b50f-b8a52666a621	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:16:28
019e838b-0bd1-7396-acd4-c977d8df9bc1	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:16:28
019e838b-0bd2-72d3-b223-7e81eda7dd9a	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:16:28
019e838b-0bd3-7007-b260-4f704b27a858	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:16:28
019e838b-0bd4-73a7-b59c-bc742b33003b	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:16:28
019e838b-0bd6-7317-a460-c4ae7238826b	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:16:28
019e838b-0bd7-7397-830b-a1c2fb09b7f0	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:16:28
019e838b-0bd8-707e-b5f5-7d444a83f50e	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:16:28
019e838b-0bd9-7049-8060-4324ee4b7331	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:16:28
019e838b-0bda-7088-a0ff-b648d7f8d531	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:16:28
019e838b-0bdc-73bd-bfca-d3b9d9e6882b	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:16:28
019e838b-0bdd-7050-bc07-96bd3e54a799	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:16:28
019e838b-0bde-7101-8381-db210f116183	019e838b-0bc3-7258-bf58-9f5bf1627481	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:16:28
019e838b-1529-7194-96ec-e73a13b42f91	019e838b-1526-7027-90e5-5f3a7780940c	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:16:30
019e838b-152b-7358-9bbe-bba7781ae2af	019e838b-1526-7027-90e5-5f3a7780940c	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:16:30
019e838b-152c-7230-b656-92cfce8df9a3	019e838b-1526-7027-90e5-5f3a7780940c	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:16:30
019e838b-152e-7374-bc71-847835013343	019e838b-1526-7027-90e5-5f3a7780940c	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:16:30
019e838b-152f-70e5-ab00-09a70cceff88	019e838b-1526-7027-90e5-5f3a7780940c	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:16:30
019e838b-1530-7311-9051-6bb41f3366b8	019e838b-1526-7027-90e5-5f3a7780940c	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:16:30
019e838b-1532-7197-b6c5-ec404c4788bd	019e838b-1526-7027-90e5-5f3a7780940c	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:16:30
019e838b-1533-729a-a065-d63204cd7f4a	019e838b-1526-7027-90e5-5f3a7780940c	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:16:30
019e838b-1534-711d-bc81-6b160a6a8fcb	019e838b-1526-7027-90e5-5f3a7780940c	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:16:30
019e838b-1535-7359-837f-f1db123f68a3	019e838b-1526-7027-90e5-5f3a7780940c	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:16:30
019e838b-1536-70f2-b638-48d3567b736c	019e838b-1526-7027-90e5-5f3a7780940c	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:16:30
019e838b-1538-73da-9f59-7af893b905ca	019e838b-1526-7027-90e5-5f3a7780940c	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:16:30
019e838b-1539-70d6-9e51-38f6d815e8e0	019e838b-1526-7027-90e5-5f3a7780940c	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:16:30
019e838b-153b-708b-964e-d11e56750bf9	019e838b-1526-7027-90e5-5f3a7780940c	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:16:30
019e838b-153c-719a-9898-94981cb5a14d	019e838b-1526-7027-90e5-5f3a7780940c	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:16:30
019e838b-153d-736c-a4b9-9ab2f5653c13	019e838b-1526-7027-90e5-5f3a7780940c	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:16:30
019e838b-153e-72c4-863d-464829037dba	019e838b-1526-7027-90e5-5f3a7780940c	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:16:30
019e838b-153f-728f-b6b5-f27fd252f6ae	019e838b-1526-7027-90e5-5f3a7780940c	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:16:30
019e838b-1541-7195-a2b3-bf8cc63791b8	019e838b-1526-7027-90e5-5f3a7780940c	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:16:30
019e838b-1542-73b3-9711-317c5a1655ba	019e838b-1526-7027-90e5-5f3a7780940c	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:16:30
019e838b-35e3-71da-a6ba-e172784b0b32	019e838b-35d7-738c-b15a-03a05359801d	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:16:39
019e838b-35e4-7259-be66-c6b437a6a932	019e838b-35d7-738c-b15a-03a05359801d	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:16:39
019e838b-35e6-730a-9bdf-18583c2220b0	019e838b-35d7-738c-b15a-03a05359801d	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-01 14:16:39
019e838b-35e7-736b-b58c-61b20ae21cd6	019e838b-35d7-738c-b15a-03a05359801d	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:16:39
019e838b-35e8-734e-bc90-5f1e2ed150d6	019e838b-35d7-738c-b15a-03a05359801d	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:16:39
019e838b-35e9-7018-bc16-0a5399794b30	019e838b-35d7-738c-b15a-03a05359801d	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:16:39
019e838b-35eb-73ad-bc1f-023021769af6	019e838b-35d7-738c-b15a-03a05359801d	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:16:39
019e838b-35ec-723f-b7ba-927438c55d98	019e838b-35d7-738c-b15a-03a05359801d	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-01 14:16:39
019e838b-35ed-719e-8d8a-99e1cb78a270	019e838b-35d7-738c-b15a-03a05359801d	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-01 14:16:39
019e838b-35ef-728d-a31e-4ca8e2b6878f	019e838b-35d7-738c-b15a-03a05359801d	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:16:39
019e838b-35f0-735d-90a5-84a264a41721	019e838b-35d7-738c-b15a-03a05359801d	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:16:39
019e838b-35f1-70ab-922e-272441b81496	019e838b-35d7-738c-b15a-03a05359801d	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-01 14:16:39
019e838b-35f2-7094-879f-3750e28387b3	019e838b-35d7-738c-b15a-03a05359801d	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:16:39
019e838b-35f3-73c3-9c31-3ef4576f0950	019e838b-35d7-738c-b15a-03a05359801d	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:16:39
019e838b-35da-73f6-bd80-8203f58bf17e	019e838b-35d7-738c-b15a-03a05359801d	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-01 14:16:39
019e838b-35dc-71e3-9197-b7e1d6b5e280	019e838b-35d7-738c-b15a-03a05359801d	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-01 14:16:39
019e838b-35de-7308-adb1-a43d13d0a070	019e838b-35d7-738c-b15a-03a05359801d	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	t	2026-06-01 14:16:39
019e838b-35df-7092-ade1-fc0c99160c41	019e838b-35d7-738c-b15a-03a05359801d	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-01 14:16:39
019e838b-35e0-7054-81f9-5e5f49781856	019e838b-35d7-738c-b15a-03a05359801d	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	t	2026-06-01 14:16:39
019e838b-35e2-7109-bae8-ec980252b0d5	019e838b-35d7-738c-b15a-03a05359801d	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-01 14:16:39
019e838e-e272-72e7-91f1-00fd66082d9b	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-01 14:20:39
019e838e-e274-71f3-983a-621c91c0c01d	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-01 14:20:39
019e838e-e275-7087-a39e-d27527144ffd	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-01 14:20:39
019e838e-e276-73e5-99e3-e415ab1ef0a5	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-01 14:20:39
019e838e-e277-73e9-9661-1e71403c4659	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-01 14:20:39
019e838e-e278-72f4-b66b-af25d8e6dd4b	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-01 14:20:39
019e838e-e279-72a2-bd32-3b7aef76b141	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-01 14:20:39
019e838e-e27a-731c-8586-e04777f45381	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-01 14:20:39
019e838e-e27b-738e-bb41-5ef95311fbd5	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-01 14:20:39
019e838e-e27d-70cd-8d65-678670985ee7	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-01 14:20:39
019e838e-e27e-7331-8a65-dc56ca6934e0	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-01 14:20:39
019e838e-e27f-734f-879c-43c35d7d6b3d	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-01 14:20:39
019e838e-e280-716e-bf3d-10d48ff7a034	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-01 14:20:39
019e838e-e281-734a-a74d-6b64d8596f90	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-01 14:20:39
019e838e-e282-7291-97ef-f289067169f5	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-01 14:20:39
019e838e-e283-7123-9a0a-9d7a6bbb24b5	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-01 14:20:39
019e838e-e26c-70b4-99c3-ef8dd1209258	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-01 14:20:39
019e838e-e26e-7394-8273-3d824d3127a9	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	t	2026-06-01 14:20:39
019e838e-e26f-736a-9441-d88eeb4cb29d	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-01 14:20:39
019e838e-e271-70e8-8e6c-4c0bb04be9f8	019e838e-e269-7061-8ac2-0b6f35c0090b	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	t	2026-06-01 14:20:39
019e8390-4da4-71e4-9ad1-b166a55daf1d	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 14:22:12
019e8390-4da5-7303-9bda-8a341e7844a6	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 14:22:12
019e8390-4da6-715d-a759-287460cd397a	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 14:22:12
019e8390-4da7-706f-b137-95bbf0ac9cba	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 14:22:12
019e8390-4da9-70a8-be1a-ca5de06e2a39	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 14:22:12
019e8390-4daa-72bd-bdd4-5e9936a8bf74	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 14:22:12
019e8390-4dab-7074-bf91-4fa160da9fe7	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 14:22:12
019e8390-4dac-7039-b59c-7b0f97c4f4de	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 14:22:12
019e8390-4d9e-73b1-9f43-437e02091c5f	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-01 14:22:12
019e8390-4da0-7083-a08d-f680c794786c	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-01 14:22:12
019e8390-4da1-71f2-bc7c-6960c824e933	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-01 14:22:12
019e8390-4da2-7169-9ae5-20a08dff0535	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-01 14:22:12
019e8390-4dad-704c-9473-c3ce36e263ac	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 14:22:12
019e8390-4daf-738a-87fc-a654d0a1ad6e	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 14:22:12
019e8390-4db0-7079-abc5-82e89bc9532c	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 14:22:12
019e8390-4db2-7360-a385-2ebec5802259	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 14:22:12
019e8390-4db3-72d6-a85f-0c963cb6e6a9	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 14:22:12
019e8390-4db4-7167-8f3a-07336ec9ec72	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 14:22:12
019e8390-4db5-709d-8fdc-ab8877bee500	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 14:22:12
019e8390-4db6-7363-b0e5-561fd96ad804	019e8390-4d9b-713b-94be-29f986dd4f80	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 14:22:12
019e83e4-820f-7056-bf8f-be49578524e3	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 15:54:11
019e83e4-8212-734e-83fe-9f702031ff66	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 15:54:11
019e83e4-8213-7248-bc30-792d2a1cd694	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 15:54:11
019e83e4-8215-739e-933a-ced35ed361bf	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 15:54:11
019e83e4-8216-71d9-8ba9-7e9f626e4548	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 15:54:11
019e83e4-8218-7284-8c46-818ab3941020	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-01 15:54:11
019e83e4-821a-72d9-8669-13f36653bb8b	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 15:54:11
019e83e4-821d-716b-8b8e-f9b7bd160ef8	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 15:54:11
019e83e4-821e-7093-ba9e-b3124206f60b	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 15:54:11
019e83e4-821f-7040-a57c-0a16717bc34c	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 15:54:11
019e83e4-8222-7083-b6df-15c4bb1cc3d8	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 15:54:11
019e83e4-8223-736a-b31a-e8585edda143	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 15:54:11
019e83e4-8226-7058-b10b-5ae6c2ed8364	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 15:54:11
019e83e4-8227-7055-bd5a-156174c6a340	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 15:54:11
019e83e4-8228-717d-ae41-b2eeecad78df	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 15:54:11
019e83e4-8229-7267-adb8-5fa49b423174	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 15:54:11
019e83e4-822a-7243-9b8c-a5dac063625b	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 15:54:11
019e83e4-822b-707f-82ed-a4ada4e94ae4	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 15:54:11
019e83e4-822d-70a3-bdea-e504ed6690a7	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 15:54:11
019e83e4-822e-711d-ab51-ab072ef04fb5	019e83e4-820b-7101-bb1c-6ef167183394	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 15:54:11
019e83e4-9ea0-73a8-ab69-906658d62c0b	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3276-7022-9eea-b52898a285bc	alright i have to go now	t	f	2026-06-01 15:54:18
019e83e4-9ea1-7272-ab3b-fef4832070b7	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-01 15:54:18
019e83e4-9ea3-72e6-b345-c7f0bc1f50d0	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	fine thank you	t	f	2026-06-01 15:54:18
019e83e4-9ea4-72ee-b4c7-258bce0f4b06	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-326f-71da-ad92-48800b1c008e	do you understand what I mean	t	f	2026-06-01 15:54:18
019e83e4-9ea5-73f3-b5b3-f6dbec996012	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-327d-739e-b4c9-7e19f212ff0b	im going to bed	t	f	2026-06-01 15:54:18
019e83e4-9ea7-73a4-8712-189a964eabd6	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-01 15:54:18
019e83e4-9ea8-7071-bde1-cde5bdc7a8a4	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-326c-7287-8e58-6efb81d2293f	oh im so sorry	t	f	2026-06-01 15:54:18
019e83e4-9ea9-7276-ae4b-40f9fe281161	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3270-72c4-a123-4fd4e2837da1	i don't understand	t	f	2026-06-01 15:54:18
019e83e4-9eaa-7095-b8e6-9c7a21c6cb1e	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-327a-73f4-9a63-092cefb1aabf	i agree	t	f	2026-06-01 15:54:18
019e83e4-9eab-731a-bef2-3063aa7ac069	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how are you	t	f	2026-06-01 15:54:18
019e83e4-9eac-72fb-8a54-408837a7d0b9	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-326a-7367-b316-afb7232fe48c	thank you so much	t	f	2026-06-01 15:54:18
019e83e4-9eae-711c-9b05-2b2e92a0b053	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3273-7288-ac2e-40fac328fb6d	hey do you want to grab some coffee now	t	f	2026-06-01 15:54:18
019e83e4-9eaf-71a6-ab56-dd264324503c	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-01 15:54:18
019e83e4-9eb0-7101-8411-b0ca5362f784	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-327b-70a4-a7ad-d11703dd3c66	where is my key	t	f	2026-06-01 15:54:18
019e83e4-9eb1-71f0-a34c-45444e093b9f	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-326e-708c-8deb-5b611d1fca9b	its okay	t	f	2026-06-01 15:54:18
019e83e4-9eb3-7276-a152-7fbafaf880fc	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-327e-72b7-9b50-f40528ac67e7	hi you are finally here	t	f	2026-06-01 15:54:18
019e83e4-9eb4-73be-9d8b-94fdf6105b15	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3277-7245-8397-2b95ecf990d9	see you later	t	f	2026-06-01 15:54:18
019e83e4-9eb5-7097-bc52-84cf68cb350c	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-326b-72db-83f5-77053c15a6f1	you re welcome	t	f	2026-06-01 15:54:18
019e83e4-9eb6-707b-9528-f8708dd7bd7b	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-3278-7246-a23e-10370ffbd291	what do think about this idea	f	f	2026-06-01 15:54:18
019e83e4-9eb8-71ad-81a9-4982162b1a3a	019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e71e1-327c-71e1-9d58-b2fe6426441a	its already 1130 pm	f	f	2026-06-01 15:54:18
019e83ec-4468-7028-94d7-b3e368492e96	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-01 16:02:39
019e83ec-4469-7102-b9bb-f238c87bd2a7	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-01 16:02:39
019e83ec-446a-70ff-9c8c-8b73eccdac2b	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-01 16:02:39
019e83ec-446c-70d6-b4b7-c892e0d4a667	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-01 16:02:39
019e83ec-446d-70f5-a420-f491a96f09b7	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-01 16:02:39
019e83ec-446e-73ec-a37f-2a42e93628d1	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-01 16:02:39
019e83ec-446f-701e-862f-2070c58dfbb8	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-01 16:02:39
019e83ec-4471-70a3-9da1-ffeaf797c473	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-01 16:02:39
019e83ec-4472-71bd-9723-ea53ef2c887e	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-01 16:02:39
019e83ec-4473-704a-b601-3e49b5a44c8d	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-01 16:02:39
019e83ec-4474-700e-bbe9-c33c35c4c563	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-01 16:02:39
019e83ec-4475-70f4-ad78-eb77e3d2cb3a	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-01 16:02:39
019e83ec-4476-72a2-bb5b-ec4b41d2f93c	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-01 16:02:39
019e83ec-4478-72d5-97bf-aae7a9cd8062	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-01 16:02:39
019e83ec-4479-73ff-861c-ad4de010f62f	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-01 16:02:39
019e83ec-447a-7007-81eb-0bde0dc466c5	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-01 16:02:39
019e83ec-4466-711c-9cd8-91246749f726	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3270-72c4-a123-4fd4e2837da1	i don't get it	f	f	2026-06-01 16:02:39
019e83ec-447b-7330-a1ba-d9d57c36c3d2	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-01 16:02:39
019e83ec-447c-73df-8ac6-a6c0047c88f1	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-01 16:02:39
019e83ec-447d-7391-b160-13fd404bec0e	019e83ec-4463-716a-a1ec-d659eacd218b	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-01 16:02:39
019e83fe-e410-71dc-9091-efc5d651f207	019e83fe-e409-7257-9982-3a9271826f3a	019e7d95-a439-71b1-ba90-e8188efdc35c	\N	f	f	2026-06-01 16:23:00
019e83fe-e411-7077-99ef-3397e3961418	019e83fe-e409-7257-9982-3a9271826f3a	019e7d91-89b0-7290-83d7-a8302fdbf69b	\N	f	f	2026-06-01 16:23:00
019e83fe-e413-724d-9953-e77f527fb12e	019e83fe-e409-7257-9982-3a9271826f3a	019e7d93-7bde-7006-b83c-4c466e972eca	\N	f	f	2026-06-01 16:23:00
019e83fe-e414-712e-848e-1d6c64dba449	019e83fe-e409-7257-9982-3a9271826f3a	019e7d94-7af9-714b-8c54-8e5623d87f7b	\N	f	f	2026-06-01 16:23:00
019e83fe-e415-72e9-8329-df84fd3bc072	019e83fe-e409-7257-9982-3a9271826f3a	019e7d94-7afd-7266-9ad9-7323e46fe98d	\N	f	f	2026-06-01 16:23:00
019e83fe-e416-71a2-8da9-f100e39023b3	019e83fe-e409-7257-9982-3a9271826f3a	019e7d91-89ab-70de-a46c-aa5b3670ebc5	\N	f	f	2026-06-01 16:23:00
019e83fe-e417-72d6-854c-7b8177fbbf4f	019e83fe-e409-7257-9982-3a9271826f3a	019e7d95-a43c-732d-8e96-2e9fa6152340	\N	f	f	2026-06-01 16:23:00
019e83fe-e418-7315-90e8-d29624cc5273	019e83fe-e409-7257-9982-3a9271826f3a	019e7d94-7afb-72a0-9dcc-ac4756c20268	\N	f	f	2026-06-01 16:23:00
019e83fe-e41a-73af-abdb-d49090693117	019e83fe-e409-7257-9982-3a9271826f3a	019e7d95-a43b-70c6-9bbe-2d5c416e83a1	\N	f	f	2026-06-01 16:23:00
019e83fe-e41b-7147-b255-7b267b257fae	019e83fe-e409-7257-9982-3a9271826f3a	019e7d93-7be0-71b6-bea6-63943b6aa987	\N	f	f	2026-06-01 16:23:00
019e83fe-e41c-73f3-897a-a95822149519	019e83fe-e409-7257-9982-3a9271826f3a	019e7d94-7afc-72cc-ab72-77caf3b4bb46	\N	f	f	2026-06-01 16:23:00
019e83fe-e41d-70b6-bcf7-f54026032e5b	019e83fe-e409-7257-9982-3a9271826f3a	019e7d91-89ae-7390-9291-e3ac6b2a38f8	\N	f	f	2026-06-01 16:23:00
019e83fe-e41e-7206-9e8c-825130e4a912	019e83fe-e409-7257-9982-3a9271826f3a	019e7d95-a43d-73f5-ae58-b057ebdd9cab	\N	f	f	2026-06-01 16:23:00
019e83fe-e420-72b5-a21c-3ee2233d1d10	019e83fe-e409-7257-9982-3a9271826f3a	019e7d91-89b1-7373-a171-9f6c5d750f2e	\N	f	f	2026-06-01 16:23:00
019e83fe-e421-7084-9803-58d383316571	019e83fe-e409-7257-9982-3a9271826f3a	019e7d95-a437-733d-865e-2ed4c1818e5b	\N	f	f	2026-06-01 16:23:00
019e83fe-e422-724e-9306-21b8461d8095	019e83fe-e409-7257-9982-3a9271826f3a	019e7d93-7be2-719b-9171-575599404c78	\N	f	f	2026-06-01 16:23:00
019e83fe-e423-71aa-8a92-944a0ad90867	019e83fe-e409-7257-9982-3a9271826f3a	019e7d93-7be3-7357-8e52-5cee679328f3	\N	f	f	2026-06-01 16:23:00
019e83fe-e425-71fd-a872-4030982b5853	019e83fe-e409-7257-9982-3a9271826f3a	019e7d94-7af7-705a-9cf5-6b058147a0db	\N	f	f	2026-06-01 16:23:00
019e83fe-e40c-722c-8515-bb9821cd23aa	019e83fe-e409-7257-9982-3a9271826f3a	019e7d93-7be1-715e-ac46-089ccbf219f7	\N	f	t	2026-06-01 16:23:00
019e83fe-e40f-7217-a97e-ce8d6a4d43fd	019e83fe-e409-7257-9982-3a9271826f3a	019e7d91-89ad-71d2-b50c-267cb2caf6f6	\N	f	t	2026-06-01 16:23:00
019e83ff-7cb4-72f8-9082-a9d7ddff3fb3	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d91-89ae-7390-9291-e3ac6b2a38f8	\N	f	f	2026-06-01 16:23:39
019e83ff-7cb5-72e0-a286-f8375ed7fb02	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d93-7bde-7006-b83c-4c466e972eca	\N	f	f	2026-06-01 16:23:39
019e83ff-7cb7-71bf-94f1-f7bd29699f57	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d93-7be2-719b-9171-575599404c78	\N	f	f	2026-06-01 16:23:39
019e83ff-7cb8-7355-b41c-b54202cafa24	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d94-7afd-7266-9ad9-7323e46fe98d	\N	f	f	2026-06-01 16:23:39
019e83ff-7cba-70a0-937b-73b415f51869	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d94-7af7-705a-9cf5-6b058147a0db	\N	f	f	2026-06-01 16:23:39
019e83ff-7cbb-70ea-a43a-e681fb643252	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d93-7be1-715e-ac46-089ccbf219f7	\N	f	f	2026-06-01 16:23:39
019e83ff-7cbc-705e-80cf-1ae4ad824cbd	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d91-89b0-7290-83d7-a8302fdbf69b	\N	f	f	2026-06-01 16:23:39
019e83ff-7cbe-736a-ae6f-1993ad1c0142	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d95-a43c-732d-8e96-2e9fa6152340	\N	f	f	2026-06-01 16:23:39
019e83ff-7cbf-7200-8deb-e901a86a1759	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d91-89ad-71d2-b50c-267cb2caf6f6	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc0-71b8-baeb-bce1d8cd1171	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d93-7be3-7357-8e52-5cee679328f3	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc1-7065-bd6e-df61d28a95ed	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d94-7af9-714b-8c54-8e5623d87f7b	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc2-7270-9c95-f17fed40ef9f	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d94-7afb-72a0-9dcc-ac4756c20268	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc4-72bf-bf47-79589c18231a	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d95-a43d-73f5-ae58-b057ebdd9cab	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc5-70a3-8120-d478b8700105	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d91-89b1-7373-a171-9f6c5d750f2e	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc6-7109-bd0a-657944ac8801	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d93-7be0-71b6-bea6-63943b6aa987	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc7-730f-8e69-1df0d3cf1152	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d95-a439-71b1-ba90-e8188efdc35c	\N	f	f	2026-06-01 16:23:39
019e83ff-7cc9-7177-8fb3-0df62782a297	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d95-a43b-70c6-9bbe-2d5c416e83a1	\N	f	f	2026-06-01 16:23:39
019e83ff-7ccd-7121-b531-f7f6d096e959	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d94-7afc-72cc-ab72-77caf3b4bb46	\N	f	f	2026-06-01 16:23:39
019e83ff-7cce-707a-ba11-544f578e69f6	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d95-a437-733d-865e-2ed4c1818e5b	\N	f	f	2026-06-01 16:23:39
019e83ff-7ccf-7331-8b12-3a97ecef3d43	019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d91-89ab-70de-a46c-aa5b3670ebc5	\N	f	f	2026-06-01 16:23:39
019e8603-f7f1-7040-a55f-ce23e3e80667	019e8603-f7d4-7326-8194-92556954338c	019e7b92-2867-7295-bd89-eeffa7b5e9e5	how much is it	t	f	2026-06-02 01:47:47
019e8603-f7f2-7252-9386-c21d353e3403	019e8603-f7d4-7326-8194-92556954338c	019e7b95-30d3-706c-b753-39c2c9cd6e27	i dont know	t	f	2026-06-02 01:47:47
019e8603-f7de-72e5-8b29-df8fc6e2093e	019e8603-f7d4-7326-8194-92556954338c	019e7b96-cf83-7291-9bfd-4366f670d4e8	wait a minute	t	f	2026-06-02 01:47:47
019e8603-f7e2-71a1-beee-fbe2499bac1e	019e8603-f7d4-7326-8194-92556954338c	019e7b95-30d5-73a1-87c6-f54e0f65931d	oh my phone is ringing	t	t	2026-06-02 01:47:47
019e8603-f7e3-71f5-a9a3-3e82cb238071	019e8603-f7d4-7326-8194-92556954338c	019e7b93-72a2-70f2-b8a5-34a992d6f88d	we are done eating	t	t	2026-06-02 01:47:47
019e8603-f7d9-71eb-b97f-9f42e5dc2dd5	019e8603-f7d4-7326-8194-92556954338c	019e7b93-72a4-719f-92fd-1bb01f8f151f	bill please	t	f	2026-06-02 01:47:47
019e8603-f7dc-701e-b191-33a422103a3b	019e8603-f7d4-7326-8194-92556954338c	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	hey it has been years since we last met	t	t	2026-06-02 01:47:47
019e8603-f7df-7123-bb9e-e20620da78b5	019e8603-f7d4-7326-8194-92556954338c	019e7b96-cf8a-7229-8e92-279f82780bfb	long time no see	t	t	2026-06-02 01:47:47
019e8603-f7e0-72b1-afd2-2f399ccc9126	019e8603-f7d4-7326-8194-92556954338c	019e7b93-72a5-7173-8f22-a29d484b8e37	excuse me where is the toilet	t	t	2026-06-02 01:47:47
019e8634-618b-7290-8f1a-a930c00f0426	019e8634-6186-7364-87cf-3022660c7b7e	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-02 02:40:40
019e8603-f7e4-73dd-827f-c1063b6edee8	019e8603-f7d4-7326-8194-92556954338c	019e7b95-30d1-7115-adce-9a46439b1e43	dont worry	t	f	2026-06-02 01:47:47
019e8634-618c-7112-b574-0dc06e6c4457	019e8634-6186-7364-87cf-3022660c7b7e	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-02 02:40:40
019e8634-618e-738c-9ef9-c0d2cef6beca	019e8634-6186-7364-87cf-3022660c7b7e	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-02 02:40:40
019e8603-f7e5-7035-987c-03e48fe953c2	019e8603-f7d4-7326-8194-92556954338c	019e7b92-2869-724f-a3c4-4cbfe8941117	hurry up	t	f	2026-06-02 01:47:47
019e8603-f7e7-70a5-aff8-3d09d1782950	019e8603-f7d4-7326-8194-92556954338c	019e7b92-286a-7211-96ac-244725e33cdc	you look worried, is everything okay	t	f	2026-06-02 01:47:47
019e8603-f7e8-72b6-8466-7b64405aa950	019e8603-f7d4-7326-8194-92556954338c	019e7b95-30cf-7358-b291-186df440e3e2	this project is so hard i want to give up	t	t	2026-06-02 01:47:47
019e8603-f7e9-739e-a454-7028ce702124	019e8603-f7d4-7326-8194-92556954338c	019e7b93-72a0-7149-bcf1-20286bec7997	please quiet	f	t	2026-06-02 01:47:47
019e8603-f7ea-735a-9422-f3e28ff2c232	019e8603-f7d4-7326-8194-92556954338c	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-02 01:47:47
019e8603-f7eb-72c2-8efb-543d8673647f	019e8603-f7d4-7326-8194-92556954338c	019e7b92-2866-73bb-b02e-aec30e8df203	excuse me i want to buy this	t	f	2026-06-02 01:47:47
019e8603-f7ed-71b3-9d2d-ac68d0d82ffb	019e8603-f7d4-7326-8194-92556954338c	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-02 01:47:47
019e8603-f7ee-72b4-95eb-5e346667d1a0	019e8603-f7d4-7326-8194-92556954338c	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-02 01:47:47
019e8603-f7ef-7120-8403-ff05365f5832	019e8603-f7d4-7326-8194-92556954338c	019e7b92-286b-7188-8d3e-f455b947f6e3	can i help	f	f	2026-06-02 01:47:47
019e8603-f7f0-723c-bdd5-132e3fbc9628	019e8603-f7d4-7326-8194-92556954338c	019e7b95-30d2-70b7-8a4a-8380976f5294	do you know where is the post office	f	f	2026-06-02 01:47:47
019e8634-618f-72a0-9d0c-5e11fd9dfea4	019e8634-6186-7364-87cf-3022660c7b7e	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-02 02:40:40
019e8634-6190-7265-9416-917d772b4392	019e8634-6186-7364-87cf-3022660c7b7e	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-02 02:40:40
019e8634-6192-70d5-a22e-15abcaabe842	019e8634-6186-7364-87cf-3022660c7b7e	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-02 02:40:40
019e8634-6193-720d-aa43-f271fee5f8b9	019e8634-6186-7364-87cf-3022660c7b7e	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-02 02:40:40
019e8634-6194-72a1-a871-a69e03562526	019e8634-6186-7364-87cf-3022660c7b7e	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-02 02:40:40
019e8634-6195-7395-adb3-9d9895fcc6d7	019e8634-6186-7364-87cf-3022660c7b7e	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-02 02:40:40
019e8634-6196-711d-ab1a-7ef6ca98dc6e	019e8634-6186-7364-87cf-3022660c7b7e	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-02 02:40:40
019e8634-6198-73db-befd-a05266858812	019e8634-6186-7364-87cf-3022660c7b7e	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-02 02:40:40
019e8634-6199-7069-bb01-836832ae6c98	019e8634-6186-7364-87cf-3022660c7b7e	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-02 02:40:40
019e8634-619a-7070-af76-a411fd8724d6	019e8634-6186-7364-87cf-3022660c7b7e	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-02 02:40:40
019e8634-619b-7188-ba9d-277d42aaf280	019e8634-6186-7364-87cf-3022660c7b7e	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-02 02:40:40
019e8634-619c-70e9-99da-628a787703cb	019e8634-6186-7364-87cf-3022660c7b7e	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-02 02:40:40
019e8634-619d-736c-915c-a58530855bc1	019e8634-6186-7364-87cf-3022660c7b7e	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-02 02:40:40
019e8634-619f-7218-b964-7a8c1da9d3f7	019e8634-6186-7364-87cf-3022660c7b7e	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-02 02:40:40
019e8634-61a0-71bf-827a-5b930d5b1692	019e8634-6186-7364-87cf-3022660c7b7e	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-02 02:40:40
019e8634-6189-7231-9549-8e978fba0ecd	019e8634-6186-7364-87cf-3022660c7b7e	019e7b92-2869-724f-a3c4-4cbfe8941117	hurry up	t	f	2026-06-02 02:40:40
019e8634-61a1-72ef-b545-3c2bfda234ac	019e8634-6186-7364-87cf-3022660c7b7e	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-02 02:40:40
019e864d-ce69-70b3-88fd-2a58d57ff4e1	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-02 03:08:26
019e864d-ce6b-737b-829a-1fef0f21bbf1	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-02 03:08:26
019e864d-ce6c-725c-90c8-8efd36faa08b	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-02 03:08:26
019e864d-ce6e-73aa-921c-c2efd3d1c96b	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-02 03:08:26
019e864d-ce6f-7032-9e9a-8ce4667548ae	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-02 03:08:26
019e864d-ce70-73c3-ae35-d2fc47815b6b	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-02 03:08:26
019e864d-ce72-7322-8588-e2f110f3e8bb	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-02 03:08:26
019e864d-ce73-73dd-9a4d-e17296e7ad33	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-02 03:08:26
019e864d-ce74-7381-b9fa-7376d0772576	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-02 03:08:26
019e864d-ce75-707c-bb36-c70e82805c4f	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-02 03:08:26
019e864d-ce77-71ee-8303-711a0cd2b664	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-02 03:08:26
019e864d-ce78-70e8-bb9f-9bccd17f744b	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-02 03:08:26
019e864d-ce79-7230-85f9-95eb98e39f5e	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-02 03:08:26
019e864d-ce7a-70e7-b5fe-e77f7974b19d	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-02 03:08:26
019e864d-ce7b-722c-a845-baa2e8b90dad	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-02 03:08:26
019e864d-ce7d-73b6-8b26-32cca203e087	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-02 03:08:26
019e864d-ce7e-7022-9947-d7a43fabe52a	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-02 03:08:26
019e864d-ce7f-737a-b71f-aa527f625f76	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-02 03:08:26
019e864d-ce80-7325-ba05-eaed18bdadf3	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-02 03:08:26
019e864d-ce81-7049-bd13-d3c81c6ae943	019e864d-ce65-714b-869d-e1e2151a92f9	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-02 03:08:26
019e864d-e42a-712d-8416-bf19c010e616	019e864d-e427-7049-a918-e33e1c971b31	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-02 03:08:32
019e864d-e42c-7394-a172-fb11b8664009	019e864d-e427-7049-a918-e33e1c971b31	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-02 03:08:32
019e864d-e42d-73b2-81bd-588d27bca89c	019e864d-e427-7049-a918-e33e1c971b31	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-02 03:08:32
019e8643-6b19-73c4-8b71-420bc32b560e	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-02 02:57:05
019e8643-6b1b-7176-8962-9e1605896790	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-02 02:57:05
019e8643-6b1c-729d-b382-26a4ad1c5542	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-02 02:57:05
019e8643-6b1d-73ca-b8b5-7224ce4f32ee	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-02 02:57:05
019e8643-6b1f-70e6-9ac1-1ecd7b191c28	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-02 02:57:05
019e8643-6b20-723a-bff2-04a910a48f45	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-02 02:57:05
019e8643-6b21-71f9-ae5f-080a8f40eaa9	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-02 02:57:05
019e8643-6b22-7184-a06d-b76302b429b8	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-02 02:57:05
019e8643-6b23-71e1-b4d7-489732c37da1	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-02 02:57:05
019e8643-6b25-71f8-9290-59faa50e0abf	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-02 02:57:05
019e8643-6b26-71ee-8dd4-c71c9cf26e8f	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-02 02:57:05
019e8643-6b27-719a-a6d0-675f7ad29ec5	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-02 02:57:05
019e8643-6b28-7176-b268-4ae35305fddf	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-02 02:57:05
019e8643-6b29-7248-a119-876fe9e00806	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-02 02:57:05
019e8643-6b2b-72ff-832a-ff1738d275f3	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-02 02:57:05
019e8643-6b2c-732c-873d-a48dcb59647c	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-02 02:57:05
019e8643-6b2d-7035-a37d-77bddc576cfb	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-02 02:57:05
019e8643-6b15-7322-991e-6b6a2d2760f0	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-02 02:57:05
019e8643-6b17-70f6-85ef-cc1c90373227	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-02 02:57:05
019e8643-6b18-7218-8654-980bd556a6fd	019e8643-6b11-7042-9f17-1c191f8e10ea	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-02 02:57:05
019e864b-6b7b-7001-b080-196aa60e04a8	019e864b-6b78-72ce-9628-11a1322a4403	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-02 03:05:50
019e864b-6b7c-71e2-97fe-9bd4c834604f	019e864b-6b78-72ce-9628-11a1322a4403	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-02 03:05:50
019e864b-6b7e-707c-ad64-5d8e76321cc5	019e864b-6b78-72ce-9628-11a1322a4403	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-02 03:05:50
019e864b-6b7f-70c0-8df2-acda68841172	019e864b-6b78-72ce-9628-11a1322a4403	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-02 03:05:50
019e864b-6b80-7212-8840-8310fdc2f76e	019e864b-6b78-72ce-9628-11a1322a4403	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-02 03:05:50
019e864b-6b81-72f3-bc3e-1311ed45fd5a	019e864b-6b78-72ce-9628-11a1322a4403	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-02 03:05:50
019e864b-6b83-7283-ae9f-0d1cba698143	019e864b-6b78-72ce-9628-11a1322a4403	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-02 03:05:50
019e864b-6b84-70b1-a0e0-f2c11936d601	019e864b-6b78-72ce-9628-11a1322a4403	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-02 03:05:50
019e864b-6b85-7152-91b3-bccb79c17f7a	019e864b-6b78-72ce-9628-11a1322a4403	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-02 03:05:50
019e864b-6b86-7352-8020-57a1e3283a8f	019e864b-6b78-72ce-9628-11a1322a4403	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-02 03:05:50
019e864b-6b87-72c8-b304-d8242efced88	019e864b-6b78-72ce-9628-11a1322a4403	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-02 03:05:50
019e864b-6b89-71e9-8510-0a10e0320b45	019e864b-6b78-72ce-9628-11a1322a4403	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-02 03:05:50
019e864b-6b8a-72a3-808f-8fb8ec0b01dc	019e864b-6b78-72ce-9628-11a1322a4403	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-02 03:05:50
019e864b-6b8b-710a-9949-bce58629cc41	019e864b-6b78-72ce-9628-11a1322a4403	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-02 03:05:50
019e864b-6b8c-7145-a89a-34b3606a92ad	019e864b-6b78-72ce-9628-11a1322a4403	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-02 03:05:50
019e864b-6b8d-7080-89f2-3c662a351afb	019e864b-6b78-72ce-9628-11a1322a4403	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-02 03:05:50
019e864b-6b8e-729f-b112-b6ad686e167f	019e864b-6b78-72ce-9628-11a1322a4403	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-02 03:05:50
019e864b-6b90-7214-ab8a-60954169003d	019e864b-6b78-72ce-9628-11a1322a4403	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-02 03:05:50
019e864b-6b91-7069-9f8b-f3e31f322908	019e864b-6b78-72ce-9628-11a1322a4403	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-02 03:05:50
019e864b-6b92-702b-869e-727cfae1a2df	019e864b-6b78-72ce-9628-11a1322a4403	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-02 03:05:50
019e864d-e42f-72e7-9d68-a7d46d25ab33	019e864d-e427-7049-a918-e33e1c971b31	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-02 03:08:32
019e864d-e430-72a8-8318-c24b0fe8f816	019e864d-e427-7049-a918-e33e1c971b31	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-02 03:08:32
019e864d-e431-706b-bf97-9fd3467599f3	019e864d-e427-7049-a918-e33e1c971b31	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-02 03:08:32
019e864d-e433-73fe-bede-8e01fc60d70f	019e864d-e427-7049-a918-e33e1c971b31	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-02 03:08:32
019e864d-e434-7133-9453-e6b64494d97f	019e864d-e427-7049-a918-e33e1c971b31	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-02 03:08:32
019e864d-e435-73d1-a33f-ff342488800e	019e864d-e427-7049-a918-e33e1c971b31	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-02 03:08:32
019e864d-e436-730e-9ddd-b89ee8b27be4	019e864d-e427-7049-a918-e33e1c971b31	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-02 03:08:32
019e864d-e437-7148-8f5b-69b7b1bed0c8	019e864d-e427-7049-a918-e33e1c971b31	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-02 03:08:32
019e864d-e438-73e3-ac91-cf4238673a89	019e864d-e427-7049-a918-e33e1c971b31	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-02 03:08:32
019e864d-e43a-7323-ae30-d56a58f936a1	019e864d-e427-7049-a918-e33e1c971b31	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-02 03:08:32
019e864d-e43b-7191-9677-fd4503b615c6	019e864d-e427-7049-a918-e33e1c971b31	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-02 03:08:32
019e864d-e43c-731d-802a-16675bb827f4	019e864d-e427-7049-a918-e33e1c971b31	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-02 03:08:32
019e864d-e43d-72e3-be0f-a2d325467632	019e864d-e427-7049-a918-e33e1c971b31	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-02 03:08:32
019e864d-e43f-7154-aa2a-278c52602bbf	019e864d-e427-7049-a918-e33e1c971b31	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-02 03:08:32
019e864d-e440-72a4-8152-847c2d3af01d	019e864d-e427-7049-a918-e33e1c971b31	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-02 03:08:32
019e864d-e441-73aa-a598-6c221d609e56	019e864d-e427-7049-a918-e33e1c971b31	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-02 03:08:32
019e864d-e442-7345-99de-2c621ac5377a	019e864d-e427-7049-a918-e33e1c971b31	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-02 03:08:32
019e864e-03c2-7026-b161-f874ea60372b	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b95-30d2-70b7-8a4a-8380976f5294	do you know where the post office is	t	f	2026-06-02 03:08:40
019e864e-03d7-7278-91dd-c2e45acd3468	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b95-30d1-7115-adce-9a46439b1e43	dont worry	t	f	2026-06-02 03:08:40
019e8657-f15d-7385-83e5-ee74f77382c3	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7baa-9257-71b1-b5f8-17b4b20c8759	\N	f	f	2026-06-02 03:19:30
019e8657-f15f-73b1-be41-40af0b3f5ba0	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba7-8687-70c9-98e4-c7fb328bff8b	\N	f	f	2026-06-02 03:19:30
019e8657-f160-729e-872b-bdddd6b4936f	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7baa-9258-7269-8cb6-67b777f41dab	\N	f	f	2026-06-02 03:19:30
019e8657-f162-71c6-af5b-0896da5abd3b	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7bab-79fc-724a-8010-8f6cfee7d5bb	\N	f	f	2026-06-02 03:19:30
019e8657-f163-73be-91f6-9d4809cb5dd7	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba7-8685-7111-b6c8-641c785adf9b	\N	f	f	2026-06-02 03:19:30
019e8657-f164-71ea-bc23-cb0c7557aa30	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba7-8688-722e-a58e-649754c118f2	\N	f	f	2026-06-02 03:19:30
019e8657-f166-7351-ad53-7d006e0ff076	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7baa-9255-73de-890b-f0f4eabada61	\N	f	f	2026-06-02 03:19:30
019e8657-f167-719e-92e2-34ac26763697	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba8-c28c-73c3-9cae-59ab23479bc2	\N	f	f	2026-06-02 03:19:30
019e8657-f168-72f9-b9d6-e000679d3a29	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba8-c286-737c-8b88-5b51104a975e	\N	f	f	2026-06-02 03:19:30
019e8657-f169-7026-9b7b-0d75a2971c8f	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7baa-925b-70a3-9d03-a2c9c5b49d2d	\N	f	f	2026-06-02 03:19:30
019e8657-f16a-71ab-82d3-34c1275a700b	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba8-c28b-728b-8b5c-adc20c5139e6	\N	f	f	2026-06-02 03:19:30
019e8657-f16c-71c7-98de-c908620c4ddd	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7bab-79f7-716c-9b04-1a1bbbbb7246	\N	f	f	2026-06-02 03:19:30
019e8657-f16d-7113-9ec7-efbc7ca77ce1	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba8-c289-7060-85c3-c7758c2e1a02	\N	f	f	2026-06-02 03:19:30
019e8657-f16e-7201-9915-9278f9db2240	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba7-8684-706d-8e79-903dbdfd5f91	\N	f	f	2026-06-02 03:19:30
019e8657-f16f-7089-9382-5ff7dc60da07	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7bab-79fd-732d-8b58-75301bbf54cb	\N	f	f	2026-06-02 03:19:30
019e8657-f171-7371-811b-2d3afeae9f33	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba8-c288-71bb-999e-6483ad6d705a	\N	f	f	2026-06-02 03:19:30
019e8657-f172-7095-b2e2-fb3a1f483b6b	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7bab-79fa-7084-96ab-cb12e2c8c5cb	\N	f	f	2026-06-02 03:19:30
019e8657-f173-737e-981e-c30b216f5a0e	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7baa-9259-72f1-bafe-c60b67fd06af	\N	f	f	2026-06-02 03:19:30
019e8657-f174-70fb-ad45-2bfddf55341f	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7ba7-8682-7218-8276-d3aefb06c058	\N	f	f	2026-06-02 03:19:30
019e8657-f175-7130-8f82-b30d45acf527	019e8657-f15a-725f-9dd7-ab15d29f964e	019e7bab-79f9-720b-9752-aab2d6683393	\N	f	f	2026-06-02 03:19:30
019e8b7f-d4a5-7320-86f5-af6dbfaa7df0	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7baa-9258-7269-8cb6-67b777f41dab	where are you going	t	f	2026-06-03 03:21:11
019e864e-03bf-71f7-b5d1-c59a4b800f17	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b96-cf85-709a-bd49-da5491997789	what if we go to the beach this weekend	t	f	2026-06-02 03:08:40
019e864e-03c1-7142-94ad-f174f08d0ef9	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b95-30d5-73a1-87c6-f54e0f65931d	oh my phone is ringing	t	f	2026-06-02 03:08:40
019e864e-03c4-72f9-8c37-b77f26a916ad	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b93-72a5-7173-8f22-a29d484b8e37	excuse me where is the toilet	t	f	2026-06-02 03:08:40
019e864e-03c5-70bd-b2b6-789d1d4f3679	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b92-2867-7295-bd89-eeffa7b5e9e5	how much is it	t	f	2026-06-02 03:08:40
019e864e-03c6-701a-97ca-e984b342e8f3	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b93-72a6-70c5-9006-caab62f97b36	over there	t	f	2026-06-02 03:08:40
019e864e-03c8-7058-8bbb-53eaa01eed6f	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b92-286b-7188-8d3e-f455b947f6e3	can i help you	t	f	2026-06-02 03:08:40
019e864e-03c9-709b-ba90-cd952dcf60cd	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b95-30d3-706c-b753-39c2c9cd6e27	i dont know	t	f	2026-06-02 03:08:40
019e864e-03ca-72ec-a610-0de2cbd18c28	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b92-2869-724f-a3c4-4cbfe8941117	hurry up	t	f	2026-06-02 03:08:40
019e864e-03cc-71b9-aab6-4645c3f73184	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b93-72a2-70f2-b8a5-34a992d6f88d	we are done eating	t	f	2026-06-02 03:08:40
019e864e-03cd-73c6-892d-648e6bca5f4a	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	hey it has been years since we last met	t	f	2026-06-02 03:08:40
019e864e-03ce-723b-86e0-e5a7387d0aa9	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b93-72a0-7149-bcf1-20286bec7997	please be quiet	t	f	2026-06-02 03:08:40
019e864e-03cf-72de-b1b6-bc79af35c32d	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b95-30cf-7358-b291-186df440e3e2	this project is so hard i want to give up	t	f	2026-06-02 03:08:40
019e864e-03d0-7081-afda-5c9c4a3a5ec8	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b92-2866-73bb-b02e-aec30e8df203	excuse me i want to buy this	t	f	2026-06-02 03:08:40
019e864e-03d1-73ea-b246-81d04fddd272	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b96-cf8a-7229-8e92-279f82780bfb	long time no see	t	f	2026-06-02 03:08:40
019e864e-03d3-72f9-990a-c747a1d2fea1	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b96-cf83-7291-9bfd-4366f670d4e8	wait a minute	t	f	2026-06-02 03:08:40
019e864e-03d4-7151-9be5-49e93bef1917	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	thats a good idea	t	f	2026-06-02 03:08:40
019e864e-03d5-72f7-aa1f-b287d4ccb1fd	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b93-72a4-719f-92fd-1bb01f8f151f	bill please	t	f	2026-06-02 03:08:40
019e864e-03d6-70ca-a14c-fc08c8f0b60a	019e864e-03bd-73d0-b2aa-5afedad3b33f	019e7b92-286a-7211-96ac-244725e33cdc	you look worried is everything okay	t	f	2026-06-02 03:08:40
019e8b7f-d4a7-7321-94fd-6b5e74b011d8	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba7-8684-706d-8e79-903dbdfd5f91	nice to meet you	t	f	2026-06-03 03:21:11
019e8b7f-d4a8-70ed-b3b3-bc1a1ab8134b	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba8-c28b-728b-8b5c-adc20c5139e6	i am hungry	t	f	2026-06-03 03:21:11
019e8b7f-d4ae-7354-a3e2-4a748fa3ef88	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7baa-9259-72f1-bafe-c60b67fd06af	i am on my way	t	f	2026-06-03 03:21:11
019e8b7f-d4af-7142-9134-1d1c629f0a8b	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7bab-79fc-724a-8010-8f6cfee7d5bb	good luck	t	f	2026-06-03 03:21:11
019e8b7f-d4b1-72cf-bb95-bfacdf083d05	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba7-8687-70c9-98e4-c7fb328bff8b	what do you do	t	f	2026-06-03 03:21:11
019e8b7f-d4b2-708e-b4d0-3e837d9aabc0	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7bab-79f7-716c-9b04-1a1bbbbb7246	take care	t	f	2026-06-03 03:21:11
019e8b7f-d4b3-7100-a3e5-633a8428f5f2	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7baa-9257-71b1-b5f8-17b4b20c8759	i am full	t	f	2026-06-03 03:21:11
019e8b7f-d4b4-71f5-87b0-e3d9e912c57d	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7bab-79fa-7084-96ab-cb12e2c8c5cb	congratulations	t	f	2026-06-03 03:21:11
019e8b7f-d4b5-73c0-be7f-4992d9db49f6	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba8-c28c-73c3-9cae-59ab23479bc2	lets eat together	t	f	2026-06-03 03:21:11
019e921b-5787-7042-be4f-86e0f8c44255	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	t	2026-06-04 10:08:45
019e9623-0368-721b-a5a2-6e71dfa4c9f1	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-05 04:55:37
019e9623-0369-70f4-8cd1-3227119a5308	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-05 04:55:37
019e9623-036a-71cf-b40b-d949c3603d05	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-05 04:55:37
019e9623-036b-7387-9a58-4c29b1945436	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-05 04:55:37
019e9623-036c-72c2-8e4d-89f86d89b49b	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-05 04:55:37
019e9623-036e-7085-8d54-283ce9ff5413	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-05 04:55:37
019e9623-036f-7298-9fd0-f359c93f057a	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-05 04:55:37
019e9623-0370-7140-acf5-f44175ae3d93	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-05 04:55:37
019e9623-0371-71d0-a403-16d19c97f131	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-05 04:55:37
019e9623-0373-73a0-b4b0-f97d8c83f475	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-05 04:55:37
019e9623-0374-716f-a925-2d1c31fea5e4	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-05 04:55:37
019e9623-0375-701b-aa50-4e28d64a8cc9	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-05 04:55:37
019e9623-0376-7149-9031-0280988b8af6	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-05 04:55:37
019e9623-0377-73ea-9f07-c0e1ae8c4b4f	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-05 04:55:37
019e9623-0379-7177-b7cc-86bbfd428530	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-05 04:55:37
019e9623-0361-7089-84a4-11ef781bea62	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	t	2026-06-05 04:55:37
019e9623-0362-73ff-a99b-aa1453dcf251	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	t	2026-06-05 04:55:37
019e9623-0364-723f-970b-4fc252213a63	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	t	2026-06-05 04:55:37
019e8b7f-d4a9-7158-924b-739e4eec26ec	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7baa-925b-70a3-9d03-a2c9c5b49d2d	i have arrived	t	f	2026-06-03 03:21:11
019e8b7f-d4ab-70f8-9a62-adb2c21328ce	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7bab-79f9-720b-9752-aab2d6683393	have anice day	t	f	2026-06-03 03:21:11
019e8b7f-d4ac-736a-9bbd-e022474b05b1	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba8-c289-7060-85c3-c7758c2e1a02	what time is it	t	f	2026-06-03 03:21:11
019e8b7f-d4ad-7099-8f19-eab49c223061	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7bab-79fd-732d-8b58-75301bbf54cb	thank you for everything	t	f	2026-06-03 03:21:11
019e8b7f-d4b6-7273-8d30-1112f42f70d1	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba8-c288-71bb-999e-6483ad6d705a	speak slowly please	t	f	2026-06-03 03:21:11
019e8b7f-d4b8-72a0-94d7-ccfc3fbdb0e7	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba7-8685-7111-b6c8-641c785adf9b	where do you live	t	f	2026-06-03 03:21:11
019e8b7f-d4b9-7115-8fe4-1d542be9125b	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba8-c286-737c-8b88-5b51104a975e	can you repeat that	t	f	2026-06-03 03:21:11
019e8b7f-d4ba-718e-92ff-e8ce90febb80	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba7-8688-722e-a58e-649754c118f2	i am happy for you	t	f	2026-06-03 03:21:11
019e8b7f-d4bb-7163-8631-8c9b3d2fde1a	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7ba7-8682-7218-8276-d3aefb06c058	what is your name	t	f	2026-06-03 03:21:11
019e8b7f-d4bc-7342-9cb3-53cba3216f28	019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e7baa-9255-73de-890b-f0f4eabada61	the food is delicious	t	f	2026-06-03 03:21:11
019e8dd8-74b5-73e6-9151-4e8ad3d37e21	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-03 14:17:13
019e8dd8-74b8-73ba-b43a-d86379ab000e	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-03 14:17:13
019e8dd8-74ba-7212-ab5d-94a6dfa86cb1	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-03 14:17:13
019e8dd8-74bb-70a8-ad80-7d229686ac55	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-03 14:17:13
019e8dd8-74bc-70e0-81e9-bc26e1ddfd6f	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-03 14:17:13
019e8dd8-74be-7315-866f-4ebd23a64227	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-03 14:17:13
019e8dd8-74bf-73f1-87d3-09ac803843ba	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c0-7284-a553-f441a9dfe252	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c1-7370-8618-e7a99221670a	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c2-738c-9678-89be2954f18f	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c3-71a8-8c23-2659c775fb7c	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c5-7205-a53e-99fe80bd23e6	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c6-7334-bf47-ccad9745951a	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c7-7360-bdac-125d8c9520cb	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-03 14:17:13
019e8dd8-74c8-7037-b443-b2d55585e90a	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-03 14:17:13
019e8dd8-74ca-72f9-a199-b2d90e25fe52	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-03 14:17:13
019e8dd8-74cb-732f-b7ba-4a5829635c94	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-03 14:17:13
019e8dd8-74cc-7390-9f1c-f237419487f6	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-03 14:17:13
019e8dd8-74cd-719b-a558-d1fbf7f0c92a	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-03 14:17:13
019e8dd8-74ce-7108-bae5-b8b95c3abeb7	019e8dd8-74b2-70e6-b206-6bde874abf32	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-03 14:17:13
019e921b-5789-7359-a521-ec72cb25343a	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-04 10:08:45
019e921b-578a-73b0-9140-4b974ed7217c	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-04 10:08:45
019e921b-578b-71f0-b305-cfe776d4ebc0	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-04 10:08:45
019e921b-578d-70b4-ba8d-ad374fda1d36	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-04 10:08:45
019e921b-578e-701b-bc1c-13edc2bd78f9	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-04 10:08:45
019e921b-578f-70bf-a1e6-646eb8cd4c65	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-04 10:08:45
019e921b-5791-71bc-aec1-368a7852cd66	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-04 10:08:45
019e921b-5792-736d-a3aa-56e1d709d3f1	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-04 10:08:45
019e921b-5793-7073-8155-a5b4610b0ec6	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-04 10:08:45
019e921b-5794-73c3-80ed-75073d578cd0	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-04 10:08:45
019e921b-5796-70af-9ccb-52000be1e4dc	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-04 10:08:45
019e921b-5797-72bd-b755-0cd5a2e3ff06	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-04 10:08:45
019e921b-5798-707f-9025-2c63d9e596d5	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-04 10:08:45
019e921b-5799-737c-800a-908412933f84	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-04 10:08:45
019e921b-579a-704f-bc38-c85cdc171494	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-04 10:08:45
019e921b-579c-70eb-a144-c6919525258f	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-04 10:08:45
019e921b-579d-73e0-9b55-c453f895f464	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-04 10:08:45
019e921b-579e-736b-96a4-366afaaf1b4f	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-04 10:08:45
019e921b-579f-72ae-b80e-c547756bcfb4	019e921b-5784-7216-bdbc-d6307a5f7ba7	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-04 10:08:45
019e9623-0365-7293-a24b-80b8001b2b1a	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	t	2026-06-05 04:55:37
019e9623-0366-729d-a4a6-e89438d5eb3f	019e9623-035e-70f4-8f2c-2ae2eab86231	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	t	2026-06-05 04:55:37
019e9c0e-a038-721a-ad71-ecaa97195dda	019e9c0e-a035-72aa-bde1-b75799012633	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 08:31:04
019e9c0e-a03a-73ca-a1ef-ae7302e34f1a	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 08:31:04
019e9c0e-a03b-728f-8453-03ebc59ea7f7	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 08:31:04
019e9c0e-a03c-712d-86e7-3245d12aee5d	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-06 08:31:04
019e9c0e-a03e-710f-a29b-752289b7c4ad	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 08:31:04
019e9c0e-a03f-7384-9ddd-2efffa0d8418	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 08:31:04
019e9c0e-a040-71f0-83a3-6637c424d3e8	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 08:31:04
019e9c0e-a041-734a-b4d5-b74638411c87	019e9c0e-a035-72aa-bde1-b75799012633	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 08:31:04
019e9c0e-a043-7184-b150-f91773614ee2	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 08:31:04
019e9c0e-a044-7137-a03f-42d61adff482	019e9c0e-a035-72aa-bde1-b75799012633	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 08:31:04
019e9c0e-a045-7167-8852-790b97ea1346	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 08:31:04
019e9c0e-a047-733d-997c-9e7d967ae6e8	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-06 08:31:04
019e9c0e-a048-7191-a2c1-4703120fd673	019e9c0e-a035-72aa-bde1-b75799012633	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 08:31:04
019e9c0e-a04a-70d8-ac1f-34b0fae8e4e8	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 08:31:04
019e9c0e-a04b-726a-8f90-90ec38a9931f	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 08:31:04
019e9c0e-a04c-73a4-b0b1-3d68cbfcea30	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 08:31:04
019e9c0e-a04d-73d4-8ee7-18c75a0e1897	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 08:31:04
019e9c0e-a04e-70fe-ad48-a6c08e56a51e	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 08:31:04
019e9c0e-a04f-738f-af5b-dabf5ea17a45	019e9c0e-a035-72aa-bde1-b75799012633	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 08:31:04
019e9c0e-a050-7371-9a3f-4ac7a477a7bd	019e9c0e-a035-72aa-bde1-b75799012633	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 08:31:04
019e9c0e-b7de-7136-ab2c-1af514f1ddcf	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e0-7169-8f27-df04f467f3e7	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e1-7157-959f-2c2dbca55a10	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e2-73ab-8693-a016d262608e	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e3-716e-ad02-fa671ba36f45	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e5-7305-a209-5d5a4578125f	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e6-7059-89d9-130f6bc66d25	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e7-726b-a1f4-fa6ecb2b6b8e	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e8-7229-a745-eb1a0aab1f1c	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7e9-730c-b69c-428a63b3bbb1	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7ea-72d7-83ba-4b7e14822e8c	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7eb-7231-9659-5b352e8a992f	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7ed-7115-be8e-d597956d6c63	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7ee-73e5-95cd-0069095b694b	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7ef-7155-a6fd-0f6e4aed8275	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7f0-71b9-a993-ef245ed1e583	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7f2-735d-9a7a-8302bf0e4dd8	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7f3-72ee-9a5a-6cca6acc1178	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7f4-701e-a6e0-65ddb4c305d9	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-06 08:31:10
019e9c0e-b7f5-7034-b5b1-9d363de8a088	019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 08:31:10
019e9c0e-c825-725c-a339-7e84c3bc927c	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-06 08:31:14
019e9c0e-c827-70e5-98cc-8794ce80b2bd	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 08:31:14
019e9c0e-c828-7261-b929-0c3063681025	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 08:31:14
019e9c0e-c829-7337-b7ee-8b3ff5268463	019e9c0e-c822-716f-903b-68722b8b404a	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 08:31:14
019e9c0e-c82b-7124-9e4b-3c048d2d35fb	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 08:31:14
019e9c0e-c82c-711f-8bb7-3f67cabdba20	019e9c0e-c822-716f-903b-68722b8b404a	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 08:31:14
019e9c0e-c82d-713c-9f22-d1f377f368c7	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 08:31:14
019e9c0e-c82e-7386-b05f-577b5c560504	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 08:31:14
019e9c0e-c82f-7065-8cae-1b810a138089	019e9c0e-c822-716f-903b-68722b8b404a	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 08:31:14
019e9c0e-c830-70d3-a6d6-2000e7615c78	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 08:31:14
019e9c0e-c832-7160-80a7-60f31caab6d8	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-06 08:31:14
019e9c0e-c833-70f3-ae7c-7005908b93c7	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 08:31:14
019e9c0e-c834-70dc-9625-ef1ff7124882	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 08:31:14
019e9c0e-c836-712a-a235-45f608398dd2	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 08:31:14
019e9c0e-c837-729c-a53a-0db1f66dc5fd	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 08:31:14
019e9c0e-c838-70fc-a2ae-eb42e3633386	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 08:31:15
019e9c0e-c839-712f-8296-88a4d611413f	019e9c0e-c822-716f-903b-68722b8b404a	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 08:31:15
019e9c0e-c83a-71e1-a6ef-3807bf375fc2	019e9c0e-c822-716f-903b-68722b8b404a	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 08:31:15
019e9c0e-c83b-7040-a5b6-69a668c55622	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 08:31:15
019e9c0e-c83c-7096-a30b-eaadae209168	019e9c0e-c822-716f-903b-68722b8b404a	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 08:31:15
019e9c46-414a-7365-b236-94a74c09a67f	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 09:31:50
019e9c46-414b-701d-958d-d9f146fe70c0	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 09:31:50
019e9c46-414d-739f-b1c0-d3e04c6d0a7f	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-06 09:31:50
019e9c46-414e-73b4-a843-032d9fbda409	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 09:31:50
019e9c46-414f-71d5-bc3c-e7031955e7cd	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 09:31:50
019e9c46-4150-7164-9031-2dfb4821b363	019e9c46-4147-70ed-9583-079f0305bd72	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 09:31:50
019e9c46-4151-7040-a878-d60a50e45406	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 09:31:50
019e9c46-4152-72e6-a207-e0739dac25aa	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 09:31:50
019e9c46-4153-72c7-a036-3989dae3507b	019e9c46-4147-70ed-9583-079f0305bd72	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 09:31:50
019e9c46-4155-72e7-b8a9-a913aeef33de	019e9c46-4147-70ed-9583-079f0305bd72	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 09:31:50
019e9c46-4156-72db-8875-092323482738	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-06 09:31:50
019e9c46-4157-73cf-9880-70cfd55a2ffe	019e9c46-4147-70ed-9583-079f0305bd72	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 09:31:50
019e9c46-4158-722b-9939-fe38d88da173	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 09:31:50
019e9c46-4159-7116-a3ea-e6fd262c45a7	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 09:31:50
019e9c46-415b-72d5-98ba-082e3f519370	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 09:31:50
019e9c46-415c-706c-b1f5-c2eebfe2cdab	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 09:31:50
019e9c46-415d-7217-8261-8edd4ae897dc	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 09:31:50
019e9c46-415e-7292-b199-f2fbaf12b1fe	019e9c46-4147-70ed-9583-079f0305bd72	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 09:31:50
019e9c46-415f-7310-9290-40d6ae5bc80d	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 09:31:50
019e9c46-4160-72a2-84d7-ac0e5d72abd2	019e9c46-4147-70ed-9583-079f0305bd72	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 09:31:50
019e9c46-428e-7025-8bde-67f5f81a6881	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 09:31:50
019e9c46-428f-7287-8c5d-f9915d2b1009	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 09:31:50
019e9c46-4290-713b-9e9a-842671ef0321	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 09:31:50
019e9c46-4291-7303-9eca-c56616e72b56	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 09:31:50
019e9c46-4293-73a1-9858-9ecbb6d3b8db	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 09:31:50
019e9c46-4294-7092-a30e-8684744b15da	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 09:31:50
019e9c46-4295-70d1-959f-71b70276d3c1	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 09:31:50
019e9c46-4296-7114-88e3-847fd4c8a1cc	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-06 09:31:50
019e9c46-4297-701d-848f-5c23735b538b	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 09:31:50
019e9c46-4298-73bb-b18d-b6edf76ba40e	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 09:31:50
019e9c46-4299-7050-973c-726dc805feec	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 09:31:50
019e9c46-429b-7257-b1d0-762688366fb7	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 09:31:50
019e9c46-429c-72b1-b609-1931d84513ad	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 09:31:50
019e9c46-429d-70ee-895e-8b7b74f4db0d	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 09:31:50
019e9c46-429e-718a-adc6-c785587af934	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 09:31:50
019e9c46-429f-724e-916d-3a099a2f4a40	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 09:31:50
019e9c46-42a1-7257-90fa-8a3f79fd0ca7	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 09:31:50
019e9c46-42a2-72d1-a136-f1b6a549aae2	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 09:31:50
019e9c46-42a3-7214-8d43-5562dcd25784	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-06 09:31:50
019e9c46-42a4-70e4-acff-5ad07daec5c0	019e9c46-4289-7277-915f-c0e9ea1c85b6	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 09:31:50
019ea290-8ff3-7149-858d-e9e6457f9459	019ea290-8fee-72de-8cae-d3268366c1b3	019e71ef-d06e-715d-8d24-37e223338848	Kein Problem	f	f	2026-06-07 14:50:43
019ea290-8ff5-728e-8b51-2ebf6df13430	019ea290-8fee-72de-8cae-d3268366c1b3	019e71eb-cf8e-710c-8318-da485ebe01db	Danke sehr	f	f	2026-06-07 14:50:43
019e9c49-77b5-70f5-a14e-2c1ed46ea803	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 09:35:21
019e9c49-77b6-7195-a7b9-fd68af26656c	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 09:35:21
019e9c49-77b7-71b2-8f3f-1848cc6995aa	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 09:35:21
019e9c49-77b9-732b-9ece-79eaef428b1f	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 09:35:21
019e9c49-77ba-73b7-b51b-cb032730b2b9	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 09:35:21
019e9c49-77bb-7352-be72-b273892f55d8	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 09:35:21
019e9c49-77bc-714b-a7a7-13949cd328cc	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 09:35:21
019e9c49-77bd-73fb-a77f-5cf70f00d284	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 09:35:21
019e9c49-77be-70be-b4dc-628b31ce5fc8	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 09:35:21
019e9c49-77bf-7233-9b7f-e3259ed231da	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 09:35:21
019e9c49-77c1-7290-8078-ccf068b79b8b	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 09:35:21
019e9c49-77c2-70ab-9743-0b9046d85922	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 09:35:21
019e9c49-77c3-73a5-992d-5b1482c8bb5d	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 09:35:21
019e9c49-77c4-72e2-a475-7fd96419640d	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 09:35:21
019e9c49-77c5-7364-a228-59a9ae36b136	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 09:35:21
019e9c49-77c6-73e1-b475-d8d6f349dc8a	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 09:35:21
019e9c49-77c8-7131-8fbf-9c765c0c6fca	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 09:35:21
019e9c49-77c9-72a8-a309-f4deb002155c	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 09:35:21
019e9c49-77b2-70c3-8a33-a52298b066fe	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	t	2026-06-06 09:35:21
019e9c49-77b4-70ff-a24d-2c7129044582	019e9c49-77af-70cf-b43b-1be113e60f78	019e7bc4-4fbd-7261-8742-8047409d06ae	thats true	t	f	2026-06-06 09:35:21
019e9c7a-23df-71e5-b353-6cb792201ae6	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e1-70f0-8384-48976e93658d	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e2-71c2-8547-b7bd8069cf5e	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e3-715e-8859-93eb6c2ed5ac	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e4-73c8-9c83-c05f78e436af	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e5-735e-bc8f-9166c1f81668	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e6-70f0-bc3e-ddb10721fe32	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e8-7076-a49e-29d73130ea8e	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-06 10:28:30
019e9c7a-23e9-7305-8a61-4fd6a26b0595	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-06 10:28:30
019e9c7a-23ea-708d-8681-c53278afe360	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-06 10:28:30
019e9c7a-23eb-73e8-a484-717d920264ff	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-06 10:28:30
019e9c7a-23ec-70cb-8f6d-b676bb490c32	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-06 10:28:30
019e9c7a-23ed-7217-8634-2b29f546716a	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-06 10:28:30
019e9c7a-23ee-7292-beb2-b4eb773fe278	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-06 10:28:30
019e9c7a-23ef-7106-a2a4-998d4e4c13c4	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-06 10:28:30
019e9c7a-23f0-72fa-b7f3-63b6e3b0881a	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-06 10:28:30
019e9c7a-23f1-7281-bd16-d877d732a94a	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-06 10:28:30
019e9c7a-23f2-7163-b038-6ee8cbefac8f	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-06 10:28:30
019e9c7a-23f3-7182-95f4-8eb056f029bb	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-06 10:28:30
019e9c7a-23f4-724b-a20c-e7785023343d	019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-06 10:28:30
019ea290-8ff6-7338-92a3-b8834e1ca576	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	\N	f	f	2026-06-07 14:50:43
019ea290-8ff8-73a8-b543-0de38371469d	019ea290-8fee-72de-8cae-d3268366c1b3	019e71ef-d070-729c-b759-759475f881e4	\N	f	f	2026-06-07 14:50:43
019ea290-8ff9-71e9-a3a9-08b3f43bfe23	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f4-ad18-73c9-8eee-64c5228ee0d4	\N	f	f	2026-06-07 14:50:43
019ea290-8ffa-73b4-9b8e-4fde34e3ff31	019ea290-8fee-72de-8cae-d3268366c1b3	019e71eb-cf91-7206-a413-ba626f474318	\N	f	f	2026-06-07 14:50:43
019ea290-8ffc-72c8-a26c-e65f77271492	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f3-a9a5-71f9-b9b7-252789895918	\N	f	f	2026-06-07 14:50:43
019ea290-8ffd-71ad-a83d-b813c7ff8ee8	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f3-a9a4-709a-87be-9cd0e3245bb2	\N	f	f	2026-06-07 14:50:43
019ea290-8ffe-719b-b5d0-0eb143f213be	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f3-a9a2-70da-a348-6c09f3366e31	\N	f	f	2026-06-07 14:50:43
019ea290-8fff-72a6-aba7-17019475f7e6	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f4-ad1b-724d-8848-4771d3af48a3	\N	f	f	2026-06-07 14:50:43
019ea290-9001-73f4-abe7-f58fa933f76e	019ea290-8fee-72de-8cae-d3268366c1b3	019e71eb-cf8d-708d-8e56-133f744455aa	\N	f	f	2026-06-07 14:50:43
019ea290-9002-7383-8ea4-c9d7316614e5	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f4-ad15-7345-87da-15bb8af4535b	\N	f	f	2026-06-07 14:50:43
019ea290-9003-731d-926c-a7ddfcf88944	019ea290-8fee-72de-8cae-d3268366c1b3	019e71ef-d073-73e8-b243-ce6e2d57a1cf	\N	f	f	2026-06-07 14:50:43
019ea290-9005-7169-be04-498839bf25e8	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f4-ad17-7057-a29e-a645631ff2d6	\N	f	f	2026-06-07 14:50:43
019ea290-9006-7106-aab3-4a95f7b40bb5	019ea290-8fee-72de-8cae-d3268366c1b3	019e71ef-d072-705f-8ec3-3ea03670f130	\N	f	f	2026-06-07 14:50:43
019ea290-9007-7342-bdcd-1aa4fb0bab3a	019ea290-8fee-72de-8cae-d3268366c1b3	019e71ef-d074-71d8-8604-3a676061ba94	\N	f	f	2026-06-07 14:50:43
019ea290-9008-73d2-a142-7ce387b3f86b	019ea290-8fee-72de-8cae-d3268366c1b3	019e71eb-cf8b-73e6-b6a8-933b2095ea7b	\N	f	f	2026-06-07 14:50:43
019ea290-900a-7156-97e1-8efc7d2607f0	019ea290-8fee-72de-8cae-d3268366c1b3	019e71eb-cf90-723d-b039-382d41219cf6	\N	f	f	2026-06-07 14:50:43
019ea290-900b-71d8-bad0-4d15ea135d20	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f4-ad1a-7399-ac55-390ae67dfe03	\N	f	f	2026-06-07 14:50:43
019ea290-900c-71f4-9d67-4c737ff11c19	019ea290-8fee-72de-8cae-d3268366c1b3	019e71f3-a9a8-713c-ba1e-29e897876c75	\N	f	f	2026-06-07 14:50:43
019eaba6-efa8-73fa-8173-c94f5ab083b4	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd3-e097-721b-86d6-0b2fc4e1b448	\N	f	f	2026-06-09 09:11:44
019eaba6-efaa-73da-9d3e-1b112990f42b	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd1-9c61-7131-b721-25cb44ee8ba5	\N	f	f	2026-06-09 09:11:44
019eaba6-efab-73b9-88a0-07500a384c7a	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd6-4962-7084-aea1-b48824d0a213	\N	f	f	2026-06-09 09:11:44
019eaba6-efac-724e-941b-6a355bb02399	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd1-9c65-707a-acd0-38b839c8eb30	\N	f	f	2026-06-09 09:11:44
019eaba6-efad-73a3-979e-d119d1832087	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd3-e098-73ff-8a54-e47c19e1888d	\N	f	f	2026-06-09 09:11:44
019eaba6-efae-7179-a5e1-af62bafbb035	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd1-9c63-721e-87e8-1a39f142c7b2	\N	f	f	2026-06-09 09:11:44
019eaba6-efaf-7048-866e-b1e524cefcc6	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd3-e095-706c-a3fe-0a68641117be	\N	f	f	2026-06-09 09:11:44
019eaba6-efb0-7194-beb2-15536bbeaeff	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd7-d2ed-73c9-8680-12fd73518724	\N	f	f	2026-06-09 09:11:44
019eaba6-efb1-7366-b8aa-b12c03703873	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd6-4966-72be-b6c7-605087737a73	\N	f	f	2026-06-09 09:11:44
019eaba6-efb2-7024-a69c-37bfeb9e002f	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd6-4963-728b-9ff7-174d14ad2ec8	\N	f	f	2026-06-09 09:11:44
019eaba6-efb4-7350-99f8-7e6cc12fd1df	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd6-4964-7360-b652-d96852b2d0de	\N	f	f	2026-06-09 09:11:44
019eaba6-efb5-712a-9a6b-5669a94191d1	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd7-d2eb-71a8-93b9-2ab8d7895bf2	\N	f	f	2026-06-09 09:11:44
019eaba6-efb6-717e-bd82-fa794e344193	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd1-9c5f-7331-add1-b6700f7762a1	\N	f	f	2026-06-09 09:11:44
019eaba6-efb7-714e-9f0b-4ff6f4138327	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd3-e099-706d-a85a-076e8a27e4fd	\N	f	f	2026-06-09 09:11:44
019eaba6-efb8-7273-91d7-035b5ff1d9bc	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd7-d2e9-71d7-acd6-b8c3e1a50c85	\N	f	f	2026-06-09 09:11:44
019eaba6-efba-714e-9d03-0afd05ff67a9	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd1-9c64-704b-a49e-3e81eb834ef9	\N	f	f	2026-06-09 09:11:44
019eaba6-efbb-7352-a88b-84adfdc6772f	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd7-d2f0-7259-87b8-a0143417b492	\N	f	f	2026-06-09 09:11:44
019eaba6-efbc-708c-a2ef-920193972c02	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd7-d2ee-70a0-bebd-7e978edd2a78	\N	f	f	2026-06-09 09:11:44
019eaba6-efa5-7314-89b9-1376f3e9d81d	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd6-495f-72c3-b830-50016c9d6815	\N	f	t	2026-06-09 09:11:44
019eaba6-efa7-7064-b965-f5f28222a0e3	019eaba6-efa2-726b-9356-52f0578f4573	019e7bd3-e09b-716d-804b-5c8c93e90c92	\N	f	t	2026-06-09 09:11:44
\.


--
-- Data for Name: quiz_sessions; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.quiz_sessions (id, user_id, language_id, level_id, status, total_questions, correct_count, started_at, completed_at, created_at, updated_at) FROM stdin;
019e73c3-11a3-7107-a2dc-f82d97a31f06	019e73af-7105-714e-8d4f-0658f4579a11	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-29 12:43:44	\N	2026-05-29 12:43:44	2026-05-29 12:43:44
019e73c3-6163-7051-b4aa-0af2fbcdf4c4	019e73af-7105-714e-8d4f-0658f4579a11	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-29 12:44:04	\N	2026-05-29 12:44:04	2026-05-29 12:44:04
019e7bf4-5c49-716f-948e-229576fcecac	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-05-31 02:54:32	\N	2026-05-31 02:54:32	2026-05-31 02:54:32
019e7c04-1250-71f5-ad71-f454c71cdcbe	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	1	2026-05-31 03:11:42	\N	2026-05-31 03:11:42	2026-05-31 03:14:09
019e7c93-a479-7259-a661-dc28e5d8ca53	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	1	2026-05-31 05:48:31	\N	2026-05-31 05:48:31	2026-05-31 05:49:09
019e7d20-a2d8-70d6-ad1b-b15324125cf1	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-31 08:22:31	\N	2026-05-31 08:22:31	2026-05-31 08:22:31
019e7d25-5942-73e3-858c-f442d5f26c1b	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-31 08:27:40	\N	2026-05-31 08:27:40	2026-05-31 08:27:40
019e7d45-5654-716e-883d-5c92efd4c4f8	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-31 09:02:36	\N	2026-05-31 09:02:36	2026-05-31 09:02:36
019e7d46-a505-70ee-bc10-9a62eb26a683	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e7ce2-3737-72c6-bf3f-365b2693356d	in_progress	0	0	2026-05-31 09:04:02	\N	2026-05-31 09:04:02	2026-05-31 09:04:02
019e7d47-22d9-70c1-a909-f17c5eef06b0	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	in_progress	20	0	2026-05-31 09:04:34	\N	2026-05-31 09:04:34	2026-05-31 09:04:34
019e7d4a-5ccc-71c0-9ee6-1df4288609a6	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-31 09:08:05	\N	2026-05-31 09:08:05	2026-05-31 09:08:05
019e7d4e-cd61-73d5-b08f-a395daad5b28	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-31 09:12:56	\N	2026-05-31 09:12:56	2026-05-31 09:12:56
019e7d4f-1e03-70bb-8a55-55207196d5da	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-05-31 09:13:17	\N	2026-05-31 09:13:17	2026-05-31 09:13:17
019e80da-df1b-719f-acfb-570091a3286c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	20	2026-06-01 01:44:48	2026-06-01 01:53:33	2026-06-01 01:44:48	2026-06-01 01:53:33
019e80e2-f306-72d3-b4aa-4b6bf7e030f7	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 01:53:37	\N	2026-06-01 01:53:37	2026-06-01 01:53:37
019e8131-db38-72b8-8dac-c6c65184662f	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 03:19:48	\N	2026-06-01 03:19:48	2026-06-01 03:19:48
019e8132-2b47-7049-91d7-4f27b33f994d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 03:20:09	\N	2026-06-01 03:20:09	2026-06-01 03:20:09
019e8290-6350-7061-80ab-b89b95dadc97	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:42:41	\N	2026-06-01 09:42:41	2026-06-01 09:42:41
019e81db-2967-73f7-a304-243be6324fed	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	2	2026-06-01 06:24:44	\N	2026-06-01 06:24:44	2026-06-01 06:28:46
019e81fc-1725-70dc-8e47-04c6c40fcc64	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 07:00:42	\N	2026-06-01 07:00:42	2026-06-01 07:00:42
019e8206-4a63-704c-bac6-3670fe444541	019e73af-7105-714e-8d4f-0658f4579a11	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-06-01 07:11:50	\N	2026-06-01 07:11:50	2026-06-01 07:11:50
019e820e-425c-7368-b1d6-21bbe500c64a	019e73af-7105-714e-8d4f-0658f4579a11	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-06-01 07:20:33	\N	2026-06-01 07:20:33	2026-06-01 07:20:33
019e8212-3d30-72f7-8a92-d70952aabbd6	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 07:24:53	\N	2026-06-01 07:24:53	2026-06-01 07:24:53
019e8212-52a2-734c-a293-0b120336a013	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 07:24:59	\N	2026-06-01 07:24:59	2026-06-01 07:24:59
019e8219-4395-721e-bda1-78406fa20588	019e73af-7105-714e-8d4f-0658f4579a11	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-06-01 07:32:34	\N	2026-06-01 07:32:34	2026-06-01 07:32:34
019e821a-5b10-73c2-95fe-bc64f43978e5	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 07:33:45	\N	2026-06-01 07:33:45	2026-06-01 07:33:45
019e80bf-46aa-730b-808e-ae9f6e04b151	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	15	2026-06-01 01:14:39	2026-06-01 01:44:41	2026-06-01 01:14:39	2026-06-01 01:44:41
019e821a-7ee2-7335-8b21-bffda7a2bfc4	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 07:33:55	\N	2026-06-01 07:33:55	2026-06-01 07:33:55
019e8290-db66-7238-9545-fbb48b5d1dd6	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:43:11	\N	2026-06-01 09:43:11	2026-06-01 09:43:11
019e8212-bd76-73fc-9510-8fe9d2752f65	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	2	2026-06-01 07:25:26	\N	2026-06-01 07:25:26	2026-06-01 07:48:23
019e8237-5a77-738f-a39e-98627209ae04	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 08:05:26	\N	2026-06-01 08:05:26	2026-06-01 08:05:26
019e8238-8a30-7218-8fb9-fd0b45c8c7d0	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 08:06:44	\N	2026-06-01 08:06:44	2026-06-01 08:06:44
019e824d-9b7e-732b-995b-c1705b512bf7	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	1	2026-06-01 08:29:44	\N	2026-06-01 08:29:44	2026-06-01 08:30:39
019e8251-35b0-732a-b08e-7fd560354bc6	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 08:33:40	\N	2026-06-01 08:33:40	2026-06-01 08:33:40
019e8255-c6c8-7399-8863-9a6164d947f8	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 08:38:40	\N	2026-06-01 08:38:40	2026-06-01 08:38:40
019e825a-349b-7307-901e-cf2a2b3c01f9	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 08:43:30	\N	2026-06-01 08:43:30	2026-06-01 08:43:30
019e825b-bcdc-7167-9076-def1c5a89815	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 08:45:10	\N	2026-06-01 08:45:10	2026-06-01 08:45:10
019e8278-5073-71d4-b401-b670e3f13933	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:23	\N	2026-06-01 09:16:23	2026-06-01 09:16:23
019e8278-8345-7229-904f-e27fd9b54725	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:36	\N	2026-06-01 09:16:36	2026-06-01 09:16:36
019e8278-8ad4-71a3-83ac-4feb4c36c89d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:38	\N	2026-06-01 09:16:38	2026-06-01 09:16:38
019e8278-90c5-71cb-a713-41830447f99c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:40	\N	2026-06-01 09:16:40	2026-06-01 09:16:40
019e8278-b40b-73c4-ad79-b66cf3741318	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:49	\N	2026-06-01 09:16:49	2026-06-01 09:16:49
019e8278-bd4c-71db-a0c1-8aa5b0d60c54	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:51	\N	2026-06-01 09:16:51	2026-06-01 09:16:51
019e8278-d665-72e2-978c-a8afd7ebe2f5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:16:57	\N	2026-06-01 09:16:57	2026-06-01 09:16:57
019e827a-fb0d-7279-942c-ad2e2c9f8dff	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:19:18	\N	2026-06-01 09:19:18	2026-06-01 09:19:18
019e8297-61e8-723f-854e-24bbc3f98e51	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:50:19	\N	2026-06-01 09:50:19	2026-06-01 09:50:19
019e827b-0d16-70ed-8491-4f0d086b9ae9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:19:22	\N	2026-06-01 09:19:22	2026-06-01 09:19:22
019e827b-49e2-7285-bf0d-b1d97d77033a	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 09:19:38	\N	2026-06-01 09:19:38	2026-06-01 09:19:38
019e827d-fb54-7322-8666-404778194696	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	1	2026-06-01 09:22:34	\N	2026-06-01 09:22:34	2026-06-01 09:35:29
019e82a1-9086-71be-9fdc-4fcd86d00425	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:01:26	\N	2026-06-01 10:01:26	2026-06-01 10:01:26
019e82a1-a6f1-7078-a139-9fd0e1c8b459	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:01:32	\N	2026-06-01 10:01:32	2026-06-01 10:01:32
019e82a1-e86b-72a2-a4a3-b814fe111424	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:01:49	\N	2026-06-01 10:01:49	2026-06-01 10:01:49
019e82b4-52d4-725e-ba27-9c4afd5ababe	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:21:56	\N	2026-06-01 10:21:56	2026-06-01 10:21:56
019e82b4-9285-70fc-aa4d-d405b0349001	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:22:12	\N	2026-06-01 10:22:12	2026-06-01 10:22:12
019e82b5-6d1f-7154-9cdf-19d20329097b	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:23:08	\N	2026-06-01 10:23:08	2026-06-01 10:23:08
019e82b5-be53-73b6-9bd4-5fc520358648	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:23:29	\N	2026-06-01 10:23:29	2026-06-01 10:23:29
019e82b9-11ad-7148-9ca0-fad420f3eca2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:27:07	\N	2026-06-01 10:27:07	2026-06-01 10:27:07
019e82c2-59c3-7051-bc9b-8ef28c66affa	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:37:15	\N	2026-06-01 10:37:15	2026-06-01 10:37:15
019e82c2-6f81-711f-822a-47c72d1fe066	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:37:21	\N	2026-06-01 10:37:21	2026-06-01 10:37:21
019e82c5-cab1-709b-be04-92feff4e7db3	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:41:01	\N	2026-06-01 10:41:01	2026-06-01 10:41:01
019e82c6-3e44-7144-9725-8b77c28b0b97	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:41:30	\N	2026-06-01 10:41:30	2026-06-01 10:41:30
019e82c6-7b31-70d6-aef1-160ac4d631a8	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:41:46	\N	2026-06-01 10:41:46	2026-06-01 10:41:46
019e82c7-82fe-70b2-9cdf-7109f5a6c308	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:42:53	\N	2026-06-01 10:42:53	2026-06-01 10:42:53
019e82cc-f4d6-7042-a2ca-afe4db90c338	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 10:48:50	\N	2026-06-01 10:48:50	2026-06-01 10:48:50
019e82d7-7ce0-72a2-a91e-e96dcf19b109	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:00:20	\N	2026-06-01 11:00:20	2026-06-01 11:00:20
019e82db-96b5-71f8-976c-4f08792fc128	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:04:49	\N	2026-06-01 11:04:49	2026-06-01 11:04:49
019e82db-a3ea-72bb-adf1-b3e01e1b49d6	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:04:52	\N	2026-06-01 11:04:52	2026-06-01 11:04:52
019e82e2-64b9-738a-828c-d59bb827d1b3	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:12:15	\N	2026-06-01 11:12:15	2026-06-01 11:12:15
019e82e3-1094-7399-99da-712ffa67f850	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:12:59	\N	2026-06-01 11:12:59	2026-06-01 11:12:59
019e82e3-711c-739f-b91d-3fc462b6766a	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:13:24	\N	2026-06-01 11:13:24	2026-06-01 11:13:24
019e82e3-8b1e-731b-b3da-93fae7157790	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:13:30	\N	2026-06-01 11:13:30	2026-06-01 11:13:30
019e82e3-a5db-7272-a17e-33bdbd05e190	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:13:37	\N	2026-06-01 11:13:37	2026-06-01 11:13:37
019e82e4-2f70-70da-be13-f9ff37cb6c8a	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:14:12	\N	2026-06-01 11:14:12	2026-06-01 11:14:12
019e82e9-fb2e-72f2-af00-dfdfd34bde3f	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:20:32	\N	2026-06-01 11:20:32	2026-06-01 11:20:32
019e82eb-8b85-7265-a847-0ef7d3b34122	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:22:15	\N	2026-06-01 11:22:15	2026-06-01 11:22:15
019e82ec-77ce-735c-a1ad-56e3b803377a	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:23:15	\N	2026-06-01 11:23:15	2026-06-01 11:23:15
019e82f9-0038-72c8-906c-d133f49d54a5	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 11:36:57	\N	2026-06-01 11:36:57	2026-06-01 11:36:57
019e8316-5180-7385-afaf-db9f6ec3dcd3	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:08:58	\N	2026-06-01 12:08:58	2026-06-01 12:08:58
019e8323-4244-7088-8a55-5b63d0e793ce	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:23:06	\N	2026-06-01 12:23:06	2026-06-01 12:23:06
019e8324-3468-7132-8090-721db3e72153	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:24:08	\N	2026-06-01 12:24:08	2026-06-01 12:24:08
019e8327-5982-7330-aaa6-487237ab7d1c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:27:34	\N	2026-06-01 12:27:34	2026-06-01 12:27:34
019e8327-8c88-7107-a505-0f1e229933f1	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:27:47	\N	2026-06-01 12:27:47	2026-06-01 12:27:47
019e8330-d36d-71e5-8af0-08a1dee2dd53	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:37:55	\N	2026-06-01 12:37:55	2026-06-01 12:37:55
019e8331-3038-701d-b958-9fad182a080e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 12:38:19	\N	2026-06-01 12:38:19	2026-06-01 12:38:19
019e8335-349f-712c-92bb-40acd516b996	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:42:42	\N	2026-06-01 12:42:42	2026-06-01 12:42:42
019e8339-af37-7379-9910-e303b7d8f4b1	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:47:36	\N	2026-06-01 12:47:36	2026-06-01 12:47:36
019e8344-9158-7204-b9b7-2cc75eb853a6	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:59:29	\N	2026-06-01 12:59:29	2026-06-01 12:59:29
019e8344-ad9c-7035-895a-8912c21b5189	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 12:59:36	\N	2026-06-01 12:59:36	2026-06-01 12:59:36
019e834d-5b5b-735f-802f-b19c9f0cfb16	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 13:09:05	\N	2026-06-01 13:09:05	2026-06-01 13:09:05
019e8350-50e6-729c-811f-1062da1dcc43	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 13:12:19	\N	2026-06-01 13:12:19	2026-06-01 13:12:19
019e8357-847e-71cb-a1ac-705232b50899	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 13:20:11	\N	2026-06-01 13:20:11	2026-06-01 13:20:11
019e836f-34d9-7090-8975-772fcfc1a291	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 13:46:03	\N	2026-06-01 13:46:03	2026-06-01 13:46:03
019e8385-aa7e-71a3-b235-b9da7e64deb1	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 14:10:35	\N	2026-06-01 14:10:35	2026-06-01 14:10:35
019e8385-fc02-73c6-a053-86f4eb363a80	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	1	2026-06-01 14:10:56	\N	2026-06-01 14:10:56	2026-06-01 14:11:07
019e8387-e275-70d3-ab37-f6828e90f491	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 14:13:01	\N	2026-06-01 14:13:01	2026-06-01 14:13:01
019e8388-a2d2-72d5-8589-853a21ee061c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:13:50	\N	2026-06-01 14:13:50	2026-06-01 14:13:50
019e8388-a7af-733d-8068-557500bdcd30	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:13:51	\N	2026-06-01 14:13:51	2026-06-01 14:13:51
019e8388-ac0a-725a-a9b3-aa69d2b73514	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:13:52	\N	2026-06-01 14:13:52	2026-06-01 14:13:52
019e8388-b7bd-70f7-be45-afc11205ed22	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:13:55	\N	2026-06-01 14:13:55	2026-06-01 14:13:55
019e8389-4626-73b9-8a41-4924b90e2b76	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:14:32	\N	2026-06-01 14:14:32	2026-06-01 14:14:32
019e8389-75db-7119-b451-c6ef304adfe3	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:14:44	\N	2026-06-01 14:14:44	2026-06-01 14:14:44
019e8389-851b-702e-b78c-de9189b8bae9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:14:48	\N	2026-06-01 14:14:48	2026-06-01 14:14:48
019e8389-8f06-72cf-a38c-27bf67765bce	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:14:50	\N	2026-06-01 14:14:50	2026-06-01 14:14:50
019e8389-b227-7191-b4c3-b7b2cc15ceea	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:14:59	\N	2026-06-01 14:14:59	2026-06-01 14:14:59
019e8389-b9ff-7080-8109-8a5b61e3ef6d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:01	\N	2026-06-01 14:15:01	2026-06-01 14:15:01
019e8389-d846-71ef-b11e-1534c25a23df	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:09	\N	2026-06-01 14:15:09	2026-06-01 14:15:09
019e8389-e7e8-7222-bd17-6b96ad2701f2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:13	\N	2026-06-01 14:15:13	2026-06-01 14:15:13
019e838a-07b7-7036-b011-356bc24b94c8	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:21	\N	2026-06-01 14:15:21	2026-06-01 14:15:21
019e838a-18ca-72d6-b029-e517ede00c0e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:26	\N	2026-06-01 14:15:26	2026-06-01 14:15:26
019e838a-4344-710d-aab4-9bcccff1c7bb	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:37	\N	2026-06-01 14:15:37	2026-06-01 14:15:37
019e838a-4fba-71f1-ad1a-a9254c547de5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:40	\N	2026-06-01 14:15:40	2026-06-01 14:15:40
019e838a-871c-717c-8bc5-4f1079769fee	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:15:54	\N	2026-06-01 14:15:54	2026-06-01 14:15:54
019e838a-a7cd-712f-a5a7-c34b65945af3	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:16:02	\N	2026-06-01 14:16:02	2026-06-01 14:16:02
019e838b-0bc3-7258-bf58-9f5bf1627481	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:16:28	\N	2026-06-01 14:16:28	2026-06-01 14:16:28
019e838b-1526-7027-90e5-5f3a7780940c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:16:30	\N	2026-06-01 14:16:30	2026-06-01 14:16:30
019e838b-35d7-738c-b15a-03a05359801d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:16:39	\N	2026-06-01 14:16:39	2026-06-01 14:16:39
019e838e-e269-7061-8ac2-0b6f35c0090b	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-01 14:20:39	\N	2026-06-01 14:20:39	2026-06-01 14:20:39
019e8390-4d9b-713b-94be-29f986dd4f80	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 14:22:12	\N	2026-06-01 14:22:12	2026-06-01 14:22:12
019e83e4-820b-7101-bb1c-6ef167183394	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 15:54:11	\N	2026-06-01 15:54:11	2026-06-01 15:54:11
019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-5252-70fc-bed5-16a997fd50f2	completed	20	20	2026-06-03 03:21:11	2026-06-03 04:18:56	2026-06-03 03:21:11	2026-06-03 04:18:56
019e8643-6b11-7042-9f17-1c191f8e10ea	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 02:57:05	\N	2026-06-02 02:57:05	2026-06-02 02:58:02
019e864b-6b78-72ce-9628-11a1322a4403	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 03:05:50	\N	2026-06-02 03:05:50	2026-06-02 03:05:50
019e864d-ce65-714b-869d-e1e2151a92f9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 03:08:26	\N	2026-06-02 03:08:26	2026-06-02 03:08:26
019e864d-e427-7049-a918-e33e1c971b31	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 03:08:32	\N	2026-06-02 03:08:32	2026-06-02 03:08:32
019e8dd8-74b2-70e6-b206-6bde874abf32	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-03 14:17:13	\N	2026-06-03 14:17:13	2026-06-03 14:17:13
019e921b-5784-7216-bdbc-d6307a5f7ba7	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-04 10:08:45	\N	2026-06-04 10:08:45	2026-06-04 10:16:47
019e9623-035e-70f4-8f2c-2ae2eab86231	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-05 04:55:37	\N	2026-06-05 04:55:37	2026-06-05 05:02:01
019e9c0e-a035-72aa-bde1-b75799012633	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 08:31:04	\N	2026-06-06 08:31:04	2026-06-06 08:31:04
019e83e4-9e9d-70d9-bf80-77141ecf3cf7	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	18	2026-06-01 15:54:18	2026-06-01 16:01:49	2026-06-01 15:54:18	2026-06-01 16:01:49
019e83ec-4463-716a-a1ec-d659eacd218b	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-01 16:02:39	\N	2026-06-01 16:02:39	2026-06-01 16:02:39
019e83fe-e409-7257-9982-3a9271826f3a	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e7ce2-7c82-7252-971e-b0bf17d42bf5	in_progress	20	0	2026-06-01 16:23:00	\N	2026-06-01 16:23:00	2026-06-01 16:23:00
019e83ff-7cb1-7154-9cea-23bb6f220d50	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e7ce2-7c82-7252-971e-b0bf17d42bf5	in_progress	20	0	2026-06-01 16:23:39	\N	2026-06-01 16:23:39	2026-06-01 16:23:39
019e9c0e-b7db-73c9-81e1-3e5555cd77c6	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 08:31:10	\N	2026-06-06 08:31:10	2026-06-06 08:31:10
019e9c0e-c822-716f-903b-68722b8b404a	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 08:31:14	\N	2026-06-06 08:31:14	2026-06-06 08:31:14
019e9c46-4147-70ed-9583-079f0305bd72	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 09:31:50	\N	2026-06-06 09:31:50	2026-06-06 09:31:50
019e9c46-4289-7277-915f-c0e9ea1c85b6	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 09:31:50	\N	2026-06-06 09:31:50	2026-06-06 09:31:50
019e9c49-77af-70cf-b43b-1be113e60f78	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	1	2026-06-06 09:35:21	\N	2026-06-06 09:35:21	2026-06-06 09:36:22
019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 10:28:30	\N	2026-06-06 10:28:30	2026-06-06 10:28:30
019ea290-8fee-72de-8cae-d3268366c1b3	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-06-07 14:50:43	\N	2026-06-07 14:50:43	2026-06-08 06:22:03
019eaba6-efa2-726b-9356-52f0578f4573	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fe-0aae-73a8-8cbc-ef043131f6ea	in_progress	20	0	2026-06-09 09:11:44	\N	2026-06-09 09:11:44	2026-06-09 09:11:58
019e864e-03bd-73d0-b2aa-5afedad3b33f	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	20	2026-06-02 03:08:40	2026-06-02 03:19:21	2026-06-02 03:08:40	2026-06-02 03:19:21
019e8657-f15a-725f-9dd7-ab15d29f964e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-5252-70fc-bed5-16a997fd50f2	in_progress	20	0	2026-06-02 03:19:30	\N	2026-06-02 03:19:30	2026-06-02 03:19:30
019e8603-f7d4-7326-8194-92556954338c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	21	2026-06-02 01:47:47	2026-06-02 02:37:57	2026-06-02 01:47:47	2026-06-02 02:37:57
019e8634-6186-7364-87cf-3022660c7b7e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	1	2026-06-02 02:40:40	\N	2026-06-02 02:40:40	2026-06-02 02:40:47
\.


--
-- Data for Name: sentences; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.sentences (id, level_id, source_text, target_text, tags, difficulty, "order", created_at, updated_at) FROM stdin;
019e71e1-3267-734a-abc1-895dd8abaf31	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Selamat pagi! Apa khabar?	Good morning! How are you?	\N	1	1	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3269-7090-b8b5-dd70d2b8fa7b	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya sihat, terima kasih.	Fine, thank you.	\N	1	2	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-326a-7367-b316-afb7232fe48c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Terima kasih banyak-banyak!	Thank you so much!	\N	1	3	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-326b-72db-83f5-77053c15a6f1	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Sama-sama.	You're welcome.	\N	1	4	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-326c-7287-8e58-6efb81d2293f	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Oh, saya minta maaf sangat-sangat!	Oh, I'm so sorry!	\N	1	5	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-326e-708c-8deb-5b611d1fca9b	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Tak apa.	It's okay.	\N	1	6	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-326f-71da-ad92-48800b1c008e	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Awak faham tak apa maksud saya?	Do you understand what I mean?	\N	1	7	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3270-72c4-a123-4fd4e2837da1	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya tidak faham.	I don't understand.	\N	1	8	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3271-7351-a397-1bfca7c3cebb	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Tumpang lalu.	Excuse me.	\N	1	9	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3273-7288-ac2e-40fac328fb6d	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Wei, nak pergi minum kopi sekarang tak?	Hey, do you want to grab some coffee now?	\N	1	10	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3275-71ec-91d8-9f6937c785d8	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Maaf, saya sibuk	Sorry, I'm busy.	\N	1	11	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3276-7022-9eea-b52898a285bc	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Baiklah, saya kena pergi sekarang.	Alright, I have to go now.	\N	1	12	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3277-7245-8397-2b95ecf990d9	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Jumpa lagi.	See you later.	\N	1	13	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3278-7246-a23e-10370ffbd291	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Apa pendapat awak pasal idea ni?	What do you think about this idea?	\N	1	14	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-327a-73f4-9a63-092cefb1aabf	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya setuju.	I agree.	\N	1	15	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-327b-70a4-a7ad-d11703dd3c66	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Di mana kunci saya?	Where is my key?	\N	1	16	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-327c-71e1-9d58-b2fe6426441a	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Dah pukul 11:30 malam sekarang.	It is already 11:30 PM.	\N	1	17	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-327d-739e-b4c9-7e19f212ff0b	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya nak pergi tidur.	I'm going to bed.	\N	1	18	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-327e-72b7-9b50-f40528ac67e7	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Hai! Sampai pun awak	Hi! You are finally here.	\N	1	19	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3280-720c-8511-ed606ebc1ff9	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Sila masuk.	Please come in.	\N	1	20	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71eb-cf8b-73e6-b6a8-933b2095ea7b	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Selamat pagi! Apa khabar?	Guten Morgen! Wie geht's?	\N	1	1	2026-05-29 04:09:00	2026-05-29 04:09:00
019e71eb-cf8d-708d-8e56-133f744455aa	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Saya sihat, terima kasih.	Mir geht's gut, danke.	\N	1	2	2026-05-29 04:09:00	2026-05-29 04:09:00
019e71eb-cf8e-710c-8318-da485ebe01db	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Terima kasih banyak-banyak!	Vielen, vielen Dank!	\N	1	3	2026-05-29 04:09:00	2026-05-29 04:09:00
019e71eb-cf90-723d-b039-382d41219cf6	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Sama-sama.	Gerne!	\N	1	4	2026-05-29 04:09:00	2026-05-29 04:09:00
019e71eb-cf91-7206-a413-ba626f474318	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Oh, saya minta maaf sangat-sangat!	Oh, tut mir echt leid!	\N	1	5	2026-05-29 04:09:00	2026-05-29 04:09:00
019e71ef-d06e-715d-8d24-37e223338848	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Tak apa.	Macht nichts.	\N	1	6	2026-05-29 04:13:22	2026-05-29 04:13:22
019e71ef-d070-729c-b759-759475f881e4	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Awak faham tak apa maksud saya?	Verstehst du, was ich meine?	\N	1	7	2026-05-29 04:13:22	2026-05-29 04:13:22
019e71ef-d072-705f-8ec3-3ea03670f130	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Saya tidak faham.	Ich versteh's nicht.	\N	1	8	2026-05-29 04:13:22	2026-05-29 04:13:22
019e71ef-d073-73e8-b243-ce6e2d57a1cf	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Tumpang lalu.	Darf ich mal kurz durch?	\N	1	9	2026-05-29 04:13:22	2026-05-29 04:13:22
019e71ef-d074-71d8-8604-3a676061ba94	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Wei, nak pergi minum kopi sekarang tak?	Ey, hast du Bock, jetzt 'nen Kaffee trinken zu gehen?	\N	1	10	2026-05-29 04:13:22	2026-05-29 04:13:22
019e71f3-a9a2-70da-a348-6c09f3366e31	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Maaf, saya sibuk.	Tut mir leid, ich bin gerade beschäftigt.	\N	1	11	2026-05-29 04:17:34	2026-05-29 04:17:34
019e71f3-a9a4-709a-87be-9cd0e3245bb2	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Baiklah, saya kena pergi sekarang.	Alles klar, ich muss jetzt los.	\N	1	12	2026-05-29 04:17:34	2026-05-29 04:17:34
019e71f3-a9a5-71f9-b9b7-252789895918	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Jumpa lagi.	Bis dann!	\N	1	13	2026-05-29 04:17:34	2026-05-29 04:17:34
019e71f3-a9a7-70a8-a64f-7f2c4f3b57aa	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Apa pendapat awak pasal idea ni?	Was hältst du von der Idee?	\N	1	14	2026-05-29 04:17:34	2026-05-29 04:17:34
019e71f3-a9a8-713c-ba1e-29e897876c75	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Saya setuju.	Ich bin dabei.	\N	1	15	2026-05-29 04:17:34	2026-05-29 04:17:34
019e71f4-ad15-7345-87da-15bb8af4535b	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Di mana kunci saya?	Wo ist mein Schlüssel?	\N	1	16	2026-05-29 04:18:41	2026-05-29 04:18:41
019e71f4-ad17-7057-a29e-a645631ff2d6	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Dah pukul 11:30 malam sekarang.	Es ist schon 23:30 Uhr.	\N	1	17	2026-05-29 04:18:41	2026-05-29 04:18:41
019e71f4-ad18-73c9-8eee-64c5228ee0d4	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Saya nak pergi tidur.	Ich gehe jetzt ins Bett.	\N	1	18	2026-05-29 04:18:41	2026-05-29 04:18:41
019e71f4-ad1a-7399-ac55-390ae67dfe03	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Hai! Sampai pun awak	Hi! Da bist du ja.	\N	1	19	2026-05-29 04:18:41	2026-05-29 04:18:41
019e71f4-ad1b-724d-8848-4771d3af48a3	019e71e2-45f2-7038-9aa5-7b4bffcdc765	Sila masuk.	Komm rein!	\N	1	20	2026-05-29 04:18:41	2026-05-29 04:18:41
019e7b92-2866-73bb-b02e-aec30e8df203	019e720d-251d-70c9-859b-dbad677ca8bc	Maaf, saya nak beli yang ini.	Excuse me, I want to buy this.	\N	1	1	2026-05-31 01:07:16	2026-05-31 01:07:16
019e7b92-2867-7295-bd89-eeffa7b5e9e5	019e720d-251d-70c9-859b-dbad677ca8bc	Berapa harganya?	How much is it?	\N	1	2	2026-05-31 01:07:16	2026-05-31 01:07:16
019e7b92-286a-7211-96ac-244725e33cdc	019e720d-251d-70c9-859b-dbad677ca8bc	Awak nampak risau. Semuanya okay ke?	You look worried. Is everything okay?	\N	1	4	2026-05-31 01:07:16	2026-05-31 01:07:16
019e7b92-286b-7188-8d3e-f455b947f6e3	019e720d-251d-70c9-859b-dbad677ca8bc	Boleh saya bantu?	Can I help you?	\N	1	5	2026-05-31 01:07:16	2026-05-31 01:07:16
019e7b93-72a0-7149-bcf1-20286bec7997	019e720d-251d-70c9-859b-dbad677ca8bc	Tolong senyap.	Please be quiet.	\N	1	6	2026-05-31 01:08:41	2026-05-31 01:08:41
019e7b93-72a2-70f2-b8a5-34a992d6f88d	019e720d-251d-70c9-859b-dbad677ca8bc	Kami dah selesai makan.	We are done eating.	\N	1	7	2026-05-31 01:08:41	2026-05-31 01:08:41
019e7b93-72a5-7173-8f22-a29d484b8e37	019e720d-251d-70c9-859b-dbad677ca8bc	Maafkan saya, di mana tandas?	Excuse me, where is the toilet?	\N	1	9	2026-05-31 01:08:41	2026-05-31 01:08:41
019e7b93-72a6-70c5-9006-caab62f97b36	019e720d-251d-70c9-859b-dbad677ca8bc	Di sebelah sana.	Over there.	\N	1	10	2026-05-31 01:08:41	2026-05-31 01:08:41
019e7b95-30cf-7358-b291-186df440e3e2	019e720d-251d-70c9-859b-dbad677ca8bc	Projek ni susah sangat, saya rasa nak putus asa.	This project is so hard, I want to give up.	\N	1	11	2026-05-31 01:10:35	2026-05-31 01:10:35
019e7b95-30d1-7115-adce-9a46439b1e43	019e720d-251d-70c9-859b-dbad677ca8bc	Jangan risau.	Don't worry.	\N	1	12	2026-05-31 01:10:35	2026-05-31 01:10:35
019e7b95-30d2-70b7-8a4a-8380976f5294	019e720d-251d-70c9-859b-dbad677ca8bc	Awak tahu tak di mana pejabat pos?	Do you know where the post office is?	\N	1	13	2026-05-31 01:10:35	2026-05-31 01:10:35
019e7b95-30d3-706c-b753-39c2c9cd6e27	019e720d-251d-70c9-859b-dbad677ca8bc	Saya tidak tahu.	I don't know.	\N	1	14	2026-05-31 01:10:35	2026-05-31 01:10:35
019e7b95-30d5-73a1-87c6-f54e0f65931d	019e720d-251d-70c9-859b-dbad677ca8bc	Oh, telefon saya tengah berbunyi.	Oh, my phone is ringing.	\N	1	15	2026-05-31 01:10:35	2026-05-31 01:10:35
019e7b96-cf85-709a-bd49-da5491997789	019e720d-251d-70c9-859b-dbad677ca8bc	Bagaimana kalau kita pergi ke pantai hujung minggu ni?	What if we go to the beach this weekend?	\N	1	17	2026-05-31 01:12:21	2026-05-31 01:12:21
019e7b92-2869-724f-a3c4-4cbfe8941117	019e720d-251d-70c9-859b-dbad677ca8bc	Cepatlah!	Hurry up!	\N	1	3	2026-05-31 01:07:16	2026-05-31 01:49:23
019e7b93-72a4-719f-92fd-1bb01f8f151f	019e720d-251d-70c9-859b-dbad677ca8bc	Boleh bagi bil?	Bill, please.	\N	1	8	2026-05-31 01:08:41	2026-05-31 01:49:34
019e7b96-cf83-7291-9bfd-4366f670d4e8	019e720d-251d-70c9-859b-dbad677ca8bc	Tunggu sekejap.	Wait a minute.	\N	1	16	2026-05-31 01:12:21	2026-05-31 01:49:48
019e7b96-cf88-70e2-ad7f-9d5b79ce5710	019e720d-251d-70c9-859b-dbad677ca8bc	Wei! Dah bertahun rasanya sejak kali terakhir kita jumpa.	Hey! It has been years since we last met.	\N	1	19	2026-05-31 01:12:21	2026-05-31 01:12:21
019e7b96-cf8a-7229-8e92-279f82780bfb	019e720d-251d-70c9-859b-dbad677ca8bc	Lama tidak berjumpa.	Long time no see.	\N	1	20	2026-05-31 01:12:21	2026-05-31 01:12:21
019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	019e720d-251d-70c9-859b-dbad677ca8bc	Itu idea yang bagus!	That's a good idea!	\N	1	18	2026-05-31 01:12:21	2026-05-31 01:12:55
019e7ba1-d075-71b5-99b3-c8e610478a91	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Maaf, saya nak beli yang ini.	Entschuldigung, ich möchte das hier kaufen.	\N	1	1	2026-05-31 01:24:22	2026-05-31 01:24:22
019e7ba1-d077-72ff-8822-5698665663d7	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Berapa harganya?	Wie viel kostet das?	\N	1	2	2026-05-31 01:24:22	2026-05-31 01:24:22
019e7ba1-d078-73d9-9b2e-be0c3b17839f	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Cepatlah! / Sila cepat.	Beeil dich!	\N	1	3	2026-05-31 01:24:22	2026-05-31 01:24:22
019e7ba1-d07a-704f-ae4f-013fabe6b0ce	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Awak nampak risau. Semuanya okay ke?Awak nampak risau. Semuanya okay ke?	Du siehst besorgt aus. Ist alles okay?	\N	1	4	2026-05-31 01:24:22	2026-05-31 01:24:22
019e7ba1-d07b-705b-b1c0-6962bba22f43	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Boleh saya bantu?	Kann ich dir helfen?	\N	1	5	2026-05-31 01:24:22	2026-05-31 01:24:22
019e7ba2-c19e-7299-b681-6ef367725490	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Tolong senyap.	Sei bitte leise.	\N	1	6	2026-05-31 01:25:24	2026-05-31 01:25:24
019e7ba2-c1a0-718a-80e4-07a09d5920dd	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Kami dah selesai makan.	Wir sind fertig mit dem Essen.	\N	1	7	2026-05-31 01:25:24	2026-05-31 01:25:24
019e7ba2-c1a1-72b3-ac27-becd0cf5391e	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Boleh bagi bil? / Minta bil.	Die Rechnung, bitte.	\N	1	8	2026-05-31 01:25:24	2026-05-31 01:25:24
019e7ba2-c1a3-7268-98cc-78b0170327b2	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Maafkan saya, di mana tandas?	Entschuldigung, wo ist die Toilette?	\N	1	9	2026-05-31 01:25:24	2026-05-31 01:25:24
019e7ba2-c1a4-72da-abf8-5868a3464bea	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Di sebelah sana.	Da drüben.	\N	1	10	2026-05-31 01:25:24	2026-05-31 01:25:24
019e7ba3-af2d-7015-b766-7fd4460c2995	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Projek ni susah sangat, saya rasa nak putus asa.	Dieses Projekt ist so schwer, ich will aufgeben.	\N	1	11	2026-05-31 01:26:25	2026-05-31 01:26:25
019e7ba3-af2f-716d-8b79-dac3525698b0	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Jangan risau.	Mach dir keine Sorgen.	\N	1	12	2026-05-31 01:26:25	2026-05-31 01:26:25
019e7ba3-af30-71e5-b8bc-b36461be0640	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Awak tahu tak di mana pejabat pos?	Weißt du, wo die Post ist?	\N	1	13	2026-05-31 01:26:25	2026-05-31 01:26:25
019e7ba3-af32-71e0-ad52-5ddae2aa9158	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Saya tidak tahu.	Ich weiß es nicht.	\N	1	14	2026-05-31 01:26:25	2026-05-31 01:26:25
019e7ba3-af33-72fb-9ac8-9c5c613266f1	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Oh, telefon saya tengah berbunyi.	Oh, mein Handy klingelt.	\N	1	15	2026-05-31 01:26:25	2026-05-31 01:26:25
019e7ba4-8534-7179-9ab5-ab7ba99cda74	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Tunggu sekejap. / Hold on a second.	Warte mal kurz.	\N	1	16	2026-05-31 01:27:20	2026-05-31 01:27:20
019e7ba4-8536-70a6-83ec-b654f1c2d40c	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Bagaimana kalau kita pergi ke pantai hujung minggu ni?	Wie wär’s, wenn wir am Wochenende an den Strand fahren?	\N	1	17	2026-05-31 01:27:20	2026-05-31 01:27:20
019e7ba4-8537-72f1-a0fd-f0ce86e4a5c0	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Itu idea yang bagus!	Das ist eine gute Idee!	\N	1	18	2026-05-31 01:27:20	2026-05-31 01:27:20
019e7ba4-8538-7225-8650-67c64c2206fc	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Wei! Dah bertahun rasanya sejak kali terakhir kita jumpa.	Hey! Es ist gefühlt Jahre her, seit wir uns das letzte Mal gesehen haben.	\N	1	19	2026-05-31 01:27:20	2026-05-31 01:27:20
019e7ba4-8539-72e0-af77-dabb5a4e7650	019e7ba0-19ab-72fc-9fc4-64ba2ed5160c	Lama tidak berjumpa.	Lange nicht gesehen.	\N	1	20	2026-05-31 01:27:20	2026-05-31 01:27:20
019e7ba7-8682-7218-8276-d3aefb06c058	019e720d-5252-70fc-bed5-16a997fd50f2	Siapa nama awak?	What is your name?	\N	1	1	2026-05-31 01:30:37	2026-05-31 01:30:37
019e7ba7-8684-706d-8e79-903dbdfd5f91	019e720d-5252-70fc-bed5-16a997fd50f2	Selamat berkenalan.	Nice to meet you.	\N	1	2	2026-05-31 01:30:37	2026-05-31 01:30:37
019e7ba7-8685-7111-b6c8-641c785adf9b	019e720d-5252-70fc-bed5-16a997fd50f2	Awak tinggal di mana?	Where do you live?	\N	1	3	2026-05-31 01:30:37	2026-05-31 01:30:37
019e7ba7-8687-70c9-98e4-c7fb328bff8b	019e720d-5252-70fc-bed5-16a997fd50f2	Awak kerja apa?	What do you do?	\N	1	4	2026-05-31 01:30:37	2026-05-31 01:30:37
019e7ba7-8688-722e-a58e-649754c118f2	019e720d-5252-70fc-bed5-16a997fd50f2	Saya tumpang gembira untuk awak.	I am happy for you.	\N	1	5	2026-05-31 01:30:37	2026-05-31 01:30:37
019e7ba8-c286-737c-8b88-5b51104a975e	019e720d-5252-70fc-bed5-16a997fd50f2	Boleh awak ulang balik?	Can you repeat that?	\N	1	6	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7ba8-c288-71bb-999e-6483ad6d705a	019e720d-5252-70fc-bed5-16a997fd50f2	Tolong cakap perlahan sikit.	Speak slowly, please.	\N	1	7	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7ba8-c289-7060-85c3-c7758c2e1a02	019e720d-5252-70fc-bed5-16a997fd50f2	Pukul berapa sekarang?	What time is it?	\N	1	8	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7ba8-c28b-728b-8b5c-adc20c5139e6	019e720d-5252-70fc-bed5-16a997fd50f2	Saya lapar.	I am hungry.	\N	1	9	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7ba8-c28c-73c3-9cae-59ab23479bc2	019e720d-5252-70fc-bed5-16a997fd50f2	Jom kita makan sama-sama.	Let's eat together.	\N	1	10	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7baa-9255-73de-890b-f0f4eabada61	019e720d-5252-70fc-bed5-16a997fd50f2	Makanan ni sedap sangat.	The food is delicious.	\N	1	11	2026-05-31 01:33:56	2026-05-31 01:33:56
019e7baa-9257-71b1-b5f8-17b4b20c8759	019e720d-5252-70fc-bed5-16a997fd50f2	Saya dah kenyang.	I am full.	\N	1	12	2026-05-31 01:33:56	2026-05-31 01:33:56
019e7baa-9258-7269-8cb6-67b777f41dab	019e720d-5252-70fc-bed5-16a997fd50f2	Awak nak pergi mana tu?	Where are you going?	\N	1	13	2026-05-31 01:33:56	2026-05-31 01:33:56
019e7baa-9259-72f1-bafe-c60b67fd06af	019e720d-5252-70fc-bed5-16a997fd50f2	Saya tengah dalam perjalanan.	I am on my way.	\N	1	14	2026-05-31 01:33:56	2026-05-31 01:33:56
019e7baa-925b-70a3-9d03-a2c9c5b49d2d	019e720d-5252-70fc-bed5-16a997fd50f2	Saya dah sampai.	I have arrived.	\N	1	15	2026-05-31 01:33:56	2026-05-31 01:33:56
019e7bab-79f7-716c-9b04-1a1bbbbb7246	019e720d-5252-70fc-bed5-16a997fd50f2	Jaga diri elok-elok.	Take care.	\N	1	16	2026-05-31 01:34:55	2026-05-31 01:34:55
019e7bab-79f9-720b-9752-aab2d6683393	019e720d-5252-70fc-bed5-16a997fd50f2	Semoga hari awak menyenangkan!	Have a nice day!	\N	1	17	2026-05-31 01:34:55	2026-05-31 01:34:55
019e7bab-79fa-7084-96ab-cb12e2c8c5cb	019e720d-5252-70fc-bed5-16a997fd50f2	Tahniah!	Congratulations!	\N	1	18	2026-05-31 01:34:55	2026-05-31 01:34:55
019e7bab-79fc-724a-8010-8f6cfee7d5bb	019e720d-5252-70fc-bed5-16a997fd50f2	Semoga berjaya!	Good luck!	\N	1	19	2026-05-31 01:34:55	2026-05-31 01:34:55
019e7bab-79fd-732d-8b58-75301bbf54cb	019e720d-5252-70fc-bed5-16a997fd50f2	Terima kasih untuk segalanya.	Thank you for everything.	\N	1	20	2026-05-31 01:34:55	2026-05-31 01:34:55
019e7baf-7c22-7261-a0ff-b4c81d348024	019e7ba0-396c-7259-99a4-91c443b3e4f4	Siapa nama awak?	Wie heißt du?	\N	1	1	2026-05-31 01:39:18	2026-05-31 01:39:18
019e7baf-7c24-73e7-b9a9-d21f5389ca93	019e7ba0-396c-7259-99a4-91c443b3e4f4	Selamat berkenalan.	Schön, dich kennenzulernen.	\N	1	2	2026-05-31 01:39:18	2026-05-31 01:39:18
019e7baf-7c26-728f-9811-bb8e25caa5cb	019e7ba0-396c-7259-99a4-91c443b3e4f4	Awak tinggal di mana?	Wo wohnst du?	\N	1	3	2026-05-31 01:39:18	2026-05-31 01:39:18
019e7baf-7c27-7298-8287-3f4c3198a959	019e7ba0-396c-7259-99a4-91c443b3e4f4	Awak kerja apa?	Was machst du so beruflich?	\N	1	4	2026-05-31 01:39:18	2026-05-31 01:39:18
019e7baf-7c28-72c1-b535-dba354a88fb8	019e7ba0-396c-7259-99a4-91c443b3e4f4	Saya tumpang gembira untuk awak.	Ich freu mich für dich.	\N	1	5	2026-05-31 01:39:18	2026-05-31 01:39:18
019e7bb3-b91a-71d8-b34c-14ca4372ebb6	019e7ba0-396c-7259-99a4-91c443b3e4f4	Boleh awak ulang balik?	Kannst du das nochmal sagen?	\N	1	6	2026-05-31 01:43:56	2026-05-31 01:43:56
019e7bb3-b91c-738f-9310-c249c265e9da	019e7ba0-396c-7259-99a4-91c443b3e4f4	Tolong cakap perlahan sikit.	Kannst du bitte etwas langsamer sprechen?	\N	1	7	2026-05-31 01:43:56	2026-05-31 01:43:56
019e7bb3-b91d-70bf-9a93-1de4efdf31d0	019e7ba0-396c-7259-99a4-91c443b3e4f4	Pukul berapa sekarang?	Wie spät ist es?	\N	1	8	2026-05-31 01:43:56	2026-05-31 01:43:56
019e7bb3-b91e-70d0-b571-3d264d7eace9	019e7ba0-396c-7259-99a4-91c443b3e4f4	Saya lapar.	Ich habe Hunger.	\N	1	9	2026-05-31 01:43:56	2026-05-31 01:43:56
019e7bb3-b91f-70ed-b5f5-95c12c9e5238	019e7ba0-396c-7259-99a4-91c443b3e4f4	Jom kita makan sama-sama.	Lass uns zusammen essen gehen.	\N	1	10	2026-05-31 01:43:56	2026-05-31 01:43:56
019e7bb5-3b8f-7176-a401-88c7e064f063	019e7ba0-396c-7259-99a4-91c443b3e4f4	Makanan ni sedap sangat.	Das Essen ist voll lecker.	\N	1	11	2026-05-31 01:45:35	2026-05-31 01:45:35
019e7bb5-3b91-7319-88fc-83458fc1e690	019e7ba0-396c-7259-99a4-91c443b3e4f4	Saya dah kenyang.	Ich bin satt.	\N	1	12	2026-05-31 01:45:35	2026-05-31 01:45:35
019e7bb5-3b92-708c-b874-19ecfff47e81	019e7ba0-396c-7259-99a4-91c443b3e4f4	Awak nak pergi mana tu?	Wo gehst du hin?	\N	1	13	2026-05-31 01:45:35	2026-05-31 01:45:35
019e7bb5-3b93-70c8-bc66-08689cb944c6	019e7ba0-396c-7259-99a4-91c443b3e4f4	Saya tengah dalam perjalanan.	Ich bin unterwegs.	\N	1	14	2026-05-31 01:45:35	2026-05-31 01:45:35
019e7bb5-3b95-71a2-ae5e-31f98baf9bf3	019e7ba0-396c-7259-99a4-91c443b3e4f4	Saya dah sampai.	Ich bin da.	\N	1	15	2026-05-31 01:45:35	2026-05-31 01:45:35
019e7bb6-45b1-72b4-b513-5c6f7b49ee86	019e7ba0-396c-7259-99a4-91c443b3e4f4	Jaga diri elok-elok.	Mach's gut!	\N	1	16	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b3-71a1-9010-a1ed4b26f1d2	019e7ba0-396c-7259-99a4-91c443b3e4f4	Semoga hari awak menyenangkan!	Schönen Tag noch!	\N	1	17	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b4-7389-bb62-5cdb1581fbf1	019e7ba0-396c-7259-99a4-91c443b3e4f4	Tahniah!	Herzlichen Glückwunsch!	\N	1	18	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b5-7193-b0da-1757c1860ce3	019e7ba0-396c-7259-99a4-91c443b3e4f4	Semoga berjaya!	Viel Glück!	\N	1	19	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b6-70e1-9443-9d75af3b4377	019e7ba0-396c-7259-99a4-91c443b3e4f4	Terima kasih untuk segalanya.	Danke für alles.	\N	1	20	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Ada cerita baru tak?	What's new?	\N	1	1	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bbf-eaf5-7246-9dd4-9a117ac392c9	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak ada apa yang baru sangat.	Nothing much.	\N	1	2	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya penat.	I am tired.	\N	1	3	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bbf-eaf8-72db-89b4-98c4a7aaf349	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya perlukan rehat sekejap.	I need a break.	\N	1	4	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bbf-eaf9-7364-ad63-b0e73f4eb101	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Semoga cepat sembuh.	Feel better soon.	\N	1	5	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bc1-9c70-7163-a98e-f76e93c46b00	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Awak dah sedia?	Are you ready?	\N	1	6	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc1-9c72-73fd-9bd9-fcb97b76385d	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya dah sedia.	I am ready.	\N	1	7	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc1-9c74-7378-928d-e83b5579b9aa	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Bagi saya seminit	Give me a moment.	\N	1	8	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc1-9c75-7218-8008-c793491ba389	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saja nak ingatkan awal-awal.	Just a heads up.	\N	1	9	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc1-9c76-70c3-9c05-82e7e05cdc24	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak ada masalah langsung.	No problem at all.	\N	1	10	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc2-de08-73f7-aa5d-83b23cdf54e1	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Kecil punya hal.	Don't mention it.	\N	1	11	2026-05-31 02:00:28	2026-05-31 02:00:28
019e7bc2-de0a-71cd-96f7-5d57aafe8804	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Terpulang pada awak.	It's up to you.	\N	1	12	2026-05-31 02:00:28	2026-05-31 02:00:28
019e7bc2-de0b-729e-b62c-b3dd0ea91312	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya tak kisah.	I don't mind.	\N	1	13	2026-05-31 02:00:28	2026-05-31 02:00:28
019e7bc2-de0c-71bb-8a67-670ea9144baf	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Awak pasti ke?	Are you sure?	\N	1	14	2026-05-31 02:00:28	2026-05-31 02:00:28
019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya tak pasti.	I am not sure.	\N	1	15	2026-05-31 02:00:28	2026-05-31 02:00:28
019e7bc4-4fb9-7012-a874-60626596c19b	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Believe me.	Believe me.	\N	1	16	2026-05-31 02:02:03	2026-05-31 02:02:03
019e7bc4-4fbb-727d-ab39-1ecf35062c59	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya terlupa.	I forgot.	\N	1	17	2026-05-31 02:02:03	2026-05-31 02:02:03
019e7bc4-4fbc-7333-abaf-844f2ff9c177	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak mengapalah.	Never mind.	\N	1	18	2026-05-31 02:02:03	2026-05-31 02:02:03
019e7bc4-4fbd-7261-8742-8047409d06ae	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Betul tu.	That's true.	\N	1	19	2026-05-31 02:02:03	2026-05-31 02:02:03
019e7bc4-4fbe-7145-990d-e3c7a8f2e280	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Telefon saya balik nanti.	Call me back later.	\N	1	20	2026-05-31 02:02:03	2026-05-31 02:02:03
019e7bc6-ef20-72a0-812d-f955c59e048c	019e7ba0-5936-70a6-8841-0b7031b36332	Ada cerita baru tak?	Was gibt's Neues?	\N	1	1	2026-05-31 02:04:55	2026-05-31 02:04:55
019e7bc6-ef22-729f-90f9-364c7c64215e	019e7ba0-5936-70a6-8841-0b7031b36332	Tak ada apa yang baru sangat.	Nicht viel.	\N	1	2	2026-05-31 02:04:55	2026-05-31 02:04:55
019e7bc6-ef24-7107-afd1-1ac384071eda	019e7ba0-5936-70a6-8841-0b7031b36332	Saya penat.	Ich bin müde.	\N	1	3	2026-05-31 02:04:55	2026-05-31 02:04:55
019e7bc6-ef25-7113-9381-963bfc1ad506	019e7ba0-5936-70a6-8841-0b7031b36332	Saya perlukan rehat sekejap.	Ich brauche eine Pause.	\N	1	4	2026-05-31 02:04:55	2026-05-31 02:04:55
019e7bc6-ef26-7293-ae59-d790e710e828	019e7ba0-5936-70a6-8841-0b7031b36332	Semoga cepat sembuh.	Gute Besserung!	\N	1	5	2026-05-31 02:04:55	2026-05-31 02:04:55
019e7bc8-557e-7390-ad43-6f469f814adc	019e7ba0-5936-70a6-8841-0b7031b36332	Awak dah sedia?	Bist du bereit?	\N	1	6	2026-05-31 02:06:27	2026-05-31 02:06:27
019e7bc8-5580-70f0-b25e-33138676f352	019e7ba0-5936-70a6-8841-0b7031b36332	Saya dah sedia.	Ich bin bereit.	\N	1	7	2026-05-31 02:06:27	2026-05-31 02:06:27
019e7bc8-5582-7158-b69e-dc94506f73e0	019e7ba0-5936-70a6-8841-0b7031b36332	Bagi saya seminit	Gib mir einen Moment.	\N	1	8	2026-05-31 02:06:27	2026-05-31 02:06:27
019e7bc8-5583-7379-94b3-1049a597d781	019e7ba0-5936-70a6-8841-0b7031b36332	Saja nak ingatkan awal-awal.	Nur zur Info.	\N	1	9	2026-05-31 02:06:27	2026-05-31 02:06:27
019e7bc8-5584-70da-911f-adc163c54acf	019e7ba0-5936-70a6-8841-0b7031b36332	Tak ada masalah langsung.	Kein Problem!	\N	1	10	2026-05-31 02:06:27	2026-05-31 02:06:27
019e7bc9-4c2a-73e1-8e07-ff21e503ec81	019e7ba0-5936-70a6-8841-0b7031b36332	Kecil punya hal.	Keine Ursache!	\N	1	11	2026-05-31 02:07:30	2026-05-31 02:07:30
019e7bc9-4c2c-71e8-bb36-a0fe89cf99b4	019e7ba0-5936-70a6-8841-0b7031b36332	Terpulang pada awak.	Wie du willst.	\N	1	12	2026-05-31 02:07:30	2026-05-31 02:07:30
019e7bc9-4c2e-7094-b0ab-1f1fcd8e9327	019e7ba0-5936-70a6-8841-0b7031b36332	Saya tak kisah.	Ist mir egal.	\N	1	13	2026-05-31 02:07:30	2026-05-31 02:07:30
019e7bc9-4c2f-7068-a96b-cbfe0ffb6d13	019e7ba0-5936-70a6-8841-0b7031b36332	Awak pasti ke?	Bist du sicher?	\N	1	14	2026-05-31 02:07:30	2026-05-31 02:07:30
019e7bc9-4c30-727b-ba7d-1656c3a30fce	019e7ba0-5936-70a6-8841-0b7031b36332	Saya tak pasti.	Ich bin mir nicht sicher.	\N	1	15	2026-05-31 02:07:30	2026-05-31 02:07:30
019e7bca-92cb-738a-bc87-d7f11ff68993	019e7ba0-5936-70a6-8841-0b7031b36332	Percayalah cakap saya.	Glaub mir.	\N	1	16	2026-05-31 02:08:53	2026-05-31 02:08:53
019e7bca-92cd-7272-9eed-a64ee8b8bbb8	019e7ba0-5936-70a6-8841-0b7031b36332	Saya terlupa.	Ich hab's vergessen.	\N	1	17	2026-05-31 02:08:53	2026-05-31 02:08:53
019e7bca-92cf-7359-b680-610b4f4c1b7a	019e7ba0-5936-70a6-8841-0b7031b36332	Tak mengapalah.	Schon gut.	\N	1	18	2026-05-31 02:08:53	2026-05-31 02:08:53
019e7bca-92d0-72c9-9db1-a6ec3b8b9e12	019e7ba0-5936-70a6-8841-0b7031b36332	Betul tu.	Das stimmt.	\N	1	19	2026-05-31 02:08:53	2026-05-31 02:08:53
019e7bca-92d1-7149-af6d-cbce269597b3	019e7ba0-5936-70a6-8841-0b7031b36332	Telefon saya balik nanti.	Ruf mich später zurück.	\N	1	20	2026-05-31 02:08:53	2026-05-31 02:08:53
019e7bd1-9c5f-7331-add1-b6700f7762a1	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Apa yang dah berlaku?	What happened?	\N	1	1	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd1-9c61-7131-b721-25cb44ee8ba5	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Tak ada apa-apa yang berlaku.	Nothing happened.	\N	1	2	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd1-9c63-721e-87e8-1a39f142c7b2	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya bosan.	I am bored.	\N	1	3	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd1-9c64-704b-a49e-3e81eb834ef9	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Jom kita buat sesuatu.	Let's do something.	\N	1	4	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd1-9c65-707a-acd0-38b839c8eb30	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Kedengaran bagus bagi saya.	Sounds good to me.	\N	1	5	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd3-e095-706c-a3fe-0a68641117be	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya rasa begitulah.	I think so.	\N	1	6	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd3-e097-721b-86d6-0b2fc4e1b448	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya rasa bukan macam tu.	I don't think so.	\N	1	7	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd3-e098-73ff-8a54-e47c19e1888d	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Apa maksud awak?	What do you mean?	\N	1	8	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd3-e099-706d-a85a-076e8a27e4fd	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya sesat.	I am lost.	\N	1	9	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd3-e09b-716d-804b-5c8c93e90c92	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Boleh awak tolong saya cari benda ni?	Can you help me find this?	\N	1	10	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd6-495f-72c3-b830-50016c9d6815	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Benda ni mahal sangat.	It is too expensive.	\N	1	11	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd6-4962-7084-aea1-b48824d0a213	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Benda ni agak murah.	It is quite cheap.	\N	1	12	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd6-4963-728b-9ff7-174d14ad2ec8	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Boleh saya cuba ni?	Can I try this on?	\N	1	13	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd6-4964-7360-b652-d96852b2d0de	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Di mana kaunter bayaran?	Where is the cashier?	\N	1	14	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd6-4966-72be-b6c7-605087737a73	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Simpan baki tu.	Keep the change.	\N	1	15	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd7-d2e9-71d7-acd6-b8c3e1a50c85	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Bukan perkara besar pun.	It's no big deal.	\N	1	16	2026-05-31 02:23:22	2026-05-31 02:23:22
019e7bd7-d2eb-71a8-93b9-2ab8d7895bf2	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya bangga dengan awak.	I am proud of you.	\N	1	17	2026-05-31 02:23:22	2026-05-31 02:23:22
019e7bd7-d2ed-73c9-8680-12fd73518724	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Awak pasti boleh buat punya.	You can do it.	\N	1	18	2026-05-31 02:23:22	2026-05-31 02:23:22
019e7bd7-d2ee-70a0-bebd-7e978edd2a78	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Masa berlalu cepat sungguh.	Time flies so fast.	\N	1	19	2026-05-31 02:23:22	2026-05-31 02:23:22
019e7bd7-d2f0-7259-87b8-a0143417b492	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Jumpa lagi pada masa akan datang.	See you next time.	\N	1	20	2026-05-31 02:23:22	2026-05-31 02:23:22
019e7bda-3308-71aa-bae6-aeb78634f4fc	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Apa yang dah berlaku?	Was ist passiert?	\N	1	1	2026-05-31 02:25:58	2026-05-31 02:25:58
019e7bda-330a-7093-911b-6e838917912e	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Tak ada apa-apa yang berlaku.	Nichts ist passiert.	\N	1	2	2026-05-31 02:25:58	2026-05-31 02:25:58
019e7bda-330b-7353-9c5b-f655e6101a44	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Saya bosan.	Mir ist langweilig.	\N	1	3	2026-05-31 02:25:58	2026-05-31 02:25:58
019e7bda-330c-735d-96c5-aeb55ad2eada	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Jom kita buat sesuatu.	Lass uns was machen.	\N	1	4	2026-05-31 02:25:58	2026-05-31 02:25:58
019e7bda-330e-70aa-b6f5-54e9bf1cd9bf	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Kedengaran bagus bagi saya.	Klingt gut für mich.	\N	1	5	2026-05-31 02:25:58	2026-05-31 02:25:58
019e7be2-68ab-7023-8174-dba43aefca8d	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Saya rasa begitulah.	Ich denke schon.	\N	1	6	2026-05-31 02:34:56	2026-05-31 02:34:56
019e7be2-68ad-7326-b196-583a7d010f2e	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Saya rasa bukan macam tu.	Ich glaube eher nicht.	\N	1	7	2026-05-31 02:34:56	2026-05-31 02:34:56
019e7be2-68ae-725e-bc39-ce32153f5a1c	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Apa maksud awak?	Wie meinst du das?	\N	1	8	2026-05-31 02:34:56	2026-05-31 02:34:56
019e7be2-68af-718b-a709-50051b3f1d59	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Saya sesat.	Ich habe mich verlaufen.	\N	1	9	2026-05-31 02:34:56	2026-05-31 02:34:56
019e7be2-68b0-730e-bbe2-8674b4d6a3d4	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Boleh awak tolong saya cari benda ni?	Kannst du mir helfen, das hier zu finden?	\N	1	10	2026-05-31 02:34:56	2026-05-31 02:34:56
019e7be4-3fdb-73a0-bd9d-38ddb91a286b	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Benda ni mahal sangat.	Das ist zu teuer.	\N	1	11	2026-05-31 02:36:56	2026-05-31 02:36:56
019e7be4-3fdd-7202-93e8-0f4ea0a749a2	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Benda ni agak murah.	Das ist ziemlich billig.	\N	1	12	2026-05-31 02:36:56	2026-05-31 02:36:56
019e7be4-3fdf-7117-95ca-8163f0db867d	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Boleh saya cuba ni?	Kann ich das mal anprobieren?	\N	1	13	2026-05-31 02:36:56	2026-05-31 02:36:56
019e7be4-3fe0-72dd-89a0-9215fbf64c4e	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Di mana kaunter bayaran?	Wo ist die Kasse?	\N	1	14	2026-05-31 02:36:56	2026-05-31 02:36:56
019e7be4-3fe1-7199-884a-dee64b1e4a73	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Simpan baki tu.	Stimmt so.	\N	1	15	2026-05-31 02:36:56	2026-05-31 02:36:56
019e7be5-57ee-71ab-9643-1dd0b460957c	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Bukan perkara besar pun.	Ist halb so wild.	\N	1	16	2026-05-31 02:38:08	2026-05-31 02:38:08
019e7be5-57f0-73b0-b528-7bd3bd58a526	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Saya bangga dengan awak.	Ich bin stolz auf dich.	\N	1	17	2026-05-31 02:38:08	2026-05-31 02:38:08
019e7be5-57f2-7388-af20-7a073d6ec969	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Awak pasti boleh buat punya.	Du schaffst das!	\N	1	18	2026-05-31 02:38:08	2026-05-31 02:38:08
019e7be5-57f3-7011-aa05-400520e50d5a	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Masa berlalu cepat sungguh.	Die Zeit vergeht wie im Flug.	\N	1	19	2026-05-31 02:38:08	2026-05-31 02:38:08
019e7be5-57f4-71bd-94a9-0955fde8fc4e	019e7ba0-90ec-7340-b7e8-a9d7188ce518	Jumpa lagi pada masa akan datang.	Bis zum nächsten Mal!	\N	1	20	2026-05-31 02:38:08	2026-05-31 02:38:08
019e7cf3-638e-73cf-bd65-d882118a0864	019e7cda-8953-7306-b15b-1df831470d8a	Awak ada masa tak hari ni?	Are you free today?	\N	1	1	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cf3-6390-7027-b3e8-39fa29e94469	019e7cda-8953-7306-b15b-1df831470d8a	Saya ada masa sekarang.	I am free now.	\N	1	2	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cf3-6391-70c6-8f43-d30ded1d8fed	019e7cda-8953-7306-b15b-1df831470d8a	Saya sibuk sikit.	I am a bit busy.	\N	1	3	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cf3-6392-7147-9945-531411da9378	019e7cda-8953-7306-b15b-1df831470d8a	Jom kita jumpa.	Let's meet up.	\N	1	4	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cf3-6393-72d3-ad8b-f843b5ff362d	019e7cda-8953-7306-b15b-1df831470d8a	Kat mana kita patut jumpa?	Where should we meet?	\N	1	5	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cfc-dc4c-7152-9cad-6a32ea60ccc4	019e7cda-8953-7306-b15b-1df831470d8a	Mana-mana pun okay.	Anywhere is fine.	\N	1	6	2026-05-31 07:43:26	2026-05-31 07:43:26
019e7cfc-dc4f-7268-a74d-d13035b3a8f4	019e7cda-8953-7306-b15b-1df831470d8a	Saya dah lambat ni.	I am running late.	\N	1	7	2026-05-31 07:43:26	2026-05-31 07:43:26
019e7cfc-dc51-7399-8a9a-c1b12c4dd99f	019e7cda-8953-7306-b15b-1df831470d8a	Maaf sebab lambat	Sorry for the delay.	\N	1	8	2026-05-31 07:43:26	2026-05-31 07:43:26
019e7cfc-dc52-713c-999d-8adef98f39e5	019e7cda-8953-7306-b15b-1df831470d8a	Terima kasih sebab sudi tunggu.	Thanks for waiting.	\N	1	9	2026-05-31 07:43:26	2026-05-31 07:43:26
019e7cfe-3096-72c3-9b4a-7808d24e38d9	019e7cda-8953-7306-b15b-1df831470d8a	Semuanya nampak okay	Everything looks good.	\N	1	11	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cfe-3098-7271-ad52-bc450f20e491	019e7cda-8953-7306-b15b-1df831470d8a	Ada sesuatu yang tak kena ni.	Something is wrong.	\N	1	12	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cfe-3099-7339-9422-d500fc10dbbb	019e7cda-8953-7306-b15b-1df831470d8a	Biar saya check dulu.	Let me check first.	\N	1	13	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cfe-309a-702e-ba08-588ec86af5ac	019e7cda-8953-7306-b15b-1df831470d8a	Saya akan buat benda tu nanti.	I will do it later.	\N	1	14	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cfe-309b-7041-9d4b-7f7766960244	019e7cda-8953-7306-b15b-1df831470d8a	Jangan lupa tau.	Don't forget.	\N	1	15	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cff-aa1e-7077-8b0c-8e2f1986c4f4	019e7cda-8953-7306-b15b-1df831470d8a	Saya akan ingat.	I will remember.	\N	1	16	2026-05-31 07:46:30	2026-05-31 07:46:30
019e7cff-aa20-7110-b879-de04a31add4b	019e7cda-8953-7306-b15b-1df831470d8a	Ini awak punya ke?	Is this yours?	\N	1	17	2026-05-31 07:46:30	2026-05-31 07:46:30
019e7cff-aa21-7325-b916-61e98f30d470	019e7cda-8953-7306-b15b-1df831470d8a	Bukan saya punya.	It is not mine.	\N	1	18	2026-05-31 07:46:30	2026-05-31 07:46:30
019e7cff-aa22-72ef-98d9-4e07b392b8b6	019e7cda-8953-7306-b15b-1df831470d8a	Awak bergurau eh?	Are you kidding?	\N	1	19	2026-05-31 07:46:30	2026-05-31 07:46:30
019e7cff-aa23-72c9-a034-dd6895ae1436	019e7cda-8953-7306-b15b-1df831470d8a	Saya serius ni.	I am serious.	\N	1	20	2026-05-31 07:46:30	2026-05-31 07:46:30
019e7d02-562c-7292-8a19-c8a21d990f6d	019e7ce1-ef8c-71aa-9535-c73a17837d74	Awak ada masa tak hari ni?	Hast du heute Zeit?	\N	1	1	2026-05-31 07:49:25	2026-05-31 07:49:25
019e7d02-562e-7217-9c63-e0d22e629c47	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya ada masa sekarang.	Ich habe gerade Zeit.	\N	1	2	2026-05-31 07:49:25	2026-05-31 07:49:25
019e7d02-5630-7036-ad58-2184dd8d8872	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya sibuk sikit.	Ich bin ein bisschen beschäftigt.	\N	1	3	2026-05-31 07:49:25	2026-05-31 07:49:25
019e7d02-5631-73ac-911c-76c478770d56	019e7ce1-ef8c-71aa-9535-c73a17837d74	Jom kita jumpa.	Lass uns treffen.	\N	1	4	2026-05-31 07:49:25	2026-05-31 07:49:25
019e7d02-5632-7349-86c5-64224125a6fd	019e7ce1-ef8c-71aa-9535-c73a17837d74	Kat mana kita patut jumpa?	Wo wollen wir uns treffen?	\N	1	5	2026-05-31 07:49:25	2026-05-31 07:49:25
019e7d03-f546-73c7-9686-0aca317b82d9	019e7ce1-ef8c-71aa-9535-c73a17837d74	Mana-mana pun okay.	Egal wo.	\N	1	6	2026-05-31 07:51:11	2026-05-31 07:51:11
019e7d03-f548-715a-ae83-567d1a4ede88	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya dah lambat ni.	Ich bin spät dran.	\N	1	7	2026-05-31 07:51:11	2026-05-31 07:51:11
019e7d03-f549-72a4-b497-309be65ab881	019e7ce1-ef8c-71aa-9535-c73a17837d74	Maaf sebab lambat	Sorry für die Verspätung.	\N	1	8	2026-05-31 07:51:11	2026-05-31 07:51:11
019e7d03-f54b-737b-a30a-9b04d9b5a3d8	019e7ce1-ef8c-71aa-9535-c73a17837d74	Terima kasih sebab sudi tunggu.	Danke fürs Warten.	\N	1	9	2026-05-31 07:51:11	2026-05-31 07:51:11
019e7d05-14ce-7218-8def-8cb670bba175	019e7ce1-ef8c-71aa-9535-c73a17837d74	Semuanya nampak okay	Sieht alles gut aus.	\N	1	11	2026-05-31 07:52:25	2026-05-31 07:52:25
019e7d05-14d0-710c-bc90-48b1fd352b8a	019e7ce1-ef8c-71aa-9535-c73a17837d74	Ada sesuatu yang tak kena ni.	Irgendwas stimmt hier nicht.	\N	1	12	2026-05-31 07:52:25	2026-05-31 07:52:25
019e7d05-14d1-701c-bd70-01211199cf4d	019e7ce1-ef8c-71aa-9535-c73a17837d74	Biar saya check dulu.	Lass mich erst mal nachgucken.	\N	1	13	2026-05-31 07:52:25	2026-05-31 07:52:25
019e7d05-14d2-7094-94e6-daae023146b7	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya akan buat benda tu nanti.	Ich mach das später.	\N	1	14	2026-05-31 07:52:25	2026-05-31 07:52:25
019e7d05-14d3-7106-805b-45eb20561733	019e7ce1-ef8c-71aa-9535-c73a17837d74	Jangan lupa tau.	Vergiss es nicht!	\N	1	15	2026-05-31 07:52:25	2026-05-31 07:52:25
019e7d03-f54c-7355-a0f4-059633cba447	019e7ce1-ef8c-71aa-9535-c73a17837d74	Boleh awak tolong semak benda ni?	Kannst du das mal checken?	\N	1	10	2026-05-31 07:51:11	2026-05-31 10:17:09
019e7d06-2f43-70fb-a2c9-3fa6f1339975	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya akan ingat.	Ich werd' dran denken.	\N	1	16	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f45-71d5-b91b-aa415cf51731	019e7ce1-ef8c-71aa-9535-c73a17837d74	Ini awak punya ke?	Ist das deins?	\N	1	17	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f46-7184-813e-37cdd8833a5f	019e7ce1-ef8c-71aa-9535-c73a17837d74	Bukan saya punya.	Das ist nicht meins.	\N	1	18	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f48-70b1-8847-bf07e296b69d	019e7ce1-ef8c-71aa-9535-c73a17837d74	Awak bergurau eh?	Machst du Witze?	\N	1	19	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f49-7203-a4e8-a4b9e8c51bd0	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya serius ni.	Ich meine es ernst.	\N	1	20	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d0a-dcea-71d9-9b64-2f60bd0440af	019e7cda-a2e1-7354-a433-5f119e57ba21	Apa rancangannya?	What is the plan?	\N	1	1	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0a-dcec-724f-a649-e8fe3a8020c4	019e7cda-a2e1-7354-a433-5f119e57ba21	Jom kita mula.	Let's get started.	\N	1	2	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0a-dced-73f8-81a0-c5a198492b9e	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya dah nak hampir siap ni.	I am almost done.	\N	1	3	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0a-dcee-7319-ba75-bf757315aad3	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya perlukan bantuan sikit.	I need some help.	\N	1	4	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0a-dcef-705e-a006-7b9ac6aaa98b	019e7cda-a2e1-7354-a433-5f119e57ba21	Boleh awak tunjukkan pada saya?	Can you show me?	\N	1	5	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0c-c21c-735b-bc5d-bca4915a7a19	019e7cda-a2e1-7354-a433-5f119e57ba21	Macam ni ke?	Like this?	\N	1	6	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c21f-7249-8732-bbf032f79ced	019e7cda-a2e1-7354-a433-5f119e57ba21	Ya, tepat sekali.	Yes, exactly.	\N	1	7	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c220-71d0-9af5-1a0b6c2f3b78	019e7cda-a2e1-7354-a433-5f119e57ba21	Bukan macam tu.	Not like that.	\N	1	8	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c221-71eb-a6e8-dbdbb00f0c95	019e7cda-a2e1-7354-a433-5f119e57ba21	Cuba lagi sekali.	Try again.	\N	1	9	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c223-73a3-938a-7118a22af771	019e7cda-a2e1-7354-a433-5f119e57ba21	Cubalah dulu.	Give it a try.	\N	1	10	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0d-f92c-7375-ad64-0b3865261bf0	019e7cda-a2e1-7354-a433-5f119e57ba21	Benda ni sangat mudah.	It is very easy.	\N	1	11	2026-05-31 08:02:08	2026-05-31 08:02:08
019e7d0d-f92e-71c8-9e87-8e418d7cb4ba	019e7cda-a2e1-7354-a433-5f119e57ba21	Benda ni terlalu susah.	It is too difficult.	\N	1	12	2026-05-31 08:02:08	2026-05-31 08:02:08
019e7d0d-f92f-7309-8236-0a7127aa1647	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya akan cuba yang terbaik.	I will try my best.	\N	1	13	2026-05-31 08:02:08	2026-05-31 08:02:08
019e7d0d-f930-705b-bda4-3c92a93ba23a	019e7cda-a2e1-7354-a433-5f119e57ba21	Kerja yang bagus!	Good job!	\N	1	14	2026-05-31 08:02:08	2026-05-31 08:02:08
019e7d0d-f932-72b6-893a-352c7b362025	019e7cda-a2e1-7354-a433-5f119e57ba21	Teruskan usaha.	Keep it up.	\N	1	15	2026-05-31 08:02:08	2026-05-31 08:02:08
019e7d0f-16f7-7084-8eb2-92c61e38ee88	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya penat sangat hari ni.	I am so tired today.	\N	1	16	2026-05-31 08:03:21	2026-05-31 08:03:21
019e7d0f-16f9-72ac-99b2-9b839db9a47b	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya nak balik rumah sekarang ni.	I am going home now.	\N	1	17	2026-05-31 08:03:21	2026-05-31 08:03:21
019e7d0f-16fb-710a-9a94-eb173a98f340	019e7cda-a2e1-7354-a433-5f119e57ba21	Mesej saya bila awak dah sampai nanti.	Text me when you arrive.	\N	1	18	2026-05-31 08:03:21	2026-05-31 08:03:21
019e7d0f-16fc-708a-9d47-03c3e2c6185f	019e7cda-a2e1-7354-a433-5f119e57ba21	Semoga penerbangan awak selamat.	Have a safe flight.	\N	1	19	2026-05-31 08:03:21	2026-05-31 08:03:21
019e7d0f-16fd-71ec-8e8f-ef64d344aca7	019e7cda-a2e1-7354-a433-5f119e57ba21	Selamat kembali.	Welcome back.	\N	1	20	2026-05-31 08:03:21	2026-05-31 08:03:21
019e7d15-0832-7306-87bd-a3603817da46	019e7ce2-0839-7023-92f7-dd91960265e2	Apa rancangannya?	Was ist der Plan?	\N	1	1	2026-05-31 08:09:50	2026-05-31 08:09:50
019e7d15-0834-7251-ad4f-eb4ca40f7f70	019e7ce2-0839-7023-92f7-dd91960265e2	Jom kita mula.	Lass uns anfangen!	\N	1	2	2026-05-31 08:09:50	2026-05-31 08:09:50
019e7d15-0836-721c-a397-baf2f0fa91ae	019e7ce2-0839-7023-92f7-dd91960265e2	Saya dah nak hampir siap ni.	Ich bin fast fertig.	\N	1	3	2026-05-31 08:09:50	2026-05-31 08:09:50
019e7d15-0837-705f-bf10-1f27b5a13d0f	019e7ce2-0839-7023-92f7-dd91960265e2	Saya perlukan bantuan sikit.	Ich brauche mal Hilfe.	\N	1	4	2026-05-31 08:09:50	2026-05-31 08:09:50
019e7d15-0838-7305-b8aa-9ae793fed42b	019e7ce2-0839-7023-92f7-dd91960265e2	Boleh awak tunjukkan pada saya?	Kannst du mir das zeigen?	\N	1	5	2026-05-31 08:09:50	2026-05-31 08:09:50
019e7d16-3562-7346-a4c9-4da95a2a54af	019e7ce2-0839-7023-92f7-dd91960265e2	Macam ni ke?	So wie hier?	\N	1	6	2026-05-31 08:11:08	2026-05-31 08:11:08
019e7d16-3564-71f2-8488-42324c28ae74	019e7ce2-0839-7023-92f7-dd91960265e2	Ya, tepat sekali.	Ja, genau.	\N	1	7	2026-05-31 08:11:08	2026-05-31 08:11:08
019e7d16-3565-7140-8fdf-f1cfcb520caa	019e7ce2-0839-7023-92f7-dd91960265e2	Bukan macam tu.	Nicht so.	\N	1	8	2026-05-31 08:11:08	2026-05-31 08:11:08
019e7d16-3566-70db-9cac-e44b1421d28f	019e7ce2-0839-7023-92f7-dd91960265e2	Cuba lagi sekali.	Versuch's nochmal.	\N	1	9	2026-05-31 08:11:08	2026-05-31 08:11:08
019e7d16-3567-737a-b9ff-7689ab209c6f	019e7ce2-0839-7023-92f7-dd91960265e2	Cubalah dulu.	Probier's mal aus.	\N	1	10	2026-05-31 08:11:08	2026-05-31 08:11:08
019e7d1a-4b6e-7119-88fd-277bd7ddeb1d	019e7ce2-0839-7023-92f7-dd91960265e2	Benda ni sangat mudah.	Das ist voll einfach.	\N	1	11	2026-05-31 08:15:35	2026-05-31 08:15:35
019e7d1a-4b70-7117-9db8-6d986a97e799	019e7ce2-0839-7023-92f7-dd91960265e2	Benda ni terlalu susah.	Das ist zu schwer.	\N	1	12	2026-05-31 08:15:35	2026-05-31 08:15:35
019e7d1a-4b72-72d0-abeb-5560e21ca592	019e7ce2-0839-7023-92f7-dd91960265e2	Saya akan cuba yang terbaik.	Ich gebe mein Bestes.	\N	1	13	2026-05-31 08:15:35	2026-05-31 08:15:35
019e7d1a-4b73-7078-b471-842ed6a62767	019e7ce2-0839-7023-92f7-dd91960265e2	Kerja yang bagus!	Gute Arbeit!	\N	1	14	2026-05-31 08:15:35	2026-05-31 08:15:35
019e7d1a-4b74-73f5-9deb-9793bb01423b	019e7ce2-0839-7023-92f7-dd91960265e2	Teruskan usaha.	Mach weiter so!	\N	1	15	2026-05-31 08:15:35	2026-05-31 08:15:35
019e7d1b-867b-716d-8bb0-a004a03bd9a2	019e7ce2-0839-7023-92f7-dd91960265e2	Saya penat sangat hari ni.	Ich bin heute so ko.	\N	1	16	2026-05-31 08:16:56	2026-05-31 08:16:56
019e7d1b-867d-71f9-880d-3b9146bd501e	019e7ce2-0839-7023-92f7-dd91960265e2	Saya nak balik rumah sekarang ni.	Ich gehe jetzt nach Hause.	\N	1	17	2026-05-31 08:16:56	2026-05-31 08:16:56
019e7d1b-867f-7193-8320-a472c8238415	019e7ce2-0839-7023-92f7-dd91960265e2	Mesej saya bila awak dah sampai nanti.	Schreib mir, wenn du da bist.	\N	1	18	2026-05-31 08:16:56	2026-05-31 08:16:56
019e7d1b-8680-7088-a622-c62ae7f0d52e	019e7ce2-0839-7023-92f7-dd91960265e2	Semoga penerbangan awak selamat.	Guten Flug!	\N	1	19	2026-05-31 08:16:56	2026-05-31 08:16:56
019e7d1b-8681-71f8-9825-4b0df2be9b73	019e7ce2-0839-7023-92f7-dd91960265e2	Selamat kembali.	Willkommen zurück!	\N	1	20	2026-05-31 08:16:56	2026-05-31 08:16:56
019e7d1d-340c-72af-a4be-7962e2bf5537	019e7cda-bf7e-7056-8a29-ecdabcebee69	Awak nak apa?	What do you want?	\N	1	1	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1d-340f-73b3-8498-f98cba3ac012	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya nak yang ini.	I want this one.	\N	1	2	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1d-3410-73f3-ab88-d5cc98e8bc2a	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya tak nak benda tu.	I don't want it.	\N	1	3	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1d-3411-72d2-9657-1a68321cf580	019e7cda-bf7e-7056-8a29-ecdabcebee69	Awak lebih suka yang mana satu?	Which one do you prefer?	\N	1	4	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1d-3413-73e0-98c2-2ed578a41e97	019e7cda-bf7e-7056-8a29-ecdabcebee69	Mana-mana satu pun okay.	Either one is fine.	\N	1	5	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1f-ec06-72de-8298-e182e4db8d0e	019e7cda-bf7e-7056-8a29-ecdabcebee69	Sama je rasanya.	It makes no difference.	\N	1	6	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d1f-ec08-711c-9aca-4e4630fe6d9a	019e7cda-bf7e-7056-8a29-ecdabcebee69	Awak rasa sihat ke?	Are you feeling okay?	\N	1	7	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d1f-ec0a-70c2-8742-487288f4a1c1	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya rasa jauh lebih baik.	I feel much better.	\N	1	8	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d1f-ec0b-72c4-b96c-0676fa78d9e8	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tak perlu tergesa-gesa.	Take your time.	\N	1	9	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d1f-ec0c-7072-b101-058c3f2dd9e5	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tak ada apa yang nak dikejarkan.	There is no rush.	\N	1	10	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d24-094a-73d9-a175-a7a998323d39	019e7cda-bf7e-7056-8a29-ecdabcebee69	Boleh tolong bukakan pintu?	Can you open the door?	\N	1	11	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-094c-7087-8332-d3065ee44778	019e7cda-bf7e-7056-8a29-ecdabcebee69	Boleh tolong tutupkan tingkap?	Can you close the window?	\N	1	12	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-094d-710e-8bd2-5b1d2c084173	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tolong pasang lampu.	Turn on the light, please.	\N	1	13	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-094f-7376-b125-a7810c3dfb2f	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tolong tutup kipas.	Turn off the fan, please.	\N	1	14	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-0950-706a-9d12-8e0b8955bd86	019e7cda-bf7e-7056-8a29-ecdabcebee69	Panas betul hari ni.	It is very hot today.	\N	1	15	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d25-9127-7025-9d38-f45f4ed1d8e9	019e7cda-bf7e-7056-8a29-ecdabcebee69	Macam nak hujan dah ni.	It looks like rain.	\N	1	16	2026-05-31 08:27:54	2026-05-31 08:27:54
019e7d25-9129-703c-a0ba-cf9aa2072e79	019e7cda-bf7e-7056-8a29-ecdabcebee69	Jangan sampai basah.	Don't get wet.	\N	1	17	2026-05-31 08:27:54	2026-05-31 08:27:54
019e7d25-912a-71f8-a284-f8cd70e956e0	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya duduk kat rumah je.	I am staying at home.	\N	1	18	2026-05-31 08:27:54	2026-05-31 08:27:54
019e7d25-912c-7215-b8dd-cf4e6271cf2e	019e7cda-bf7e-7056-8a29-ecdabcebee69	Hubungi saya bila awak free nanti.	Call me when you are free.	\N	1	19	2026-05-31 08:27:54	2026-05-31 08:27:54
019e7d25-912d-72ff-b55c-f09bb7568670	019e7cda-bf7e-7056-8a29-ecdabcebee69	Nanti kita borak lagi.	Talk to you later.	\N	1	20	2026-05-31 08:27:54	2026-05-31 08:27:54
019e7d66-faf4-73b9-a048-77cba1b0adb3	019e7ce2-2335-71b3-b1e5-e952362ffcef	Awak nak apa?	Was willst du?	\N	1	1	2026-05-31 09:39:21	2026-05-31 09:39:21
019e7d66-faf6-725f-849b-2a87f1e60185	019e7ce2-2335-71b3-b1e5-e952362ffcef	Saya nak yang ini.	Ich will das hier.	\N	1	2	2026-05-31 09:39:21	2026-05-31 09:39:21
019e7d66-faf7-71fe-81b5-3c75ca031243	019e7ce2-2335-71b3-b1e5-e952362ffcef	Saya tak nak benda tu.	Ich will das nicht.	\N	1	3	2026-05-31 09:39:21	2026-05-31 09:39:21
019e7d66-faf8-71a7-93a3-55cb413974ec	019e7ce2-2335-71b3-b1e5-e952362ffcef	Awak lebih suka yang mana satu?	Welches magst du lieber?	\N	1	4	2026-05-31 09:39:21	2026-05-31 09:39:21
019e7d66-faf9-7071-99e4-94f35430a4a8	019e7ce2-2335-71b3-b1e5-e952362ffcef	Mana-mana satu pun okay.	Egal welches.	\N	1	5	2026-05-31 09:39:21	2026-05-31 09:39:21
019e7d69-1938-72ba-a2d0-69e4823c1ea3	019e7ce2-2335-71b3-b1e5-e952362ffcef	Sama je rasanya.	Macht keinen Unterschied.	\N	1	6	2026-05-31 09:41:40	2026-05-31 09:41:40
019e7d69-193a-716c-931f-93d7757b175e	019e7ce2-2335-71b3-b1e5-e952362ffcef	Awak rasa sihat ke?	Alles okay bei dir?	\N	1	7	2026-05-31 09:41:40	2026-05-31 09:41:40
019e7d69-193c-71f4-a11b-95b022e9c35b	019e7ce2-2335-71b3-b1e5-e952362ffcef	Saya rasa jauh lebih baik.	Mir geht's viel besser.	\N	1	8	2026-05-31 09:41:40	2026-05-31 09:41:40
019e7d69-193d-713e-8e5d-af6ac90142ed	019e7ce2-2335-71b3-b1e5-e952362ffcef	Tak perlu tergesa-gesa.	Lass dir Zeit.	\N	1	9	2026-05-31 09:41:40	2026-05-31 09:41:40
019e7d69-193e-725b-b2f6-2c250a51cf75	019e7ce2-2335-71b3-b1e5-e952362ffcef	Tak ada apa yang nak dikejarkan.	Keine Eile.	\N	1	10	2026-05-31 09:41:40	2026-05-31 09:41:40
019e7d6a-29d8-719f-aa67-c1272c78c3c6	019e7ce2-2335-71b3-b1e5-e952362ffcef	Boleh tolong bukakan pintu?	Kannst du mal die Tür aufmachen?	\N	1	11	2026-05-31 09:42:50	2026-05-31 09:42:50
019e7d6a-29da-72f1-bbe0-f5105c2fa86c	019e7ce2-2335-71b3-b1e5-e952362ffcef	Boleh tolong tutupkan tingkap?	Kannst du mal das Fenster zumachen?	\N	1	12	2026-05-31 09:42:50	2026-05-31 09:42:50
019e7d6a-29db-7279-8251-9addfcf6fe79	019e7ce2-2335-71b3-b1e5-e952362ffcef	Tolong pasang lampu.	Mach bitte das Licht an.	\N	1	13	2026-05-31 09:42:50	2026-05-31 09:42:50
019e7d6a-29dc-71ae-aaea-7f9f6d5524cf	019e7ce2-2335-71b3-b1e5-e952362ffcef	Tolong tutup kipas.	Mach bitte den Ventilator aus.	\N	1	14	2026-05-31 09:42:50	2026-05-31 09:42:50
019e7d6a-29dd-7355-be8d-46e797d167f1	019e7ce2-2335-71b3-b1e5-e952362ffcef	Panas betul hari ni.	Es ist voll heiß heute.	\N	1	15	2026-05-31 09:42:50	2026-05-31 09:42:50
019e7d6b-5b78-7359-985e-743d6c33e89a	019e7ce2-2335-71b3-b1e5-e952362ffcef	Macam nak hujan dah ni.	Es sieht nach Regen aus.	\N	1	16	2026-05-31 09:44:08	2026-05-31 09:44:08
019e7d6b-5b7a-728c-bdb9-e99e362b3f20	019e7ce2-2335-71b3-b1e5-e952362ffcef	Jangan sampai basah.	Werd nicht nass!	\N	1	17	2026-05-31 09:44:08	2026-05-31 09:44:08
019e7d6b-5b7b-728e-8490-e63606c0e5db	019e7ce2-2335-71b3-b1e5-e952362ffcef	Saya duduk kat rumah je.	Ich bleibe zu Hause.	\N	1	18	2026-05-31 09:44:08	2026-05-31 09:44:08
019e7d6b-5b7c-728a-a0df-8732046101ea	019e7ce2-2335-71b3-b1e5-e952362ffcef	Hubungi saya bila awak free nanti.	Ruf mich an, wenn du Zeit hast.	\N	1	19	2026-05-31 09:44:08	2026-05-31 09:44:08
019e7d6b-5b7e-73f2-8732-1c2406d8059b	019e7ce2-2335-71b3-b1e5-e952362ffcef	Nanti kita borak lagi.	Wir sprechen uns später.	\N	1	20	2026-05-31 09:44:08	2026-05-31 09:44:08
019e7d6f-e212-71c1-91b6-c992272eb1e4	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Apa benda tu?	What is that?	\N	1	1	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d6f-e215-7086-ad6b-6d919edf5056	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Apa nama benda ni?	What is this called?	\N	1	2	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d6f-e218-702c-9263-34fe8234a165	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saya dah ingat balik sekarang.	I remember now.	\N	1	3	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d6f-e219-7287-8c30-d6267b0f235d	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saya betul-betul tak ingat langsung.	I completely forgot.	\N	1	4	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d6f-e21a-7017-bc62-197f7d10d292	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Betul ke ni?	Is it correct?	\N	1	5	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d71-04c6-7274-afcb-4753b7a9c7fb	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Itu betul.	That is correct.	\N	1	6	2026-05-31 09:50:19	2026-05-31 09:50:19
019e7d71-04c9-73f6-a23e-7d7046d5faba	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Itu salah.	That is wrong.	\N	1	7	2026-05-31 09:50:19	2026-05-31 09:50:19
019e7d71-04cb-7102-8b93-42ee0ed9480b	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Tak ada masalah, saya boleh buat.	No problem, I can do it.	\N	1	9	2026-05-31 09:50:19	2026-05-31 09:50:19
019e7d71-04cd-72c0-9b6b-11346bb2d508	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Boleh tolong semak sekali lagi?	Can you double-check?	\N	1	10	2026-05-31 09:50:19	2026-05-31 09:50:19
019e7d72-ba9a-70ec-bf23-727cc4f9c3d1	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saya pasti tentang perkara ni.	I am sure about this.	\N	1	11	2026-05-31 09:52:11	2026-05-31 09:52:11
019e7d72-ba9c-729c-af43-846672abe72c	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saja nak pastikan betul-betul.	Just to be sure.	\N	1	12	2026-05-31 09:52:11	2026-05-31 09:52:11
019e7d72-ba9d-7320-a0cf-e6f2db098c61	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Lega rasanya!	What a relief!	\N	1	13	2026-05-31 09:52:11	2026-05-31 09:52:11
019e7d72-ba9e-710e-b0df-05ed8419446f	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Lega mendengarnya.	That's a relief.	\N	1	14	2026-05-31 09:52:11	2026-05-31 09:52:11
019e7d72-ba9f-72a3-945e-098f5397b237	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Simpan elok-elok.	Keep it safe.	\N	1	15	2026-05-31 09:52:11	2026-05-31 09:52:11
019e7d73-cd5d-7097-aed1-4c68cd9740d0	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Kat mana saya patut letak benda ni?	Where should I put this?	\N	1	16	2026-05-31 09:53:21	2026-05-31 09:53:21
019e7d73-cd5f-71c7-9630-447f2cb214a4	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Letak kat sini.	Put it here.	\N	1	17	2026-05-31 09:53:21	2026-05-31 09:53:21
019e7d73-cd61-72c9-b82e-c3047930ec8f	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Biarkan je kat situ.	Leave it there.	\N	1	18	2026-05-31 09:53:21	2026-05-31 09:53:21
019e7d73-cd62-73a9-bb89-cf6f052e4dfd	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Jangan sentuh benda tu.	Don't touch it.	\N	1	19	2026-05-31 09:53:21	2026-05-31 09:53:21
019e7d73-cd63-73f0-a351-513d789b0297	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Terima kasih atas bantuan awak.	Thanks for your help.	\N	1	20	2026-05-31 09:53:21	2026-05-31 09:53:21
019e7d76-cc5b-72ad-97a8-3f6c6c95f419	019e7ce2-3737-72c6-bf3f-365b2693356d	Apa benda tu?	Was ist das?	\N	1	1	2026-05-31 09:56:38	2026-05-31 09:56:38
019e7d76-cc5d-7152-90a6-9cb1f9d78e6f	019e7ce2-3737-72c6-bf3f-365b2693356d	Apa nama benda ni?	Wie heißt das?	\N	1	2	2026-05-31 09:56:38	2026-05-31 09:56:38
019e7d76-cc5f-735f-b15e-5507168965f9	019e7ce2-3737-72c6-bf3f-365b2693356d	Saya dah ingat balik sekarang.	Jetzt fällt's mir wieder ein.	\N	1	3	2026-05-31 09:56:38	2026-05-31 09:56:38
019e7d76-cc60-7299-aa82-b9e4cf749335	019e7ce2-3737-72c6-bf3f-365b2693356d	Saya betul-betul tak ingat langsung.	Ich habe es komplett vergessen.	\N	1	4	2026-05-31 09:56:38	2026-05-31 09:56:38
019e7d76-cc61-73e8-802a-bcd6ea74552f	019e7ce2-3737-72c6-bf3f-365b2693356d	Betul ke ni?	Stimmt das?	\N	1	5	2026-05-31 09:56:38	2026-05-31 09:56:38
019e7d78-32c2-7299-810e-a0caed6677ca	019e7ce2-3737-72c6-bf3f-365b2693356d	Itu betul.	Das stimmt.	\N	1	6	2026-05-31 09:58:09	2026-05-31 09:58:09
019e7d78-32c4-71ca-ae5b-15a919899c65	019e7ce2-3737-72c6-bf3f-365b2693356d	Itu salah.	Das ist falsch.	\N	1	7	2026-05-31 09:58:09	2026-05-31 09:58:09
019e7d78-32c7-700e-bbd2-2812ebfa0070	019e7ce2-3737-72c6-bf3f-365b2693356d	Tak ada masalah, saya boleh buat.	Kein Problem, ich mach das.	\N	1	9	2026-05-31 09:58:09	2026-05-31 09:58:09
019e7d78-32c8-7270-b07c-c11f2bcd8e57	019e7ce2-3737-72c6-bf3f-365b2693356d	Boleh tolong semak sekali lagi?	Kannst du das nochmal checken?	\N	1	10	2026-05-31 09:58:09	2026-05-31 09:58:09
019e7d7a-0c94-73d1-bc8f-237d5314ab8a	019e7ce2-3737-72c6-bf3f-365b2693356d	Saya pasti tentang perkara ni.	Ich bin mir da sicher.	\N	1	11	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d7a-0c96-739a-b5b2-c6231aadde6c	019e7ce2-3737-72c6-bf3f-365b2693356d	Saja nak pastikan betul-betul.	Nur um sicherzugehen.	\N	1	12	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d7a-0c97-737c-b80c-c1beb996da3b	019e7ce2-3737-72c6-bf3f-365b2693356d	Lega rasanya!	Was für eine Erleichterung!	\N	1	13	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d78-32c6-7384-9fe9-e0058a7ff9f4	019e7ce2-3737-72c6-bf3f-365b2693356d	Jom kita betulkan benda ni.	Lass uns das hinkriegen.	\N	1	8	2026-05-31 09:58:09	2026-05-31 10:14:31
019e7d7a-0c98-73d7-a1b1-494dd2afeff3	019e7ce2-3737-72c6-bf3f-365b2693356d	Lega mendengarnya.	Das ist beruhigend.	\N	1	14	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d7a-0c9a-739d-af42-f9a49204764b	019e7ce2-3737-72c6-bf3f-365b2693356d	Simpan elok-elok	Bewahr's gut auf.	\N	1	15	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d7b-af43-722f-a626-af90b6096d76	019e7ce2-3737-72c6-bf3f-365b2693356d	Kat mana saya patut letak benda ni?	Wo soll ich das hinlegen?	\N	1	16	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af45-73f2-9251-32319d90148c	019e7ce2-3737-72c6-bf3f-365b2693356d	Letak kat sini.	Leg es hierhin.	\N	1	17	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af47-716e-9209-a9209dffb640	019e7ce2-3737-72c6-bf3f-365b2693356d	Biarkan je kat situ.	Lass es einfach da liegen.	\N	1	18	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af48-72b7-8dd5-eb1a2254d9b6	019e7ce2-3737-72c6-bf3f-365b2693356d	Jangan sentuh benda tu.	Fass es nicht an!	\N	1	19	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af49-734b-80a5-a474b87ee7e6	019e7ce2-3737-72c6-bf3f-365b2693356d	Terima kasih atas bantuan awak.	Danke für deine Hilfe.	\N	1	20	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7f-1a5b-72dd-a55a-a7da49735008	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Apa perkembangan terbaru?	What's the update?	\N	1	1	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d7f-1a5d-70fb-99c2-412018590694	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Belum ada apa-apa lagi buat masa ni.	Nothing yet.	\N	1	2	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d7f-1a5f-71a2-afe4-a2ede47d3bd2	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Biar saya fikirkan dulu pasal benda tu.	Let me think about it.	\N	1	3	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d7f-1a60-7229-8e3e-26ddaf7c8b62	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya dah buat keputusan.	I have decided.	\N	1	4	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d7f-1a61-700d-955d-9b59adcf99ed	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Berbaloi untuk dicuba.	It is worth a try.	\N	1	5	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d81-0adc-70c7-a86a-2354c89ca66e	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Awak nampak segak/cantik hari ni.	You look great today.	\N	1	6	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d81-0ade-7047-a7c9-f841b6529cc4	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Terima kasih atas pujian tu.	Thanks for the compliment.	\N	1	7	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d81-0ae0-71df-bf32-7e4a847bcd11	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Boleh tak kita borak kejap lagi?	Can we talk later?	\N	1	8	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d81-0ae1-7232-966b-812946915551	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya tengah ada mesyuarat ni.	I am in a meeting.	\N	1	9	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d81-0ae2-70d8-a912-fd2707c662dd	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Nanti saya telefon awak balik.	I will call you back.	\N	1	10	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d84-1a74-706f-9e70-b79d2e6eb897	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Awak dah nak sampai ke?	Are you almost here?	\N	1	11	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d84-1a76-718b-b622-097175e27e2d	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya tengah parking kereta ni.	I'm parking my car.	\N	1	12	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d84-1a77-72b3-a72b-093342862167	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Jumpa kat dalam nanti.	See you inside.	\N	1	13	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d84-1a79-701f-8545-966ac7495649	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Benda ni dah yang paling terbaru.	It is up to date.	\N	1	14	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d84-1a7a-7279-8dd0-bee1f0165b53	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Boleh tolong hantarkan pautan/link pada saya?	Can you send me the link?	\N	1	15	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d85-d663-71be-b3da-78c374aec05d	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya hantarkan benda tu sekarang juga.	I will send it now.	\N	1	16	2026-05-31 10:13:03	2026-05-31 10:13:03
019e7d85-d665-7000-8313-de657b1d6156	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Awak dah dapat ke?	Did you get it?	\N	1	17	2026-05-31 10:13:03	2026-05-31 10:13:03
019e7d85-d666-71dc-a739-84db5a964948	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Ya, saya dah dapat.	Yes, I got it.	\N	1	18	2026-05-31 10:13:03	2026-05-31 10:13:03
019e7d85-d667-7039-ad8f-bc2985d9a237	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Itu sahaja buat masa sekarang.	That's all for now.	\N	1	19	2026-05-31 10:13:03	2026-05-31 10:13:03
019e7d85-d669-71bd-a5a5-5a975288e075	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Selamat bercuti hujung minggu!	Have a great weekend!	\N	1	20	2026-05-31 10:13:03	2026-05-31 10:13:03
019e7d71-04ca-7277-a299-5d3fd644ea66	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Jom kita betulkan benda ni.	Let's fix this.	\N	1	8	2026-05-31 09:50:19	2026-05-31 10:14:06
019e7cfc-dc53-72e7-83f5-b832556d133d	019e7cda-8953-7306-b15b-1df831470d8a	Boleh awak tolong semak benda ni?	Can you check this?	\N	1	10	2026-05-31 07:43:26	2026-05-31 10:16:48
019e7d91-89ab-70de-a46c-aa5b3670ebc5	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Apa perkembangan terbaru?	Was gibt's Neues?	\N	1	1	2026-05-31 10:25:50	2026-05-31 10:25:50
019e7d91-89ad-71d2-b50c-267cb2caf6f6	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Belum ada apa-apa lagi buat masa ni.	Noch nichts.	\N	1	2	2026-05-31 10:25:50	2026-05-31 10:25:50
019e7d91-89ae-7390-9291-e3ac6b2a38f8	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Biar saya fikirkan dulu pasal benda tu.	Ich überleg's mir mal.	\N	1	3	2026-05-31 10:25:50	2026-05-31 10:25:50
019e7d91-89b0-7290-83d7-a8302fdbf69b	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Saya dah buat keputusan.	Ich habe mich entschieden.	\N	1	4	2026-05-31 10:25:50	2026-05-31 10:25:50
019e7d91-89b1-7373-a171-9f6c5d750f2e	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Berbaloi untuk dicuba.	Ein Versuch ist es wert.	\N	1	5	2026-05-31 10:25:50	2026-05-31 10:25:50
019e7d93-7bde-7006-b83c-4c466e972eca	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Awak nampak segak/cantik hari ni.	Du siehst heute super aus.	\N	1	6	2026-05-31 10:27:58	2026-05-31 10:27:58
019e7d93-7be0-71b6-bea6-63943b6aa987	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Terima kasih atas pujian tu.	Danke für das Kompliment.	\N	1	7	2026-05-31 10:27:58	2026-05-31 10:27:58
019e7d93-7be1-715e-ac46-089ccbf219f7	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Boleh tak kita borak kejap lagi?	Können wir später quatschen?	\N	1	8	2026-05-31 10:27:58	2026-05-31 10:27:58
019e7d93-7be2-719b-9171-575599404c78	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Saya tengah ada mesyuarat ni.	Ich bin gerade im Meeting.	\N	1	9	2026-05-31 10:27:58	2026-05-31 10:27:58
019e7d93-7be3-7357-8e52-5cee679328f3	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Nanti saya telefon awak balik.	Ich ruf dich zurück.	\N	1	10	2026-05-31 10:27:58	2026-05-31 10:27:58
019e7d94-7af7-705a-9cf5-6b058147a0db	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Awak dah nak dekat sampai ke?	Bist du fast da?	\N	1	11	2026-05-31 10:29:03	2026-05-31 10:29:03
019e7d94-7af9-714b-8c54-8e5623d87f7b	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Saya tengah parking kereta ni.	Ich parke gerade das Auto.	\N	1	12	2026-05-31 10:29:03	2026-05-31 10:29:03
019e7d94-7afb-72a0-9dcc-ac4756c20268	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Jumpa kat dalam nanti.	Wir sehen uns drinnen.	\N	1	13	2026-05-31 10:29:03	2026-05-31 10:29:03
019e7d94-7afc-72cc-ab72-77caf3b4bb46	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Benda ni dah yang paling terbaru.	Das ist auf dem neuesten Stand.	\N	1	14	2026-05-31 10:29:03	2026-05-31 10:29:03
019e7d94-7afd-7266-9ad9-7323e46fe98d	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Boleh tolong hantarkan pautan/link pada saya?	Kannst du mir den Link schicken?	\N	1	15	2026-05-31 10:29:03	2026-05-31 10:29:03
019e7d95-a437-733d-865e-2ed4c1818e5b	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Saya hantarkan benda tu sekarang juga.	Ich schick's dir sofort.	\N	1	16	2026-05-31 10:30:19	2026-05-31 10:30:19
019e7d95-a439-71b1-ba90-e8188efdc35c	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Awak dah dapat ke?	Ist es angekommen?	\N	1	17	2026-05-31 10:30:19	2026-05-31 10:30:19
019e7d95-a43b-70c6-9bbe-2d5c416e83a1	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Ya, saya dah dapat.	Ja, ist da.	\N	1	18	2026-05-31 10:30:19	2026-05-31 10:30:19
019e7d95-a43c-732d-8e96-2e9fa6152340	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Itu sahaja buat masa sekarang.	Das ist erst mal alles.	\N	1	19	2026-05-31 10:30:19	2026-05-31 10:30:19
019e7d95-a43d-73f5-ae58-b057ebdd9cab	019e7ce2-7c82-7252-971e-b0bf17d42bf5	Selamat bercuti hujung minggu!	Schönes Wochenende!	\N	1	20	2026-05-31 10:30:19	2026-05-31 10:30:19
019e8665-1be5-704f-bdad-dc0c1aedb351	019e865e-e466-71a2-88eb-238ba8dd32ab	Macam mana hari awak hari ni?	How was your day?	\N	1	1	2026-06-02 03:33:53	2026-06-02 03:33:53
019e8665-1be8-7395-8ad4-1a03d95235ec	019e865e-e466-71a2-88eb-238ba8dd32ab	Hari ni hari yang sangat baik	It was a great day.	\N	1	2	2026-06-02 03:33:53	2026-06-02 03:33:53
019e8665-1be9-711f-91e9-730f0590973e	019e865e-e466-71a2-88eb-238ba8dd32ab	Tak ada apa-apa yang istimewa pun.	Nothing special.	\N	1	3	2026-06-02 03:33:53	2026-06-02 03:33:53
019e8665-1bea-7231-9f56-31aa6cf5ed79	019e865e-e466-71a2-88eb-238ba8dd32ab	Saya sangat gembira	I am so glad.	\N	1	4	2026-06-02 03:33:53	2026-06-02 03:33:53
019e8665-1beb-7086-95b8-7d8a37667a6a	019e865e-e466-71a2-88eb-238ba8dd32ab	Awak tengah cari apa tu?	What are you looking for?	\N	1	5	2026-06-02 03:33:53	2026-06-02 03:33:53
019e8666-89ce-70fe-8a91-490726a97112	019e865e-e466-71a2-88eb-238ba8dd32ab	Saya tak jumpa benda tu.	I can't find it.	\N	1	6	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8666-89d0-70c8-9de6-3b2f2993682d	019e865e-e466-71a2-88eb-238ba8dd32ab	Kat mana awak letak benda tu hari tu?	Where did you put it?	\N	1	7	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8666-89d1-72be-978e-62df9bdb8c6a	019e865e-e466-71a2-88eb-238ba8dd32ab	Saya tak sabar menantikannya.	I am looking forward to it.	\N	1	8	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8666-89d3-735e-b4b7-21fe71e8cc43	019e865e-e466-71a2-88eb-238ba8dd32ab	Sertakan saya sekali.	Count me in.	\N	1	9	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8666-89d4-7261-ab07-8f814fd69fc9	019e865e-e466-71a2-88eb-238ba8dd32ab	Jangan kira saya sekali.	Count me out.	\N	1	10	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8669-085d-7084-a950-e467519b5663	019e865e-e466-71a2-88eb-238ba8dd32ab	Benda tu tak boleh dibawa bincang dah.	That's non-negotiable.	\N	1	11	2026-06-02 03:38:10	2026-06-02 03:38:10
019e8669-085f-71f7-8170-3edcf287392c	019e865e-e466-71a2-88eb-238ba8dd32ab	Jom kita buat perjanjian.	Let's make a deal.	\N	1	12	2026-06-02 03:38:10	2026-06-02 03:38:10
019e8669-0861-70fb-9392-be9a8a78db15	019e865e-e466-71a2-88eb-238ba8dd32ab	Dua-dua pihak pun untung	It is a win-win situation.	\N	1	13	2026-06-02 03:38:10	2026-06-02 03:38:10
019e8669-0862-7241-a6c6-6cd3ec904931	019e865e-e466-71a2-88eb-238ba8dd32ab	Boleh saya tanya satu soalan?	Can I ask a question?	\N	1	14	2026-06-02 03:38:10	2026-06-02 03:38:10
019e8669-0863-7153-a7f9-5a6057e82ae6	019e865e-e466-71a2-88eb-238ba8dd32ab	Silakan.	Go ahead.	\N	1	15	2026-06-02 03:38:10	2026-06-02 03:38:10
019e866d-cd28-7363-ac3d-e249bbf5bf22	019e865e-e466-71a2-88eb-238ba8dd32ab	Saja bergurau je.	Just kidding.	\N	1	16	2026-06-02 03:43:23	2026-06-02 03:43:23
019e866d-cd2a-7135-b6e4-195f52e270cb	019e865e-e466-71a2-88eb-238ba8dd32ab	Jangan ambil serius sangat.	Don't take it seriously.	\N	1	17	2026-06-02 03:43:23	2026-06-02 03:43:23
019e866d-cd2b-7377-b9cc-f11396c468d2	019e865e-e466-71a2-88eb-238ba8dd32ab	Semuanya akan okay nanti.	Everything will be fine.	\N	1	18	2026-06-02 03:43:23	2026-06-02 03:43:23
019e866d-cd2c-72fb-9a09-f7110f7e33fd	019e865e-e466-71a2-88eb-238ba8dd32ab	Terima kasih kerana memahami.	Thanks for understanding.	\N	1	19	2026-06-02 03:43:23	2026-06-02 03:43:23
019e8673-26c5-73fb-8b3a-ea975f22ab09	019e8661-9df5-72f2-b377-bc266e7baeac	Macam mana hari awak hari ni?	Wie war dein Tag?	\N	1	1	2026-06-02 03:49:14	2026-06-02 03:49:14
019e8673-26c7-7385-ba79-aa8a6f30e3ce	019e8661-9df5-72f2-b377-bc266e7baeac	Hari ni hari yang sangat baik	Der Tag war echt super.	\N	1	2	2026-06-02 03:49:14	2026-06-02 03:49:14
019e8673-26c8-7246-b1cb-5f0005049a33	019e8661-9df5-72f2-b377-bc266e7baeac	Tak ada apa-apa yang istimewa pun.	Nichts Besonderes.	\N	1	3	2026-06-02 03:49:14	2026-06-02 03:49:14
019e8673-26c9-73bb-9f53-8d2fdeb7d7fb	019e8661-9df5-72f2-b377-bc266e7baeac	Saya sangat gembira	Ich bin so froh.	\N	1	4	2026-06-02 03:49:14	2026-06-02 03:49:14
019e8673-26cb-73b6-b3f7-f9d4860a7280	019e8661-9df5-72f2-b377-bc266e7baeac	Awak tengah cari apa tu?	Was suchst du?	\N	1	5	2026-06-02 03:49:14	2026-06-02 03:49:14
019e8674-6097-70a7-8842-011f9cfdf059	019e8661-9df5-72f2-b377-bc266e7baeac	Saya tak jumpa benda tu.	Ich kann's nicht finden.	\N	1	6	2026-06-02 03:50:34	2026-06-02 03:50:34
019e8674-6099-724e-9d74-8edc0a90be38	019e8661-9df5-72f2-b377-bc266e7baeac	Kat mana awak letak benda tu hari tu?	Wo hast du das hingetan?	\N	1	7	2026-06-02 03:50:34	2026-06-02 03:50:34
019e8674-609a-70f8-ba4e-86bd98a24b47	019e8661-9df5-72f2-b377-bc266e7baeac	Saya tak sabar menantikannya.	Ich freu mich drauf!	\N	1	8	2026-06-02 03:50:34	2026-06-02 03:50:34
019e8674-609c-704e-84ff-21f4c38bf07c	019e8661-9df5-72f2-b377-bc266e7baeac	Sertakan saya sekali.	Ich bin dabei!	\N	1	9	2026-06-02 03:50:34	2026-06-02 03:50:34
019e8674-609d-7343-8a8a-cea2bcb0d443	019e8661-9df5-72f2-b377-bc266e7baeac	Jangan kira saya sekali.	Ich bin raus.	\N	1	10	2026-06-02 03:50:34	2026-06-02 03:50:34
019e8675-a257-737a-89e7-2242f1779826	019e8661-9df5-72f2-b377-bc266e7baeac	Benda tu tak boleh dibawa bincang dah.	Das steht tidak zur Debatte.	\N	1	11	2026-06-02 03:51:56	2026-06-02 03:51:56
019e8675-a259-7243-9fe3-687bdc69f67a	019e8661-9df5-72f2-b377-bc266e7baeac	Jom kita buat perjanjian.	Lass uns einen Deal machen.	\N	1	12	2026-06-02 03:51:56	2026-06-02 03:51:56
019e8675-a25a-70ed-a0ce-0718291be894	019e8661-9df5-72f2-b377-bc266e7baeac	Dua-dua pihak pun untung	Das ist eine Win-win-Situation.	\N	1	13	2026-06-02 03:51:56	2026-06-02 03:51:56
019e8675-a25b-721d-ab7e-d3367f391bf1	019e8661-9df5-72f2-b377-bc266e7baeac	Boleh saya tanya satu soalan?	Kann ich dich was fragen?	\N	1	14	2026-06-02 03:51:56	2026-06-02 03:51:56
019e8675-a25d-7378-8222-ff487fa48e67	019e8661-9df5-72f2-b377-bc266e7baeac	Silakan	Schieß los!	\N	1	15	2026-06-02 03:51:56	2026-06-02 03:51:56
019e866d-cd2e-7182-bd09-df78fe1b0c94	019e865e-e466-71a2-88eb-238ba8dd32ab	Nanti kita contact-contact lagi	Let's keep in touch.	\N	1	20	2026-06-02 03:43:23	2026-06-02 03:53:12
019e8676-f08b-711a-935e-1ac7c461f25f	019e8661-9df5-72f2-b377-bc266e7baeac	Saja bergurau je.	War nur ein Spaß.	\N	1	16	2026-06-02 03:53:22	2026-06-02 03:53:22
019e8676-f08d-72da-bc13-4e00f10fefb5	019e8661-9df5-72f2-b377-bc266e7baeac	Jangan ambil serius sangat.	Nimm's nicht so ernst.	\N	1	17	2026-06-02 03:53:22	2026-06-02 03:53:22
019e8676-f08e-72d6-94eb-d1dcaaa1cc12	019e8661-9df5-72f2-b377-bc266e7baeac	Semuanya akan okay nanti.	Alles wird gut.	\N	1	18	2026-06-02 03:53:22	2026-06-02 03:53:22
019e8676-f08f-71bb-9116-2bcc46fc3de1	019e8661-9df5-72f2-b377-bc266e7baeac	Terima kasih kerana memahami.	Danke für dein Verständnis.	\N	1	19	2026-06-02 03:53:22	2026-06-02 03:53:22
019e8676-f090-73a2-ac7b-e4631445ed1c	019e8661-9df5-72f2-b377-bc266e7baeac	Nanti kita contact-contact lagi	Lass uns in Kontakt bleiben.	\N	1	20	2026-06-02 03:53:22	2026-06-02 03:53:22
019e867b-6e8d-70b4-b6a1-2759262dcc83	019e8660-815c-739c-b143-abbbe4c35c02	Bagaimana perkembangannya?	What is the status?	\N	1	1	2026-06-02 03:58:16	2026-06-02 03:58:16
019e867b-6e8f-71ed-a654-9747d478213d	019e8660-815c-739c-b143-abbbe4c35c02	Benda tu tengah berjalan lagi.	It is still in progress.	\N	1	2	2026-06-02 03:58:16	2026-06-02 03:58:16
019e867b-6e90-71f3-828a-df6365215d19	019e8660-815c-739c-b143-abbbe4c35c02	Nanti saya beritahu awak balik.	I will let you know.	\N	1	3	2026-06-02 03:58:16	2026-06-02 03:58:16
019e867b-6e92-716a-8c14-acd94ed97f5e	019e8660-815c-739c-b143-abbbe4c35c02	Sentiasa maklumkan saya perkembangan terbaru.	Keep me posted.	\N	1	4	2026-06-02 03:58:16	2026-06-02 03:58:16
019e867b-6e93-7171-8cd2-27c0b6a93314	019e8660-815c-739c-b143-abbbe4c35c02	Terbaiklah!	That is awesome!	\N	1	5	2026-06-02 03:58:16	2026-06-02 03:58:16
019e867c-a792-71d1-a0a6-4d40bd25413b	019e8660-815c-739c-b143-abbbe4c35c02	Saya kagum betul.	I am impressed.	\N	1	6	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a794-7344-97de-140d136592b0	019e8660-815c-739c-b143-abbbe4c35c02	Awak boleh uruskan benda ni tak?	Can you handle this?	\N	1	7	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a796-7325-aae9-d88be43e1d5f	019e8660-815c-739c-b143-abbbe4c35c02	Serahkan je benda tu pada saya.	Leave it to me.	\N	1	8	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a797-7278-82c5-08b21e035ca1	019e8660-815c-739c-b143-abbbe4c35c02	Saya hargai masa yang awak luangkan.	I appreciate your time.	\N	1	9	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a798-7214-a1a2-33997e94e5f5	019e8660-815c-739c-b143-abbbe4c35c02	Maaf sebab mengganggu awak.	Sorry to bother you.	\N	1	10	2026-06-02 03:59:36	2026-06-02 03:59:36
019e8685-471a-7118-9af9-5071e2ec6296	019e8660-815c-739c-b143-abbbe4c35c02	Tak menyusahkan langsung pun.	It's no trouble at all.	\N	1	11	2026-06-02 04:09:01	2026-06-02 04:09:01
019e8685-471c-72f6-9304-2cecb29e9d4e	019e8660-815c-739c-b143-abbbe4c35c02	Awak dah dalam perjalanan ke?	Are you on your way?	\N	1	12	2026-06-02 04:09:01	2026-06-02 04:09:01
019e8685-471d-71ab-bde0-c4d863945d73	019e8660-815c-739c-b143-abbbe4c35c02	Saya akan sampai sana sekejap lagi.	I will be there soon.	\N	1	13	2026-06-02 04:09:01	2026-06-02 04:09:01
019e8685-471f-73f1-b93c-136d0ab3ceed	019e8660-815c-739c-b143-abbbe4c35c02	Ambil masa awak, tak perlu terburu-buru.	Take your time, don't rush.	\N	1	14	2026-06-02 04:09:01	2026-06-02 04:09:01
019e8685-4720-719f-8f10-fede4814cd80	019e8660-815c-739c-b143-abbbe4c35c02	Saya kena semak semula untuk kepastian.	I need to double-check.	\N	1	15	2026-06-02 04:09:01	2026-06-02 04:09:01
019e8687-124f-7090-baef-19ae77981464	019e8660-815c-739c-b143-abbbe4c35c02	Semuanya dah siap sedia ke?	Is everything ready?	\N	1	16	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1251-7072-9f33-b86c053afa88	019e8660-815c-739c-b143-abbbe4c35c02	Semua dah sedia, kita dah boleh gerak	We are good to go.	\N	1	17	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1252-720f-b27c-a851c1d45b42	019e8660-815c-739c-b143-abbbe4c35c02	Jom kita bersurai.	Let's call it a day.	\N	1	18	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1254-72a3-9264-0b921c51726f	019e8660-815c-739c-b143-abbbe4c35c02	Pergilah rehat secukupnya.	Get some rest.	\N	1	19	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1255-710c-bb70-a524528be04c	019e8660-815c-739c-b143-abbbe4c35c02	Jumpa lagi esok.	See you tomorrow.	\N	1	20	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8689-8368-7069-89b9-fbfba952ed9f	019e8661-ac77-72e9-8330-5e9deb107f20	Bagaimana perkembangannya?	Wie läuft's?	\N	1	1	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836a-731e-95dd-fe6c469bdfef	019e8661-ac77-72e9-8330-5e9deb107f20	Benda tu tengah berjalan lagi.	Ist noch in Arbeit.	\N	1	2	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836b-70c2-8417-1661a062682b	019e8661-ac77-72e9-8330-5e9deb107f20	Nanti saya beritahu awak balik.	Ich sag dir Bescheid.	\N	1	3	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836c-71fd-a69e-e7ce53961bbf	019e8661-ac77-72e9-8330-5e9deb107f20	Sentiasa maklumkan saya perkembangan terbaru.	Halt mich auf dem Laufenden.	\N	1	4	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836e-735e-ab06-d3dd7b3fdc8a	019e8661-ac77-72e9-8330-5e9deb107f20	Terbaiklah!	Das ist ja mega!	\N	1	5	2026-06-02 04:13:39	2026-06-02 04:13:39
019e868a-b5e4-73e3-868f-b3973c30e9b4	019e8661-ac77-72e9-8330-5e9deb107f20	Saya kagum betul.	Ich bin echt beeindruckt.	\N	1	6	2026-06-02 04:14:58	2026-06-02 04:14:58
019e868a-b5e6-7204-a4cc-cb321eb1c59f	019e8661-ac77-72e9-8330-5e9deb107f20	Awak boleh uruskan benda ni tak?	Kriegst du das hin?	\N	1	7	2026-06-02 04:14:58	2026-06-02 04:14:58
019e868a-b5e7-729c-8ab9-fbb82d5b108c	019e8661-ac77-72e9-8330-5e9deb107f20	Serahkan je benda tu pada saya.	Überlass das mir.	\N	1	8	2026-06-02 04:14:58	2026-06-02 04:14:58
019e868a-b5e9-720f-86fc-ed94301a898d	019e8661-ac77-72e9-8330-5e9deb107f20	Saya hargai masa yang awak luangkan.	Ich weiß deine Zeit zu schätzen.	\N	1	9	2026-06-02 04:14:58	2026-06-02 04:14:58
019e868a-b5ea-719f-9ee4-b90cd2e86de8	019e8661-ac77-72e9-8330-5e9deb107f20	Maaf sebab mengganggu awak.	Sorry, dass ich dich störe.	\N	1	10	2026-06-02 04:14:58	2026-06-02 04:14:58
019e868c-1cfb-72a6-918e-d69ec0c10ed6	019e8661-ac77-72e9-8330-5e9deb107f20	Tak menyusahkan langsung pun.	Macht überhaupt keine Umstände.	\N	1	11	2026-06-02 04:16:29	2026-06-02 04:16:29
019e868c-1cfd-720b-bdc3-e17092cd4b1e	019e8661-ac77-72e9-8330-5e9deb107f20	Awak dah dalam perjalanan ke?	Bist du schon unterwegs?	\N	1	12	2026-06-02 04:16:29	2026-06-02 04:16:29
019e868c-1cfe-733a-be9c-25ee4d83e855	019e8661-ac77-72e9-8330-5e9deb107f20	Saya akan sampai sana sekejap lagi.	Ich bin gleich da.	\N	1	13	2026-06-02 04:16:29	2026-06-02 04:16:29
019e868c-1d00-7240-8092-4397f29d9496	019e8661-ac77-72e9-8330-5e9deb107f20	Ambil masa awak, tak perlu terburu-buru.	Lass dir Zeit, kein Stress.	\N	1	14	2026-06-02 04:16:29	2026-06-02 04:16:29
019e868c-1d01-73a0-bb7a-4a9aa31a447e	019e8661-ac77-72e9-8330-5e9deb107f20	Saya kena semak semula untuk kepastian.	Ich muss das noch mal kurz checken.	\N	1	15	2026-06-02 04:16:29	2026-06-02 04:16:29
019e868d-23b7-70b1-b32d-4bd21da0babf	019e8661-ac77-72e9-8330-5e9deb107f20	Semuanya dah siap sedia ke?	Ist alles fertig?	\N	1	16	2026-06-02 04:17:37	2026-06-02 04:17:37
019e868d-23b9-709f-8238-7ba08144744a	019e8661-ac77-72e9-8330-5e9deb107f20	Semua dah sedia, kita dah boleh gerak	Wir können loslegen.	\N	1	17	2026-06-02 04:17:37	2026-06-02 04:17:37
019e868d-23ba-72bc-aa75-92a01eb973de	019e8661-ac77-72e9-8330-5e9deb107f20	Jom kita bersurai.	Lass uns Feierabend machen.	\N	1	18	2026-06-02 04:17:37	2026-06-02 04:17:37
019e868d-23bc-70ee-8bb7-2ba291703c26	019e8661-ac77-72e9-8330-5e9deb107f20	Pergilah rehat secukupnya.	Ruh dich erst mal aus.	\N	1	19	2026-06-02 04:17:37	2026-06-02 04:17:37
019e868d-23bd-73aa-838d-e5eb21b00091	019e8661-ac77-72e9-8330-5e9deb107f20	Jumpa lagi esok.	Bis morgen!	\N	1	20	2026-06-02 04:17:37	2026-06-02 04:17:37
019e86b3-dcdc-73f5-8721-60612b39f405	019e8660-a777-734d-9e75-0d5007463fb1	Pukul berapa yang sesuai untuk awak?	What time works for you?	\N	1	1	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b3-dcde-7185-9e84-ff5b0b66c6c5	019e8660-a777-734d-9e75-0d5007463fb1	Mana-mana masa pun okay bagi saya.	Anytime is fine with me.	\N	1	2	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b3-dcdf-70be-bf96-539bf1f81bac	019e8660-a777-734d-9e75-0d5007463fb1	Jom kita jadualkan semula.	Let's reschedule.	\N	1	3	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b3-dce1-734c-be60-7a14144083b4	019e8660-a777-734d-9e75-0d5007463fb1	Saya tak dapat datang.	I can't make it.	\N	1	4	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b3-dce2-7146-869c-7cbfa3e59a95	019e8660-a777-734d-9e75-0d5007463fb1	Ada hal mustahak tiba-tiba.	Something came up.	\N	1	5	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b5-840c-7326-a951-4ab726c5f286	019e8660-a777-734d-9e75-0d5007463fb1	Saya tengah rehat makan tengah hari ni.	I am on my lunch break.	\N	1	6	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b5-840e-71b6-8a64-5a8d6c149d96	019e8660-a777-734d-9e75-0d5007463fb1	Kat mana kita patut parking?	Where should we park?	\N	1	7	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b5-8410-70f7-8567-0c339edb4024	019e8660-a777-734d-9e75-0d5007463fb1	Ikut saya.	Follow me.	\N	1	8	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b5-8411-700f-9aa8-cabddc6661a0	019e8660-a777-734d-9e75-0d5007463fb1	Tunjukkan jalan.	Lead the way.	\N	1	9	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b5-8412-72a1-9a54-59bbad366a24	019e8660-a777-734d-9e75-0d5007463fb1	Saya kehilangan kata-kata.	I am lost for words.	\N	1	10	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b7-aa75-7370-88da-9163b187d411	019e8660-a777-734d-9e75-0d5007463fb1	Perkara tu masuk akal.	That makes sense.	\N	1	11	2026-06-02 05:04:04	2026-06-02 05:04:04
019e86b7-aa77-734c-b76b-67d1b28a0857	019e8660-a777-734d-9e75-0d5007463fb1	Macam tak masuk akal je.	It doesn't make sense.	\N	1	12	2026-06-02 05:04:04	2026-06-02 05:04:04
019e86b7-aa78-72e5-8594-4bce895855f6	019e8660-a777-734d-9e75-0d5007463fb1	Awak masih dengar ke?	Are you with me?	\N	1	13	2026-06-02 05:04:04	2026-06-02 05:04:04
019e86b7-aa7a-705f-b00f-e5b11231c90e	019e8660-a777-734d-9e75-0d5007463fb1	Saya tengah dengar ni.	I am listening.	\N	1	14	2026-06-02 05:04:04	2026-06-02 05:04:04
019e86b7-aa7b-703a-8d1a-efce3e3982ed	019e8660-a777-734d-9e75-0d5007463fb1	Tolong jangan mencelah	Don't interrupt, please.	\N	1	15	2026-06-02 05:04:04	2026-06-02 05:04:04
019e86b8-e3f8-716f-be4e-cedea1e1271a	019e8660-a777-734d-9e75-0d5007463fb1	Biar saya habiskan cakap dulu.	Let me finish first.	\N	1	16	2026-06-02 05:05:24	2026-06-02 05:05:24
019e86b8-e3fa-71d3-8743-f6869adf9d84	019e8660-a777-734d-9e75-0d5007463fb1	Ada betulnya juga point awak tu.	You have a point.	\N	1	17	2026-06-02 05:05:24	2026-06-02 05:05:24
019e86b8-e3fb-70b0-bab8-430acfbeeb0b	019e8660-a777-734d-9e75-0d5007463fb1	Itu cerita lain pula dah.	That's a different story.	\N	1	18	2026-06-02 05:05:24	2026-06-02 05:05:24
019e86b8-e3fd-73cd-a1b4-452bee1a58fa	019e8660-a777-734d-9e75-0d5007463fb1	Jom kita beralih ke perkara seterusnya.	Let's move on.	\N	1	19	2026-06-02 05:05:24	2026-06-02 05:05:24
019e86b8-e3fe-7067-bde0-500f48984ec6	019e8660-a777-734d-9e75-0d5007463fb1	Teruskan kerja yang bagus tu!	Keep up the good work!	\N	1	20	2026-06-02 05:05:24	2026-06-02 05:05:24
019e86ba-9bca-724b-8b23-68b11bac1718	019e8661-b91d-71d1-ad0a-016d61b5128c	Pukul berapa yang sesuai untuk awak?	Um wie viel Uhr passt es dir?	\N	1	1	2026-06-02 05:07:17	2026-06-02 05:07:17
019e86ba-9bcc-733b-af03-015fa8e7188c	019e8661-b91d-71d1-ad0a-016d61b5128c	Mana-mana masa pun okay bagi saya.	Mir passt es eigentlich immer.	\N	1	2	2026-06-02 05:07:17	2026-06-02 05:07:17
019e86ba-9bcd-7097-a8d5-87a0817ccbcf	019e8661-b91d-71d1-ad0a-016d61b5128c	Jom kita jadualkan semula.	Lass uns den Termin verschieben.	\N	1	3	2026-06-02 05:07:17	2026-06-02 05:07:17
019e86ba-9bce-7288-aff4-60b4617e1440	019e8661-b91d-71d1-ad0a-016d61b5128c	Saya tak dapat datang.	Ich schaff's leider nicht.	\N	1	4	2026-06-02 05:07:17	2026-06-02 05:07:17
019e86ba-9bd0-7003-ae5b-b3f2e92d02a8	019e8661-b91d-71d1-ad0a-016d61b5128c	Ada hal mustahak tiba-tiba.	Mir ist was dazwischengekommen.	\N	1	5	2026-06-02 05:07:17	2026-06-02 05:07:17
019e86bb-edfd-71e3-a278-8d7c425a7e7a	019e8661-b91d-71d1-ad0a-016d61b5128c	Saya tengah rehat makan tengah hari ni.	Ich bin gerade in der Mittagspause.	\N	1	6	2026-06-02 05:08:43	2026-06-02 05:08:43
019e86bb-edff-73ba-852f-e1724dab08fe	019e8661-b91d-71d1-ad0a-016d61b5128c	Kat mana kita patut parking?	Wo sollen wir parken?	\N	1	7	2026-06-02 05:08:43	2026-06-02 05:08:43
019e86bb-ee00-7093-9772-cc4fac25a886	019e8661-b91d-71d1-ad0a-016d61b5128c	Ikut saya.	Folge mir.	\N	1	8	2026-06-02 05:08:43	2026-06-02 05:08:43
019e86bb-ee01-73ba-a41e-2ccc818a4a19	019e8661-b91d-71d1-ad0a-016d61b5128c	Tunjukkan jalan.	Geh du vor.	\N	1	9	2026-06-02 05:08:43	2026-06-02 05:08:43
019e86bb-ee02-7393-854c-6a457963a109	019e8661-b91d-71d1-ad0a-016d61b5128c	Saya kehilangan kata-kata.	Mir fehlen die Worte.	\N	1	10	2026-06-02 05:08:43	2026-06-02 05:08:43
019e86bd-792b-7164-ae67-07c7615c15c0	019e8661-b91d-71d1-ad0a-016d61b5128c	Perkara tu masuk akal.	Das klingt logisch.	\N	1	11	2026-06-02 05:10:24	2026-06-02 05:10:24
019e86bd-792d-715b-9b76-d7c054bb1100	019e8661-b91d-71d1-ad0a-016d61b5128c	Macam tak masuk akal je.	Das macht keinen Sinn.	\N	1	12	2026-06-02 05:10:24	2026-06-02 05:10:24
019e86bd-792e-739e-9b36-82ed517e0577	019e8661-b91d-71d1-ad0a-016d61b5128c	Awak masih dengar ke?	Verstehst du mich soweit?	\N	1	13	2026-06-02 05:10:24	2026-06-02 05:10:24
019e86bd-7930-71e1-8433-bc4f1ebc90a1	019e8661-b91d-71d1-ad0a-016d61b5128c	Saya tengah dengar ni.	Ich höre dir zu.	\N	1	14	2026-06-02 05:10:24	2026-06-02 05:10:24
019e86bd-7931-739e-a6cc-6e3c67f8d71e	019e8661-b91d-71d1-ad0a-016d61b5128c	Tolong jangan mencelah	Unterbrich mich bitte nicht.	\N	1	15	2026-06-02 05:10:24	2026-06-02 05:10:24
019e86be-9ced-73de-b8f0-63ec289d7b7a	019e8661-b91d-71d1-ad0a-016d61b5128c	Biar saya habiskan cakap dulu.	Lass mich erst mal fertig reden.	\N	1	16	2026-06-02 05:11:39	2026-06-02 05:11:39
019e86be-9cef-71fb-8de0-778a1de14491	019e8661-b91d-71d1-ad0a-016d61b5128c	Ada betulnya juga point awak tu.	Da hast du recht.	\N	1	17	2026-06-02 05:11:39	2026-06-02 05:11:39
019e86be-9cf0-70d2-8542-85e2d001c38a	019e8661-b91d-71d1-ad0a-016d61b5128c	Itu cerita lain pula dah.	Das ist wieder eine andere Geschichte.	\N	1	18	2026-06-02 05:11:39	2026-06-02 05:11:39
019e86be-9cf2-7346-8b45-3144bcb83b68	019e8661-b91d-71d1-ad0a-016d61b5128c	Jom kita beralih ke perkara seterusnya.	Lass uns weitermachen.	\N	1	19	2026-06-02 05:11:39	2026-06-02 05:11:39
019e86be-9cf3-70ef-a6e9-38074537ead0	019e8661-b91d-71d1-ad0a-016d61b5128c	Teruskan kerja yang bagus tu!	Mach weiter so!	\N	1	20	2026-06-02 05:11:39	2026-06-02 05:11:39
019e86dc-c309-7074-acfa-8bb3e43425a3	019e8660-bfce-726a-9b1a-91ed8fa57632	Apa pendapat awak?	What is your opinion?	\N	1	1	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dc-c30b-73c6-9232-ab7cc8aa7adc	019e8660-bfce-726a-9b1a-91ed8fa57632	Pada pendapat saya...	In my opinion	\N	1	2	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dc-c30c-73fc-a9eb-94d5025e13f1	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya langsung tak ada idea.	I have no idea.	\N	1	3	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dc-c30d-7397-9b0c-6c4c03fd3448	019e8660-bfce-726a-9b1a-91ed8fa57632	Jom kita cari jalan penyelesaian sama-sama.	Let's figure it out.	\N	1	4	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dc-c30e-7179-8972-64347aafcef8	019e8660-bfce-726a-9b1a-91ed8fa57632	Benda ni tak penting sangat pun.	It is not urgent.	\N	1	5	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dd-f5ff-7150-ab31-c7e27359b9c3	019e8660-bfce-726a-9b1a-91ed8fa57632	Secepat yang mungkin.	As soon as possible.	\N	1	6	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f601-7251-a3f9-27317e021952	019e8660-bfce-726a-9b1a-91ed8fa57632	Boleh tolong hantarkan gambar?	Can you send a photo?	\N	1	7	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f602-710b-a12b-728ef1c03576	019e8660-bfce-726a-9b1a-91ed8fa57632	Hantarkan lokasi pada saya.	Send me the location.	\N	1	8	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f604-70c5-8749-e3640fbfc90c	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya kat luar sekarang ni.	I am outside now.	\N	1	9	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f605-7021-b50e-36d90b7977b8	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya baru je sampai rumah.	I just got home.	\N	1	10	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86df-5b9e-71e8-a8e5-cad9969925dc	019e8660-bfce-726a-9b1a-91ed8fa57632	Benda ni masih ada lagi ke?	Is it available?	\N	1	11	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86df-5ba0-70b1-b70b-9e3b3e776a66	019e8660-bfce-726a-9b1a-91ed8fa57632	Stok dah habis.	It is out of stock.	\N	1	12	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86df-5ba1-7246-97d6-4a8e5e29eb28	019e8660-bfce-726a-9b1a-91ed8fa57632	Boleh bagi diskaun sikit?	Can I get a discount?	\N	1	13	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86df-5ba2-7143-b047-6edc8e40a8cf	019e8660-bfce-726a-9b1a-91ed8fa57632	Harganya berpatutan.	It is a fair price.	\N	1	14	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86df-5ba4-739b-8d0f-057501fa369c	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya ambil yang ini.	I will take it.	\N	1	15	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86e2-91eb-712b-a066-034626207880	019e8660-bfce-726a-9b1a-91ed8fa57632	Jangan ambil hati ya.	No hard feelings.	\N	1	16	2026-06-02 05:50:55	2026-06-02 05:50:55
019e86e2-91ed-72c4-92c3-f011bbf70da6	019e8660-bfce-726a-9b1a-91ed8fa57632	Jangan salahkan diri awak sendiri.	Don't blame yourself.	\N	1	17	2026-06-02 05:50:55	2026-06-02 05:50:55
019e86e2-91ee-7124-ba08-4a38bf283a93	019e8660-bfce-726a-9b1a-91ed8fa57632	Adatlah, kesilapan kadang-kadang berlaku.	Mistakes happen.	\N	1	18	2026-06-02 05:50:55	2026-06-02 05:50:55
019e86e2-91ef-720d-85b4-9bba94244b54	019e8660-bfce-726a-9b1a-91ed8fa57632	Jom kita cuba sekali lagi.	Let's try one more time.	\N	1	19	2026-06-02 05:50:55	2026-06-02 05:50:55
019e86e2-91f1-7171-a6fd-ddf24e71c7bb	019e8660-bfce-726a-9b1a-91ed8fa57632	Kita dah berjaya buat!	We did it!	\N	1	20	2026-06-02 05:50:55	2026-06-02 05:50:55
019e86e5-1fb6-717c-bf9b-9a5f74a3935e	019e8661-c90a-71e6-bd13-abc26c40b47e	Apa pendapat awak?	Was ist deine Meinung?	\N	1	1	2026-06-02 05:53:43	2026-06-02 05:53:43
019e86e5-1fb8-7042-a5da-ae763c57f1e9	019e8661-c90a-71e6-bd13-abc26c40b47e	Pada pendapat saya...	Meiner Meinung nach	\N	1	2	2026-06-02 05:53:43	2026-06-02 05:53:43
019e86e5-1fb9-7026-80fa-ffed158d7404	019e8661-c90a-71e6-bd13-abc26c40b47e	Saya langsung tak ada idea.	Ich habe absolut keine Ahnung.	\N	1	3	2026-06-02 05:53:43	2026-06-02 05:53:43
019e86e5-1fbb-737f-bf46-babd21f51175	019e8661-c90a-71e6-bd13-abc26c40b47e	Jom kita cari jalan penyelesaian sama-sama.	Lass uns eine Lösung finden.	\N	1	4	2026-06-02 05:53:43	2026-06-02 05:53:43
019e86e5-1fbc-730a-9b03-26495f8ddbdc	019e8661-c90a-71e6-bd13-abc26c40b47e	Benda ni tak penting sangat pun.	Es ist nicht so dringend.	\N	1	5	2026-06-02 05:53:43	2026-06-02 05:53:43
019e86e6-4d31-7274-96ef-9124e77f92ad	019e8661-c90a-71e6-bd13-abc26c40b47e	Secepat yang mungkin.	So schnell wie möglich.	\N	1	6	2026-06-02 05:55:00	2026-06-02 05:55:00
019e86e6-4d33-71bd-8290-dcf652affa77	019e8661-c90a-71e6-bd13-abc26c40b47e	Boleh tolong hantarkan gambar?	Kannst du mir ein Foto schicken?	\N	1	7	2026-06-02 05:55:00	2026-06-02 05:55:00
019e86e6-4d34-7331-8f0d-afbaeb4c8378	019e8661-c90a-71e6-bd13-abc26c40b47e	Hantarkan lokasi pada saya.	Schick mir mal den Standort.	\N	1	8	2026-06-02 05:55:00	2026-06-02 05:55:00
019e86e6-4d35-73f3-88b1-3d74eb26a728	019e8661-c90a-71e6-bd13-abc26c40b47e	Saya kat luar sekarang ni.	Ich bin gerade draußen.	\N	1	9	2026-06-02 05:55:00	2026-06-02 05:55:00
019e86e6-4d36-70d0-bf55-2a1995feb15d	019e8661-c90a-71e6-bd13-abc26c40b47e	Saya baru je sampai rumah.	Ich bin gerade erst nach Hause gekommen.	\N	1	10	2026-06-02 05:55:00	2026-06-02 05:55:00
019e86e7-69c3-72b1-91da-614a4047e007	019e8661-c90a-71e6-bd13-abc26c40b47e	Benda ni masih ada lagi ke?	Ist das noch da?	\N	1	11	2026-06-02 05:56:13	2026-06-02 05:56:13
019e86e7-69c5-73af-b16e-df35c509cbb8	019e8661-c90a-71e6-bd13-abc26c40b47e	Stok dah habis.	Das ist ausverkauft.	\N	1	12	2026-06-02 05:56:13	2026-06-02 05:56:13
019e86e7-69c6-7100-8750-f36b745f4e1e	019e8661-c90a-71e6-bd13-abc26c40b47e	Boleh bagi diskaun sikit?	Kann ich einen Rabatt kriegen?	\N	1	13	2026-06-02 05:56:13	2026-06-02 05:56:13
019e86e7-69c8-73ee-a96e-2ccb92838f30	019e8661-c90a-71e6-bd13-abc26c40b47e	Harganya berpatutan.	Das ist ein fairer Preis.	\N	1	14	2026-06-02 05:56:13	2026-06-02 05:56:13
019e86e7-69c9-73db-815f-5f886bbf131c	019e8661-c90a-71e6-bd13-abc26c40b47e	Saya ambil yang ini.	Ich nehme das.	\N	1	15	2026-06-02 05:56:13	2026-06-02 05:56:13
019e86e8-5cff-72fa-9928-d1509fbd1b12	019e8661-c90a-71e6-bd13-abc26c40b47e	Jangan ambil hati ya.	Nicht bös gemeint.	\N	1	16	2026-06-02 05:57:15	2026-06-02 05:57:15
019e86e8-5d01-7047-9d08-3aeb0a572b74	019e8661-c90a-71e6-bd13-abc26c40b47e	Jangan salahkan diri awak sendiri.	Mach dir keine Vorwürfe.	\N	1	17	2026-06-02 05:57:15	2026-06-02 05:57:15
019e86e8-5d02-73a9-b105-c75959edff35	019e8661-c90a-71e6-bd13-abc26c40b47e	Adatlah, kesilapan kadang-kadang berlaku.	Fehler passieren eben.	\N	1	18	2026-06-02 05:57:15	2026-06-02 05:57:15
019e86e8-5d03-732d-88b6-7cd65a833f39	019e8661-c90a-71e6-bd13-abc26c40b47e	Jom kita cuba sekali lagi.	Lass es uns noch mal versuchen.	\N	1	19	2026-06-02 05:57:15	2026-06-02 05:57:15
019e86e8-5d04-718b-9a88-7ca1cff4bed3	019e8661-c90a-71e6-bd13-abc26c40b47e	Kita dah berjaya buat!	Wir haben's geschafft!	\N	1	20	2026-06-02 05:57:15	2026-06-02 05:57:15
019e86ea-d79e-7018-91b4-733d60c39fa9	019e8660-d50d-7278-b630-c3586babcf71	Awak tengah buat apa tu?	What are you up to?	\N	1	1	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ea-d7a0-7305-bf37-56ec4725403b	019e8660-d50d-7278-b630-c3586babcf71	Saya tengah santai-santai je ni.	I am just relaxing.	\N	1	2	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ea-d7a1-7100-b977-c31fbb46d606	019e8660-d50d-7278-b630-c3586babcf71	Boleh awak simpan rahsia?	Can you keep a secret?	\N	1	3	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ea-d7a3-731d-aa0d-27ab42a0cee5	019e8660-d50d-7278-b630-c3586babcf71	Saya takkan bocorkan rahsia	My lips are sealed.	\N	1	4	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ea-d7a4-7342-80ff-9a96792b92c7	019e8660-d50d-7278-b630-c3586babcf71	Benda ni memang berbaloi.	It is worth it.	\N	1	5	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ec-42be-70eb-a1be-198f7e4daae1	019e8660-d50d-7278-b630-c3586babcf71	Benda tu buang masa je.	It is a waste of time.	\N	1	6	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86ec-42bf-7199-ac90-835c7a798e65	019e8660-d50d-7278-b630-c3586babcf71	Ada udang di sebalik batu ke?	What's the catch?	\N	1	7	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86ec-42c1-718c-892e-f62dadd5904c	019e8660-d50d-7278-b630-c3586babcf71	Tak ada syarat apa-apa pun.	No strings attached.	\N	1	8	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86ec-42c2-7247-b95e-476f294ba742	019e8660-d50d-7278-b630-c3586babcf71	Awak free tak hujung minggu ni?	Are you free this weekend?	\N	1	9	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86ec-42c3-73d0-a835-e500e1aa6edf	019e8660-d50d-7278-b630-c3586babcf71	Saya dah ada rancangan lain dah.	I have plans already.	\N	1	10	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86f0-3bd0-71e3-8c3c-6ef221a6b321	019e8660-d50d-7278-b630-c3586babcf71	Jom kita buat benda ni cepat-cepat.	Let's make it quick.	\N	1	11	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86f0-3bd3-7206-a92e-63e5ba9fadf2	019e8660-d50d-7278-b630-c3586babcf71	Masa kita dah nak habis ni.	We are running out of time.	\N	1	12	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86f0-3bd7-7044-bf53-9f284f768c72	019e8660-d50d-7278-b630-c3586babcf71	Boleh tolong kuatkan volume sikit?	Can you turn up the volume?	\N	1	13	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86f0-3bdb-71eb-b748-e0ac8fdb5331	019e8660-d50d-7278-b630-c3586babcf71	Bunyi terlalu kuat.	It is too loud.	\N	1	14	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86f0-3bdc-7241-a9fc-a9125b46d17b	019e8660-d50d-7278-b630-c3586babcf71	Awak boleh tangkap tak apa saya cakap?	Are you following me?	\N	1	15	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86f3-4aaa-7260-9848-db1cb26e1849	019e8660-d50d-7278-b630-c3586babcf71	Saya setuju dengan awak.	I am with you.	\N	1	16	2026-06-02 06:09:11	2026-06-02 06:09:11
019e86f3-4aac-7248-a7de-fe09e23159d0	019e8660-d50d-7278-b630-c3586babcf71	Jangan fikir bukan-bukan.	Don't overthink it.	\N	1	17	2026-06-02 06:09:11	2026-06-02 06:09:11
019e86f3-4aad-7145-ad87-b3f095db5f83	019e8660-d50d-7278-b630-c3586babcf71	Biar masa yang menentukan.	Let nature take its course.	\N	1	18	2026-06-02 06:09:11	2026-06-02 06:09:11
019e86f3-4aaf-709d-931d-431f9e8684c0	019e8660-d50d-7278-b630-c3586babcf71	Haa, macam tu lah baru betul.	That is more like it.	\N	1	19	2026-06-02 06:09:11	2026-06-02 06:09:11
019e86f3-4ab1-7311-9a6b-eaa3af4c11fe	019e8660-d50d-7278-b630-c3586babcf71	Kita dah berjaya sampai tiga ratus ayat!	We made it to three hundred!	\N	1	20	2026-06-02 06:09:11	2026-06-02 06:09:11
019e86f6-cf7d-720e-8450-4c0a3d2fdb38	019e8661-d71d-72ca-88a0-e04c9585e77f	Awak tengah buat apa tu?	Was hast du so vor?	\N	1	1	2026-06-02 06:13:02	2026-06-02 06:13:02
019e86f6-cf7f-71b7-b226-4e072eb853ac	019e8661-d71d-72ca-88a0-e04c9585e77f	Saya tengah santai-santai je ni.	Ich entspanne mich nur.	\N	1	2	2026-06-02 06:13:02	2026-06-02 06:13:02
019e86f6-cf80-70fc-a45d-2066b6416333	019e8661-d71d-72ca-88a0-e04c9585e77f	Boleh awak simpan rahsia?	Kannst du ein Geheimnis für dich behalten?	\N	1	3	2026-06-02 06:13:02	2026-06-02 06:13:02
019e86f6-cf81-7295-9b4f-b2b8f4d307f8	019e8661-d71d-72ca-88a0-e04c9585e77f	Saya takkan bocorkan rahsia	Ich schweige wie ein Grab.	\N	1	4	2026-06-02 06:13:02	2026-06-02 06:13:02
019e86f6-cf83-7083-a7c6-63e1c6b5def5	019e8661-d71d-72ca-88a0-e04c9585e77f	Benda ni memang berbaloi.	Das lohnt sich voll.	\N	1	5	2026-06-02 06:13:02	2026-06-02 06:13:02
019e86f7-c2d7-73a2-b302-f6a3ab500271	019e8661-d71d-72ca-88a0-e04c9585e77f	Benda tu buang masa je.	Das ist voll die Zeitverschwendung.	\N	1	6	2026-06-02 06:14:04	2026-06-02 06:14:04
019e86f7-c2d9-726b-9f0a-26243ffd744a	019e8661-d71d-72ca-88a0-e04c9585e77f	Ada udang di sebalik batu ke?	Wo ist der Haken?	\N	1	7	2026-06-02 06:14:04	2026-06-02 06:14:04
019e86f7-c2da-73f7-a7b4-f0a6c54df816	019e8661-d71d-72ca-88a0-e04c9585e77f	Tak ada syarat apa-apa pun.	Ohne Bedingungen.	\N	1	8	2026-06-02 06:14:04	2026-06-02 06:14:04
019e86f7-c2dc-7001-9c1a-0e2962fbbb7a	019e8661-d71d-72ca-88a0-e04c9585e77f	Awak free tak hujung minggu ni?	Hast du dieses Wochenende Zeit?	\N	1	9	2026-06-02 06:14:04	2026-06-02 06:14:04
019e86f7-c2dd-736c-9755-8d37bd3548aa	019e8661-d71d-72ca-88a0-e04c9585e77f	Saya dah ada rancangan lain dah.	Ich habe schon Pläne.	\N	1	10	2026-06-02 06:14:04	2026-06-02 06:14:04
019e86f9-02a3-70c9-a4ac-4be6da9a5878	019e8661-d71d-72ca-88a0-e04c9585e77f	Jom kita buat benda ni cepat-cepat.	Lass uns das schnell machen.	\N	1	11	2026-06-02 06:15:26	2026-06-02 06:15:26
019e86f9-02a5-7191-8282-d8684e2c75fe	019e8661-d71d-72ca-88a0-e04c9585e77f	Masa kita dah nak habis ni.	Uns läuft die Zeit davon.	\N	1	12	2026-06-02 06:15:26	2026-06-02 06:15:26
019e86f9-02a6-713a-bf7b-8937de90c842	019e8661-d71d-72ca-88a0-e04c9585e77f	Boleh tolong kuatkan volume sikit?	Kannst du das lauter machen?	\N	1	13	2026-06-02 06:15:26	2026-06-02 06:15:26
019e86f9-02a7-72b8-b096-e8043b31afa5	019e8661-d71d-72ca-88a0-e04c9585e77f	Bunyi terlalu kuat.	Das ist viel zu laut.	\N	1	14	2026-06-02 06:15:26	2026-06-02 06:15:26
019e86f9-02a9-7399-b3ab-c9ff031a8a10	019e8661-d71d-72ca-88a0-e04c9585e77f	Awak boleh tangkap tak apa saya cakap?	Kommst du mit?	\N	1	15	2026-06-02 06:15:26	2026-06-02 06:15:26
019e86fa-1dd5-7338-9483-9bffeef32356	019e8661-d71d-72ca-88a0-e04c9585e77f	Saya setuju dengan awak.	Ich verstehe dich.	\N	1	16	2026-06-02 06:16:39	2026-06-02 06:16:39
019e86fa-1dd7-706f-99cd-e7b6aaac668f	019e8661-d71d-72ca-88a0-e04c9585e77f	Jangan fikir bukan-bukan.	Denk nicht so viel darüber nach.	\N	1	17	2026-06-02 06:16:39	2026-06-02 06:16:39
019e86fa-1dd8-7163-8946-63ad7973271a	019e8661-d71d-72ca-88a0-e04c9585e77f	Biar masa yang menentukan.	Lass den Dingen ihren Lauf.	\N	1	18	2026-06-02 06:16:39	2026-06-02 06:16:39
019e86fa-1dd9-701a-ac11-7f3c5d2a673d	019e8661-d71d-72ca-88a0-e04c9585e77f	Haa, macam tu lah baru betul.	Schon besser!	\N	1	19	2026-06-02 06:16:39	2026-06-02 06:16:39
019e86fa-1dda-7293-a5f0-87280ac3a36a	019e8661-d71d-72ca-88a0-e04c9585e77f	Kita dah berjaya sampai tiga ratus ayat!	Wir haben die Dreihundert geschafft!	\N	1	20	2026-06-02 06:16:39	2026-06-02 06:16:39
019e872d-ad5a-726b-b8d7-3adf99140fe8	019e8660-efc4-705c-a666-3dd34556d4f8	Apa yang awak tengah fikirkan tu?	What is on your mind?	\N	1	1	2026-06-02 07:12:58	2026-06-02 07:12:58
019e872d-ad5d-703e-a800-3665aabdd937	019e8660-efc4-705c-a666-3dd34556d4f8	Itu bukan urusan saya	It's none of my business.	\N	1	3	2026-06-02 07:12:58	2026-06-02 07:12:58
019e872d-ad5f-734b-94ab-94b8fd75f38e	019e8660-efc4-705c-a666-3dd34556d4f8	Tak payah sibuk hal orang.	Mind your own business.	\N	1	4	2026-06-02 07:12:58	2026-06-02 07:12:58
019e872d-ad60-7162-beab-436fa3e8f362	019e8660-efc4-705c-a666-3dd34556d4f8	Adakah tempat tu jauh dari sini?	Is it far from here?	\N	1	5	2026-06-02 07:12:58	2026-06-02 07:12:58
019e872f-0633-72b5-8b7d-4b6a788ae2dc	019e8660-efc4-705c-a666-3dd34556d4f8	Dah dekat sangat dah.	It is just around the corner.	\N	1	6	2026-06-02 07:14:26	2026-06-02 07:14:26
019e872f-0635-7309-a073-a4b11b41ebc9	019e8660-efc4-705c-a666-3dd34556d4f8	Berapa lama masa yang diambil?	How long does it take?	\N	1	7	2026-06-02 07:14:26	2026-06-02 07:14:26
019e872f-0636-7029-bd43-d715769d570a	019e8660-efc4-705c-a666-3dd34556d4f8	Lebih kurang sepuluh minit.	About ten minutes.	\N	1	8	2026-06-02 07:14:26	2026-06-02 07:14:26
019e872f-0638-734b-97a0-f88a8299e0f3	019e8660-efc4-705c-a666-3dd34556d4f8	Saya tengah nak cepat.	I am in a hurry.	\N	1	9	2026-06-02 07:14:26	2026-06-02 07:14:26
019e872f-0639-72a0-9e91-5381345db959	019e8660-efc4-705c-a666-3dd34556d4f8	Jangan desak saya.	Don't rush me.	\N	1	10	2026-06-02 07:14:26	2026-06-02 07:14:26
019e8734-3dbd-70fb-9738-bffbfdf0dc62	019e8660-efc4-705c-a666-3dd34556d4f8	Boleh tolong saya sikit?	Can you do me a favor?	\N	1	11	2026-06-02 07:20:08	2026-06-02 07:20:08
019e8734-3dbf-712e-8c8d-15549cb5e553	019e8660-efc4-705c-a666-3dd34556d4f8	Apa yang awak perlukan?	What do you need?	\N	1	12	2026-06-02 07:20:08	2026-06-02 07:20:08
019e8734-3dc0-73a2-804d-4238677e1281	019e8660-efc4-705c-a666-3dd34556d4f8	Biar saya yang uruskan perkara tu.	I will handle it.	\N	1	13	2026-06-02 07:20:08	2026-06-02 07:20:08
019e8734-3dc1-712b-bf83-bb5ea7cfc70c	019e8660-efc4-705c-a666-3dd34556d4f8	Terima kasih atas peringatan awal tu.	Thanks for the heads up.	\N	1	14	2026-06-02 07:20:08	2026-06-02 07:20:08
019e8734-3dc3-72c7-b7d5-036ea741a5be	019e8660-efc4-705c-a666-3dd34556d4f8	Saya tengah buat benda tu sekarang.	I am on it.	\N	1	15	2026-06-02 07:20:08	2026-06-02 07:20:08
019e872d-ad5c-739c-8381-9a8819cd477e	019e8660-efc4-705c-a666-3dd34556d4f8	Saja tengah termenung kejap.	I am just thinking	\N	1	2	2026-06-02 07:12:58	2026-06-02 07:20:27
019e8735-f3d8-702e-a56f-08ca30dae088	019e8660-efc4-705c-a666-3dd34556d4f8	Beritahu saya kalau awak perlukan apa-apa.	Let me know if you need anything.	\N	1	16	2026-06-02 07:22:00	2026-06-02 07:22:00
019e8735-f3da-7166-b841-e51481f4e9e0	019e8660-efc4-705c-a666-3dd34556d4f8	Saya tengah cuba sedaya upaya saya ni.	I am doing my best.	\N	1	17	2026-06-02 07:22:00	2026-06-02 07:22:00
019e8735-f3db-7264-ad14-b35af3be72ea	019e8660-efc4-705c-a666-3dd34556d4f8	Jangan putus asa.	Don't give up.	\N	1	18	2026-06-02 07:22:00	2026-06-02 07:22:00
019e8735-f3dd-7008-8fad-dc22947654ae	019e8660-efc4-705c-a666-3dd34556d4f8	Awak dah buat dengan sangat bagus.	You are doing great.	\N	1	19	2026-06-02 07:22:00	2026-06-02 07:22:00
019e8735-f3de-7349-9617-617cff078b5e	019e8660-efc4-705c-a666-3dd34556d4f8	Jom kita teruskan lagi usaha ni.	Let's keep going.	\N	1	20	2026-06-02 07:22:00	2026-06-02 07:22:00
019e8738-71a3-71f6-a8b0-4ca633d6c641	019e8661-eef9-7300-ac92-1cd27b454749	Apa yang awak tengah fikirkan tu?	Was geht dir durch den Kopf?	\N	1	1	2026-06-02 07:24:43	2026-06-02 07:24:43
019e8738-71a5-73cd-9af9-de3bf4015c72	019e8661-eef9-7300-ac92-1cd27b454749	Saja tengah termenung kejap.	Ich denke nur nach.	\N	1	2	2026-06-02 07:24:43	2026-06-02 07:24:43
019e8738-71a7-7272-be00-53b26dfd3413	019e8661-eef9-7300-ac92-1cd27b454749	Itu bukan urusan saya.	Das geht mich nichts an.	\N	1	3	2026-06-02 07:24:43	2026-06-02 07:24:43
019e8738-71a8-727e-ba61-7c4237590b0d	019e8661-eef9-7300-ac92-1cd27b454749	Tak payah sibuk hal orang.	Misch dich nicht ein.	\N	1	4	2026-06-02 07:24:43	2026-06-02 07:24:43
019e8738-71a9-7161-b2c1-4ed5c55d16ff	019e8661-eef9-7300-ac92-1cd27b454749	Adakah tempat tu jauh dari sini?	Ist es weit von hier?	\N	1	5	2026-06-02 07:24:43	2026-06-02 07:24:43
019e8739-dc12-71de-b2f5-9f2653056762	019e8661-eef9-7300-ac92-1cd27b454749	Dah dekat sangat dah.	Das ist gleich um die Ecke.	\N	1	6	2026-06-02 07:26:16	2026-06-02 07:26:16
019e8739-dc14-70a4-a680-dfb23d6b2681	019e8661-eef9-7300-ac92-1cd27b454749	Berapa lama masa yang diambil?	Wie lange dauert das?	\N	1	7	2026-06-02 07:26:16	2026-06-02 07:26:16
019e8739-dc15-7389-9b7e-e3c96bd7b3d2	019e8661-eef9-7300-ac92-1cd27b454749	Lebih kurang sepuluh minit.	Ungefähr zehn Minuten.	\N	1	8	2026-06-02 07:26:16	2026-06-02 07:26:16
019e8739-dc17-7026-82ad-e15ce82e0c75	019e8661-eef9-7300-ac92-1cd27b454749	Saya tengah nak cepat.	Ich bin im Stress.	\N	1	9	2026-06-02 07:26:16	2026-06-02 07:26:16
019e8739-dc18-7209-bbb3-97981a6f3cdb	019e8661-eef9-7300-ac92-1cd27b454749	Jangan desak saya.	Hetz mich nicht.	\N	1	10	2026-06-02 07:26:16	2026-06-02 07:26:16
019e873b-74eb-70ea-909b-264a3b1a0c93	019e8661-eef9-7300-ac92-1cd27b454749	Boleh tolong saya sikit?	Kannst du mir einen Gefallen tun?	\N	1	11	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873b-74ed-71b7-a727-1752b360e8cc	019e8661-eef9-7300-ac92-1cd27b454749	Apa yang awak perlukan?	Was brauchst du?	\N	1	12	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873b-74ee-7180-951c-07327df637c2	019e8661-eef9-7300-ac92-1cd27b454749	Biar saya yang uruskan perkara tu.	Ich regel das.	\N	1	13	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873b-74f0-7333-8b26-61573834f3b8	019e8661-eef9-7300-ac92-1cd27b454749	Terima kasih atas peringatan awal tu.	Danke für den Hinweis.	\N	1	14	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873b-74f2-71bd-bc7b-e3b7041f9081	019e8661-eef9-7300-ac92-1cd27b454749	Saya tengah buat benda tu sekarang.	Ich bin dran.	\N	1	15	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873c-7a2c-71f5-bf2a-96102f9ef576	019e8661-eef9-7300-ac92-1cd27b454749	Let me know if you need anything.	Sag Bescheid, wenn du was brauchst.	\N	1	16	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a2e-7364-b3df-cf2420caf157	019e8661-eef9-7300-ac92-1cd27b454749	Saya tengah cuba sedaya upaya saya ni.	Ich gebe mein Bestes.	\N	1	17	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a2f-728f-87b3-1db31bfa52ff	019e8661-eef9-7300-ac92-1cd27b454749	Jangan putus asa.	Gib nicht auf!	\N	1	18	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a31-7033-b720-ee92ea873545	019e8661-eef9-7300-ac92-1cd27b454749	Awak dah buat dengan sangat bagus.	Du machst das super!	\N	1	19	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a32-7140-ab82-9a6e22be25b3	019e8661-eef9-7300-ac92-1cd27b454749	Jom kita teruskan lagi usaha ni.	Lass uns weitermachen.	\N	1	20	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873f-72e1-73d6-80ac-44ce9db6206d	019e8661-0b15-7008-8f4f-e527ea492d4a	Apa perkara paling buruk yang boleh berlaku?	What is the worst that can happen?	\N	1	1	2026-06-02 07:32:22	2026-06-02 07:32:22
019e873f-72e3-719f-aa22-dbcbb38bba82	019e8661-0b15-7008-8f4f-e527ea492d4a	Harap semuanya berjalan lancar.	Hope for the best.	\N	1	2	2026-06-02 07:32:22	2026-06-02 07:32:22
019e873f-72e4-7167-820d-30848e52a9de	019e8661-0b15-7008-8f4f-e527ea492d4a	Bukan kiamat pun.	It is not the end of the world.	\N	1	3	2026-06-02 07:32:22	2026-06-02 07:32:22
019e873f-72e6-73aa-8e9c-b9fd9ba55250	019e8661-0b15-7008-8f4f-e527ea492d4a	Okay je bagi saya.	I can live with that.	\N	1	4	2026-06-02 07:32:22	2026-06-02 07:32:22
019e873f-72e7-70b2-a4aa-6b6d84748860	019e8661-0b15-7008-8f4f-e527ea492d4a	Itu memang tak mungkin sama sekali.	That is out of the question.	\N	1	5	2026-06-02 07:32:22	2026-06-02 07:32:22
019e8741-16e0-71bb-84f5-06090f37fb21	019e8661-0b15-7008-8f4f-e527ea492d4a	Jom kita selesaikan salah faham ni elok-elok.	Let's clear the air.	\N	1	6	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8741-16e2-7069-a845-b46f8414c357	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya tak ada niat langsung nak buat awak terasa hati.	I didn't mean to offend you.	\N	1	7	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8741-16e4-72dc-b4ff-bf78c0e2781f	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya tak ambil hati pun.	No offense taken.	\N	1	8	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8741-16e5-72d9-a44c-4935eeae00ff	019e8661-0b15-7008-8f4f-e527ea492d4a	Kita sependapat.	We are on the same page.	\N	1	9	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8741-16e6-72ae-81d9-2a2b814350d9	019e8661-0b15-7008-8f4f-e527ea492d4a	Itu satu pandangan yang baik.	That is a good point.	\N	1	10	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8742-a6b6-729d-ab61-d22069452fb2	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya pegang kata-kata awak.	I will take your word for it.	\N	1	11	2026-06-02 07:35:52	2026-06-02 07:35:52
019e8742-a6b8-7016-94ff-ebd68db4e240	019e8661-0b15-7008-8f4f-e527ea492d4a	Masa yang akan menentukan segala-galanya.	Time will tell.	\N	1	12	2026-06-02 07:35:52	2026-06-02 07:35:52
019e8742-a6b9-732b-ab9c-2ddf084c2990	019e8661-0b15-7008-8f4f-e527ea492d4a	Panjang ceritanya kalau nak ikutkan.	It is a long story.	\N	1	13	2026-06-02 07:35:52	2026-06-02 07:35:52
019e8742-a6bb-72c6-859d-30ef347e57fa	019e8661-0b15-7008-8f4f-e527ea492d4a	Dipendekkan cerita...	To make a long story short	\N	1	14	2026-06-02 07:35:52	2026-06-02 07:35:52
019e8742-a6bc-7368-9feb-a14a82fb2d8a	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya saja tengok-tengok je ni.	I am just browsing.	\N	1	15	2026-06-02 07:35:52	2026-06-02 07:35:52
019e8745-4ca6-7021-a293-cec4e4dbd1b7	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya akan fikirkan masak-masak dulu.	I will think it over.	\N	1	16	2026-06-02 07:38:46	2026-06-02 07:38:46
019e8745-4ca8-739c-ac85-05e6c4a1c213	019e8661-0b15-7008-8f4f-e527ea492d4a	Nak ambil, tak nak sudah.	Take it or leave it.	\N	1	17	2026-06-02 07:38:46	2026-06-02 07:38:46
019e8745-4caa-70fe-b944-c317ac9da673	019e8661-0b15-7008-8f4f-e527ea492d4a	Awak dah baca fikiran saya.	You read my mind.	\N	1	19	2026-06-02 07:38:46	2026-06-02 07:38:46
019e8745-4cac-704e-83e4-774ee2b83cec	019e8661-0b15-7008-8f4f-e527ea492d4a	Jom kita akhiri benda ni.	Let's wrap it up.	\N	1	20	2026-06-02 07:38:46	2026-06-02 07:38:46
019e8747-a870-7282-9cd8-837a04fc9977	019e8661-fc4e-7106-b27c-576f54e8b66a	Apa perkara paling buruk yang boleh berlaku?	Was ist das Schlimmste, was passieren kann?	\N	1	1	2026-06-02 07:41:20	2026-06-02 07:41:20
019e8747-a872-71cf-b5f0-560de36e9f1b	019e8661-fc4e-7106-b27c-576f54e8b66a	Harap semuanya berjalan lancar.	Hoffen wir das Beste.	\N	1	2	2026-06-02 07:41:20	2026-06-02 07:41:20
019e8747-a873-7034-9bf9-4bcfdab0d548	019e8661-fc4e-7106-b27c-576f54e8b66a	Bukan kiamat pun.	Es ist kein Weltuntergang.	\N	1	3	2026-06-02 07:41:20	2026-06-02 07:41:20
019e8747-a874-735f-a4e1-050c4fca4416	019e8661-fc4e-7106-b27c-576f54e8b66a	Okay je bagi saya.	Damit kann ich leben.	\N	1	4	2026-06-02 07:41:20	2026-06-02 07:41:20
019e8747-a875-733b-9ad0-a6b13fe98ef7	019e8661-fc4e-7106-b27c-576f54e8b66a	Itu memang tak mungkin sama sekali.	Das kommt gar nicht infrage.	\N	1	5	2026-06-02 07:41:20	2026-06-02 07:41:20
019e874b-0f2f-709d-a89e-d8f1a7635eca	019e8661-fc4e-7106-b27c-576f54e8b66a	Jom kita selesaikan salah faham ni elok-elok.	Lass uns die Sache klären.	\N	1	6	2026-06-02 07:45:03	2026-06-02 07:45:03
019e874b-0f31-700a-84bd-9f757f775108	019e8661-fc4e-7106-b27c-576f54e8b66a	Saya tak ada niat langsung nak buat awak terasa hati.	Ich wollte dich nicht kränken.	\N	1	7	2026-06-02 07:45:03	2026-06-02 07:45:03
019e874b-0f33-728b-ad22-973437673b57	019e8661-fc4e-7106-b27c-576f54e8b66a	Saya tak ambil hati pun.	Schon gut, ich nehm's dir nicht übel.	\N	1	8	2026-06-02 07:45:03	2026-06-02 07:45:03
019e874b-0f34-7372-9478-6aa3f2d1c8b6	019e8661-fc4e-7106-b27c-576f54e8b66a	Kita sependapat.	Wir sind uns einig.	\N	1	9	2026-06-02 07:45:03	2026-06-02 07:45:03
019e874b-0f35-704a-88ec-81d4ac4cb9d5	019e8661-fc4e-7106-b27c-576f54e8b66a	Itu satu pandangan yang baik.	Das ist ein gutes Argument.	\N	1	10	2026-06-02 07:45:03	2026-06-02 07:45:03
019e874d-ab8c-7194-9115-c1f5e8effa71	019e8661-fc4e-7106-b27c-576f54e8b66a	Saya pegang kata-kata awak.	Ich verlass mich auf dein Wort.	\N	1	11	2026-06-02 07:47:54	2026-06-02 07:47:54
019e874d-ab8e-7158-96ac-5ed47d60c46a	019e8661-fc4e-7106-b27c-576f54e8b66a	Masa yang akan menentukan segala-galanya.	Kommt Zeit, kommt Rat.	\N	1	12	2026-06-02 07:47:54	2026-06-02 07:47:54
019e874d-ab8f-7032-ad07-dfe86ea25825	019e8661-fc4e-7106-b27c-576f54e8b66a	Panjang ceritanya kalau nak ikutkan.	Das ist eine lange Geschichte.	\N	1	13	2026-06-02 07:47:54	2026-06-02 07:47:54
019e874d-ab90-7377-a007-7db340730627	019e8661-fc4e-7106-b27c-576f54e8b66a	Dipendekkan cerita...	Um es kurz zu machen	\N	1	14	2026-06-02 07:47:54	2026-06-02 07:47:54
019e874d-ab92-73a0-9ebd-5b6c02d973bd	019e8661-fc4e-7106-b27c-576f54e8b66a	Saya saja tengok-tengok je ni.	Ich gucke nur.	\N	1	15	2026-06-02 07:47:54	2026-06-02 07:47:54
019e8745-4ca9-7155-bafc-68338a9d6e85	019e8661-0b15-7008-8f4f-e527ea492d4a	Benda ni menepati standard yang ditetapkan.	It is up to par.	\N	1	18	2026-06-02 07:38:46	2026-06-02 07:49:46
019e8750-1bb6-7000-aada-3a743bd4ffdd	019e8661-fc4e-7106-b27c-576f54e8b66a	Saya akan fikirkan masak-masak dulu.	Ich überleg's mir noch mal in Ruhe.	\N	1	16	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bb8-7175-b55e-699b0686c16a	019e8661-fc4e-7106-b27c-576f54e8b66a	Nak ambil, tak nak sudah.	Friss oder stirb.	\N	1	17	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bba-7133-8eee-6e54d0ae9b2a	019e8661-fc4e-7106-b27c-576f54e8b66a	Benda ni menepati standard yang ditetapkan.	Das entspricht dem Standard.	\N	1	18	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bbb-7245-84ef-1d1e97105247	019e8661-fc4e-7106-b27c-576f54e8b66a	Awak dah baca fikiran saya.	Du hast meine Gedanken gelesen.	\N	1	19	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bbc-7175-bda9-5e0b95649241	019e8661-fc4e-7106-b27c-576f54e8b66a	Jom kita akhiri benda ni.	Lass uns zum Schluss kommen.	\N	1	20	2026-06-02 07:50:34	2026-06-02 07:50:34
019e875a-cff8-7013-a9cc-51aaf4503057	019e8661-212a-71ce-9281-dba09436e383	Lega mendengarnya.	That is a relief to hear.	\N	1	1	2026-06-02 08:02:16	2026-06-02 08:02:16
019e875a-cffa-73cd-8e77-caadd6f9800c	019e8661-212a-71ce-9281-dba09436e383	Macam terlalu bagus sangat sampai rasa susah nak percaya.	It is too good to be true.	\N	1	2	2026-06-02 08:02:16	2026-06-02 08:02:16
019e875a-cffb-736b-8faa-8ac13e072fd7	019e8661-212a-71ce-9281-dba09436e383	Jangan cepat sangat buat andaian sendiri.	Don't jump to conclusions.	\N	1	3	2026-06-02 08:02:16	2026-06-02 08:02:16
019e875a-cffc-72b0-86fa-dededc555c99	019e8661-212a-71ce-9281-dba09436e383	Biar kita dengar dulu penjelasan mereka sampai habis.	Let's hear them out.	\N	1	4	2026-06-02 08:02:16	2026-06-02 08:02:16
019e875a-cffd-7269-b717-9b5545e72a08	019e8661-212a-71ce-9281-dba09436e383	Saya faham point yang awak cuba sampaikan.	I see your point.	\N	1	5	2026-06-02 08:02:16	2026-06-02 08:02:16
019e875d-3782-718d-a136-0ab0fddf5a7d	019e8661-212a-71ce-9281-dba09436e383	Itu satu pandangan berasas.	That is a fair point.	\N	1	6	2026-06-02 08:04:53	2026-06-02 08:04:53
019e875d-3784-73d9-853b-d01eadf77543	019e8661-212a-71ce-9281-dba09436e383	Saya mengaku saya salah.	I stand corrected.	\N	1	7	2026-06-02 08:04:53	2026-06-02 08:04:53
019e875d-3785-7293-83c1-0cb3ff1b5b8e	019e8661-212a-71ce-9281-dba09436e383	Jom kita bertolak ansur.	Let's meet halfway.	\N	1	8	2026-06-02 08:04:53	2026-06-02 08:04:53
019e875d-3787-7280-9bf5-fa9d874a47c0	019e8661-212a-71ce-9281-dba09436e383	Benda tu dah di luar bidang kuasa saya.	It is out of my hands.	\N	1	9	2026-06-02 08:04:53	2026-06-02 08:04:53
019e875d-3788-7187-820f-af6c19618b68	019e8661-212a-71ce-9281-dba09436e383	Saya sedia membantu awak bila-bila masa.	I am at your service.	\N	1	10	2026-06-02 08:04:53	2026-06-02 08:04:53
019e8761-0bd9-7269-aafa-0667665308de	019e8661-212a-71ce-9281-dba09436e383	Boleh tolong tengok-tengokkan kejap benda ni?	Can you keep an eye on this?	\N	1	11	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8761-0bdb-7215-8539-1b561efedda0	019e8661-212a-71ce-9281-dba09436e383	Biar saya tolong tengokkan.	I will watch over it.	\N	1	12	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8761-0bdc-731e-8758-01494d44e9f9	019e8661-212a-71ce-9281-dba09436e383	Jangan bagi hilang tau.	Don't lose it.	\N	1	13	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8761-0bde-70f9-8287-95225568244b	019e8661-212a-71ce-9281-dba09436e383	Saya akan simpan elok-elok	I will keep it safe.	\N	1	14	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8761-0bdf-70a1-99c9-73966f71bd47	019e8661-212a-71ce-9281-dba09436e383	Kat mana awak dengar cerita tu?	Where did you hear that?	\N	1	15	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8762-e7ce-7278-81bc-30da49a984d6	019e8661-212a-71ce-9281-dba09436e383	Itu cuma khabar angin je.	It is just a rumor.	\N	1	16	2026-06-02 08:11:06	2026-06-02 08:11:06
019e8762-e7d0-7024-bca5-aa902b3950f7	019e8661-212a-71ce-9281-dba09436e383	Jangan percaya bulat-bulat cerita tu.	Take it with a grain of salt.	\N	1	17	2026-06-02 08:11:06	2026-06-02 08:11:06
019e8762-e7d1-708a-95e7-be5f6f2e86a0	019e8661-212a-71ce-9281-dba09436e383	Kita tengok je nanti.	We will see about that.	\N	1	18	2026-06-02 08:11:06	2026-06-02 08:11:06
019e8762-e7d3-7096-80e4-c10c9cde2e04	019e8661-212a-71ce-9281-dba09436e383	Itu pun dah kira baik daripada tak ada langsung.	It is better than nothing.	\N	1	19	2026-06-02 08:11:06	2026-06-02 08:11:06
019e8762-e7d4-7050-8c54-fa329ab6804e	019e8661-212a-71ce-9281-dba09436e383	Jom kita kekalkan semangat ni.	Let's keep the momentum going.	\N	1	20	2026-06-02 08:11:06	2026-06-02 08:11:06
019e8764-e57a-7056-8e37-29b08d94d438	019e8662-141b-71a7-8a72-d1965f854414	Lega mendengarnya.	Ein Glück!	\N	1	1	2026-06-02 08:13:17	2026-06-02 08:13:17
019e8764-e57c-71c3-acdc-61af26f0a227	019e8662-141b-71a7-8a72-d1965f854414	Macam terlalu bagus sangat sampai rasa susah nak percaya.	Das ist zu schön, um wahr zu sein.	\N	1	2	2026-06-02 08:13:17	2026-06-02 08:13:17
019e8764-e57d-72ff-8178-34b6d9f4b15e	019e8662-141b-71a7-8a72-d1965f854414	Jangan cepat sangat buat andaian sendiri.	Zieh nicht so schnell voreilige Schlüsse.	\N	1	3	2026-06-02 08:13:17	2026-06-02 08:13:17
019e8764-e57e-72d6-b6db-0723314ba284	019e8662-141b-71a7-8a72-d1965f854414	Biar kita dengar dulu penjelasan mereka sampai habis.	Lass sie uns erst mal anhören.	\N	1	4	2026-06-02 08:13:17	2026-06-02 08:13:17
019e8764-e57f-716a-bca2-36985e2e9862	019e8662-141b-71a7-8a72-d1965f854414	Saya faham maksud yang awak cuba sampaikan.	Ich verstehe, was du meinst.	\N	1	5	2026-06-02 08:13:17	2026-06-02 08:13:17
019e8768-3858-7023-ad3a-df84609f8109	019e8662-141b-71a7-8a72-d1965f854414	Itu satu pandangan yang berasas.	Das ist ein berechtigter Punkt.	\N	1	6	2026-06-02 08:16:54	2026-06-02 08:16:54
019e8768-385a-7108-9a8e-e318ef40f713	019e8662-141b-71a7-8a72-d1965f854414	Saya mengaku saya salah.	Ich lasse mich gerne korrigieren.	\N	1	7	2026-06-02 08:16:54	2026-06-02 08:16:54
019e8768-385b-73e7-a63e-956b70b7d857	019e8662-141b-71a7-8a72-d1965f854414	Jom kita bertolak ansur.	Lass uns einen Kompromiss finden.	\N	1	8	2026-06-02 08:16:54	2026-06-02 08:16:54
019e8768-385d-713b-8ec6-60a5247ec860	019e8662-141b-71a7-8a72-d1965f854414	Benda tu dah di luar bidang kuasa saya.	Das liegt nicht mehr in meiner Hand.	\N	1	9	2026-06-02 08:16:54	2026-06-02 08:16:54
019e8768-385e-7107-844d-2f353947ecc3	019e8662-141b-71a7-8a72-d1965f854414	Saya sedia membantu awak bila-bila masa.	Ich stehe dir gerne zur Verfügung.	\N	1	10	2026-06-02 08:16:54	2026-06-02 08:16:54
019e8769-87e3-7352-82c5-354d410a929e	019e8662-141b-71a7-8a72-d1965f854414	Boleh tolong tengok-tengokkan kejap benda ni?	Kannst du da mal kurz ein Auge drauf werfen?	\N	1	11	2026-06-02 08:18:20	2026-06-02 08:18:20
019e8769-87e5-72c1-9adf-884b71ee0428	019e8662-141b-71a7-8a72-d1965f854414	Biar saya tolong tengokkan	Ich passe drauf auf.	\N	1	12	2026-06-02 08:18:20	2026-06-02 08:18:20
019e8769-87e6-7082-a0f9-c74b187486d1	019e8662-141b-71a7-8a72-d1965f854414	Jangan bagi hilang tau.	Verlier das bloß nicht!	\N	1	13	2026-06-02 08:18:20	2026-06-02 08:18:20
019e8769-87e8-7156-a93e-e915e4df52b5	019e8662-141b-71a7-8a72-d1965f854414	Saya akan simpan elok-elok	Ich passe gut darauf auf.	\N	1	14	2026-06-02 08:18:20	2026-06-02 08:18:20
019e8769-87e9-70ba-80f3-857be3c901f2	019e8662-141b-71a7-8a72-d1965f854414	Kat mana awak dengar cerita tu?	Wo hast du das denn gehört?	\N	1	15	2026-06-02 08:18:20	2026-06-02 08:18:20
019e876c-a06f-7379-8b61-68e58f805b91	019e8662-141b-71a7-8a72-d1965f854414	Itu cuma khabar angin je.	Das ist nur ein Gerücht.	\N	1	16	2026-06-02 08:21:43	2026-06-02 08:21:43
019e876c-a071-730d-abaa-8b96554ee254	019e8662-141b-71a7-8a72-d1965f854414	Jangan percaya bulat-bulat cerita tu.	Glaub nicht alles sofort.	\N	1	17	2026-06-02 08:21:43	2026-06-02 08:21:43
019e876c-a072-7062-9d9c-7a598b9f828e	019e8662-141b-71a7-8a72-d1965f854414	Kita tengok je nanti.	Das werden wir ja sehen.	\N	1	18	2026-06-02 08:21:43	2026-06-02 08:21:43
019e876c-a074-7334-97fc-db056cd4ebd3	019e8662-141b-71a7-8a72-d1965f854414	Itu pun dah kira baik daripada tak ada langsung.	Besser als nichts.	\N	1	19	2026-06-02 08:21:43	2026-06-02 08:21:43
019e876c-a075-73fd-9332-32cb669c5210	019e8662-141b-71a7-8a72-d1965f854414	Jom kita kekalkan semangat ni.	Lass uns am Ball bleiben!	\N	1	20	2026-06-02 08:21:43	2026-06-02 08:21:43
019e8770-4d9c-7091-a399-380703232b44	019e8661-31a0-7221-b666-2d4327bb2cb5	Jelas tak setakat ni?	Is that clear?	\N	1	1	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8770-4d9e-70b4-b82d-67e3e0d24338	019e8661-31a0-7221-b666-2d4327bb2cb5	Sangat jelas.	It is crystal clear.	\N	1	2	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8770-4da0-71a9-a059-7a632df86e10	019e8661-31a0-7221-b666-2d4327bb2cb5	Perasaan saya bercampur-baur pasal benda ni.	I have mixed feelings about this.	\N	1	3	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8770-4da1-73bf-b2a3-ded288a522eb	019e8661-31a0-7221-b666-2d4327bb2cb5	Jangan kita rumitkan lagi keadaan ni.	Let's not complicate things.	\N	1	4	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8770-4da2-71ae-ba9e-982799457a3b	019e8661-31a0-7221-b666-2d4327bb2cb5	Benda tu kacang je.	It is a walk in the park.	\N	1	5	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8772-9b8d-704e-b525-451d0cbe7331	019e8661-31a0-7221-b666-2d4327bb2cb5	Saya akan ambil maklum tentang perkara tu.	I will take note of that.	\N	1	6	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8772-9b8f-708d-af96-9f932d56c087	019e8661-31a0-7221-b666-2d4327bb2cb5	Jangan ambil ringan perkara tu.	Don't take it for granted.	\N	1	7	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8772-9b90-700d-887d-8dfd2e07dda4	019e8661-31a0-7221-b666-2d4327bb2cb5	Kita kena bertindak cepat.	We need to act fast.	\N	1	8	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8772-9b91-7260-a57c-d059e65eb166	019e8661-31a0-7221-b666-2d4327bb2cb5	Masa sangat penting sekarang ni.	Time is of the essence.	\N	1	9	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8772-9b92-73bc-a4ff-60a14f502f04	019e8661-31a0-7221-b666-2d4327bb2cb5	Boleh tolong ceritakan pada saya apa yang jadi?	Can you fill me in?	\N	1	10	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8775-e5cd-7282-8db5-960b28c5a871	019e8661-31a0-7221-b666-2d4327bb2cb5	Saya sedia mendengar.	I am all ears.	\N	1	11	2026-06-02 08:31:51	2026-06-02 08:31:51
019e8775-e5cf-7059-815c-fb414cc15a9b	019e8661-31a0-7221-b666-2d4327bb2cb5	Itu satu pilihan alternatif yang baik.	That's a good alternative.	\N	1	12	2026-06-02 08:31:51	2026-06-02 08:31:51
019e8775-e5d1-70f4-8ebb-b48043c0f7bd	019e8661-31a0-7221-b666-2d4327bb2cb5	Satu keputusan yang agak sukar untuk dibuat.	It is a tough call.	\N	1	13	2026-06-02 08:31:51	2026-06-02 08:31:51
019e8775-e5d2-70ea-b303-4250a93e94a3	019e8661-31a0-7221-b666-2d4327bb2cb5	Biar kita fikirkan dulu semalaman sebelum buat keputusan esok.	Let's sleep on it.	\N	1	14	2026-06-02 08:31:51	2026-06-02 08:31:51
019e8775-e5d3-735f-9e7c-dbd57b553a0a	019e8661-31a0-7221-b666-2d4327bb2cb5	Saya akan sentiasa sokong awak.	I will stand by you.	\N	1	15	2026-06-02 08:31:51	2026-06-02 08:31:51
019e8778-ed10-7199-bd6c-d099dcddf8f4	019e8661-31a0-7221-b666-2d4327bb2cb5	Yang lepas tu lepaslah.	Don't look back.	\N	1	16	2026-06-02 08:35:09	2026-06-02 08:35:09
019e8778-ed12-714e-9c78-a0bde8295379	019e8661-31a0-7221-b666-2d4327bb2cb5	Fikirkan tentang sudut positifnya.	Focus on the bright side.	\N	1	17	2026-06-02 08:35:09	2026-06-02 08:35:09
019e8778-ed13-7376-a77f-7cd152654973	019e8661-31a0-7221-b666-2d4327bb2cb5	Ada hikmah tersembunyi di sebalik apa yang berlaku.	It is a blessing in disguise.	\N	1	18	2026-06-02 08:35:09	2026-06-02 08:35:09
019e8778-ed15-7272-9a03-87c9fafdddda	019e8661-31a0-7221-b666-2d4327bb2cb5	Awak dah berada di landasan yang betul.	You are on the right track.	\N	1	19	2026-06-02 08:35:09	2026-06-02 08:35:09
019e8778-ed17-7349-8d12-20eafaf61dc5	019e8661-31a0-7221-b666-2d4327bb2cb5	Kita dah hampir sampai ke garisan penamat.	We are almost at the finish line.	\N	1	20	2026-06-02 08:35:09	2026-06-02 08:35:09
019e8787-7d02-70b0-b000-08b3ef7c9c2f	019e8662-2583-713a-9e42-56896185f95f	Jelas tak setakat ni?	Alles verständlich soweit?	\N	1	1	2026-06-02 08:51:04	2026-06-02 08:51:04
019e8787-7d04-7176-8fc0-9a470a82fa6c	019e8662-2583-713a-9e42-56896185f95f	Sangat jelas.	Glasklar.	\N	1	2	2026-06-02 08:51:04	2026-06-02 08:51:04
019e8787-7d05-71a7-b947-d8237b3eb1cc	019e8662-2583-713a-9e42-56896185f95f	Perasaan saya bercampur-baur pasal benda ni.	Ich habe da gemischte Gefühle.	\N	1	3	2026-06-02 08:51:04	2026-06-02 08:51:04
019e8787-7d06-701b-88b5-907d10698d04	019e8662-2583-713a-9e42-56896185f95f	Jangan kita rumitkan lagi keadaan ni.	Lass uns die Sache nicht unnötig kompliziert machen.	\N	1	4	2026-06-02 08:51:04	2026-06-02 08:51:04
019e8787-7d08-71f4-aee9-7938c07dbd18	019e8662-2583-713a-9e42-56896185f95f	Benda tu kacang je.	Das ist ein Klacks.	\N	1	5	2026-06-02 08:51:04	2026-06-02 08:51:04
019e8789-0da2-725e-b06e-fc6eae6b9e8a	019e8662-2583-713a-9e42-56896185f95f	Saya akan ambil maklum tentang perkara tu.	Ich merke mir das.	\N	1	6	2026-06-02 08:52:46	2026-06-02 08:52:46
019e8789-0da4-702d-9905-c5b42ca67b19	019e8662-2583-713a-9e42-56896185f95f	Jangan ambil ringan perkara tu.	Nimm das nicht als selbstverständlich.	\N	1	7	2026-06-02 08:52:46	2026-06-02 08:52:46
019e8789-0da5-7054-9da1-a8a62e7197a7	019e8662-2583-713a-9e42-56896185f95f	Kita kena bertindak cepat.	Wir müssen schnell handeln.	\N	1	8	2026-06-02 08:52:46	2026-06-02 08:52:46
019e8789-0da7-716a-b5ef-2ab2ea69a59b	019e8662-2583-713a-9e42-56896185f95f	Masa sangat penting sekarang ni.	Die Zeit drängt.	\N	1	9	2026-06-02 08:52:46	2026-06-02 08:52:46
019e8789-0da8-7304-8904-e1fb3defc37b	019e8662-2583-713a-9e42-56896185f95f	Boleh tolong ceritakan pada saya apa yang jadi?	Kannst du mich kurz auf den neuesten Stand bringen?	\N	1	10	2026-06-02 08:52:46	2026-06-02 08:52:46
019e878b-5616-7005-a4e9-5f93938309a2	019e8662-2583-713a-9e42-56896185f95f	Saya sedia mendengar.	Ich bin ganz Ohr.	\N	1	11	2026-06-02 08:55:16	2026-06-02 08:55:16
019e878b-5618-72ee-8ea1-e0aad08e3b85	019e8662-2583-713a-9e42-56896185f95f	Itu satu pilihan alternatif yang baik.	Das ist eine gute Alternative.	\N	1	12	2026-06-02 08:55:16	2026-06-02 08:55:16
019e878b-5619-73e1-86cb-0645ff1e3dde	019e8662-2583-713a-9e42-56896185f95f	Satu keputusan yang agak sukar untuk dibuat.	Das ist eine schwere Entscheidung.	\N	1	13	2026-06-02 08:55:16	2026-06-02 08:55:16
019e878b-561a-715d-9a83-87d2acbb2ddf	019e8662-2583-713a-9e42-56896185f95f	Biar kita fikirkan dulu semalaman sebelum buat keputusan esok.	Lass uns da erst mal eine Nacht drüber schlafen.	\N	1	14	2026-06-02 08:55:16	2026-06-02 08:55:16
019e878b-561b-7260-a2e9-233596a72a75	019e8662-2583-713a-9e42-56896185f95f	Saya akan sentiasa sokong awak.	Ich stehe hinter dir.	\N	1	15	2026-06-02 08:55:16	2026-06-02 08:55:16
019e878d-e2f6-71a0-9eb2-ef664ea134e7	019e8662-2583-713a-9e42-56896185f95f	Yang lepas tu lepaslah.	Blick nach vorn.	\N	1	16	2026-06-02 08:58:03	2026-06-02 08:58:03
019e878d-e2f8-7189-8815-f1ce449612a3	019e8662-2583-713a-9e42-56896185f95f	Fikirkan tentang sudut positifnya.	Sieh es mal von der positiven Seite.	\N	1	17	2026-06-02 08:58:03	2026-06-02 08:58:03
019e878d-e2f9-7003-9ddb-9708b24e30e9	019e8662-2583-713a-9e42-56896185f95f	Ada hikmah tersembunyi di sebalik apa yang berlaku.	Ein Glück im Unglück.	\N	1	18	2026-06-02 08:58:03	2026-06-02 08:58:03
019e878d-e2fb-708c-901d-3d7f4e85428b	019e8662-2583-713a-9e42-56896185f95f	Awak dah berada di landasan yang betul.	Du bist auf dem richtigen Weg.	\N	1	19	2026-06-02 08:58:03	2026-06-02 08:58:03
019e878d-e2fc-71dc-9b2a-eda16e088ec3	019e8662-2583-713a-9e42-56896185f95f	Kita dah hampir sampai ke garisan penamat.	Wir sind fast an der Ziellinie.	\N	1	20	2026-06-02 08:58:03	2026-06-02 08:58:03
019e8792-6576-71e7-a967-56dec7dffa51	019e8661-46ce-7395-8698-7e8833de16bc	Apa jawapan muktamad awak?	What is your final answer?	\N	1	1	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8792-6578-706e-9a8b-d942e912169b	019e8661-46ce-7395-8698-7e8833de16bc	Saya kena tenangkan fikiran kejap.	I need to clear my head.	\N	1	2	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8792-6579-70a5-bcc1-d1492222ab26	019e8661-46ce-7395-8698-7e8833de16bc	Jangan gopoh sangat bertindak sebelum masa yang sesuai.	Don't jump the gun.	\N	1	3	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8792-657a-73cd-90e6-11ae316ab89a	019e8661-46ce-7395-8698-7e8833de16bc	Benda tu jadi tanpa disangka-sangka.	It is out of the blue.	\N	1	4	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8792-657c-70fd-af12-d97ec2303925	019e8661-46ce-7395-8698-7e8833de16bc	Jom kita mudahkan je benda ni	Let's keep it simple.	\N	1	5	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8798-0897-71cf-a81d-690a6a7d1c42	019e8661-46ce-7395-8698-7e8833de16bc	Biar saya yang uruskan hal tu.	I will take care of it.	\N	1	6	2026-06-02 09:09:08	2026-06-02 09:09:08
019e8798-0899-7055-9849-054a2754b67e	019e8661-46ce-7395-8698-7e8833de16bc	Itu satu keuntungan untuk kita.	That is a win for us.	\N	1	7	2026-06-02 09:09:08	2026-06-02 09:09:08
019e8798-089a-7305-9671-10a45ae00f8f	019e8661-46ce-7395-8698-7e8833de16bc	Jangan tamak sangat bila dah beruntung.	Don't push your luck.	\N	1	8	2026-06-02 09:09:08	2026-06-02 09:09:08
019e8798-089b-72e4-bb45-6dcd2efd882b	019e8661-46ce-7395-8698-7e8833de16bc	Dah terang-terang terpancar kat muka awak.	It is written all over your face.	\N	1	9	2026-06-02 09:09:08	2026-06-02 09:09:08
019e8798-089d-733f-864c-36d19bba180e	019e8661-46ce-7395-8698-7e8833de16bc	Cakap berterus-terang je walaupun pahit.	Let's call a spade a spade.	\N	1	10	2026-06-02 09:09:08	2026-06-02 09:09:08
019e879b-238e-7140-a566-c353e1e0df8f	019e8661-46ce-7395-8698-7e8833de16bc	Duit tunai saya dah nak habis ni	I am running low on cash.	\N	1	11	2026-06-02 09:12:31	2026-06-02 09:12:31
019e879b-2390-71e5-be5f-d81a38fd550d	019e8661-46ce-7395-8698-7e8833de16bc	Dah ada kat hujung lidah saya dah ni.	It is on the tip of my tongue.	\N	1	12	2026-06-02 09:12:31	2026-06-02 09:12:31
019e879b-2391-7284-b650-86f38e1f81df	019e8661-46ce-7395-8698-7e8833de16bc	Jangan buat kecoh kat sini.	Don't make a scene.	\N	1	13	2026-06-02 09:12:31	2026-06-02 09:12:31
019e879b-2392-71ff-9706-feddb83b97c8	019e8661-46ce-7395-8698-7e8833de16bc	Kecil betul dunia ni.	It's a small world.	\N	1	14	2026-06-02 09:12:31	2026-06-02 09:12:31
019e879b-2394-7097-9bd1-fedf1b5277c5	019e8661-46ce-7395-8698-7e8833de16bc	Jom kita bayar asing-asing bayar makan ni.	Let's split the bill.	\N	1	15	2026-06-02 09:12:31	2026-06-02 09:12:31
019e879d-88a1-70a0-9835-fb4b740f796d	019e8661-46ce-7395-8698-7e8833de16bc	Saya tak ada mood la sekarang ni.	I am not in the mood.	\N	1	16	2026-06-02 09:15:08	2026-06-02 09:15:08
019e879d-88a3-701f-a5be-fcd959765787	019e8661-46ce-7395-8698-7e8833de16bc	Kuatkan semangat.	Keep your chin up.	\N	1	17	2026-06-02 09:15:08	2026-06-02 09:15:08
019e879d-88a4-717c-aa83-8b434c1b2fff	019e8661-46ce-7395-8698-7e8833de16bc	Lebih baik lambat daripada tak buat langsung.	It is better late than never.	\N	1	18	2026-06-02 09:15:08	2026-06-02 09:15:08
019e879d-88a6-7118-8a54-b9948fa5656b	019e8661-46ce-7395-8698-7e8833de16bc	Awak boleh percayakan saya.	You can count on me.	\N	1	19	2026-06-02 09:15:08	2026-06-02 09:15:08
019e879d-88a7-70b2-b428-ce86a8a44431	019e8661-46ce-7395-8698-7e8833de16bc	Kita akhirnya dah berjaya cecah empat ratus ayat!	We finally hit four hundred!	\N	1	20	2026-06-02 09:15:08	2026-06-02 09:15:08
019e87a0-7e30-71f7-a25d-3708d43381d1	019e8662-3a3c-73f1-ac0a-a39512236e43	Apa jawapan muktamad awak?	Was ist deine endgültige Antwort?	\N	1	1	2026-06-02 09:18:22	2026-06-02 09:18:22
019e87a0-7e32-725e-b07b-d7b963bb0f7a	019e8662-3a3c-73f1-ac0a-a39512236e43	Saya kena tenangkan fikiran kejap.	Ich muss mal kurz den Kopf freikriegen.	\N	1	2	2026-06-02 09:18:22	2026-06-02 09:18:22
019e87a0-7e33-72b5-ad57-8747d22296c4	019e8662-3a3c-73f1-ac0a-a39512236e43	Jangan gopoh sangat bertindak sebelum masa yang sesuai.	Sei nicht so voreilig.	\N	1	3	2026-06-02 09:18:22	2026-06-02 09:18:22
019e87a0-7e34-703a-9a02-3a587c6a46d1	019e8662-3a3c-73f1-ac0a-a39512236e43	Benda tu jadi tanpa disangka-sangka.	Das kam völlig aus dem Nichts.	\N	1	4	2026-06-02 09:18:22	2026-06-02 09:18:22
019e87a0-7e35-7115-9cb3-f0719103c749	019e8662-3a3c-73f1-ac0a-a39512236e43	Jom kita mudahkan je benda ni	Lass es uns einfach halten.	\N	1	5	2026-06-02 09:18:22	2026-06-02 09:18:22
019e87a3-2253-716f-bdc9-a2eda161810e	019e8662-3a3c-73f1-ac0a-a39512236e43	Biar saya yang uruskan hal tu.	Ich kümmere mich darum.	\N	1	6	2026-06-02 09:21:15	2026-06-02 09:21:15
019e87a3-2255-703f-8c37-f0c0a756e04a	019e8662-3a3c-73f1-ac0a-a39512236e43	Itu satu keuntungan untuk kita.	Das ist ein Riesenerfolg für uns.	\N	1	7	2026-06-02 09:21:15	2026-06-02 09:21:15
019e87a3-2256-71d2-95ae-aed3ecbf2e8a	019e8662-3a3c-73f1-ac0a-a39512236e43	Jangan tamak sangat bila dah beruntung.	Fordere dein Glück nicht heraus.	\N	1	8	2026-06-02 09:21:15	2026-06-02 09:21:15
019e87a3-2258-737c-bbd2-c16f9883b507	019e8662-3a3c-73f1-ac0a-a39512236e43	Dah terang-terang terpancar kat muka awak.	Das steht dir ins Gesicht geschrieben.	\N	1	9	2026-06-02 09:21:15	2026-06-02 09:21:15
019e87a3-2259-73bb-8064-0c2ad72e2f43	019e8662-3a3c-73f1-ac0a-a39512236e43	Cakap berterus-terang je walaupun pahit.	Lass uns das Kind beim Namen nennen.	\N	1	10	2026-06-02 09:21:15	2026-06-02 09:21:15
019e87a6-cfec-7211-b3f7-5a70ed9d34b7	019e8662-3a3c-73f1-ac0a-a39512236e43	Duit tunai saya dah nak habis ni	Ich habe gerade kaum Bargeld.	\N	1	11	2026-06-02 09:25:16	2026-06-02 09:25:16
019e87a6-cfee-7392-af1d-5c7f88f8235e	019e8662-3a3c-73f1-ac0a-a39512236e43	Dah ada kat hujung lidah saya dah ni.	Es liegt mir auf der Zunge.	\N	1	12	2026-06-02 09:25:16	2026-06-02 09:25:16
019e87a6-cfef-7394-9375-5209066d3d2d	019e8662-3a3c-73f1-ac0a-a39512236e43	Jangan buat kecoh kat sini.	Mach hier keine Szene.	\N	1	13	2026-06-02 09:25:16	2026-06-02 09:25:16
019e87a6-cff1-712e-a776-a1c258478c82	019e8662-3a3c-73f1-ac0a-a39512236e43	Kecil betul dunia ni.	Die Welt ist echt klein.	\N	1	14	2026-06-02 09:25:16	2026-06-02 09:25:16
019e87a6-cff2-7117-9f6c-45357e46d99f	019e8662-3a3c-73f1-ac0a-a39512236e43	Jom kita bayar asing-asing bayar makan ni.	Lass uns getrennt bezahlen.	\N	1	15	2026-06-02 09:25:16	2026-06-02 09:25:16
019e87a8-f751-72b8-ab4a-dcf928067d62	019e8662-3a3c-73f1-ac0a-a39512236e43	Saya tak ada mood la sekarang ni.	Ich bin gerade nicht in Stimmung.	\N	1	16	2026-06-02 09:27:38	2026-06-02 09:27:38
019e87a8-f753-72e7-aaff-4d781a50191d	019e8662-3a3c-73f1-ac0a-a39512236e43	Kuatkan semangat.	Lass den Kopf nicht hängen!	\N	1	17	2026-06-02 09:27:38	2026-06-02 09:27:38
019e87a8-f755-7025-9d52-23f674a0462d	019e8662-3a3c-73f1-ac0a-a39512236e43	Lebih baik lambat daripada tak buat langsung.	Besser spät als nie.	\N	1	18	2026-06-02 09:27:38	2026-06-02 09:27:38
019e87a8-f756-735f-8a0e-940460d38c23	019e8662-3a3c-73f1-ac0a-a39512236e43	Awak boleh percayakan saya.	Du kannst dich auf mich verlassen.	\N	1	19	2026-06-02 09:27:38	2026-06-02 09:27:38
019e87a8-f757-732b-bb2b-66266d3704e5	019e8662-3a3c-73f1-ac0a-a39512236e43	Kita akhirnya dah berjaya cecah empat ratus ayat!	Wir haben endlich die Vierhundert geschafft!	\N	1	20	2026-06-02 09:27:38	2026-06-02 09:27:38
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: subscription_plans; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.subscription_plans (id, name, slug, price_myr, stripe_price_id, is_active, created_at, updated_at, member_limit, duration_months) FROM stdin;
019e71d6-0867-72b2-92e5-92c6051f90fb	Monthly Premium	monthly-premium	20.00	\N	f	2026-05-29 03:45:12	2026-05-29 04:44:42	\N	\N
019e71d6-086f-7206-b8a1-f2e6f8f0780b	Promo 1 Tahun	lifetime	100.00	\N	t	2026-05-29 03:45:12	2026-05-29 12:24:31	100	12
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.subscriptions (id, user_id, plan_id, stripe_subscription_id, stripe_status, auto_renew, ends_at, trial_ends_at, created_at, updated_at, payment_gateway, is_lifetime) FROM stdin;
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.transactions (id, user_id, stripe_invoice_id, subscription_id, amount, currency, status, paid_at, created_at, updated_at, payment_gateway) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.users (id, name, email, email_verified_at, password, role, stripe_id, pm_type, pm_last_four, remember_token, created_at, updated_at) FROM stdin;
019e71d6-0951-71cc-a01d-3d315e9f0c21	Admin Vocabulary	admin@vocabulary.com	\N	$2y$12$fTWOo1sJIDFm/tDVEX7zuOPKGgOS7zoeXAD7FeAVBQlthGbqFZty.	admin	\N	\N	\N	\N	2026-05-29 03:45:13	2026-05-29 03:45:13
019e73af-7105-714e-8d4f-0658f4579a11	Muhammad Akmal	akmallmuhammad27@gmail.com	\N	$2y$12$XR.CPEw1ZrBHN1BSP49eaOxyiPdgWhxMuc0qbKZFcPqqA4/C45YrC	user	\N	\N	\N	\N	2026-05-29 12:22:18	2026-05-29 12:22:18
019e7d20-734e-70a4-8324-2e7509ef6c12	Aiman Faris Yaafar	aimanfarisyaafar@gmail.com	\N	$2y$12$vGvckJTBAvr1cNTmQ0maR.UPIvMXWG6u4plpVmZRS8cxoYZ0ZrYte	user	\N	\N	\N	\N	2026-05-31 08:22:19	2026-05-31 08:22:19
019e80af-126e-7219-876e-919580a5048d	Find MyPhone	findmyphone.ma999@gmail.com	\N	$2y$12$oGyRTF0z9x7qpcUMm8J5ourZY1k1rlUHt3qzR3hUGk8BN69NTEPcO	user	\N	\N	\N	pxZhc7n3T9vWo8ElSC5Q1FP7lXY4NfiKmTfj1K9d4GjhmqKp0Opi3dc0yMbt	2026-06-01 00:56:57	2026-06-03 05:38:15
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vocabulary
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vocabulary
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vocabulary
--

SELECT pg_catalog.setval('public.migrations_id_seq', 18, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vocabulary
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 14, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: coupon_redemptions coupon_redemptions_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.coupon_redemptions
    ADD CONSTRAINT coupon_redemptions_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_code_unique; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_code_unique UNIQUE (code);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: languages languages_code_unique; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_code_unique UNIQUE (code);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: quiz_answers quiz_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT quiz_answers_pkey PRIMARY KEY (id);


--
-- Name: quiz_sessions quiz_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_sessions
    ADD CONSTRAINT quiz_sessions_pkey PRIMARY KEY (id);


--
-- Name: sentences sentences_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.sentences
    ADD CONSTRAINT sentences_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: subscription_plans subscription_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.subscription_plans
    ADD CONSTRAINT subscription_plans_pkey PRIMARY KEY (id);


--
-- Name: subscription_plans subscription_plans_slug_unique; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.subscription_plans
    ADD CONSTRAINT subscription_plans_slug_unique UNIQUE (slug);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: vocabulary
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: coupon_redemptions coupon_redemptions_coupon_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.coupon_redemptions
    ADD CONSTRAINT coupon_redemptions_coupon_id_foreign FOREIGN KEY (coupon_id) REFERENCES public.coupons(id) ON DELETE CASCADE;


--
-- Name: coupon_redemptions coupon_redemptions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.coupon_redemptions
    ADD CONSTRAINT coupon_redemptions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: levels levels_language_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_language_id_foreign FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: quiz_answers quiz_answers_sentence_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT quiz_answers_sentence_id_foreign FOREIGN KEY (sentence_id) REFERENCES public.sentences(id) ON DELETE CASCADE;


--
-- Name: quiz_answers quiz_answers_session_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT quiz_answers_session_id_foreign FOREIGN KEY (session_id) REFERENCES public.quiz_sessions(id) ON DELETE CASCADE;


--
-- Name: quiz_sessions quiz_sessions_language_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_sessions
    ADD CONSTRAINT quiz_sessions_language_id_foreign FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- Name: quiz_sessions quiz_sessions_level_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_sessions
    ADD CONSTRAINT quiz_sessions_level_id_foreign FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE CASCADE;


--
-- Name: quiz_sessions quiz_sessions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.quiz_sessions
    ADD CONSTRAINT quiz_sessions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: sentences sentences_level_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.sentences
    ADD CONSTRAINT sentences_level_id_foreign FOREIGN KEY (level_id) REFERENCES public.levels(id) ON DELETE CASCADE;


--
-- Name: subscriptions subscriptions_plan_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_plan_id_foreign FOREIGN KEY (plan_id) REFERENCES public.subscription_plans(id) ON DELETE CASCADE;


--
-- Name: subscriptions subscriptions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_subscription_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_subscription_id_foreign FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id) ON DELETE SET NULL;


--
-- Name: transactions transactions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: vocabulary
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict eEDmCCoypcEMIrcGbyAkBKjDHoUVWxTzHrjDTnGwSabxmRjXHKg89oQGbRQSwLC

