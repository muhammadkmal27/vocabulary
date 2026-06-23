--
-- PostgreSQL database dump
--

\restrict qtrjgqqhbvbb4ead1kh8HeCYZGYHbePlmr8a0LLEXBxRks0E51mezKzaUQoEvN5

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
019ec37b-5730-7296-a3bd-711aa0f94fd4	019e71d6-c6c2-717c-9caa-af2f471cb44c	22	L22	2026-06-14 00:15:00	2026-06-14 00:15:00
019ec37b-764b-708b-89d1-7b9abe965897	019e71d6-c6c2-717c-9caa-af2f471cb44c	23	L23	2026-06-14 00:15:08	2026-06-14 00:15:15
019ec37b-b37f-728b-a194-a6cb03aba0bf	019e71d6-c6c2-717c-9caa-af2f471cb44c	24	L24	2026-06-14 00:15:24	2026-06-14 00:15:24
019ec37b-e1e6-7276-81d4-8d1ea3f652d7	019e71d6-c6c2-717c-9caa-af2f471cb44c	25	L25	2026-06-14 00:15:36	2026-06-14 00:15:36
019ec37b-fe05-71b2-97e5-9878f88a413f	019e71d6-c6c2-717c-9caa-af2f471cb44c	26	L26	2026-06-14 00:15:43	2026-06-14 00:15:43
019ec37c-14b4-704a-974b-da1ab82de485	019e71d6-c6c2-717c-9caa-af2f471cb44c	27	L27	2026-06-14 00:15:49	2026-06-14 00:15:49
019ec37c-2acf-705a-8b65-f244c62ec79a	019e71d6-c6c2-717c-9caa-af2f471cb44c	28	L28	2026-06-14 00:15:55	2026-06-14 00:15:55
019ec37c-3d7b-72d6-b323-5e5668487e26	019e71d6-c6c2-717c-9caa-af2f471cb44c	29	L29	2026-06-14 00:15:59	2026-06-14 00:15:59
019ec37c-51a2-7373-981b-a96898747a9c	019e71d6-c6c2-717c-9caa-af2f471cb44c	30	L30	2026-06-14 00:16:05	2026-06-14 00:16:05
019ec42c-33c3-71bc-81d9-280a8cd57e9a	019e71d6-c6c2-717c-9caa-af2f471cb44c	31	L31	2026-06-14 03:28:11	2026-06-14 03:28:11
019ec42c-5a3b-7157-a167-92e44b712f0a	019e71d6-c6c2-717c-9caa-af2f471cb44c	32	L32	2026-06-14 03:28:21	2026-06-14 03:28:21
019ec42c-7663-73ec-b13e-302ca2fc6882	019e71d6-c6c2-717c-9caa-af2f471cb44c	33	L33	2026-06-14 03:28:28	2026-06-14 03:28:28
019ec42c-acb5-725d-9503-732d956f190e	019e71d6-c6c2-717c-9caa-af2f471cb44c	34	L34	2026-06-14 03:28:42	2026-06-14 03:28:42
019ec42c-c1ca-70a3-a405-ea3f99285c2e	019e71d6-c6c2-717c-9caa-af2f471cb44c	35	L35	2026-06-14 03:28:48	2026-06-14 03:28:48
019ec42c-d3b1-70d6-9ca6-0249204ff259	019e71d6-c6c2-717c-9caa-af2f471cb44c	36	L36	2026-06-14 03:28:52	2026-06-14 03:28:52
019ec970-d0e7-71e9-9601-43ceb84b321a	019e71d6-c6c2-717c-9caa-af2f471cb44c	37	L37	2026-06-15 04:01:14	2026-06-15 04:01:14
019ec970-edff-7092-b1be-ecd06cc0384f	019e71d6-c6c2-717c-9caa-af2f471cb44c	38	L38	2026-06-15 04:01:21	2026-06-15 04:01:21
019ec971-0440-7058-b50e-4406b1db8bbe	019e71d6-c6c2-717c-9caa-af2f471cb44c	39	L39	2026-06-15 04:01:27	2026-06-15 04:01:27
019ec971-15a1-73f3-9143-463db4e852d3	019e71d6-c6c2-717c-9caa-af2f471cb44c	40	L40	2026-06-15 04:01:32	2026-06-15 04:01:32
019ec971-2ac3-7330-a7d1-d0cf4839ea62	019e71d6-c6c2-717c-9caa-af2f471cb44c	41	L41	2026-06-15 04:01:37	2026-06-15 04:01:37
019ec971-3c06-73d6-a46f-37e35b743d3c	019e71d6-c6c2-717c-9caa-af2f471cb44c	42	L42	2026-06-15 04:01:41	2026-06-15 04:01:41
019ec971-4b22-7178-8c67-fb890ecf9225	019e71d6-c6c2-717c-9caa-af2f471cb44c	43	L43	2026-06-15 04:01:45	2026-06-15 04:01:45
019ec971-6e6a-72df-b722-d4ed8f9d6c27	019e71d6-c6c2-717c-9caa-af2f471cb44c	44	L44	2026-06-15 04:01:54	2026-06-15 04:01:54
019ec971-7fed-7348-8560-c8f39615787b	019e71d6-c6c2-717c-9caa-af2f471cb44c	45	L45	2026-06-15 04:01:59	2026-06-15 04:01:59
019ec971-9105-70ba-bfc2-c66fd8419534	019e71d6-c6c2-717c-9caa-af2f471cb44c	46	L46	2026-06-15 04:02:03	2026-06-15 04:02:03
019ec971-a979-71b1-9e94-a481f27f69f6	019e71d6-c6c2-717c-9caa-af2f471cb44c	47	L47	2026-06-15 04:02:09	2026-06-15 04:02:09
019ec971-c320-7098-82fd-5a43571272aa	019e71d6-c6c2-717c-9caa-af2f471cb44c	48	L48	2026-06-15 04:02:16	2026-06-15 04:02:16
019ec971-d8bf-72a9-86a8-551a5706f0dc	019e71d6-c6c2-717c-9caa-af2f471cb44c	49	L49	2026-06-15 04:02:22	2026-06-15 04:02:22
019ed008-c390-7118-b4d0-c7bc854dcaf4	019e71d6-c6c2-717c-9caa-af2f471cb44c	50	L50	2026-06-16 10:44:55	2026-06-16 10:44:55
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
8	App\\Models\\User	019e7d20-734e-70a4-8324-2e7509ef6c12	auth-token	86e91b4fb3c57e77c55e6ee4a41c9399597102e5cc132eae07f0089734475cee	["*"]	2026-06-16 12:22:29	\N	2026-05-31 08:22:19	2026-06-16 12:22:29
2	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	3f3d3bacb8865ff554cf2d11d73329595f8c3d21107615dc59bd4cad4b25f6e4	["*"]	2026-05-29 12:24:31	\N	2026-05-29 12:23:21	2026-05-29 12:24:31
7	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	0a51290771d7c234678c33b96845664ff44dcdc506a2084db916cc56633bfa8e	["*"]	2026-06-11 15:34:06	\N	2026-05-30 08:23:35	2026-06-11 15:34:06
15	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	8685ab140aed629632987d20c755fd376e554b550402c9109c332850797f45d9	["*"]	2026-06-23 08:03:05	\N	2026-06-13 23:07:29	2026-06-23 08:03:05
13	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	1224356491ad2fcad81e4f486d97e9c19f181a9aff4b0b77ba073b74b607ddb8	["*"]	2026-06-17 04:36:26	\N	2026-06-04 10:08:42	2026-06-17 04:36:26
5	App\\Models\\User	019e73af-7105-714e-8d4f-0658f4579a11	auth-token	37165d6ea872d9241e274a85429794bc041992e13dad412cb0336cf201a53858	["*"]	\N	\N	2026-05-29 12:38:53	2026-05-29 12:38:53
3	App\\Models\\User	019e73af-7105-714e-8d4f-0658f4579a11	auth-token	2e022cb70da1bbfa21463c34a3014851874172f04476b2f66ac36bfe15746fcc	["*"]	2026-05-29 12:40:27	\N	2026-05-29 12:25:24	2026-05-29 12:40:27
16	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	986e9f0f1c3c417142ff29a814c591cb736e574f799719952dcbb952c7b421f4	["*"]	2026-06-23 08:32:22	\N	2026-06-17 04:37:03	2026-06-23 08:32:22
9	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	2ab02da3d309be77c7bdf3643bc6abf916c4313dd6579731f204de080dae1712	["*"]	2026-06-01 03:19:54	\N	2026-06-01 00:56:57	2026-06-01 03:19:54
14	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	27362fb3ddcd37a342963b50a374ce13a874bf88ade84c541f9618490a5cb35b	["*"]	2026-06-22 03:44:46	\N	2026-06-05 04:55:34	2026-06-22 03:44:46
10	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	eaf81626fb574be7ce8664f1c0735493b44ab11207f593f40c636e37777967cd	["*"]	2026-06-03 04:25:34	\N	2026-06-01 03:20:03	2026-06-03 04:25:34
12	App\\Models\\User	019e80af-126e-7219-876e-919580a5048d	auth-token	7812ccd0149d7eb74c1e8d13d899f598cf97e4607cb9be1deccf30300472cc08	["*"]	2026-06-04 07:17:44	\N	2026-06-03 05:39:17	2026-06-04 07:17:44
4	App\\Models\\User	019e71d6-0951-71cc-a01d-3d315e9f0c21	auth-token	0c63baeb4cab74cc1984ec98d0fe4164ad5f1968db670d9dd713baec878ab2ac	["*"]	2026-06-15 07:57:45	\N	2026-05-29 12:29:49	2026-06-15 07:57:45
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
019eca1a-211b-7157-87fc-f81b7883941d	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-15 07:06:10
019eca1a-211d-7197-a0e5-96b2fe6581a3	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-15 07:06:10
019eca1a-211e-712d-88fc-610c841e49ec	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-15 07:06:10
019eca1a-2120-72e8-a770-bdf467a71f3a	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-15 07:06:10
019eca1a-2121-71d5-80fc-3c9e94f25bed	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-15 07:06:10
019eca1a-2122-72ac-82ad-c38a917c7593	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-15 07:06:10
019eca1a-2124-706f-b1d8-3bee3e66bed1	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-15 07:06:10
019eca1a-2125-7100-bf86-3d38fdce58fd	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-15 07:06:10
019eca1a-2126-73a5-9a52-e1bf8167234f	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-15 07:06:10
019eca1a-2127-703b-9f9f-41537b832cd8	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-15 07:06:10
019eca1a-2129-7283-b868-cde784ea4f01	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-15 07:06:10
019eca1a-212a-7195-a7e2-8fa3c6957976	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-15 07:06:10
019eca1a-212b-728f-a2f2-b48e1869d941	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-15 07:06:10
019eca1a-212c-7226-8e06-3a308f0a48bf	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-15 07:06:10
019eca1a-212d-7294-9c4a-4c7eee53fc89	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-15 07:06:10
019eca1a-212e-72c2-8bb3-52ab0f27d299	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-15 07:06:10
019eca1a-2130-708f-a46e-1ce0c7dae050	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-15 07:06:10
019eca1a-2131-70cb-ba42-feae4f8736ae	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-15 07:06:10
019eca1a-2132-72ea-9681-dd2587c6d925	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-15 07:06:10
019eca1a-2133-7157-87f7-5bc220e3620a	019eca1a-2117-7002-8f0a-df4e77ee3632	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-15 07:06:10
019eca1a-8b52-7024-a8ce-abef36ce895a	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-15 07:06:37
019eca1a-8b54-72ab-bc8a-50ea26620ab0	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-15 07:06:37
019eca1a-8b56-715b-8aa0-2e4346ff7d0a	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-15 07:06:37
019eca1a-8b57-7159-bccb-250431a90cc9	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-15 07:06:37
019eca1a-8b58-71d4-b202-becacac8c281	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-15 07:06:37
019eca1a-8b5a-729b-b2de-397614f1c54f	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-15 07:06:37
019eca1a-8b5b-7061-92e0-4e1a45a235c3	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-15 07:06:37
019eca1a-8b5c-70f2-871e-c54d0ccaf95f	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-15 07:06:37
019eca1a-8b5e-7366-92ea-e1a59d1cc988	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-15 07:06:37
019eca1a-8b5f-732e-8c6c-096e75daaaea	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-15 07:06:37
019eca1a-8b60-739e-9479-fb20e0c371ba	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-15 07:06:37
019eca1a-8b61-7071-95c4-23f3001a9873	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-15 07:06:37
019eca1a-8b63-71d4-ab20-b3dc52a2e932	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-15 07:06:37
019eca1a-8b64-7099-a82a-9f748e1a8923	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-15 07:06:37
019eca1a-8b65-72c0-93ef-fe6161e8d206	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-15 07:06:37
019eca1a-8b66-7037-8cee-f77ff21cd826	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-15 07:06:37
019eca1a-8b67-72f6-8e97-eda685c53cd8	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-15 07:06:37
019eca1a-8b68-70e9-9824-f4227526b6e5	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-15 07:06:37
019eca1a-8b6a-72d2-90df-c4da3faf428c	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-15 07:06:37
019eca1a-8b6b-734b-ae50-ba440b1f88d3	019eca1a-8b4f-7366-9e11-498315b7d0f4	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-15 07:06:37
019eca1a-9318-7392-a95e-5426324f2447	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-15 07:06:39
019eca1a-931a-71fe-aa5c-e910dc032642	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-15 07:06:39
019eca1a-931c-7322-9e2c-d45dd97ad9f5	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-15 07:06:39
019eca1a-931d-7073-852d-9a20621ba794	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-15 07:06:39
019eca1a-931e-70d7-98f3-58476e787c18	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-15 07:06:39
019eca1a-9320-7059-8683-86f7e9c0ce30	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-15 07:06:39
019eca1a-9321-730d-8cd4-f2fc42caaf95	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-15 07:06:39
019eca1a-9322-71c7-b771-4cbf22a8f0f7	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-15 07:06:39
019eca1a-9323-71ba-b389-5067eef3d82a	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-15 07:06:39
019eca1a-9325-7114-8cb1-82b5b2233df2	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-15 07:06:39
019eca1a-9326-704e-bc91-a562e9c81caa	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-15 07:06:39
019eca1a-9327-705a-8b78-89061f0d0734	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-15 07:06:39
019eca1a-9328-724a-b64c-681a2bdf771e	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-15 07:06:39
019eca1a-932a-706b-8007-cec83f1a87aa	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-15 07:06:39
019eca1a-932b-7287-b4e7-580dfe19e1e3	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-15 07:06:39
019eca1a-932c-7074-a7ac-ac8ab85092e1	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-15 07:06:39
019eca1a-932d-71c2-bb47-a1f51c192146	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-15 07:06:39
019eca1a-932f-734a-bb9c-ea641f58d202	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-15 07:06:39
019eca1a-9330-7087-95cf-d5de51c7cf42	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-15 07:06:39
019eca1a-9331-715a-ab37-3646c902dd2e	019eca1a-9313-7172-a09f-6f1c74ee67f5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-15 07:06:39
019eca1a-b9cb-731b-b1db-3a8e6b854f2e	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-15 07:06:49
019eca1a-b9cd-7092-8e22-71198f03a999	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-15 07:06:49
019eca1a-b9ce-7287-8958-17c5c7b43f35	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-15 07:06:49
019eca1a-b9cf-73ea-bbc4-c9e88baec710	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d1-72f1-b606-917d18391334	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d2-7122-9e6c-39ea3c919551	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d3-739c-9c2e-59c24b70b44f	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d4-702e-924d-baa0362bfba6	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d6-73f9-b261-9579a51af5bd	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d7-705a-b4e8-6c535d59e7b6	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d8-7173-a666-c440f0228f0c	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-15 07:06:49
019eca1a-b9d9-7114-8e37-ccf6101d5e69	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-15 07:06:49
019eca1a-b9db-70f7-a7ad-77fe44e7a994	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-15 07:06:49
019eca1a-b9dc-7263-ba3f-3af47d5c132f	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-15 07:06:49
019eca1a-b9dd-71fd-ad71-ebe05cb11265	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-15 07:06:49
019eca1a-b9de-703f-8839-fc3c8e8f32dc	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-15 07:06:49
019eca1a-b9df-7044-b6a1-b03391455f94	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-15 07:06:49
019eca1a-b9e1-7012-9263-51e7ae79182e	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-15 07:06:49
019eca1a-b9e2-7006-a453-0f5d94999bda	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-15 07:06:49
019eca1a-b9ca-73e3-acfe-83f7ed0accb6	019eca1a-b9c7-7336-9491-4f2c21012ac8	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	t	2026-06-15 07:06:49
019eca1b-48f3-717c-ae46-f3a442795aaf	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-15 07:07:26
019eca1b-48f4-712b-a810-7fb9d9fa4464	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-15 07:07:26
019eca1b-48f6-73a7-9dd2-25b67c74ed31	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-15 07:07:26
019eca1b-48f7-7099-b5cf-904c886fdce9	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-15 07:07:26
019eca1b-48f8-7038-b33f-508400b991eb	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-15 07:07:26
019eca1b-48f9-731c-9a3c-101166cb8b20	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-15 07:07:26
019eca1b-48fa-721c-9a73-deb37d5a7196	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-15 07:07:26
019eca1b-48fc-717d-9c5b-66f5c363e4b3	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-15 07:07:26
019eca1b-48fd-7193-ae5f-cb8afde6b825	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-15 07:07:26
019eca1b-48fe-70d7-9f5a-bff500709cad	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-15 07:07:26
019eca1b-48ff-737f-b960-a83308c84c7d	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-15 07:07:26
019eca1b-4900-720e-802a-5f0d56cb57c7	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-15 07:07:26
019eca1b-4901-735e-afc3-d1aae5c37f48	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-15 07:07:26
019eca1b-4903-70c6-9400-2ce26b5cc2e6	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-15 07:07:26
019eca1b-4904-72c6-b1ae-aa89dee49792	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-15 07:07:26
019eca1b-4905-7065-868e-238056c1852c	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-15 07:07:26
019eca1b-4907-7257-ba63-544fa4176eb2	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-15 07:07:26
019eca1b-4908-70fc-a713-7da8bb70e49c	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-15 07:07:26
019eca1b-4909-70c3-b73e-932c8080a1f5	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-15 07:07:26
019eca1b-490a-739c-b546-37e8e052174b	019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-15 07:07:26
019ed065-9478-73a6-b700-2ab93917df52	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-16 12:26:18
019ed065-9479-736b-94f5-67e4e473ad2a	019ed065-9473-7102-aeeb-2d312d28840a	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-16 12:26:18
019ed065-947a-7380-9bd2-539a1274bbb6	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-16 12:26:18
019ed065-947c-7383-a7d1-726d795b3ca8	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-16 12:26:18
019ed065-947d-714e-b330-0a1505289e91	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-16 12:26:18
019ed065-947e-7020-8c34-a856c79a6369	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-16 12:26:18
019ed065-9480-7141-8c0a-96b1b1b611ad	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-16 12:26:18
019ed065-9481-7093-9caa-b54cae4cd354	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-16 12:26:18
019ed065-9482-7353-aa94-2d547766589c	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-16 12:26:18
019ed065-9483-7392-9fcd-7a6f5fc278e9	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-16 12:26:18
019ed065-9484-72b5-b459-a6d4861cb5e9	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-16 12:26:18
019ed065-9486-70c8-9cfe-da5af450bf47	019ed065-9473-7102-aeeb-2d312d28840a	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-16 12:26:18
019ed065-9487-73e2-ae5f-f2e5834faa3a	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-16 12:26:18
019ed065-9488-727b-831e-c0575142f84a	019ed065-9473-7102-aeeb-2d312d28840a	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-16 12:26:18
019ed065-9489-73d2-8ada-dcc387cfedf7	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-16 12:26:18
019ed065-948a-7174-ab31-42c2b7314a77	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-16 12:26:18
019ed065-948b-7105-b30b-6c1892707ecf	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-16 12:26:18
019ed065-948d-7238-863e-5e8559e6e6c6	019ed065-9473-7102-aeeb-2d312d28840a	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-16 12:26:18
019ed065-948e-7114-8838-51c1ffde51d6	019ed065-9473-7102-aeeb-2d312d28840a	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-16 12:26:18
019ed065-9476-71db-9767-3e9d1fa2bf0d	019ed065-9473-7102-aeeb-2d312d28840a	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	t	2026-06-16 12:26:18
019ed09a-40a3-72a4-90de-04d176504a34	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-16 13:23:50
019ed09a-40a6-73d4-a852-07815711f66b	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-16 13:23:50
019ed09a-40a7-72c9-b845-32cc143ca614	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-16 13:23:50
019ed09a-40a8-7250-86a8-8dcab2696fdb	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-16 13:23:50
019ed09a-40aa-7172-af38-a967b0e4862e	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-16 13:23:50
019ed09a-40ab-70f7-ba89-9497ee1e1091	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-16 13:23:50
019ed09a-40ac-705e-9421-771b2787649d	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-16 13:23:50
019ed09a-40ad-724d-ac7c-db027768bb66	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-16 13:23:50
019ed09a-40af-717e-9339-371e8efc2785	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-16 13:23:50
019ed09a-40b0-70f0-8ab9-6e1f81a1e98b	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-16 13:23:50
019ed09a-40b1-7180-aa1a-813d074e0916	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-16 13:23:50
019ed09a-40b2-7304-9f5a-c7b4f4985c8c	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-16 13:23:50
019ed09a-40b3-7253-8c51-8c0fc0d3c3eb	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-16 13:23:50
019ed09a-40b5-722d-8628-ea8c1256bfd9	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-16 13:23:50
019ed09a-40b6-700d-b701-5d26df5ac07a	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-16 13:23:50
019ed09a-40b7-70e0-aa56-ddc3b108e7b8	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-16 13:23:50
019ed09a-40b8-7301-a1f6-2a946a0aacf1	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-16 13:23:50
019ed09a-40b9-71ad-a04a-ce8fe34d3931	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-16 13:23:50
019ed09a-40bb-7009-b270-ec17bce988d9	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-16 13:23:50
019ed09a-40bc-71f1-bc8b-b8de2fcf948f	019ed09a-40a1-73da-a35e-cca5e29d5a29	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-16 13:23:50
019ed09a-70f4-72ae-a60e-a008e36ee04e	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-16 13:24:02
019ed09a-70f5-70af-ba71-94bd14f453c8	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-16 13:24:02
019ed09a-70f7-73c9-aad3-c1f8cebcdb9d	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-16 13:24:02
019ed09a-70f8-7244-8ffb-31d58b12d403	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-16 13:24:02
019ed09a-70f9-70b0-9bf8-69938649aed6	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-16 13:24:02
019ed09a-70fb-71a1-a6fc-ec5f71a1a562	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-16 13:24:02
019ed09a-70fc-7218-99ef-5d7d235a469b	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-16 13:24:02
019ed09a-70fd-70a8-b3d8-48ac87bfe102	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-16 13:24:02
019ed09a-70fe-7004-9ac4-f1a5fb9087a7	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-16 13:24:02
019ed09a-7100-73e0-97e8-10e066e37250	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-16 13:24:02
019ed09a-7101-70f2-8bbf-00ce597aedce	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-16 13:24:02
019ed09a-7102-70eb-aef1-1a2d1b5043ee	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-16 13:24:02
019ed09a-7103-7333-8a0a-f008ab7c2747	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-16 13:24:02
019ed09a-7105-705d-bbef-13d56ef58650	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-16 13:24:02
019ed09a-7106-726b-8fdd-376f56eba3d3	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-16 13:24:02
019ed09a-7107-7313-8e16-b94fdecef820	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-16 13:24:02
019ed09a-7108-71e4-967d-f70cacd44f80	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-16 13:24:02
019ed09a-710a-7212-b328-42836b497afd	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-16 13:24:02
019ed09a-710b-729d-8e04-f73ed14d90b9	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-16 13:24:02
019ed09a-710c-7238-b940-41eeb516f230	019ed09a-70f1-70c6-824b-f18e4dd75259	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-16 13:24:02
019ed361-00af-70cb-b71d-bcd48cd9600f	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-327a-73f4-9a63-092cefb1aabf	i agree	t	f	2026-06-17 02:20:10
019ed361-00b1-7383-93fb-e51b0698c33b	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3277-7245-8397-2b95ecf990d9	see you later	t	f	2026-06-17 02:20:10
019ed361-00b2-7166-b18b-ddbb3280adbb	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-17 02:20:10
019ed361-00b3-728f-b105-18ad93d85733	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how are you	t	f	2026-06-17 02:20:10
019ed361-00b6-7224-a2f6-031adebd43a1	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-327d-739e-b4c9-7e19f212ff0b	im going to bed	t	f	2026-06-17 02:20:10
019ed361-00b7-7131-b441-114b41c25048	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-327b-70a4-a7ad-d11703dd3c66	where is my key	t	f	2026-06-17 02:20:10
019ed361-00b8-72fb-8305-82d1dca61842	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3278-7246-a23e-10370ffbd291	what do you think about this idea	t	f	2026-06-17 02:20:10
019ed361-00b9-712d-9059-8c368931b793	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-17 02:20:10
019ed361-00bc-7242-9ed8-0dd843624d8e	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3270-72c4-a123-4fd4e2837da1	i dont understand	t	f	2026-06-17 02:20:10
019ed361-00bd-72f3-90ad-3c7377340104	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-326c-7287-8e58-6efb81d2293f	oh i am so sorry	f	f	2026-06-17 02:20:10
019ed361-00be-73a4-b65e-2585a4a82b00	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-326f-71da-ad92-48800b1c008e	do you understand what i mean	t	f	2026-06-17 02:20:10
019ed361-00bf-72d7-b806-3767333c7ea7	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-326e-708c-8deb-5b611d1fca9b	its okay	t	f	2026-06-17 02:20:10
019ed361-00c2-721d-a9d4-ce566f667e9d	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-327e-72b7-9b50-f40528ac67e7	hi finally you are here	f	f	2026-06-17 02:20:10
019ed361-00c3-7163-a752-829b71ba6764	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-326b-72db-83f5-77053c15a6f1	youre welcome	t	f	2026-06-17 02:20:10
019ed361-00c4-7324-9b65-6f46a491362b	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-326a-7367-b316-afb7232fe48c	thank you so much	t	f	2026-06-17 02:20:10
019ed361-00c6-7316-a8f1-cf839f9c70cd	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-17 02:20:10
019ed361-00b5-7113-a6df-24d1d66b7963	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	i fin thank you	f	f	2026-06-17 02:20:10
019ed361-00bb-723d-b91a-b4ae69be80e1	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3276-7022-9eea-b52898a285bc	alright i have to go now	t	f	2026-06-17 02:20:10
019ed361-00c1-705d-a113-9d402c036376	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3273-7288-ac2e-40fac328fb6d	hey do you want to grab some coffe?	f	f	2026-06-17 02:20:10
019ed361-00c7-73e4-898e-bb72c4065f7a	019ed361-00ac-73a1-aa62-5a467b331e6b	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-17 02:20:10
019ed3c0-f8f2-7041-8708-0176e348b5a4	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-17 04:04:59
019ed3c0-f8f3-7176-9345-f43230a71fa2	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-17 04:04:59
019ed3c0-f8f4-7152-9e9e-90651964c425	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-17 04:04:59
019ed3c0-f8f5-7349-bc52-df341981dec2	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-17 04:04:59
019ed3c0-f8f6-71be-98a3-935982214bbf	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-17 04:04:59
019ed39f-f7eb-73bb-925b-e596a5aa5742	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-17 03:28:56
019ed39f-f7ec-738e-9ccf-f69dbe920c2e	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-17 03:28:56
019ed39f-f7ed-7175-8e3d-2399159708b0	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-17 03:28:56
019ed39f-f7ef-7083-9c60-d985890b8eb1	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f0-73ae-9217-e8f606ebb9fc	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f1-737c-b973-cb2ce237af90	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f2-71a8-a5dd-9151dd4030d7	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f3-704e-94c7-cad05e3b87e3	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f4-7183-930a-fbc4271b77c3	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f5-73bf-af0a-ff025ee930f8	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f6-71b6-b6e1-d105cde7ef2d	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f7-71e7-bcb2-3996410a407f	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f8-7144-a911-cc5341e18178	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-17 03:28:56
019ed39f-f7f9-70ac-ad6a-c216f3e3ce9b	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-17 03:28:56
019ed39f-f7e2-7147-8fe0-c0e2f03df627	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3270-72c4-a123-4fd4e2837da1	i dont understand	t	f	2026-06-17 03:28:56
019ed39f-f7e4-7004-856d-7709909e09db	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-326f-71da-ad92-48800b1c008e	do you understand what i mean	t	f	2026-06-17 03:28:56
019ed39f-f7e5-72cc-8bf3-0bf02420de60	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-17 03:28:56
019ed39f-f7e7-7325-baed-e7ae34f7d66b	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-327a-73f4-9a63-092cefb1aabf	i agree	t	f	2026-06-17 03:28:56
019ed39f-f7e8-7309-988e-71fe5d40803a	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-327c-71e1-9d58-b2fe6426441a	it is already 1130 pm	t	f	2026-06-17 03:28:56
019ed39f-f7e9-73c3-aeb4-e0a29ef9eb7f	019ed39f-f7df-73d3-b38c-101c1bbb4381	019e71e1-327e-72b7-9b50-f40528ac67e7	hi you are finally here	t	f	2026-06-17 03:28:56
019ed3c0-f8f7-7082-9c84-b5742ded81e1	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8f8-71f5-8f78-9f32cdcdf33d	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8fa-707a-916f-e4bfd2263c88	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8fb-738b-87d6-426cf028b704	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8fc-71c3-8c3e-8704731f68f2	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8fd-73c2-9072-9d2304e8c5a9	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8fe-702f-a7ca-0799012611b2	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8ff-720c-94e6-9b5309f2cf77	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 04:04:59
019ed3c0-f901-721f-ac79-87ac16038a9f	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 04:04:59
019ed3c0-f902-71ee-b7aa-72787cd3375d	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 04:04:59
019ed3c0-f903-7245-90ae-f981982bd282	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 04:04:59
019ed3c0-f904-71b4-81f3-5aa3a13b1fc0	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 04:04:59
019ed3c0-f8ed-73bd-b632-b98a36698e68	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-17 04:04:59
019ed3c0-f8ef-7305-9bc2-d74032710012	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-17 04:04:59
019ed3c0-f8f1-71e6-a900-d279f82b65e4	019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-17 04:04:59
019ed3e3-b4e3-70f1-902b-b5552883cdc2	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e4-7346-9eb0-a79fb70ec7e3	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e5-71de-aaf0-1e249cc3e6c5	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e6-7037-8f47-7a7dee26e47e	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e7-70f7-a5ca-2af9d3d18323	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e9-72c6-8e5c-80c7b95a76ca	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4ea-72f9-8b51-17cfc54ea6fc	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4eb-734b-8ef9-04e98cf4ffef	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4ec-7053-b7d3-3e1a665aa1fc	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4ee-7358-9a14-4945bf401cab	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4ef-7049-a25e-bfed8c32c610	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4f0-7280-84c9-8af76f074062	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4f1-70f2-98d6-c5f9825d1125	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4f3-7125-9a5e-9bcf5b0a4d8d	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4f4-7291-a210-2c83ef1184f1	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4f5-71fe-8640-9c6b12ce557c	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4f7-72b1-97d6-fabe287a42b0	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4de-71a2-bc30-5b8a5a8a6a2c	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e0-73ed-84a4-5f831856b7db	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-17 04:42:56
019ed3e3-b4e2-71f4-9002-8893b59f2790	019ed3e3-b4db-737a-a38c-eca3acd4609c	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 04:42:56
019ed46c-5a65-7174-9698-3cfed070a379	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-17 07:12:11
019ed46c-5a69-70e1-9282-c0ecbd57a270	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	t	2026-06-17 07:12:11
019ed46c-5a6b-7228-acef-0ae5d7acf286	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-17 07:12:11
019ed46c-5a6c-721d-b604-c3262f934d04	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-17 07:12:11
019ed46c-5a6d-709f-8108-ba9092c1413a	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-17 07:12:11
019ed46c-5a6f-7216-9195-ba58aa85e012	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-17 07:12:11
019ed46c-5a70-7271-b0f2-e7763fc59076	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-17 07:12:11
019ed46c-5a71-72ae-8f37-46a4014106f5	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-17 07:12:11
019ed46c-5a72-7184-b803-96abccf74bd5	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b92-2866-73bb-b02e-aec30e8df203	Excuse me I wanna buy this	f	f	2026-06-17 07:12:11
019ed52d-a81f-72ef-b79f-8a0326cf8b9e	019ed52d-a81a-735b-853b-a388c901cc15	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 10:43:19
019ed52d-a822-72fb-adb4-5ff24d17da6d	019ed52d-a81a-735b-853b-a388c901cc15	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 10:43:19
019ed52d-a823-73b6-b8e3-ce1d798a24a0	019ed52d-a81a-735b-853b-a388c901cc15	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 10:43:19
019ed52d-a825-72d6-9457-53fa10ef30df	019ed52d-a81a-735b-853b-a388c901cc15	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 10:43:19
019ed52d-a826-73f3-acee-fe7c21c0d918	019ed52d-a81a-735b-853b-a388c901cc15	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-17 10:43:19
019ed464-a129-7100-8193-ab55ac96f4dd	019ed464-a113-7264-87af-d1796fd128b8	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 07:03:45
019ed464-a12d-701a-a3f8-dc230b419d1c	019ed464-a113-7264-87af-d1796fd128b8	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 07:03:45
019ed464-a12e-706b-98c4-535d9d12e793	019ed464-a113-7264-87af-d1796fd128b8	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 07:03:45
019ed464-a12f-7013-9f3f-68ca2f100ac7	019ed464-a113-7264-87af-d1796fd128b8	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 07:03:45
019ed464-a131-734b-8d19-bd50197c6444	019ed464-a113-7264-87af-d1796fd128b8	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 07:03:45
019ed464-a132-7086-811b-cfc18196a851	019ed464-a113-7264-87af-d1796fd128b8	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 07:03:45
019ed52d-a827-719d-b6b4-7c3504ab4289	019ed52d-a81a-735b-853b-a388c901cc15	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 10:43:19
019ed464-a117-71ef-bf9f-f8b4c09ce4ab	019ed464-a113-7264-87af-d1796fd128b8	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-17 07:03:45
019ed464-a119-704a-8b57-03f778db329d	019ed464-a113-7264-87af-d1796fd128b8	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-17 07:03:45
019ed464-a11b-73f4-a57c-518f66acb817	019ed464-a113-7264-87af-d1796fd128b8	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-17 07:03:45
019ed464-a11c-7102-9db4-e8d78934f4e3	019ed464-a113-7264-87af-d1796fd128b8	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-17 07:03:45
019ed464-a11d-726f-a3b7-34820a521c71	019ed464-a113-7264-87af-d1796fd128b8	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-17 07:03:45
019ed464-a11e-7303-ab79-0825cd78971f	019ed464-a113-7264-87af-d1796fd128b8	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	t	2026-06-17 07:03:45
019ed464-a120-7316-991d-e7ccc42b6a08	019ed464-a113-7264-87af-d1796fd128b8	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-17 07:03:45
019ed464-a121-702d-b1b4-78ac17a22e28	019ed464-a113-7264-87af-d1796fd128b8	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	t	2026-06-17 07:03:45
019ed464-a122-7165-876a-915fff4b6117	019ed464-a113-7264-87af-d1796fd128b8	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-17 07:03:45
019ed464-a123-73d3-863e-a7a90b42203b	019ed464-a113-7264-87af-d1796fd128b8	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-17 07:03:45
019ed464-a125-734f-bafa-ebee30abc2e2	019ed464-a113-7264-87af-d1796fd128b8	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	t	2026-06-17 07:03:45
019ed464-a126-708e-b68d-ba17cd1f1ee7	019ed464-a113-7264-87af-d1796fd128b8	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-17 07:03:45
019ed464-a127-708d-b185-80b8aa08a3a7	019ed464-a113-7264-87af-d1796fd128b8	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-17 07:03:45
019ed464-a128-7243-bbe1-83fcf540608f	019ed464-a113-7264-87af-d1796fd128b8	019e7b92-2866-73bb-b02e-aec30e8df203	excuse me im wanna buy this	f	f	2026-06-17 07:03:45
019ed46c-5a74-717e-abdf-551232892ebd	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 07:12:11
019ed46c-5a75-731e-b6fc-a37bc818a309	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 07:12:11
019ed46c-5a76-7061-947f-48b076436e6b	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 07:12:11
019ed46c-5a77-71a8-b80f-23e3f4a196e5	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 07:12:11
019ed46c-5a78-73ac-969c-fc97e8a1fbcc	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 07:12:11
019ed46c-5a7a-72d1-b6d3-6a7c27162f7e	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 07:12:11
019ed46c-5a7b-73ef-8a31-7ce67ec073c7	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 07:12:11
019ed46c-5a7c-729d-a42c-495c284c22a9	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 07:12:11
019ed46c-5a7d-72d0-b711-828617f2f216	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 07:12:11
019ed46c-5a7e-727e-95fc-4422812f1f63	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 07:12:11
019ed46c-5a7f-7155-8a8d-805938c26098	019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 07:12:11
019ed52d-a828-7162-a79c-a4c01844ee33	019ed52d-a81a-735b-853b-a388c901cc15	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 10:43:19
019ed52d-a82a-7300-a0a7-7dd1160b1b72	019ed52d-a81a-735b-853b-a388c901cc15	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 10:43:19
019ed52d-a82b-72d7-b937-42ee1019f5f9	019ed52d-a81a-735b-853b-a388c901cc15	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 10:43:19
019ed52d-a82c-734b-bf47-cc3b204eea94	019ed52d-a81a-735b-853b-a388c901cc15	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 10:43:19
019ed52d-a82d-7315-937d-d94e7a6ab0bf	019ed52d-a81a-735b-853b-a388c901cc15	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 10:43:19
019ed52d-a82e-703b-a7b5-d74d427b1bfb	019ed52d-a81a-735b-853b-a388c901cc15	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 10:43:19
019ed52d-a82f-7302-90a9-a8254fd0ee3d	019ed52d-a81a-735b-853b-a388c901cc15	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-17 10:43:19
019ed52d-a831-7262-97d1-a1ff61efd339	019ed52d-a81a-735b-853b-a388c901cc15	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 10:43:19
019ed52d-a832-721b-a547-1be2e6d3e794	019ed52d-a81a-735b-853b-a388c901cc15	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 10:43:19
019ed52d-a833-7241-b846-a9c142e971c5	019ed52d-a81a-735b-853b-a388c901cc15	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 10:43:19
019ed52d-a835-70db-863e-0e84555cef40	019ed52d-a81a-735b-853b-a388c901cc15	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 10:43:19
019ed52d-a836-736b-a6a1-9c11c595160d	019ed52d-a81a-735b-853b-a388c901cc15	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 10:43:19
019ed52d-a837-710c-b7f0-627bcd311117	019ed52d-a81a-735b-853b-a388c901cc15	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 10:43:19
019ed52d-a838-71f1-a705-f6c773148636	019ed52d-a81a-735b-853b-a388c901cc15	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 10:43:19
019ed52d-b0af-72bd-a412-c14ef84545fc	019ed52d-b0ac-70e0-9084-35774a323834	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b0-72c3-90aa-1fd2a62a636c	019ed52d-b0ac-70e0-9084-35774a323834	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b2-7232-b26e-39640a599304	019ed52d-b0ac-70e0-9084-35774a323834	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b3-720f-bd34-1423e1b304b4	019ed52d-b0ac-70e0-9084-35774a323834	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b4-716c-a40a-00ad013e72bf	019ed52d-b0ac-70e0-9084-35774a323834	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b5-7378-ad35-8b0fc6b95d70	019ed52d-b0ac-70e0-9084-35774a323834	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b6-701e-8c4e-a242b264b374	019ed52d-b0ac-70e0-9084-35774a323834	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b8-70dd-a224-50560de69e50	019ed52d-b0ac-70e0-9084-35774a323834	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 10:43:21
019ed52d-b0b9-70e7-9e1a-01eca04ee6d4	019ed52d-b0ac-70e0-9084-35774a323834	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 10:43:21
019ed52d-b0ba-70f8-aeb8-a4c56e61bd30	019ed52d-b0ac-70e0-9084-35774a323834	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 10:43:21
019ed52d-b0bb-7307-95ae-8a4b4193fc61	019ed52d-b0ac-70e0-9084-35774a323834	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 10:43:21
019ed52d-b0bc-70ef-9c8a-2c0e0bb6ae67	019ed52d-b0ac-70e0-9084-35774a323834	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 10:43:21
019ed52d-b0bd-73aa-826f-69ac1f513978	019ed52d-b0ac-70e0-9084-35774a323834	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 10:43:21
019ed52d-b0be-72ce-9aa4-5236a04836bf	019ed52d-b0ac-70e0-9084-35774a323834	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 10:43:21
019ed52d-b0bf-7211-8a3c-cadfd2c9ee38	019ed52d-b0ac-70e0-9084-35774a323834	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 10:43:21
019ed52d-b0c0-71cd-aefd-5833b7cdfac4	019ed52d-b0ac-70e0-9084-35774a323834	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 10:43:21
019ed52d-b0c2-7153-9727-75a42539ddba	019ed52d-b0ac-70e0-9084-35774a323834	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 10:43:21
019ed52d-b0c3-734f-9a65-45cf03a24b22	019ed52d-b0ac-70e0-9084-35774a323834	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 10:43:21
019ed52d-b0c4-717c-ba88-a8099ab63ed8	019ed52d-b0ac-70e0-9084-35774a323834	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 10:43:21
019ed52d-b0c5-704c-acdb-a342998ac432	019ed52d-b0ac-70e0-9084-35774a323834	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 10:43:21
019ed52d-ca0c-70d2-9100-a1b992d1280c	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 10:43:28
019ed52d-ca0e-726d-b995-a92fc3250b5a	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 10:43:28
019ed52d-ca0f-7112-8242-306993b5101b	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 10:43:28
019ed52d-ca10-7037-af2a-9d347284fc43	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 10:43:28
019ed52d-ca11-7315-9efb-3ddce389cadc	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 10:43:28
019ed52d-ca12-7208-b563-0757568c79cd	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 10:43:28
019ed52d-ca14-7317-8a2a-26f4c4932502	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 10:43:28
019ed52d-ca15-7110-a8b2-330a48676281	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 10:43:28
019ed52d-ca16-724b-8851-808928d9b6de	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 10:43:28
019ed52d-ca17-7302-a813-002010abcd0e	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 10:43:28
019ed52d-ca19-7025-9e45-88483d8fecf0	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 10:43:28
019ed52d-ca01-7171-993e-4510aa7219f9	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-17 10:43:28
019ed52d-ca02-703b-b494-fe0a61d05c11	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	t	2026-06-17 10:43:28
019ed52d-ca04-715a-9f22-030e365e7cc0	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-17 10:43:28
019ed52d-ca05-712d-8fe1-091a6d0e7720	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-17 10:43:28
019ed52d-ca06-713e-a1f0-8aba1370e516	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-17 10:43:28
019ed52d-ca08-7127-9a91-11eec52fb1b8	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	t	2026-06-17 10:43:28
019ed52d-ca09-70a0-878f-c13f0103abbb	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-17 10:43:28
019ed52d-ca0a-7166-9eb8-1a0b47215065	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-17 10:43:28
019ed52d-ca0b-72bc-bb74-97a97e3d3bc7	019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	t	2026-06-17 10:43:28
019ed531-b1cb-71ce-ada2-c0ceef4c06ac	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 10:47:44
019ed531-b1cc-7131-b4cb-0062f9b1e78f	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 10:47:44
019ed531-b1ce-735e-babb-6480789edea5	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 10:47:44
019ed531-b1cf-724b-a685-758598dc0a30	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 10:47:44
019ed531-b1d0-702e-92a2-61017cf22fe4	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 10:47:44
019ed531-b1d2-7265-97c6-c7d10e01fc0c	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 10:47:44
019ed531-b1d3-73a1-8dc0-aa7228fe702d	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 10:47:44
019ed531-b1d4-7022-ab4a-1b168ebadf8a	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 10:47:44
019ed531-b1d5-730b-ba08-0fcd7a8dedbb	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-17 10:47:44
019ed531-b1d7-70c4-b0f4-1bd8827f14c4	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 10:47:44
019ed531-b1d8-7298-8119-2bfe534e10cb	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 10:47:44
019ed531-b1d9-71ed-bc2c-ec9ba2749c49	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 10:47:44
019ed531-b1da-73e9-8c02-af43101b2068	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 10:47:44
019ed531-b1dc-70e3-a11f-14182d709fc5	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 10:47:44
019ed531-b1dd-7318-8304-ec5394b02f06	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 10:47:44
019ed531-b1de-7045-9b03-4807d2d82cf0	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 10:47:44
019ed531-b1df-70b3-a4a9-4f2be7b39d2f	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 10:47:44
019ed531-b1e0-704e-8cae-989e2b7914f5	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 10:47:44
019ed531-b1e2-7190-96ff-0aeab3f05673	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-17 10:47:44
019ed531-b1e3-7009-9b9e-6a920e0cffea	019ed531-b1c8-738d-a705-235de7fe62e2	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 10:47:44
019ed531-c646-73a6-b689-fa7459adf92d	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 10:47:49
019ed531-c647-7275-83a1-2c252eb7bb52	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 10:47:49
019ed531-c649-7264-b2c9-0e92f8bff409	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 10:47:49
019ed531-c64a-737e-9a8d-c6e5e4c419e8	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 10:47:49
019ed531-c64b-7285-b1ca-f70530b082c6	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 10:47:49
019ed531-c64c-7361-8672-52406c5a7d23	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 10:47:49
019ed531-c64d-7216-b2c5-7c69878aa4dd	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 10:47:49
019ed531-c64e-7377-8518-130f4c0df65b	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-17 10:47:49
019ed531-c64f-7309-bba9-25ccf8535d63	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 10:47:49
019ed531-c650-719a-b1c0-58972bff5619	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-17 10:47:49
019ed531-c652-7308-997f-1b64088f7c67	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 10:47:49
019ed531-c653-7101-9426-69051285d911	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 10:47:49
019ed531-c654-708d-90dd-b03c09bc246b	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 10:47:49
019ed531-c655-7385-98f4-1a1241d45ad5	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 10:47:49
019ed531-c656-7166-b0ac-48966229025f	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 10:47:49
019ed531-c657-724f-a356-25c595177093	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 10:47:49
019ed531-c640-71ae-a477-8be13537ad74	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	t	2026-06-17 10:47:49
019ed531-c642-71ab-8695-eb1ad9b156fd	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-17 10:47:49
019ed531-c644-71a8-ace2-4f70a1ff6452	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-17 10:47:49
019ed531-c645-72b5-834d-8b2992e3e169	019ed531-c63e-7077-bf7c-70aa97ce657c	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	t	2026-06-17 10:47:49
019ed538-b804-72bf-a9f3-c4d7647a4d60	019ed538-b801-7015-8e9d-5e345a57252e	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-17 10:55:24
019ed538-b805-7081-abc1-12c2f81659c8	019ed538-b801-7015-8e9d-5e345a57252e	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-17 10:55:24
019ed538-b807-713c-b6b8-4288db21c3b2	019ed538-b801-7015-8e9d-5e345a57252e	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-17 10:55:24
019ed538-b808-72b5-80d1-606f6b0202e6	019ed538-b801-7015-8e9d-5e345a57252e	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-17 10:55:24
019ed538-b809-710f-93ba-ce13a79c09fd	019ed538-b801-7015-8e9d-5e345a57252e	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-17 10:55:24
019ed538-b80b-72c2-9e17-5f4b0898f01e	019ed538-b801-7015-8e9d-5e345a57252e	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	t	2026-06-17 10:55:24
019ed538-b80c-7386-9f05-6e373f0ae2dd	019ed538-b801-7015-8e9d-5e345a57252e	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-17 10:55:24
019ed538-b80d-71c8-8f19-02b2e79135b3	019ed538-b801-7015-8e9d-5e345a57252e	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-17 10:55:24
019ed538-b80f-70ee-82e9-c9ff81f1a133	019ed538-b801-7015-8e9d-5e345a57252e	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-17 10:55:24
019ed538-b810-71ac-9ec0-d7e10e40e7e7	019ed538-b801-7015-8e9d-5e345a57252e	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-17 10:55:24
019ed538-b811-7358-b9a4-dada810b6e0a	019ed538-b801-7015-8e9d-5e345a57252e	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-17 10:55:24
019ed538-b812-7037-9afb-a9b1b5abab77	019ed538-b801-7015-8e9d-5e345a57252e	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	t	2026-06-17 10:55:24
019ed538-b814-73fc-83b8-b030cb0b8ead	019ed538-b801-7015-8e9d-5e345a57252e	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	t	2026-06-17 10:55:24
019ed538-b815-70aa-8d84-62a422387a68	019ed538-b801-7015-8e9d-5e345a57252e	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-17 10:55:24
019ed538-b816-70b0-b255-f6919a908599	019ed538-b801-7015-8e9d-5e345a57252e	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-17 10:55:24
019ed538-b817-72eb-a238-ec734479c257	019ed538-b801-7015-8e9d-5e345a57252e	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	t	2026-06-17 10:55:24
019ed538-b819-72de-8215-a9f80692b262	019ed538-b801-7015-8e9d-5e345a57252e	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	t	2026-06-17 10:55:24
019ed538-b81a-716a-891c-81bd1659564a	019ed538-b801-7015-8e9d-5e345a57252e	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-17 10:55:24
019ed538-b81b-72c6-9dba-b21708b14257	019ed538-b801-7015-8e9d-5e345a57252e	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	t	2026-06-17 10:55:24
019ed538-b81d-728a-b33e-c98e82bacddd	019ed538-b801-7015-8e9d-5e345a57252e	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	t	2026-06-17 10:55:24
019ed551-fbff-732c-9342-db869af70e54	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-17 11:23:00
019ed551-fc01-707d-9b90-547942280cb2	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-17 11:23:00
019ed551-fc02-70f0-ad45-f07175e889b7	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-17 11:23:00
019ed551-fc04-700d-9cc4-199a9610f7b1	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-17 11:23:00
019ed551-fc05-71a0-b480-7ee394431d01	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-17 11:23:00
019ed551-fc06-71d5-a89d-8dd2226994c0	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-17 11:23:00
019ed551-fc08-7219-920a-f9f26ed6e01e	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-17 11:23:00
019ed551-fc09-7087-992a-6c57618ef637	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-17 11:23:00
019ed551-fc0a-71cf-bd97-f20f290d65fd	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-17 11:23:00
019ed551-fc0c-711b-9e81-698901d20f8c	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-17 11:23:00
019ed551-fc0d-71c5-a2e1-e583201fc103	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-17 11:23:00
019ed551-fc0e-73d3-b9a6-5c944725a053	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-17 11:23:00
019ed551-fc0f-733d-a957-88c4f615395f	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-17 11:23:00
019ed551-fc10-7367-9af4-48e095fab384	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-17 11:23:00
019ed551-fc11-711b-b128-d2f5648afe56	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-17 11:23:00
019ed551-fc13-703c-83bb-58a72550e856	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-17 11:23:00
019ed551-fc14-7395-b7a2-b14c3117e0c5	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-17 11:23:00
019ed551-fc15-7062-aebb-df15ee70f5f3	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-17 11:23:00
019ed551-fc16-73d8-9edb-a0098ea979cc	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-17 11:23:00
019ed551-fc18-7087-8e87-6334a36c1e28	019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-17 11:23:00
019ed552-32ba-7043-ba3c-9e0561605bbe	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-17 11:23:14
019ed552-32bc-7303-9eb4-4932e7b0a7ca	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-17 11:23:14
019ed552-32bd-70b7-a319-93dad966a27f	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-17 11:23:14
019ed552-32be-702c-bef4-b423a09c68c1	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-17 11:23:14
019ed552-32c0-70f3-a612-a522c0278f3d	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-17 11:23:14
019ed552-32c1-73bd-b10c-40a476edd55c	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-17 11:23:14
019ed552-32c2-7125-9c4e-144252763402	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-17 11:23:14
019ed552-32c3-73eb-8639-4d900fd8a820	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-17 11:23:14
019ed552-32c5-7004-837f-9d8e6b313e00	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-17 11:23:14
019ed552-32c6-72fb-939b-72df695ee51b	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-17 11:23:14
019ed552-32c7-7144-b5a4-d8c2f8675155	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-17 11:23:14
019ed552-32c8-713f-96b7-aa6d5bfd388f	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-17 11:23:14
019ed552-32ca-71f4-b8e7-955ed9899925	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-17 11:23:14
019ed552-32cb-711d-8794-92c4f5675bf1	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-17 11:23:14
019ed552-32cc-7337-8270-b91cda8d90a0	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-17 11:23:14
019ed552-32cd-736b-b358-242d0919a819	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-17 11:23:14
019ed552-32ce-734c-a929-989876d35f5c	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-17 11:23:14
019ed552-32d0-7191-8e69-61b4224b6460	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-17 11:23:14
019ed552-32d1-7171-ab36-2dace688a11a	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-17 11:23:14
019ed552-32d2-730e-b1e3-185d806534f2	019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-17 11:23:14
019ed573-0302-7289-9e99-91c90383f78e	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	t	2026-06-17 11:59:04
019ed573-0304-7301-8a47-bb795b3e6308	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-17 11:59:04
019ed573-0305-726e-b596-31dfa1a3eb92	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	t	2026-06-17 11:59:04
019ed573-0306-70f7-866e-9be59095429f	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-17 11:59:04
019ed573-0308-7324-9c41-9ccbd77869a0	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-17 11:59:04
019ed573-0309-7122-a744-ee95dc307c7e	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-17 11:59:04
019ed573-030a-70e9-a89f-c8f47ddd1386	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-17 11:59:04
019ed573-030b-7130-91d1-6e1dd43a05f2	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-17 11:59:04
019ed573-030c-72a4-80e7-91b731232dbc	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-17 11:59:04
019ed573-030e-73b8-b888-dea35dd934c1	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-17 11:59:04
019ed573-030f-73ca-91bb-1c7663334977	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-17 11:59:04
019ed573-0310-73b2-a0d7-9a94cd9e29a1	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	t	2026-06-17 11:59:04
019ed573-0311-73d7-a23f-eeff3284a9a8	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-17 11:59:04
019ed573-0312-704a-8fd1-09a20420d0ed	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	t	2026-06-17 11:59:04
019ed573-0314-73f9-9e36-220e04b3643b	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-17 11:59:04
019ed573-0315-7079-9226-015d4c884f52	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-17 11:59:04
019ed573-0316-73db-8ba6-f0b855f260d6	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	t	2026-06-17 11:59:04
019ed573-0317-72b6-9431-348658db735a	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	t	2026-06-17 11:59:04
019ed573-0319-72ba-a46a-c8f630b14127	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-17 11:59:04
019ed573-031a-735f-acb4-593d39fbc8ed	019ed573-02fc-7045-a751-5c65629ddd13	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	t	2026-06-17 11:59:04
019ed575-dfc8-7164-8525-1f287a5458ac	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-17 12:02:12
019ed575-dfc9-73ed-ba23-08005f002a95	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-17 12:02:12
019ed575-dfca-71f1-b412-26bc3eea8dc7	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-17 12:02:12
019ed575-dfcb-72cb-8a7d-01b4bf76c1da	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-17 12:02:12
019ed575-dfcd-7075-83eb-5fd383ff67cd	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-17 12:02:12
019ed575-dfce-71a1-99b7-bb1280d1782d	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-17 12:02:12
019ed575-dfcf-718a-8cd2-0bf9552419ea	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-17 12:02:12
019ed575-dfd0-7016-9344-577520279a09	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-17 12:02:12
019ed575-dfd1-7162-972f-2b017057621c	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-17 12:02:12
019ed575-dfd2-73f6-9714-8b66458a5888	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-17 12:02:12
019ed575-dfd4-7032-9912-c2e6054c6d90	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-17 12:02:12
019ed575-dfd5-7216-9be8-6c8a2f6f7ef4	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-17 12:02:12
019ed575-dfd6-715d-8a88-340573a57e94	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-17 12:02:12
019ed575-dfd7-722c-b8bb-eb6f2297ad04	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-17 12:02:12
019ed575-dfd8-72af-b3b6-40848479d9e1	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-17 12:02:12
019ed575-dfc2-71a0-b904-9905beaa6ec8	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-17 12:02:12
019ed575-dfc4-70b5-9055-059ec790a76f	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-17 12:02:12
019ed575-dfc5-72e1-aff9-70a5b9b65ef6	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-17 12:02:12
019ed575-dfc7-7018-b418-0dc1b0ee5364	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-17 12:02:12
019ed575-dfda-72f9-86c2-b090ab1de31e	019ed575-dfbf-7000-babf-a469867cf3d6	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-17 12:02:12
019ed576-2955-7044-95e8-d2f11d7d27c9	019ed576-2952-70f1-af50-1826bc1a0974	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-17 12:02:31
019ed576-2957-72ba-b98b-6b6a9c218751	019ed576-2952-70f1-af50-1826bc1a0974	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	t	2026-06-17 12:02:31
019ed576-2958-7387-b11a-0f492392ed32	019ed576-2952-70f1-af50-1826bc1a0974	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-17 12:02:31
019ed576-295a-725d-9864-0151a0309924	019ed576-2952-70f1-af50-1826bc1a0974	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-17 12:02:31
019ed576-295b-729e-876c-f759e2b5a16a	019ed576-2952-70f1-af50-1826bc1a0974	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-17 12:02:31
019ed576-295d-7301-928c-052ea60ad66b	019ed576-2952-70f1-af50-1826bc1a0974	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	t	2026-06-17 12:02:31
019ed576-295e-702d-a187-917284f02734	019ed576-2952-70f1-af50-1826bc1a0974	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-17 12:02:31
019ed576-295f-7248-9b58-70904d25c1f7	019ed576-2952-70f1-af50-1826bc1a0974	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-17 12:02:31
019ed576-2960-70c0-97a2-69d30e15c525	019ed576-2952-70f1-af50-1826bc1a0974	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-17 12:02:31
019ed576-2962-7375-a57d-fb9384e73eaa	019ed576-2952-70f1-af50-1826bc1a0974	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	t	2026-06-17 12:02:31
019ed576-2963-72ba-9e2c-8f7f9a79b5e7	019ed576-2952-70f1-af50-1826bc1a0974	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	t	2026-06-17 12:02:31
019ed576-2964-73c7-8637-ca7987f9ba12	019ed576-2952-70f1-af50-1826bc1a0974	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-17 12:02:31
019ed576-2965-7278-878e-480504bf04be	019ed576-2952-70f1-af50-1826bc1a0974	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	t	2026-06-17 12:02:31
019ed576-2967-7276-9372-b72366c779d2	019ed576-2952-70f1-af50-1826bc1a0974	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	t	2026-06-17 12:02:31
019ed576-2968-719a-becd-e63a235e2ad9	019ed576-2952-70f1-af50-1826bc1a0974	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-17 12:02:31
019ed576-2969-73e1-a569-823879a8cf80	019ed576-2952-70f1-af50-1826bc1a0974	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-17 12:02:31
019ed576-296a-7245-ad0c-faca81773e0e	019ed576-2952-70f1-af50-1826bc1a0974	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	t	2026-06-17 12:02:31
019ed576-296c-7201-b907-2c9b6826766b	019ed576-2952-70f1-af50-1826bc1a0974	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-17 12:02:31
019ed576-296d-71d1-820e-0f8e1ca8d1f3	019ed576-2952-70f1-af50-1826bc1a0974	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-17 12:02:31
019ed576-296f-7257-8dbd-32363cd0b1c6	019ed576-2952-70f1-af50-1826bc1a0974	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-17 12:02:31
019ed8b8-601b-73f6-b882-f4fb6e1e5b6a	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-18 03:13:42
019ed8b8-601c-7344-a929-319c2dde0a62	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-18 03:13:42
019ed8b8-601d-72b0-827c-62ccc63276be	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-18 03:13:42
019ed8b8-601e-70a4-8ef5-dac1236ad109	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-18 03:13:42
019ed8b8-6020-7251-8adb-73c0e79e9f4b	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-18 03:13:42
019ed8b8-6021-7120-a9a0-8d8bd205136f	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-18 03:13:42
019ed8b8-6022-7297-a983-7fecd18cd52b	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-18 03:13:42
019ed8b8-6023-7371-b7c4-b30d9dc3423b	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-18 03:13:42
019ed8b8-6025-71d2-ae20-88efef8ebfc5	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-18 03:13:42
019ed8b8-6026-7149-b4a4-2ad71ff65584	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-18 03:13:42
019ed8b8-6027-71e8-9d12-cd9b07edd717	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-18 03:13:42
019ed8b8-6028-7038-b94c-1df1d688ae08	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-18 03:13:42
019ed8b8-6010-72f5-9de5-f401dbf4895f	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-327b-70a4-a7ad-d11703dd3c66	where's my key	t	f	2026-06-18 03:13:42
019ed8b8-6011-7289-ac06-86caa42550cb	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-18 03:13:42
019ed8b8-6013-714a-beb3-2b52fa4fc2ed	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-326c-7287-8e58-6efb81d2293f	oh im so sorry	t	f	2026-06-18 03:13:42
019ed8b8-6014-7329-812b-a487310f4748	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3277-7245-8397-2b95ecf990d9	see you later	t	f	2026-06-18 03:13:42
019ed8b8-6015-709e-a010-62e087e929aa	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	i fine thank you	f	f	2026-06-18 03:13:42
019ed8b8-6017-70f8-8d00-e3e3ababcc92	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-18 03:13:42
019ed8b8-6018-7196-9fd0-2d3cf6b712c2	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-327c-71e1-9d58-b2fe6426441a	its already 11.30 pm	t	f	2026-06-18 03:13:42
019ed8b8-6019-7248-aeaf-eb5091783912	019ed8b8-600c-7023-983f-b763f53b5432	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-18 03:13:42
019ed8ec-ca8a-72f5-9bfd-6381461804c9	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca8c-734b-9e63-3bd42f5fd3bd	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca8d-704b-b83a-6d3c01ed3723	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca8f-7144-af7a-3b4f86f887a0	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca90-71df-963b-a4d9826f6321	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca91-724a-bc51-b932c82a11dd	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca92-7165-9acb-e19aedcc60c9	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca93-7218-ac57-f80cd764d973	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca95-7012-a527-f4d3191f5d3d	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca96-73ac-afc7-6eb776a170cd	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca97-7248-a55a-b192280ec3d1	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca98-71ed-b954-f1b5fa07f6c0	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca9a-728d-b821-cc7f8d15c936	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca9b-713b-ad7d-991a4e771361	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca9c-7248-b7dd-186a34a3aadd	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca9d-70a8-af1d-ef59ef91afae	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-18 04:10:57
019ed8ec-ca9f-736d-b7d0-e9a03c0f6ba5	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-18 04:10:57
019ed8ec-caa0-7332-ad6c-c92347a90d02	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-18 04:10:57
019ed8ec-caa1-7243-b16f-77762112fdb9	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-18 04:10:57
019ed8ec-caa3-710f-9a1c-52217bd916b8	019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-18 04:10:57
019ed8ed-eeff-70a9-b8a5-c18f1a2ddb3f	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-327b-70a4-a7ad-d11703dd3c66	where's my key	t	f	2026-06-18 04:12:12
019ed8ed-ef01-7014-b5c7-9cfc22cc13e0	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-326f-71da-ad92-48800b1c008e	are you understand my i mean	f	f	2026-06-18 04:12:12
019ed8ed-ef02-702d-8e16-b6ae9a1f1b6e	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3271-7351-a397-1bfca7c3cebb	ecuse me	f	f	2026-06-18 04:12:12
019ed8ed-ef04-7107-b473-c43d812c5a47	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-327d-739e-b4c9-7e19f212ff0b	im going to bed	t	f	2026-06-18 04:12:12
019ed8ed-ef05-72f1-a632-ed0f73fcbbbc	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-327c-71e1-9d58-b2fe6426441a	it's aready 1130 pm	f	f	2026-06-18 04:12:12
019ed8ed-ef06-721e-90ff-d1f71f94533e	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3276-7022-9eea-b52898a285bc	alright i've to go now	t	f	2026-06-18 04:12:12
019ed8ed-ef07-7030-862f-90dd5754c3bd	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3278-7246-a23e-10370ffbd291	what do you think about this	f	f	2026-06-18 04:12:12
019ed8ed-ef09-72d8-85dc-70dbbc58315d	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3273-7288-ac2e-40fac328fb6d	hey do you wanna grab some coffee now	t	f	2026-06-18 04:12:12
019ed8ed-ef0a-7368-b628-d47b17dbf3dc	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3275-71ec-91d8-9f6937c785d8	soryy im busy	f	f	2026-06-18 04:12:12
019ed8ed-ef0b-708d-8741-e24c8ea031b0	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	fine thank you	t	f	2026-06-18 04:12:12
019ed8ed-ef0c-71c4-84f3-010f08a2a1f4	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-326b-72db-83f5-77053c15a6f1	you're welcome	t	f	2026-06-18 04:12:12
019ed8ed-ef0e-701e-839a-395f9b64054c	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-327e-72b7-9b50-f40528ac67e7	hi you're finally here	t	f	2026-06-18 04:12:12
019ed8ed-ef0f-703a-a8d7-ae6ddbfcb6d8	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-326e-708c-8deb-5b611d1fca9b	its okay	t	f	2026-06-18 04:12:12
019ed8ed-ef10-703a-a6ec-3f23af0f1ce8	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-326a-7367-b316-afb7232fe48c	thank you so much	t	f	2026-06-18 04:12:12
019ed8ed-ef11-735e-b984-8b94c44d1eeb	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-326c-7287-8e58-6efb81d2293f	oh im so sorry	t	f	2026-06-18 04:12:12
019ed8ed-ef12-72fc-992c-3fb91dc60f43	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how're you	f	f	2026-06-18 04:12:12
019ed8ed-ef14-71eb-9c1f-8b6f9fbf7364	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-18 04:12:12
019ed8ed-ef15-7344-9732-3695db82408d	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-327a-73f4-9a63-092cefb1aabf	im agree	f	f	2026-06-18 04:12:12
019ed8ed-ef16-72ca-98ba-5c7de5ebf402	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3277-7245-8397-2b95ecf990d9	see you later	t	f	2026-06-18 04:12:12
019ed8ed-ef17-71d9-ad82-5e9cd988fd55	019ed8ed-eefc-7203-a5b1-0200705e329c	019e71e1-3270-72c4-a123-4fd4e2837da1	i dunno understand	f	f	2026-06-18 04:12:12
019ed90c-862a-7213-a30b-8c246b62f8a9	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3271-7351-a397-1bfca7c3cebb	excuse me	t	f	2026-06-18 04:45:37
019ed90c-862c-7275-b59c-1a7bf9963757	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-326a-7367-b316-afb7232fe48c	thank you so much	t	f	2026-06-18 04:45:37
019ed90c-862e-71c6-a76d-d89ae61ccbb7	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-327b-70a4-a7ad-d11703dd3c66	where's my key	t	f	2026-06-18 04:45:37
019ed90c-862f-704d-888a-485e24afa951	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3277-7245-8397-2b95ecf990d9	see you later	t	f	2026-06-18 04:45:37
019ed90c-8630-73c7-9597-d323ce4e3ddb	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3278-7246-a23e-10370ffbd291	what do think about this idea	f	f	2026-06-18 04:45:37
019ed90c-8632-73d1-8714-f3fa703bfe17	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3280-720c-8511-ed606ebc1ff9	please come in	t	f	2026-06-18 04:45:37
019ed90c-8633-730c-9504-23048c58a3b5	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	fine thank you	t	f	2026-06-18 04:45:37
019ed90c-8634-7163-9e23-630f9adf1529	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3275-71ec-91d8-9f6937c785d8	sorry im busy	t	f	2026-06-18 04:45:37
019ed90c-8635-731e-b0f0-0d589654d0c7	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-327e-72b7-9b50-f40528ac67e7	hi you're finally here	t	f	2026-06-18 04:45:37
019ed90c-8636-72d7-b42a-e1f84a805bb3	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-327c-71e1-9d58-b2fe6426441a	it's already 1130 pm	t	f	2026-06-18 04:45:37
019ed90c-8638-73c0-b6ee-f90a3f86b2af	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-326e-708c-8deb-5b611d1fca9b	it's okay	t	f	2026-06-18 04:45:37
019ed90c-8639-73db-afba-7f402b0f299f	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3270-72c4-a123-4fd4e2837da1	i don't understand	t	f	2026-06-18 04:45:37
019ed90c-863b-70ed-9815-388bf9a573dd	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3273-7288-ac2e-40fac328fb6d	hey do you wanna grab some coffee now	t	f	2026-06-18 04:45:37
019ed90c-863c-716b-9b4d-988d0ecd44f7	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-326b-72db-83f5-77053c15a6f1	thank you	f	f	2026-06-18 04:45:37
019ed90c-863d-736b-baa3-18709681bcbb	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-326c-7287-8e58-6efb81d2293f	oh im so sorry	t	f	2026-06-18 04:45:37
019ed90c-863e-7280-b05a-e0ad401ceecd	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-327d-739e-b4c9-7e19f212ff0b	im going to bed	t	f	2026-06-18 04:45:37
019ed90c-8640-7199-88c8-af2ae184dc9e	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3276-7022-9eea-b52898a285bc	alright i've to go now	t	f	2026-06-18 04:45:37
019ed90c-8641-7170-b15b-33d738cf5d86	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-326f-71da-ad92-48800b1c008e	get what i mean	t	f	2026-06-18 04:45:37
019ed90c-8642-708a-89e5-4bee5fbd4143	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-327a-73f4-9a63-092cefb1aabf	im agree	f	f	2026-06-18 04:45:37
019ed90c-8644-73c8-a159-e12337d2f4ef	019ed90c-8627-722a-8293-dd99951f5cfc	019e71e1-3267-734a-abc1-895dd8abaf31	good morning how's it going	t	f	2026-06-18 04:45:37
019ed923-1f32-71fc-a1ef-c9d1f33cccb4	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-18 05:10:18
019ed923-1f33-711e-86d3-da4f7e353646	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-18 05:10:18
019ed923-1f35-70e1-aefe-b09f08feace7	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-18 05:10:18
019ed923-1f36-71d5-aea5-7bc50a08a3f4	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-18 05:10:18
019ed923-1f37-71b3-a03c-7a60cc7cf3f9	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-18 05:10:18
019ed923-1f38-71f3-a94e-dc655c31bf7d	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-18 05:10:18
019ed923-1f3a-7190-9b66-30de1d30e0e0	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-18 05:10:18
019ed923-1f3b-7393-83fa-8a0c008d8fc9	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-18 05:10:18
019ed923-1f3c-7055-89d1-50877a8e9e93	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-18 05:10:18
019ed923-1f3d-72ab-9a07-d91c565b15c7	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-18 05:10:18
019ed923-1f3e-73b3-b1fc-d224935f872f	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-18 05:10:18
019ed923-1f3f-738a-84d1-dcda56423bab	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-18 05:10:18
019ed923-1f28-7245-9b4c-38b5eac862b6	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-18 05:10:18
019ed923-1f29-71ed-8dbe-82d7af549dbe	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b95-30d3-706c-b753-39c2c9cd6e27	i dunno	t	f	2026-06-18 05:10:18
019ed923-1f2b-716a-bfd4-6093cd3e22ed	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b92-2869-724f-a3c4-4cbfe8941117	hurry up	t	f	2026-06-18 05:10:18
019ed923-1f2c-7162-b869-2b31398d93ad	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b93-72a5-7173-8f22-a29d484b8e37	excuse me where's the toilet	t	f	2026-06-18 05:10:18
019ed923-1f2e-726e-a1ec-85bb462e3008	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b93-72a6-70c5-9006-caab62f97b36	over there	t	f	2026-06-18 05:10:18
019ed923-1f2f-7157-b554-efca4b9f8c36	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b93-72a2-70f2-b8a5-34a992d6f88d	we done eating	f	f	2026-06-18 05:10:18
019ed923-1f30-702d-9686-37c3bb4d2bfd	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b92-2866-73bb-b02e-aec30e8df203	excuse me, i wanna to buy this	f	f	2026-06-18 05:10:18
019ed923-1f31-7220-9a55-e6d831496c7f	019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-18 05:10:18
019ed953-66ed-7363-bc30-fbbf1de79f01	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b93-72a4-719f-92fd-1bb01f8f151f	bill please	t	f	2026-06-18 06:03:02
019ed953-66ee-711b-bfc8-0ad85fe9aeb3	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b92-2867-7295-bd89-eeffa7b5e9e5	how much s it	t	f	2026-06-18 06:03:02
019ed953-66f9-72cc-a2d5-0ef8b4b5bdea	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-18 06:03:02
019ed953-66f6-73b8-91c4-6ac036c01906	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-18 06:03:02
019ed953-66f7-7024-9783-5952bde48454	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-18 06:03:02
019ed953-66f8-73be-91c7-6338aa42adc3	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-18 06:03:02
019ed953-66fa-708d-ae96-251228a42633	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-18 06:03:02
019ed953-66fc-70ae-b69a-ed916f91834f	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-18 06:03:02
019ed953-66fd-72da-b186-22742e7b58c6	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-18 06:03:02
019eda41-07fd-704e-acd4-a56fb1cfc603	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	t	2026-06-18 10:22:35
019eda41-07ff-72d5-9c3b-37284c4d8ee0	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	t	2026-06-18 10:22:35
019eda41-0800-70be-8bf5-97e3ffa64f38	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	t	2026-06-18 10:22:35
019eda41-0802-71e0-b223-9bdb6d0e88b7	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	t	2026-06-18 10:22:35
019eda41-0803-71ee-9725-315abb5cd991	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	t	2026-06-18 10:22:35
019eda41-0805-7335-8352-74c50368129e	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	t	2026-06-18 10:22:35
019eda41-0806-7061-afff-29806b145da0	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	t	2026-06-18 10:22:35
019eda41-0807-71fe-8f82-21c8f5a49e96	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	t	2026-06-18 10:22:35
019eda41-0808-73ab-8ad2-4e0e340e8eda	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	t	2026-06-18 10:22:35
019eda41-080a-7271-82d2-2a41165c55e8	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	t	2026-06-18 10:22:35
019eda41-080b-72be-9395-5ce092b1bec1	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	t	2026-06-18 10:22:35
019eda41-080c-729a-bbfd-26b77e2d5768	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	t	2026-06-18 10:22:35
019ed953-66ff-72cb-97b2-cbc3e37db253	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-18 06:03:02
019ed953-6700-7010-8106-fe8dc9798674	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-18 06:03:02
019ed953-6701-704e-94c9-48cbdabebdce	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-18 06:03:02
019ed953-6702-72ef-b25e-e4cd98a5464a	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-18 06:03:02
019ed953-6704-70d2-a8c5-a454c3599f9e	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-18 06:03:02
019ed953-6705-7368-b717-e20703a70cf0	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-18 06:03:02
019eda41-080e-70ba-adf4-75d890cc77cb	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	t	2026-06-18 10:22:35
019eda41-080f-71ad-a050-1f9fe578b5c2	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	t	2026-06-18 10:22:35
019eda41-0810-7350-a633-42aaabc9ae55	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	t	2026-06-18 10:22:35
019eda41-0811-7300-b60f-a5904f2f638a	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	t	2026-06-18 10:22:35
019eda41-0813-7030-bfc7-78b7a4536de9	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	t	2026-06-18 10:22:35
019ed953-66f0-70a1-836e-003ddd9ea6b7	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b93-72a5-7173-8f22-a29d484b8e37	excuse me where s the toilet	t	f	2026-06-18 06:03:02
019ed953-66f1-700d-8c30-30414975bc77	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b95-30cf-7358-b291-186df440e3e2	this project s so hard i wanna give up	t	f	2026-06-18 06:03:02
019ed953-66f2-708a-92ef-1fa8083d5772	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b92-286a-7211-96ac-244725e33cdc	you look worried everythings okay	t	f	2026-06-18 06:03:02
019ed953-66f4-70c4-86e8-f61113cfbe8a	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	t	2026-06-18 06:03:02
019ed953-66f5-7148-a618-708f5c6230f6	019ed953-66ea-72c3-813a-59cabc6178d2	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-18 06:03:02
019eda41-0814-719f-b4b8-d50736872b37	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	t	2026-06-18 10:22:35
019eda41-0815-70c9-a690-aa347f7a1617	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	t	2026-06-18 10:22:35
019eda41-0816-720b-9656-607e7ad0df39	019eda41-07fa-736b-bb2d-cadc489cc01b	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	t	2026-06-18 10:22:35
019eda43-88d0-728c-9400-4ec53d228a43	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-18 10:25:19
019eda43-88d2-730d-947e-226045347a10	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-18 10:25:19
019eda43-88d3-7050-a47a-3419092d2bc6	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-18 10:25:19
019eda43-88d5-73e3-8f00-7fe1725d11d2	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-18 10:25:19
019eda43-88d6-71b9-a60b-e26dd21a1cf5	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-18 10:25:19
019eda43-88d7-7072-8e3d-a8b51b91d4dd	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-18 10:25:19
019eda43-88d8-734d-93f2-0813ff9d51ce	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-18 10:25:19
019eda43-88da-720b-a7ea-416bbb7124a7	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-18 10:25:19
019eda43-88db-718d-ad6d-297dc2427049	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-18 10:25:19
019eda43-88dc-7207-9a43-4199664b8c84	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-18 10:25:19
019eda43-88dd-70b9-8ca4-db31cf275550	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-18 10:25:19
019eda43-88de-731c-8e55-47a9f2e8df10	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-18 10:25:19
019eda43-88e0-7312-8c14-33da5f285a72	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-18 10:25:19
019eda43-88e1-730a-82c4-0aad0f683460	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-18 10:25:19
019eda43-88e2-72e3-a3aa-1fdf3ba0afcb	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-18 10:25:19
019eda43-88e3-737f-9177-7f40a157003e	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-18 10:25:19
019eda43-88e4-7216-9183-cc91e9a0c536	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-18 10:25:19
019eda43-88e6-71cb-bee0-e6e0dd70a977	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-18 10:25:19
019eda43-88e7-718f-845a-266559fa96dd	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-18 10:25:19
019eda43-88e8-73be-90ad-401d4748c531	019eda43-88cd-703a-b0da-9f7d6ab191b4	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-18 10:25:19
019eda43-9966-730d-b788-190cf9edfce3	019eda43-9963-719c-90a1-c553b648570d	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	t	2026-06-18 10:25:23
019eda43-9968-72fb-9854-c61d5c8d0e6c	019eda43-9963-719c-90a1-c553b648570d	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	t	2026-06-18 10:25:23
019eda43-996a-7173-a568-ff07a3d448d6	019eda43-9963-719c-90a1-c553b648570d	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	t	2026-06-18 10:25:23
019eda43-996b-7059-be0d-df401ead2cc3	019eda43-9963-719c-90a1-c553b648570d	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	t	2026-06-18 10:25:23
019eda43-996c-706f-b77c-741341292e81	019eda43-9963-719c-90a1-c553b648570d	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	t	2026-06-18 10:25:23
019eda43-996d-719c-a00b-861b3b5dd3e8	019eda43-9963-719c-90a1-c553b648570d	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	t	2026-06-18 10:25:23
019eda43-996f-735c-8a87-a717fc1dde99	019eda43-9963-719c-90a1-c553b648570d	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	t	2026-06-18 10:25:23
019eda43-9970-700e-b409-416d75b95089	019eda43-9963-719c-90a1-c553b648570d	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	t	2026-06-18 10:25:23
019eda43-9971-703e-b612-4b499ee21c22	019eda43-9963-719c-90a1-c553b648570d	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	t	2026-06-18 10:25:23
019eda43-9973-7210-874d-a5cfe492fec9	019eda43-9963-719c-90a1-c553b648570d	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	t	2026-06-18 10:25:23
019eda43-9974-71cb-be5e-b46de1dc86b3	019eda43-9963-719c-90a1-c553b648570d	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	t	2026-06-18 10:25:23
019eda43-9975-71b5-8079-a6860e41ee6c	019eda43-9963-719c-90a1-c553b648570d	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	t	2026-06-18 10:25:23
019eda43-9976-73ad-9687-41e7257571e1	019eda43-9963-719c-90a1-c553b648570d	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	t	2026-06-18 10:25:23
019eda43-9978-70e0-ad2d-6ac6099f58cc	019eda43-9963-719c-90a1-c553b648570d	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	t	2026-06-18 10:25:23
019eda43-9979-7030-84ee-9647697c2dc6	019eda43-9963-719c-90a1-c553b648570d	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	t	2026-06-18 10:25:23
019eda43-997a-708e-b513-f6e35b9a4e61	019eda43-9963-719c-90a1-c553b648570d	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	t	2026-06-18 10:25:23
019eda43-997c-70dc-a0a4-1b21849b78d4	019eda43-9963-719c-90a1-c553b648570d	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	t	2026-06-18 10:25:23
019eda43-997d-7249-9be2-621c24cdc027	019eda43-9963-719c-90a1-c553b648570d	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	t	2026-06-18 10:25:23
019eda43-997e-719f-8981-80de1153c38e	019eda43-9963-719c-90a1-c553b648570d	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	t	2026-06-18 10:25:23
019eda43-9980-7267-a77b-804d81279a26	019eda43-9963-719c-90a1-c553b648570d	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	t	2026-06-18 10:25:23
019eda44-960f-71b6-b4e0-d823f7cb2ccd	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-18 10:26:28
019eda44-9610-72f2-bcdb-7408438e2c48	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-18 10:26:28
019eda44-9612-7383-bff0-7985c52fe408	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-18 10:26:28
019eda44-9613-7223-8770-0c42fac6c93b	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-18 10:26:28
019eda44-9614-7261-9e4e-e81d2ca35e5b	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-18 10:26:28
019eda44-9616-7352-8f7b-98d6ca099b51	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-18 10:26:28
019eda44-9617-72b4-9830-54e56d6a4d46	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-18 10:26:28
019eda44-9618-70bc-ac24-0fee09367f8a	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-18 10:26:28
019eda44-961a-7068-a23b-2ab84a985b9b	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-18 10:26:28
019eda44-961b-7230-96c6-a79294d7daa5	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-18 10:26:28
019eda44-961c-70ea-8746-31c11a905731	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-18 10:26:28
019eda44-961d-7202-ad87-7324927da3cd	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-18 10:26:28
019eda44-961e-730f-97f2-1d0893e4d782	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-18 10:26:28
019eda44-961f-7017-8b55-99d4f261fad6	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-18 10:26:28
019eda44-9620-7155-958e-a55404c38c57	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-18 10:26:28
019eda44-9621-70a5-a428-fb8ffdd9f781	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-18 10:26:28
019eda44-9623-704d-b526-74dd604d7280	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-18 10:26:28
019eda44-9624-720d-8864-36cd900d6283	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-18 10:26:28
019eda44-9625-721b-bb36-707bc6792627	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-18 10:26:28
019eda44-9626-72a4-a0fb-6bd77f4ab7fd	019eda44-960c-717e-8e64-5efb7b9e0ee9	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-18 10:26:28
019eda4a-a651-7049-8e52-72adc6635ca4	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-18 10:33:05
019eda4a-a652-734c-a829-b047aeaa0e80	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-18 10:33:05
019eda4a-a653-70d9-aa32-fe147e204b77	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-18 10:33:05
019eda4a-a654-7133-b82f-7b757d46b804	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-18 10:33:05
019eda4a-a656-7320-8e76-191500d28d0f	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	f	2026-06-18 10:33:05
019eda4a-a657-708a-a8e8-14cfe0e1d60f	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-18 10:33:05
019eda4a-a658-7188-a12b-6533fb3c451c	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	f	2026-06-18 10:33:05
019eda4a-a659-72af-9d7b-10a72ad6a488	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-18 10:33:05
019eda4a-a65a-712e-a94f-3a5739bc9a43	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-18 10:33:05
019eda4a-a65c-71e6-b4fc-0b1584cace1e	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	f	2026-06-18 10:33:05
019eda4a-a65d-7226-a1d1-5ce68cd8cc48	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	f	2026-06-18 10:33:05
019eda4a-a65e-714e-851b-e9e0d82c37ff	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-18 10:33:05
019eda4a-a65f-7123-aa34-4b8c67d155cb	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-18 10:33:05
019eda4a-a660-70e8-bfbd-5a01721e4222	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-18 10:33:05
019eda4a-a661-70fd-aaa4-d8fb36803d80	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-18 10:33:05
019eda4a-a662-717f-bb69-675c7545e736	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-18 10:33:05
019eda4a-a663-723c-bedf-42e3cec18382	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b96-cf85-709a-bd49-da5491997789	\N	f	f	2026-06-18 10:33:05
019eda4a-a665-7051-88bd-9dd90b1a3294	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	f	2026-06-18 10:33:05
019eda4a-a666-72c6-9d2d-8b78d1588624	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	f	2026-06-18 10:33:05
019eda4a-a64f-705d-a4a6-c77072d697fd	019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-18 10:33:05
019edad1-4692-72a1-aa4f-1814271a5e1b	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	t	2026-06-18 13:00:08
019edad1-4695-7304-97e5-b7415c9e3a6d	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	t	2026-06-18 13:00:08
019edad1-4696-70d4-b764-554bbda0e07e	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-18 13:00:08
019edad1-4698-732c-b235-cd82d26f788c	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-18 13:00:08
019edad1-4699-726d-9a36-1e65d15e1f46	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-18 13:00:08
019edad1-469a-71cd-bc38-08c2796f9b25	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-18 13:00:08
019edad1-469c-718d-a59f-082adeed5b08	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	t	2026-06-18 13:00:08
019edad1-469d-7373-a396-2afd1cfb3a30	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	t	2026-06-18 13:00:08
019edad1-469e-713a-8616-e2df6774c4a0	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-18 13:00:08
019edad1-469f-705c-9c81-54885491920b	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	t	2026-06-18 13:00:08
019edad1-46a1-7219-8e71-360bacb2b5e4	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-18 13:00:08
019edad1-46a2-7175-aaed-3fa4951eb09b	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-18 13:00:08
019edad1-46a3-70ae-a253-61f9678ea5bc	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-18 13:00:08
019edad1-46a4-70d7-a838-9849f8194a42	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	t	2026-06-18 13:00:08
019edad1-46a6-7067-aad2-70cb31cff86d	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	t	2026-06-18 13:00:08
019edad1-46a7-7334-9a63-65360897cf9e	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-18 13:00:08
019edad1-46a8-71a5-9866-52a6612317fc	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-18 13:00:08
019edad1-46aa-7360-a80c-8def7a9a1ae8	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-18 13:00:08
019edad1-46ab-73f9-8f91-11ee513154fa	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-18 13:00:08
019edad1-46ac-737b-aeb4-d47a6f825f37	019edad1-468e-706f-8b81-56e8d75535a9	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-18 13:00:08
019edad3-1345-7287-854b-4b1ce508f291	019edad3-1338-7211-828d-5a180c9c4c24	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	f	2026-06-18 13:02:06
019edad3-1346-719b-b678-1a9ec8db0ecb	019edad3-1338-7211-828d-5a180c9c4c24	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	f	2026-06-18 13:02:06
019edad3-1347-7371-8936-506f2c41e18c	019edad3-1338-7211-828d-5a180c9c4c24	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	f	2026-06-18 13:02:06
019edad3-1348-7362-a58d-f8262d99232a	019edad3-1338-7211-828d-5a180c9c4c24	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	f	2026-06-18 13:02:06
019edad3-1349-704a-8e9c-b2f5fe38916c	019edad3-1338-7211-828d-5a180c9c4c24	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	f	2026-06-18 13:02:06
019edad3-134b-704a-a0f0-f365c1ef42e9	019edad3-1338-7211-828d-5a180c9c4c24	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	f	2026-06-18 13:02:06
019edad3-134c-73b7-8d3b-331c632f5efb	019edad3-1338-7211-828d-5a180c9c4c24	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	f	2026-06-18 13:02:06
019edad3-134d-739b-bcd9-678660f1a29c	019edad3-1338-7211-828d-5a180c9c4c24	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	f	2026-06-18 13:02:06
019edad3-133b-717f-9f03-deef0503c6de	019edad3-1338-7211-828d-5a180c9c4c24	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-18 13:02:06
019edad3-133d-7077-ab5e-3360194ba5a1	019edad3-1338-7211-828d-5a180c9c4c24	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-18 13:02:06
019edad3-133e-700d-8e75-3a1541e797fb	019edad3-1338-7211-828d-5a180c9c4c24	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-18 13:02:06
019edad3-133f-73ed-9a66-cda9b40bf107	019edad3-1338-7211-828d-5a180c9c4c24	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-18 13:02:06
019edad3-1341-7160-a1f7-595b3b74ab50	019edad3-1338-7211-828d-5a180c9c4c24	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-18 13:02:06
019edad3-1342-711b-881a-937fbb370adb	019edad3-1338-7211-828d-5a180c9c4c24	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-18 13:02:06
019edad3-1343-738a-8fdc-b07f8b5d45db	019edad3-1338-7211-828d-5a180c9c4c24	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-18 13:02:06
019edad3-134f-7082-9fa1-8f35df9e344f	019edad3-1338-7211-828d-5a180c9c4c24	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	f	2026-06-18 13:02:06
019edad3-1350-7014-9e50-2d699c634031	019edad3-1338-7211-828d-5a180c9c4c24	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	f	2026-06-18 13:02:06
019edad3-1351-71c8-84b4-1286e560ee01	019edad3-1338-7211-828d-5a180c9c4c24	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	f	2026-06-18 13:02:06
019edad3-1353-7005-8f94-25022c5aa384	019edad3-1338-7211-828d-5a180c9c4c24	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	f	2026-06-18 13:02:06
019edad3-1354-7041-a1ea-196fece6823a	019edad3-1338-7211-828d-5a180c9c4c24	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	f	2026-06-18 13:02:06
019edaeb-6b6f-71ed-b94d-fbd64571ea98	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-18 13:28:42
019edaeb-6b70-717b-b628-da6214c7af7d	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-18 13:28:42
019edaeb-6b71-7132-9c5f-522efaac4577	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-18 13:28:42
019edaeb-6b72-735b-a35b-37e92e9870be	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-18 13:28:42
019edaeb-6b74-71b8-9eb1-681f4611b648	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-18 13:28:42
019edaeb-6b75-71c8-88bc-b5d52dac6f66	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-18 13:28:42
019edaeb-6b76-733e-9c65-1495c79c115a	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-18 13:28:42
019edaeb-6b77-72f0-9b88-696eb3338023	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-18 13:28:42
019edaeb-6b79-70e4-a244-abc295806bff	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-18 13:28:42
019edaeb-6b7a-7007-992e-a619ea53e0d3	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-18 13:28:42
019edaeb-6b7b-719d-9f43-01a9acb65a03	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-18 13:28:42
019edaeb-6b7c-7118-b0bc-402c81e64745	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-18 13:28:42
019edaeb-6b7e-7367-a385-d2d6e5460e26	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-18 13:28:42
019edaeb-6b7f-7380-92ca-9b9a97257ed2	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-18 13:28:42
019edaeb-6b80-7149-aa03-aa7da32aa2f6	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-18 13:28:42
019edaeb-6b81-71bd-b19f-e4cbec2d5236	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-18 13:28:42
019edaeb-6b82-7288-9db8-82346ced9c8d	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-18 13:28:42
019edaeb-6b83-72b2-b75a-778324325b31	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-18 13:28:42
019edaeb-6b6c-73e6-bdaa-21405ed4006e	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-18 13:28:42
019edaeb-6b6d-7237-9a8a-7c9b689dcf74	019edaeb-6b69-736f-99ad-3d2765fc87f5	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-18 13:28:42
019edf4b-a2b2-71cb-8e27-2a75f7f0cab3	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc1-9c76-70c3-9c05-82e7e05cdc24	\N	f	f	2026-06-19 09:52:16
019edf4b-a2b4-7039-b880-d690e9626229	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc4-4fbb-727d-ab39-1ecf35062c59	\N	f	f	2026-06-19 09:52:16
019edf4b-a2b5-70d4-a65d-a109e24235c8	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc2-de0c-71bb-8a67-670ea9144baf	\N	f	f	2026-06-19 09:52:16
019edf4b-a2b6-7375-b627-16b1356feab3	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	\N	f	f	2026-06-19 09:52:16
019edf4b-a2b8-73fe-aa82-72959053e439	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc4-4fbc-7333-abaf-844f2ff9c177	\N	f	f	2026-06-19 09:52:16
019edf4b-a2b9-734f-a7c9-b7c111769f0f	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc4-4fbd-7261-8742-8047409d06ae	\N	f	f	2026-06-19 09:52:16
019edf4b-a2ba-73a8-9b43-422463e0bc16	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc1-9c70-7163-a98e-f76e93c46b00	\N	f	f	2026-06-19 09:52:16
019edf4b-a2bc-709f-8ee8-8b05a2498641	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc1-9c74-7378-928d-e83b5579b9aa	\N	f	f	2026-06-19 09:52:16
019edf4b-a2bd-70c3-98cf-e6a95bf4f60c	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc2-de0a-71cd-96f7-5d57aafe8804	\N	f	f	2026-06-19 09:52:16
019edf4b-a2be-720d-a159-14ea4d051d5f	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc1-9c72-73fd-9bd9-fcb97b76385d	\N	f	f	2026-06-19 09:52:16
019edf4b-a2bf-7037-bf70-3b15d5298002	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c0-7129-ba55-003d3cb35055	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc4-4fb9-7012-a874-60626596c19b	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c1-72ca-96cd-161cd2bddc6c	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc2-de0b-729e-b62c-b3dd0ea91312	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c2-7137-b1e3-5c2474a41d7e	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bbf-eaf8-72db-89b4-98c4a7aaf349	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c3-72b3-a715-29fdb6ad0c49	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc4-4fbe-7145-990d-e3c7a8f2e280	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c4-7246-bd02-feab912ca51e	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc2-de08-73f7-aa5d-83b23cdf54e1	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c6-7284-b16b-45653f88a429	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bbf-eaf5-7246-9dd4-9a117ac392c9	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c7-733f-b528-55f90e905ee9	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bbf-eaf9-7364-ad63-b0e73f4eb101	\N	f	f	2026-06-19 09:52:16
019edf4b-a2c8-70b9-9da2-7de206736751	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bc1-9c75-7218-8008-c793491ba389	\N	f	f	2026-06-19 09:52:16
019edf4b-a2ca-71ae-a0ab-6110325efcfe	019edf4b-a2ae-700b-a2bc-314b51d97abe	019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	\N	f	f	2026-06-19 09:52:16
019edf4b-c85f-732f-9c66-c7c8baad9523	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	t	2026-06-19 09:52:26
019edf4b-c860-71bf-84f6-bca7982ac6db	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-19 09:52:26
019edf4b-c862-7112-9fad-e3cc17d048a8	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	t	2026-06-19 09:52:26
019edf4b-c863-71f9-9203-54b5957a1375	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-19 09:52:26
019edf4b-c865-7277-bb02-b971992f74ca	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	t	2026-06-19 09:52:26
019edf4b-c866-73c5-9952-3421e774d7e4	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-19 09:52:26
019edf4b-c867-71b7-a234-8b00b2ba672a	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	t	2026-06-19 09:52:26
019edf4b-c868-7137-b52d-c26bd7e77186	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-19 09:52:26
019edf4b-c86a-710d-b63c-94df641b0a9d	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	t	2026-06-19 09:52:26
019edf4b-c86b-7250-8319-9db8404c9c83	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-19 09:52:26
019edf4b-c86d-7051-ba32-853f046959db	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-19 09:52:26
019edf4b-c86e-7065-838f-1974d6c08716	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-19 09:52:26
019edf4b-c86f-7016-86a1-c31883cf1538	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-19 09:52:26
019edf4b-c871-71b2-9c1b-e8a12ebd8268	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	t	2026-06-19 09:52:26
019edf4b-c872-7213-b5a4-714bb4bef824	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	t	2026-06-19 09:52:26
019edf4b-c873-7242-aa65-3557063ebf1e	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	t	2026-06-19 09:52:26
019edf4b-c875-739a-8ec1-901eafe40e23	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	t	2026-06-19 09:52:26
019edf4b-c876-7023-a3e8-878106ea841c	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-19 09:52:26
019edf4b-c877-7389-a691-8e7ce68d534c	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	t	2026-06-19 09:52:26
019edf4b-c878-7038-bab8-93333eb7c7da	019edf4b-c85c-7327-80dc-bace379d69e9	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-19 09:52:26
019edf4e-1779-735c-8b0d-0552b8ab39cd	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b95-30d2-70b7-8a4a-8380976f5294	\N	f	t	2026-06-19 09:54:57
019edf4e-177b-7134-bd29-5bad8ad2fceb	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	\N	f	t	2026-06-19 09:54:57
019edf4e-177d-7167-bfc1-44ec996b5c9d	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b93-72a2-70f2-b8a5-34a992d6f88d	\N	f	t	2026-06-19 09:54:57
019edf4e-177e-7356-8849-e9692c6681ad	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b96-cf8a-7229-8e92-279f82780bfb	\N	f	t	2026-06-19 09:54:57
019edf4e-177f-71ba-afab-d443e3d09f02	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b93-72a5-7173-8f22-a29d484b8e37	\N	f	t	2026-06-19 09:54:57
019edf4e-1781-7309-a8a7-0eef5b1f7373	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b96-cf85-709a-bd49-da5491997789	\N	f	t	2026-06-19 09:54:57
019edf4e-1782-7354-ba71-0dc97ae7f574	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b96-cf88-70e2-ad7f-9d5b79ce5710	\N	f	t	2026-06-19 09:54:57
019edf4e-1783-71f2-b249-7e74669bba30	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b95-30d1-7115-adce-9a46439b1e43	\N	f	t	2026-06-19 09:54:57
019edf4e-1784-7355-80ba-a55244b80364	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b93-72a0-7149-bcf1-20286bec7997	\N	f	t	2026-06-19 09:54:57
019edf4e-1786-72bc-a33b-edad4dce9041	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b95-30cf-7358-b291-186df440e3e2	\N	f	t	2026-06-19 09:54:57
019edf4e-1787-71ce-955a-187345d0fa04	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b93-72a6-70c5-9006-caab62f97b36	\N	f	t	2026-06-19 09:54:57
019edf4e-1788-72cf-9889-21b8fec64df4	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b92-2866-73bb-b02e-aec30e8df203	\N	f	t	2026-06-19 09:54:57
019edf4e-1789-73a0-969b-37f9b3395241	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b92-2867-7295-bd89-eeffa7b5e9e5	\N	f	t	2026-06-19 09:54:57
019edf4e-178b-7099-9ae7-6a31466f5da5	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b92-286b-7188-8d3e-f455b947f6e3	\N	f	t	2026-06-19 09:54:57
019edf4e-178c-72ba-af00-2338ab6aa7f8	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b92-2869-724f-a3c4-4cbfe8941117	\N	f	t	2026-06-19 09:54:57
019edf4e-178d-7300-8efb-ee65b08ba0be	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b95-30d5-73a1-87c6-f54e0f65931d	\N	f	t	2026-06-19 09:54:57
019edf4e-178e-7333-9483-0b2e1687b833	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b96-cf83-7291-9bfd-4366f670d4e8	\N	f	t	2026-06-19 09:54:57
019edf4e-178f-7293-b7e5-ec533c2b430a	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b92-286a-7211-96ac-244725e33cdc	\N	f	t	2026-06-19 09:54:57
019edf4e-1790-72b9-85a8-2ee49409d866	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b95-30d3-706c-b753-39c2c9cd6e27	\N	f	t	2026-06-19 09:54:57
019edf4e-1791-7178-831f-37889f3ed934	019edf4e-1776-7109-b8a3-dbdc55c1c103	019e7b93-72a4-719f-92fd-1bb01f8f151f	\N	f	t	2026-06-19 09:54:57
019edf50-4a4c-71b6-83da-68f84b53ab56	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba7-8684-706d-8e79-903dbdfd5f91	\N	f	f	2026-06-19 09:57:21
019edf50-4a4e-72c9-b6b2-517abe2a1b35	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7baa-925b-70a3-9d03-a2c9c5b49d2d	\N	f	f	2026-06-19 09:57:21
019edf50-4a4f-7268-b5a7-56d026502fe9	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7bab-79f9-720b-9752-aab2d6683393	\N	f	f	2026-06-19 09:57:21
019edf50-4a50-7329-a692-43965ec54cd3	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7bab-79fd-732d-8b58-75301bbf54cb	\N	f	f	2026-06-19 09:57:21
019edf50-4a52-71ff-99b0-ba6cbcd4ff03	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba8-c28b-728b-8b5c-adc20c5139e6	\N	f	f	2026-06-19 09:57:21
019edf50-4a53-71e9-b25e-680bcc4af10d	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba8-c289-7060-85c3-c7758c2e1a02	\N	f	f	2026-06-19 09:57:21
019edf50-4a54-70b7-8a04-9804ba7e0304	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7baa-9257-71b1-b5f8-17b4b20c8759	\N	f	f	2026-06-19 09:57:21
019edf50-4a56-70f1-85f3-a1991669a391	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7bab-79fc-724a-8010-8f6cfee7d5bb	\N	f	f	2026-06-19 09:57:21
019edf50-4a57-7154-98e8-8753bdc9faf2	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba7-8688-722e-a58e-649754c118f2	\N	f	f	2026-06-19 09:57:21
019edf50-4a58-73ff-8019-03cf4fab7ebb	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba8-c288-71bb-999e-6483ad6d705a	\N	f	f	2026-06-19 09:57:21
019edf50-4a59-71ef-a39d-07fc1452b96b	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba8-c286-737c-8b88-5b51104a975e	\N	f	f	2026-06-19 09:57:21
019edf50-4a5b-7041-977d-233764691d50	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7bab-79f7-716c-9b04-1a1bbbbb7246	\N	f	f	2026-06-19 09:57:21
019edf50-4a5c-7002-a0a5-34ebc3a5c245	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba7-8687-70c9-98e4-c7fb328bff8b	\N	f	f	2026-06-19 09:57:21
019edf50-4a5e-7241-931b-1207fd2fc735	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7baa-9255-73de-890b-f0f4eabada61	\N	f	f	2026-06-19 09:57:21
019edf50-4a5f-73ca-bd53-7f1ff2961ffc	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7baa-9258-7269-8cb6-67b777f41dab	\N	f	f	2026-06-19 09:57:21
019edf50-4a60-7382-a080-8e5f3286fb18	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7baa-9259-72f1-bafe-c60b67fd06af	\N	f	f	2026-06-19 09:57:21
019edf50-4a61-7112-9f5b-0b8fda7dce73	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba7-8685-7111-b6c8-641c785adf9b	\N	f	f	2026-06-19 09:57:21
019edf50-4a63-7175-b70d-1511e71ddae5	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba8-c28c-73c3-9cae-59ab23479bc2	\N	f	f	2026-06-19 09:57:21
019edf50-4a64-73ff-a707-6c646f5a1781	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7ba7-8682-7218-8276-d3aefb06c058	\N	f	f	2026-06-19 09:57:21
019edf50-4a4b-7218-99c8-34b46e0f6311	019edf50-4a48-7253-b8aa-ebb428f584d2	019e7bab-79fa-7084-96ab-cb12e2c8c5cb	\N	f	t	2026-06-19 09:57:21
019eef82-faab-708f-be77-69161e373e20	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-22 13:26:39
019eef82-faad-73bc-a2b4-53d9f4989e26	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-22 13:26:39
019eef82-faae-73dd-974d-7bc18829eed8	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-22 13:26:39
019eef82-faaf-7211-8b8e-9dbf02d6301c	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-22 13:26:39
019eef82-fab1-710c-b070-be106959eb8a	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-22 13:26:39
019eef82-fab2-7313-9bfb-7a6dcd41d76a	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-22 13:26:39
019eef82-fab3-72bd-9a9d-335520c7f1f9	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-22 13:26:39
019eef82-fab5-7145-85ae-66edc5150c52	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-22 13:26:39
019eef82-fab6-738b-b0ff-e1eac3e1d121	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-22 13:26:39
019eef82-fab7-7215-bd77-3dbf4ba29548	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-22 13:26:39
019eef82-fab8-7070-837b-d80395991dc4	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-22 13:26:39
019eef82-faba-72be-b9a9-ae1d03934455	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-22 13:26:39
019eef82-fabb-7137-a3fc-7532099bf564	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-22 13:26:39
019eef82-fabc-73ed-97d4-cd738eb3aa67	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-22 13:26:39
019eef82-fabd-71be-b185-fa57f403f948	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-22 13:26:39
019eef82-fabf-7267-9558-13d1b8434505	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-22 13:26:39
019eef82-fac0-711b-a142-9db8fa144e29	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-22 13:26:39
019eef82-fac1-728e-bd8f-f9ba4b458f77	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-22 13:26:39
019eef82-fac2-72c6-9ed2-707f55af2911	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-22 13:26:39
019eef82-faa9-7311-ba11-fe52090574a1	019eef82-faa3-7233-8e5e-f29ac084ee4d	019e71e1-3278-7246-a23e-10370ffbd291	what do you think about this idea	t	f	2026-06-22 13:26:39
019eef86-e365-73f4-b56c-1e3ef2164ecf	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-22 13:30:55
019eef86-e367-7278-af03-492b06852a30	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-22 13:30:55
019eef86-e362-7314-965f-16043d54148e	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3270-72c4-a123-4fd4e2837da1	i dunno	f	f	2026-06-22 13:30:55
019eef86-e364-725c-acee-631200e2b661	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	t	2026-06-22 13:30:55
019eef86-e368-7096-99a4-e00c38ee9566	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-22 13:30:55
019eef86-e369-72e8-baf3-e8770ac1045c	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-22 13:30:55
019eef86-e36b-7267-893a-5c092783fd96	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-22 13:30:55
019eef86-e36c-70c2-9b80-df827dd7778b	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-22 13:30:55
019eef86-e36d-726d-88cc-800810b66653	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-22 13:30:55
019eef86-e36f-733f-8236-7ad03bc4d3f3	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-22 13:30:55
019eef86-e370-7335-8eac-864c7bf4e7a4	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-22 13:30:55
019eef86-e371-7098-9e69-6fb1e885d249	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-22 13:30:55
019eef86-e372-72c2-9636-6e8db4744d76	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-22 13:30:55
019eef86-e374-7151-a187-0fba2a29282b	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-22 13:30:55
019eef86-e375-729e-af47-c79e438432db	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-22 13:30:55
019eef86-e377-7187-9338-0ca3f5b7ec56	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-22 13:30:55
019eef86-e378-71ff-b132-16403b5f2fa3	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-22 13:30:55
019eef86-e379-723f-94d9-d451d660865e	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-22 13:30:55
019eef86-e37a-73fb-bcd8-f3a7edbb37e0	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-22 13:30:55
019eef86-e361-71f6-80a1-e957bb12bf2b	019eef86-e35e-739b-8088-1243fe12dca5	019e71e1-3276-7022-9eea-b52898a285bc	alright i've to go now	f	f	2026-06-22 13:30:55
019ef2f7-707a-715d-bf66-5846f8cffacf	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-23 05:32:43
019ef2f7-707b-73d2-a49f-d748eaf11ed1	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-23 05:32:43
019ef2f7-707c-7114-b296-d033f988a053	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-23 05:32:43
019ef2f7-707e-70e8-a3fb-cb29f94026b9	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-23 05:32:43
019ef2f7-707f-73a9-84be-c01efb4fdb4f	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-23 05:32:43
019ef2f7-7080-7302-81c1-e9b8e2d40697	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-23 05:32:43
019ef2f7-7082-70f0-83cb-94967b859090	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-23 05:32:43
019ef2f7-7083-7067-a870-38ffdb54a2e6	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-23 05:32:43
019ef2f7-7084-7029-8b66-2c12761efd10	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-23 05:32:43
019ef2f7-7085-71f0-992d-f922b80d36d2	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-23 05:32:43
019ef2f7-7086-7341-88a9-ad46593565c2	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-23 05:32:43
019ef2f7-7087-710e-9377-27e5b233e931	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-23 05:32:43
019ef2f7-7088-7200-9445-6c761c435236	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-23 05:32:43
019ef2f7-7089-7227-b370-2d8213a5f988	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-23 05:32:43
019ef2f7-708b-7223-9c16-c082aa789d7e	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-23 05:32:43
019ef2f7-708c-72da-a54a-99bf9a62bf11	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-23 05:32:43
019ef2f7-708d-70ea-bc9a-6c045137d7e9	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-23 05:32:43
019ef2f7-708e-702e-84a6-b513b82ff467	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-23 05:32:43
019ef2f7-7077-7340-aa05-2ffb43a4189e	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-23 05:32:42
019ef2f7-7079-7083-a4f0-23dc44fb1df9	019ef2f7-7072-731f-8b95-3ac46da33dd2	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-23 05:32:43
019ef352-7d7a-717b-995e-dc87928a48df	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-23 07:12:10
019ef352-7d7b-73dd-bb06-f9607a08e034	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-23 07:12:10
019ef352-7d7d-7142-a5df-8841681c1148	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-23 07:12:10
019ef352-7d7e-736d-b7d7-0c0fb50c7ded	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-23 07:12:10
019ef352-7d7f-73e7-9e7f-f7c13b57a129	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-23 07:12:10
019ef352-7d81-725d-9d70-215091c2921e	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-23 07:12:10
019ef352-7d82-705d-ad64-6903ccb72a35	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-23 07:12:10
019ef352-7d83-702e-a136-2d465626642f	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-23 07:12:10
019ef352-7d85-71b9-aeb7-e2971cdca2b5	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-23 07:12:10
019ef352-7d86-7037-a489-5eaaa35c8419	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-23 07:12:10
019ef352-7d87-7037-9a0e-135524fdc12c	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-23 07:12:10
019ef352-7d88-7163-96ed-b489c1eb4154	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-23 07:12:10
019ef352-7d8a-739c-9773-0f44ce75b0f5	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-23 07:12:10
019ef352-7d8b-728b-8ae6-c14bb245d8a4	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-23 07:12:10
019ef352-7d8c-71ad-9895-13bef68c836f	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-23 07:12:10
019ef352-7d8d-71ca-b66c-1b427bca116b	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-23 07:12:10
019ef352-7d8e-72c4-bd23-4ea942f18d71	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-23 07:12:10
019ef352-7d90-7164-ae0d-9ab548b68c7b	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-23 07:12:10
019ef352-7d91-70e2-88bc-51ee4485d84d	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-23 07:12:10
019ef352-7d92-70e6-82ca-9403cee4aa04	019ef352-7d76-7388-986b-ec5cf5660453	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-23 07:12:10
019ef393-2f8f-72f7-a006-afbd8d7930a1	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-23 08:22:49
019ef393-2f90-7238-8d27-0a12b4d776e9	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	t	2026-06-23 08:22:50
019ef393-2f92-7372-8c27-fb399ce9be5b	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	t	2026-06-23 08:22:50
019ef393-2f93-710a-84e7-9c6cb5428f90	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-23 08:22:50
019ef393-2f95-7044-b90f-16bb9a486820	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	t	2026-06-23 08:22:50
019ef393-2f96-710c-a889-fcca5e0080a0	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	t	2026-06-23 08:22:50
019ef393-2f97-73d5-ba1e-aab3b41a9bf9	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-23 08:22:50
019ef352-b0df-7389-a80f-9752640b74b5	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-23 07:12:23
019ef352-b0e0-701f-a872-d625663d23a7	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-23 07:12:23
019ef352-b0e1-736b-a7fa-14606f44154b	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-23 07:12:23
019ef352-b0e2-71da-abba-12cb9ef4a1d9	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-23 07:12:23
019ef352-b0e4-734a-92a4-04f7d5359f86	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-23 07:12:23
019ef352-b0e5-7141-aa08-52133b039217	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-23 07:12:23
019ef352-b0e6-72ed-9e7c-4eb7adf766de	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-23 07:12:23
019ef352-b0e7-721d-b2b9-fc0314ba4c15	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-23 07:12:23
019ef352-b0e9-72c6-a3b0-51e89a7893b8	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-23 07:12:23
019ef352-b0ea-711a-a7ae-1320d62ddfaa	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-23 07:12:23
019ef352-b0eb-7302-9e8c-9de0478a369c	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-23 07:12:23
019ef352-b0ec-732e-b3cb-0221bfeac7b1	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-23 07:12:23
019ef352-b0ed-71ff-8a36-f649647f4ea0	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-23 07:12:23
019ef352-b0ee-7003-ac10-e6eebf223f85	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-23 07:12:23
019ef352-b0f0-7034-b2bd-3c668407b2b1	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-23 07:12:23
019ef352-b0f1-7095-96d7-b32b0a2c82e6	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-23 07:12:23
019ef393-2f98-706c-85dc-d84415c667d1	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	t	2026-06-23 08:22:50
019ef393-2f9a-7068-bf15-ef09a2d227bb	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-23 08:22:50
019ef352-b0f2-701d-9785-cbea7bd90a4d	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-23 07:12:23
019ef352-b0f3-706c-b7dc-1f6399dff8c5	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-23 07:12:23
019ef352-b0db-72b0-be76-b66afc3bbc61	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-326e-708c-8deb-5b611d1fca9b	it's okay	t	f	2026-06-23 07:12:23
019ef352-b0dd-7133-822f-80de14920429	019ef352-b0d9-71ef-96b1-6adb31426369	019e71e1-3276-7022-9eea-b52898a285bc	alright i gotta go now	t	f	2026-06-23 07:12:23
019ef393-2f9b-7156-8819-829ee1bf731f	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-23 08:22:50
019ef393-2f9c-72dc-8a62-98c4d7c66691	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-23 08:22:50
019ef393-2f9d-70cb-ad50-0278ca6ff632	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-23 08:22:50
019ef393-2f9e-7095-9f0e-a696f057f76b	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-23 08:22:50
019ef393-2fa0-733f-9ca2-83cb725a7a46	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-23 08:22:50
019ef393-2fa1-71ac-a839-0f1060a066a3	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-23 08:22:50
019ef393-2fa2-7343-9512-e0d33bc9329e	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-23 08:22:50
019ef393-2fa3-7395-8321-5727b67f9cd0	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-23 08:22:50
019ef393-2fa5-71bd-a16b-47c7606a1fdd	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-23 08:22:50
019ef393-2fa6-7056-a8cd-e7d65497deb5	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-23 08:22:50
019ef393-2fa7-735f-b725-48320b90429c	019ef393-2f8a-739a-85a4-fc4d55704924	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-23 08:22:50
019ef39b-1304-72b1-a053-55f7dd798255	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-23 08:31:26
019ef39b-1306-7378-aff7-53b24e367bc3	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-23 08:31:26
019ef39b-1307-728f-a24d-ed710e4b28a8	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-23 08:31:26
019ef39b-1308-7227-8050-fce453aee7d4	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-23 08:31:26
019ef39b-1309-7339-9641-45e44d2f6412	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	f	2026-06-23 08:31:26
019ef39b-130a-730b-afef-2682057a1559	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-23 08:31:26
019ef39b-130c-70b9-9be9-5e44b5f9f5ea	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-23 08:31:26
019ef39b-130d-7093-aff0-e9c529f14b2f	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-23 08:31:26
019ef39b-130e-7326-bdbc-926fd8cd3f53	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-23 08:31:26
019ef39b-1310-7131-ab6f-04746d536db8	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-23 08:31:26
019ef39b-1311-73fd-96c4-f333103db4e2	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	f	2026-06-23 08:31:26
019ef39b-1312-7190-b50b-1f3dd77354a6	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-23 08:31:26
019ef39b-1313-73a6-87c2-aa13f6b31931	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	f	2026-06-23 08:31:26
019ef39b-1315-718a-9f78-816cab837186	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	f	2026-06-23 08:31:26
019ef39b-1316-7181-ac61-ff0f39c4089b	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	f	2026-06-23 08:31:26
019ef39b-1317-70ae-a1d3-abcfcc46ad80	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	f	2026-06-23 08:31:26
019ef39b-1318-70ed-80ff-0074a398ccdf	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	f	2026-06-23 08:31:27
019ef39b-1319-722a-aa5b-ead7130d52f0	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	f	2026-06-23 08:31:27
019ef39b-131a-71a5-8b0a-1251e8806164	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-23 08:31:27
019ef39b-131b-701f-8d22-b15546286f63	019ef39b-1300-712c-a945-c8c83d8e3bc7	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	f	2026-06-23 08:31:27
019ef39b-7f49-711d-8157-44d20569acf5	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3278-7246-a23e-10370ffbd291	\N	f	f	2026-06-23 08:31:54
019ef39b-7f4a-736c-9d2c-d601f5b41a98	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-327b-70a4-a7ad-d11703dd3c66	\N	f	f	2026-06-23 08:31:54
019ef39b-7f4c-72e5-99a3-1fda64e0e8f1	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-326c-7287-8e58-6efb81d2293f	\N	f	f	2026-06-23 08:31:54
019ef39b-7f4d-7075-bd0e-49e168e88bbb	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-326b-72db-83f5-77053c15a6f1	\N	f	f	2026-06-23 08:31:54
019ef39b-7f4f-714c-9996-de53e7df105f	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3267-734a-abc1-895dd8abaf31	\N	f	f	2026-06-23 08:31:54
019ef39b-7f50-7251-8b39-7926841bf1ed	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-327d-739e-b4c9-7e19f212ff0b	\N	f	f	2026-06-23 08:31:54
019ef39b-7f51-73f0-aace-99e926207eae	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3271-7351-a397-1bfca7c3cebb	\N	f	f	2026-06-23 08:31:54
019ef39b-7f52-73e8-9962-b32b03f98679	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3270-72c4-a123-4fd4e2837da1	\N	f	f	2026-06-23 08:31:54
019ef39b-7f53-7067-b8e8-163c4a85690b	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-326f-71da-ad92-48800b1c008e	\N	f	f	2026-06-23 08:31:54
019ef39b-7f55-70f7-8e23-fcc5de0c6921	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3280-720c-8511-ed606ebc1ff9	\N	f	f	2026-06-23 08:31:54
019ef39b-7f56-73ec-b018-347288dc9813	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-326e-708c-8deb-5b611d1fca9b	\N	f	f	2026-06-23 08:31:54
019ef39b-7f3d-7193-bab2-e59849b9e696	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-327e-72b7-9b50-f40528ac67e7	\N	f	t	2026-06-23 08:31:54
019ef39b-7f3f-712e-a094-315781000ced	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-327c-71e1-9d58-b2fe6426441a	\N	f	t	2026-06-23 08:31:54
019ef39b-7f40-70e4-b2a5-c7fec4f682a0	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-326a-7367-b316-afb7232fe48c	\N	f	t	2026-06-23 08:31:54
019ef39b-7f41-738b-b751-0f78df9b24a3	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3273-7288-ac2e-40fac328fb6d	\N	f	t	2026-06-23 08:31:54
019ef39b-7f43-72b9-9562-2917aebc6ac7	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-327a-73f4-9a63-092cefb1aabf	\N	f	t	2026-06-23 08:31:54
019ef39b-7f44-7320-945d-5716dbf67809	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3277-7245-8397-2b95ecf990d9	\N	f	t	2026-06-23 08:31:54
019ef39b-7f45-70e4-bedd-dbf515bcd065	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3269-7090-b8b5-dd70d2b8fa7b	\N	f	t	2026-06-23 08:31:54
019ef39b-7f47-7258-bd7a-8a7d50697f85	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3275-71ec-91d8-9f6937c785d8	\N	f	t	2026-06-23 08:31:54
019ef39b-7f48-70b3-80fe-0ad5df5041dc	019ef39b-7f3a-728c-84aa-459c4a31afb5	019e71e1-3276-7022-9eea-b52898a285bc	\N	f	t	2026-06-23 08:31:54
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
019ed065-9473-7102-aeeb-2d312d28840a	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-16 12:26:18	\N	2026-06-16 12:26:18	2026-06-16 12:26:22
019ed09a-40a1-73da-a35e-cca5e29d5a29	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-16 13:23:50	\N	2026-06-16 13:23:50	2026-06-16 13:23:50
019e8b7f-d4a2-702e-bb9d-b9fbbde57945	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-5252-70fc-bed5-16a997fd50f2	completed	20	20	2026-06-03 03:21:11	2026-06-03 04:18:56	2026-06-03 03:21:11	2026-06-03 04:18:56
019e8643-6b11-7042-9f17-1c191f8e10ea	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 02:57:05	\N	2026-06-02 02:57:05	2026-06-02 02:58:02
019e864b-6b78-72ce-9628-11a1322a4403	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 03:05:50	\N	2026-06-02 03:05:50	2026-06-02 03:05:50
019e864d-ce65-714b-869d-e1e2151a92f9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 03:08:26	\N	2026-06-02 03:08:26	2026-06-02 03:08:26
019e864d-e427-7049-a918-e33e1c971b31	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-02 03:08:32	\N	2026-06-02 03:08:32	2026-06-02 03:08:32
019e8dd8-74b2-70e6-b206-6bde874abf32	019e73af-7105-714e-8d4f-0658f4579a11	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-03 14:17:13	\N	2026-06-03 14:17:13	2026-06-03 14:17:13
019e921b-5784-7216-bdbc-d6307a5f7ba7	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-04 10:08:45	\N	2026-06-04 10:08:45	2026-06-04 10:16:47
019ed09a-70f1-70c6-824b-f18e4dd75259	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-16 13:24:02	\N	2026-06-16 13:24:02	2026-06-16 13:24:02
019ed39f-f7df-73d3-b38c-101c1bbb4381	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	6	2026-06-17 03:28:56	\N	2026-06-17 03:28:56	2026-06-17 03:31:26
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
019ed538-b801-7015-8e9d-5e345a57252e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	0	2026-06-17 10:55:24	2026-06-17 10:58:23	2026-06-17 10:55:24	2026-06-17 10:58:23
019ed551-fbfc-71fb-bd25-e3c88eedaf14	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 11:23:00	\N	2026-06-17 11:23:00	2026-06-17 11:23:00
019e9c49-77af-70cf-b43b-1be113e60f78	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	1	2026-06-06 09:35:21	\N	2026-06-06 09:35:21	2026-06-06 09:36:22
019e9c7a-23dc-7253-94a3-d7ea73ab0246	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-06 10:28:30	\N	2026-06-06 10:28:30	2026-06-06 10:28:30
019ed361-00ac-73a1-aa62-5a467b331e6b	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	15	2026-06-17 02:20:10	2026-06-17 03:26:10	2026-06-17 02:20:10	2026-06-17 03:26:10
019ea290-8fee-72de-8cae-d3268366c1b3	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d7-1221-71e7-930e-a5d0643c1c7e	019e71e2-45f2-7038-9aa5-7b4bffcdc765	in_progress	20	0	2026-06-07 14:50:43	\N	2026-06-07 14:50:43	2026-06-08 06:22:03
019ed46c-5a5f-7395-89c6-390e0efd1dcd	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 07:12:11	\N	2026-06-17 07:12:11	2026-06-17 07:13:14
019eaba6-efa2-726b-9356-52f0578f4573	019e7d20-734e-70a4-8324-2e7509ef6c12	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fe-0aae-73a8-8cbc-ef043131f6ea	in_progress	20	0	2026-06-09 09:11:44	\N	2026-06-09 09:11:44	2026-06-09 09:11:58
019eca1a-2117-7002-8f0a-df4e77ee3632	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-15 07:06:10	\N	2026-06-15 07:06:10	2026-06-15 07:06:10
019eca1a-8b4f-7366-9e11-498315b7d0f4	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-15 07:06:37	\N	2026-06-15 07:06:37	2026-06-15 07:06:37
019e864e-03bd-73d0-b2aa-5afedad3b33f	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	20	2026-06-02 03:08:40	2026-06-02 03:19:21	2026-06-02 03:08:40	2026-06-02 03:19:21
019e8657-f15a-725f-9dd7-ab15d29f964e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-5252-70fc-bed5-16a997fd50f2	in_progress	20	0	2026-06-02 03:19:30	\N	2026-06-02 03:19:30	2026-06-02 03:19:30
019e8603-f7d4-7326-8194-92556954338c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	21	2026-06-02 01:47:47	2026-06-02 02:37:57	2026-06-02 01:47:47	2026-06-02 02:37:57
019e8634-6186-7364-87cf-3022660c7b7e	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	1	2026-06-02 02:40:40	\N	2026-06-02 02:40:40	2026-06-02 02:40:47
019eca1a-9313-7172-a09f-6f1c74ee67f5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-15 07:06:39	\N	2026-06-15 07:06:39	2026-06-15 07:06:39
019eca1a-b9c7-7336-9491-4f2c21012ac8	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-15 07:06:49	\N	2026-06-15 07:06:49	2026-06-15 07:06:52
019eca1b-48f0-73a1-89ba-6bea2bfe3dda	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-15 07:07:26	\N	2026-06-15 07:07:26	2026-06-15 07:07:26
019ed464-a113-7264-87af-d1796fd128b8	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 07:03:45	\N	2026-06-17 07:03:45	2026-06-17 07:04:44
019ed52d-a81a-735b-853b-a388c901cc15	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 10:43:19	\N	2026-06-17 10:43:19	2026-06-17 10:43:19
019ed52d-b0ac-70e0-9084-35774a323834	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 10:43:21	\N	2026-06-17 10:43:21	2026-06-17 10:43:21
019ed3c0-f8eb-7280-bc35-523c36b1dd1d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 04:04:59	\N	2026-06-17 04:04:59	2026-06-17 04:05:19
019ed552-32b5-71de-ad54-3ff45fb1f7c0	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-17 11:23:14	\N	2026-06-17 11:23:14	2026-06-17 11:23:14
019ed531-c63e-7077-bf7c-70aa97ce657c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 10:47:49	\N	2026-06-17 10:47:49	2026-06-17 10:47:59
019ed3e3-b4db-737a-a38c-eca3acd4609c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 04:42:56	\N	2026-06-17 04:42:56	2026-06-17 04:43:04
019ed52d-c9fe-71a6-a3b4-da0fdb743fe2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 10:43:28	\N	2026-06-17 10:43:28	2026-06-17 10:44:23
019ed531-b1c8-738d-a705-235de7fe62e2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-17 10:47:44	\N	2026-06-17 10:47:44	2026-06-17 10:47:44
019ed573-02fc-7045-a751-5c65629ddd13	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	0	2026-06-17 11:59:04	2026-06-17 12:02:10	2026-06-17 11:59:04	2026-06-17 12:02:10
019ed575-dfbf-7000-babf-a469867cf3d6	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-17 12:02:12	\N	2026-06-17 12:02:12	2026-06-17 12:02:23
019ed576-2952-70f1-af50-1826bc1a0974	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	0	2026-06-17 12:02:31	2026-06-17 12:04:30	2026-06-17 12:02:31	2026-06-17 12:04:30
019ed8b8-600c-7023-983f-b763f53b5432	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	6	2026-06-18 03:13:42	\N	2026-06-18 03:13:42	2026-06-18 03:35:50
019ed8ec-ca87-73c7-b063-1cd78fe8bb3a	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-18 04:10:57	\N	2026-06-18 04:10:57	2026-06-18 04:10:57
019ed8ed-eefc-7203-a5b1-0200705e329c	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	12	2026-06-18 04:12:12	2026-06-18 04:45:28	2026-06-18 04:12:12	2026-06-18 04:45:28
019ef352-7d76-7388-986b-ec5cf5660453	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-23 07:12:10	\N	2026-06-23 07:12:10	2026-06-23 07:12:10
019edad3-1338-7211-828d-5a180c9c4c24	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-18 13:02:06	\N	2026-06-18 13:02:06	2026-06-18 13:02:39
019edaeb-6b69-736f-99ad-3d2765fc87f5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-18 13:28:42	\N	2026-06-18 13:28:42	2026-06-18 13:29:02
019edf4b-a2ae-700b-a2bc-314b51d97abe	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-19 09:52:16	\N	2026-06-19 09:52:16	2026-06-19 09:52:16
019edf4e-1776-7109-b8a3-dbdc55c1c103	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	completed	20	0	2026-06-19 09:54:57	2026-06-19 09:57:17	2026-06-19 09:54:57	2026-06-19 09:57:17
019eda43-9963-719c-90a1-c553b648570d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	completed	20	0	2026-06-18 10:25:23	2026-06-18 10:26:18	2026-06-18 10:25:23	2026-06-18 10:26:18
019eda44-960c-717e-8e64-5efb7b9e0ee9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-18 10:26:28	\N	2026-06-18 10:26:28	2026-06-18 10:26:28
019ed90c-8627-722a-8293-dd99951f5cfc	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	17	2026-06-18 04:45:37	2026-06-18 05:10:16	2026-06-18 04:45:37	2026-06-18 05:10:16
019eda4a-a64c-7147-92d1-464ff4cbd1b9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	0	2026-06-18 10:33:05	\N	2026-06-18 10:33:05	2026-06-18 10:33:07
019ed953-66ea-72c3-813a-59cabc6178d2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	5	2026-06-18 06:03:02	\N	2026-06-18 06:03:02	2026-06-18 10:14:38
019edf50-4a48-7253-b8aa-ebb428f584d2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-5252-70fc-bed5-16a997fd50f2	in_progress	20	0	2026-06-19 09:57:21	\N	2026-06-19 09:57:21	2026-06-19 09:57:23
019eef82-faa3-7233-8e5e-f29ac084ee4d	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	1	2026-06-22 13:26:39	\N	2026-06-22 13:26:39	2026-06-22 13:27:18
019ed923-1f25-7367-aa1e-9cbb36baa3b5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e720d-251d-70c9-859b-dbad677ca8bc	in_progress	20	4	2026-06-18 05:10:18	\N	2026-06-18 05:10:18	2026-06-18 05:57:30
019ef39b-7f3a-728c-84aa-459c4a31afb5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-23 08:31:54	\N	2026-06-23 08:31:54	2026-06-23 08:32:22
019eef86-e35e-739b-8088-1243fe12dca5	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-22 13:30:55	\N	2026-06-22 13:30:55	2026-06-22 13:33:08
019edf4b-c85c-7327-80dc-bace379d69e9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	0	2026-06-19 09:52:26	2026-06-19 09:54:54	2026-06-19 09:52:26	2026-06-19 09:54:54
019eda41-07fa-736b-bb2d-cadc489cc01b	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	completed	20	0	2026-06-18 10:22:35	2026-06-18 10:25:16	2026-06-18 10:22:35	2026-06-18 10:25:16
019eda43-88cd-703a-b0da-9f7d6ab191b4	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e77fd-ea28-71d0-9d94-a0c18b8a418e	in_progress	20	0	2026-06-18 10:25:19	\N	2026-06-18 10:25:19	2026-06-18 10:25:19
019edad1-468e-706f-8b81-56e8d75535a9	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	completed	20	0	2026-06-18 13:00:08	2026-06-18 13:02:00	2026-06-18 13:00:08	2026-06-18 13:02:00
019ef352-b0d9-71ef-96b1-6adb31426369	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	2	2026-06-23 07:12:23	\N	2026-06-23 07:12:23	2026-06-23 07:47:00
019ef2f7-7072-731f-8b95-3ac46da33dd2	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-23 05:32:42	\N	2026-06-23 05:32:42	2026-06-23 06:20:19
019ef393-2f8a-739a-85a4-fc4d55704924	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-23 08:22:49	\N	2026-06-23 08:22:49	2026-06-23 08:23:11
019ef39b-1300-712c-a945-c8c83d8e3bc7	019e80af-126e-7219-876e-919580a5048d	019e71d6-c6c2-717c-9caa-af2f471cb44c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	in_progress	20	0	2026-06-23 08:31:26	\N	2026-06-23 08:31:26	2026-06-23 08:31:26
\.


--
-- Data for Name: sentences; Type: TABLE DATA; Schema: public; Owner: vocabulary
--

COPY public.sentences (id, level_id, source_text, target_text, tags, difficulty, "order", created_at, updated_at) FROM stdin;
019e71e1-3269-7090-b8b5-dd70d2b8fa7b	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya sihat, terima kasih.	Fine, thank you.	\N	1	2	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-326a-7367-b316-afb7232fe48c	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Terima kasih banyak-banyak!	Thank you so much!	\N	1	3	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3271-7351-a397-1bfca7c3cebb	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Tumpang lalu.	Excuse me.	\N	1	9	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3277-7245-8397-2b95ecf990d9	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Jumpa lagi.	See you later.	\N	1	13	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-3278-7246-a23e-10370ffbd291	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Apa pendapat awak pasal idea ni?	What do you think about this idea?	\N	1	14	2026-05-29 03:57:24	2026-05-29 03:57:24
019e71e1-327a-73f4-9a63-092cefb1aabf	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya setuju.	I agree.	\N	1	15	2026-05-29 03:57:24	2026-05-29 03:57:24
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
019e7b92-286b-7188-8d3e-f455b947f6e3	019e720d-251d-70c9-859b-dbad677ca8bc	Boleh saya bantu?	Can I help you?	\N	1	5	2026-05-31 01:07:16	2026-05-31 01:07:16
019e7b93-72a0-7149-bcf1-20286bec7997	019e720d-251d-70c9-859b-dbad677ca8bc	Tolong senyap.	Please be quiet.	\N	1	6	2026-05-31 01:08:41	2026-05-31 01:08:41
019e7b93-72a6-70c5-9006-caab62f97b36	019e720d-251d-70c9-859b-dbad677ca8bc	Di sebelah sana.	Over there.	\N	1	10	2026-05-31 01:08:41	2026-05-31 01:08:41
019e7b92-2869-724f-a3c4-4cbfe8941117	019e720d-251d-70c9-859b-dbad677ca8bc	Cepatlah!	Hurry up!	\N	1	3	2026-05-31 01:07:16	2026-05-31 01:49:23
019e7b93-72a4-719f-92fd-1bb01f8f151f	019e720d-251d-70c9-859b-dbad677ca8bc	Boleh bagi bil?	Bill, please.	\N	1	8	2026-05-31 01:08:41	2026-05-31 01:49:34
019e7b96-cf83-7291-9bfd-4366f670d4e8	019e720d-251d-70c9-859b-dbad677ca8bc	Tunggu sekejap.	Wait a minute.	\N	1	16	2026-05-31 01:12:21	2026-05-31 01:49:48
019e71e1-327c-71e1-9d58-b2fe6426441a	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Dah pukul 11:30 malam sekarang.	It['s/ is] already 11:30 PM.	\N	1	17	2026-05-29 03:57:24	2026-06-18 11:49:08
019e71e1-327e-72b7-9b50-f40528ac67e7	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Hai! Sampai pun awak	Hi! You['re/ are] finally here.	\N	1	19	2026-05-29 03:57:24	2026-06-18 11:49:35
019e71e1-3267-734a-abc1-895dd8abaf31	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Selamat pagi! Apa khabar?	Good morning! [How's it going/How are you]?	\N	1	1	2026-05-29 03:57:24	2026-06-17 11:41:45
019e7b96-cf85-709a-bd49-da5491997789	019e720d-251d-70c9-859b-dbad677ca8bc	Bagaimana kalau kita pergi ke pantai hujung minggu ni?	What if we [gonna/go to] the beach this weekend?	\N	1	17	2026-05-31 01:12:21	2026-06-18 06:02:49
019e7b93-72a2-70f2-b8a5-34a992d6f88d	019e720d-251d-70c9-859b-dbad677ca8bc	Kami dah selesai makan.	We['re/ are] done eating.	\N	1	7	2026-05-31 01:08:41	2026-06-18 11:51:33
019e7b95-30d5-73a1-87c6-f54e0f65931d	019e720d-251d-70c9-859b-dbad677ca8bc	Oh, telefon saya tengah berbunyi.	Oh, my phone['s/ is] ringing.	\N	1	15	2026-05-31 01:10:35	2026-06-18 11:56:24
019e71e1-3276-7022-9eea-b52898a285bc	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Baiklah, saya kena pergi sekarang.	Alright, I [gotta/have to] go now.	\N	1	12	2026-05-29 03:57:24	2026-06-18 13:25:37
019e7b95-30cf-7358-b291-186df440e3e2	019e720d-251d-70c9-859b-dbad677ca8bc	Projek ni susah sangat, saya rasa nak putus asa.	This project's so hard, I [wanna/want to] give up.	\N	1	11	2026-05-31 01:10:35	2026-06-17 10:51:02
019e7b95-30d1-7115-adce-9a46439b1e43	019e720d-251d-70c9-859b-dbad677ca8bc	Jangan risau.	[Don't/Do not] worry.	\N	1	12	2026-05-31 01:10:35	2026-06-17 07:38:19
019e7b92-286a-7211-96ac-244725e33cdc	019e720d-251d-70c9-859b-dbad677ca8bc	Awak nampak risau. Semuanya okay ke?	You look worried. [Everything's/Is everything] okay?	\N	1	4	2026-05-31 01:07:16	2026-06-17 10:49:10
019e7b95-30d3-706c-b753-39c2c9cd6e27	019e720d-251d-70c9-859b-dbad677ca8bc	Saya tidak tahu.	I [dunno/don't know].	\N	1	14	2026-05-31 01:10:35	2026-06-17 10:54:17
019e71e1-326e-708c-8deb-5b611d1fca9b	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Tak apa.	It['s/ is] okay.	\N	1	6	2026-05-29 03:57:24	2026-06-18 11:35:50
019e71e1-3270-72c4-a123-4fd4e2837da1	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya tidak faham.	I [don't get it/don't understand].	\N	1	8	2026-05-29 03:57:24	2026-06-18 11:46:49
019e71e1-3275-71ec-91d8-9f6937c785d8	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Maaf, saya sibuk	Sorry, I['m/ am] busy.	\N	1	11	2026-05-29 03:57:24	2026-06-18 11:47:20
019e71e1-327b-70a4-a7ad-d11703dd3c66	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Di mana kunci saya?	Where['s/ is] my key?	\N	1	16	2026-05-29 03:57:24	2026-06-18 11:48:57
019e71e1-326c-7287-8e58-6efb81d2293f	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Oh, saya minta maaf sangat-sangat!	Oh, I['m/ am] so sorry!	\N	1	5	2026-05-29 03:57:24	2026-06-18 11:35:27
019e71e1-327d-739e-b4c9-7e19f212ff0b	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Saya nak pergi tidur.	I['m/ am] going to bed.	\N	1	18	2026-05-29 03:57:24	2026-06-18 11:49:24
019e7b92-2867-7295-bd89-eeffa7b5e9e5	019e720d-251d-70c9-859b-dbad677ca8bc	Berapa harganya?	How much['s it/ is it]?	\N	1	2	2026-05-31 01:07:16	2026-06-18 11:50:56
019e71e1-326f-71da-ad92-48800b1c008e	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Awak faham tak apa maksud saya?	[Get what I mean/Do you understand what I mean]?	\N	1	7	2026-05-29 03:57:24	2026-06-17 11:42:30
019e7b93-72a5-7173-8f22-a29d484b8e37	019e720d-251d-70c9-859b-dbad677ca8bc	Maafkan saya, di mana tandas?	Excuse me, where['s/ is] the toilet?	\N	1	9	2026-05-31 01:08:41	2026-06-18 11:52:06
019e71e1-326b-72db-83f5-77053c15a6f1	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Sama-sama.	You['re/ are] welcome.	\N	1	4	2026-05-29 03:57:24	2026-06-18 11:35:05
019e7b95-30d2-70b7-8a4a-8380976f5294	019e720d-251d-70c9-859b-dbad677ca8bc	Awak tahu tak di mana pejabat pos?	[Know/Do you know] where the post office is?	\N	1	13	2026-05-31 01:10:35	2026-06-18 13:19:11
019e7b96-cf8a-7229-8e92-279f82780bfb	019e720d-251d-70c9-859b-dbad677ca8bc	Lama tidak berjumpa.	Long time no see.	\N	1	20	2026-05-31 01:12:21	2026-05-31 01:12:21
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
019e7ba7-8684-706d-8e79-903dbdfd5f91	019e720d-5252-70fc-bed5-16a997fd50f2	Selamat berkenalan.	Nice to meet you.	\N	1	2	2026-05-31 01:30:37	2026-05-31 01:30:37
019e7ba8-c286-737c-8b88-5b51104a975e	019e720d-5252-70fc-bed5-16a997fd50f2	Boleh awak ulang balik?	Can you repeat that?	\N	1	6	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7ba8-c288-71bb-999e-6483ad6d705a	019e720d-5252-70fc-bed5-16a997fd50f2	Tolong cakap perlahan sikit.	Speak slowly, please.	\N	1	7	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7ba8-c28c-73c3-9cae-59ab23479bc2	019e720d-5252-70fc-bed5-16a997fd50f2	Jom kita makan sama-sama.	Let's eat together.	\N	1	10	2026-05-31 01:31:57	2026-05-31 01:31:57
019e7bab-79f7-716c-9b04-1a1bbbbb7246	019e720d-5252-70fc-bed5-16a997fd50f2	Jaga diri elok-elok.	Take care.	\N	1	16	2026-05-31 01:34:55	2026-05-31 01:34:55
019e7bab-79f9-720b-9752-aab2d6683393	019e720d-5252-70fc-bed5-16a997fd50f2	Semoga hari awak menyenangkan!	Have a nice day!	\N	1	17	2026-05-31 01:34:55	2026-05-31 01:34:55
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
019e7ba7-8685-7111-b6c8-641c785adf9b	019e720d-5252-70fc-bed5-16a997fd50f2	Awak tinggal di mana?	Where [you/do you] live?	\N	1	3	2026-05-31 01:30:37	2026-06-18 12:25:29
019e7ba7-8682-7218-8276-d3aefb06c058	019e720d-5252-70fc-bed5-16a997fd50f2	Siapa nama awak?	What['s/ is] your name?	\N	1	1	2026-05-31 01:30:37	2026-06-18 11:59:54
019e7ba8-c289-7060-85c3-c7758c2e1a02	019e720d-5252-70fc-bed5-16a997fd50f2	Pukul berapa sekarang?	[Got the time/What time is it]?	\N	1	8	2026-05-31 01:31:57	2026-06-18 12:45:11
019e7baa-9257-71b1-b5f8-17b4b20c8759	019e720d-5252-70fc-bed5-16a997fd50f2	Saya dah kenyang.	I['m/ am] full.	\N	1	12	2026-05-31 01:33:56	2026-06-18 12:49:12
019e7baa-9259-72f1-bafe-c60b67fd06af	019e720d-5252-70fc-bed5-16a997fd50f2	Saya tengah dalam perjalanan.	I['m/ am] on my way.	\N	1	14	2026-05-31 01:33:56	2026-06-18 12:49:39
019e7baa-9258-7269-8cb6-67b777f41dab	019e720d-5252-70fc-bed5-16a997fd50f2	Awak nak pergi mana tu?	Where [you/are you] going?	\N	1	13	2026-05-31 01:33:56	2026-06-17 12:15:14
019e7baa-925b-70a3-9d03-a2c9c5b49d2d	019e720d-5252-70fc-bed5-16a997fd50f2	Saya dah sampai.	I['ve/ have] arrived.	\N	1	15	2026-05-31 01:33:56	2026-06-18 12:49:56
019e7baa-9255-73de-890b-f0f4eabada61	019e720d-5252-70fc-bed5-16a997fd50f2	Makanan ni sedap sangat.	The food is delicious.	\N	1	11	2026-05-31 01:33:56	2026-06-18 13:20:01
019e7b96-cf86-714c-bb0c-4e2a8bf7cd2a	019e720d-251d-70c9-859b-dbad677ca8bc	Itu idea yang bagus!	That['s/ is] a good idea!	\N	1	18	2026-05-31 01:12:21	2026-06-18 11:57:29
019e7ba7-8687-70c9-98e4-c7fb328bff8b	019e720d-5252-70fc-bed5-16a997fd50f2	Awak kerja apa?	What [you/do you] do?	\N	1	4	2026-05-31 01:30:37	2026-06-18 12:26:38
019e7ba7-8688-722e-a58e-649754c118f2	019e720d-5252-70fc-bed5-16a997fd50f2	Saya tumpang gembira untuk awak.	I['m/ am] happy for you.	\N	1	5	2026-05-31 01:30:37	2026-06-18 12:27:01
019e7ba8-c28b-728b-8b5c-adc20c5139e6	019e720d-5252-70fc-bed5-16a997fd50f2	Saya lapar.	I['m/ am] hungry.	\N	1	9	2026-05-31 01:31:57	2026-06-18 12:45:41
019e7bb5-3b95-71a2-ae5e-31f98baf9bf3	019e7ba0-396c-7259-99a4-91c443b3e4f4	Saya dah sampai.	Ich bin da.	\N	1	15	2026-05-31 01:45:35	2026-05-31 01:45:35
019e7bb6-45b1-72b4-b513-5c6f7b49ee86	019e7ba0-396c-7259-99a4-91c443b3e4f4	Jaga diri elok-elok.	Mach's gut!	\N	1	16	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b3-71a1-9010-a1ed4b26f1d2	019e7ba0-396c-7259-99a4-91c443b3e4f4	Semoga hari awak menyenangkan!	Schönen Tag noch!	\N	1	17	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b4-7389-bb62-5cdb1581fbf1	019e7ba0-396c-7259-99a4-91c443b3e4f4	Tahniah!	Herzlichen Glückwunsch!	\N	1	18	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b5-7193-b0da-1757c1860ce3	019e7ba0-396c-7259-99a4-91c443b3e4f4	Semoga berjaya!	Viel Glück!	\N	1	19	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bb6-45b6-70e1-9443-9d75af3b4377	019e7ba0-396c-7259-99a4-91c443b3e4f4	Terima kasih untuk segalanya.	Danke für alles.	\N	1	20	2026-05-31 01:46:43	2026-05-31 01:46:43
019e7bbf-eaf5-7246-9dd4-9a117ac392c9	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak ada apa yang baru sangat.	Nothing much.	\N	1	2	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bbf-eaf8-72db-89b4-98c4a7aaf349	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya perlukan rehat sekejap.	I need a break.	\N	1	4	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bbf-eaf9-7364-ad63-b0e73f4eb101	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Semoga cepat sembuh.	Feel better soon.	\N	1	5	2026-05-31 01:57:15	2026-05-31 01:57:15
019e7bc1-9c75-7218-8008-c793491ba389	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saja nak ingatkan awal-awal.	Just a heads up.	\N	1	9	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc1-9c76-70c3-9c05-82e7e05cdc24	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak ada masalah langsung.	No problem at all.	\N	1	10	2026-05-31 01:59:06	2026-05-31 01:59:06
019e7bc4-4fb9-7012-a874-60626596c19b	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Believe me.	Believe me.	\N	1	16	2026-05-31 02:02:03	2026-05-31 02:02:03
019e7bc4-4fbb-727d-ab39-1ecf35062c59	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya terlupa.	I forgot.	\N	1	17	2026-05-31 02:02:03	2026-05-31 02:02:03
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
019e7bd1-9c64-704b-a49e-3e81eb834ef9	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Jom kita buat sesuatu.	Let's do something.	\N	1	4	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd1-9c65-707a-acd0-38b839c8eb30	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Kedengaran bagus bagi saya.	Sounds good to me.	\N	1	5	2026-05-31 02:16:35	2026-05-31 02:16:35
019e7bd3-e095-706c-a3fe-0a68641117be	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya rasa begitulah.	I think so.	\N	1	6	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd3-e097-721b-86d6-0b2fc4e1b448	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya rasa bukan macam tu.	I don't think so.	\N	1	7	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd3-e09b-716d-804b-5c8c93e90c92	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Boleh awak tolong saya cari benda ni?	Can you help me find this?	\N	1	10	2026-05-31 02:19:03	2026-05-31 02:19:03
019e7bd6-4963-728b-9ff7-174d14ad2ec8	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Boleh saya cuba ni?	Can I try this on?	\N	1	13	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd6-4966-72be-b6c7-605087737a73	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Simpan baki tu.	Keep the change.	\N	1	15	2026-05-31 02:21:41	2026-05-31 02:21:41
019e7bd1-9c63-721e-87e8-1a39f142c7b2	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya bosan.	I['m/ am] bored.	\N	1	3	2026-05-31 02:16:35	2026-06-19 00:29:20
019e7bc4-4fbc-7333-abaf-844f2ff9c177	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak apa lah	Never mind.	\N	1	18	2026-05-31 02:02:03	2026-06-17 02:33:40
019e7bbf-eaf7-73c4-9dcd-b573d3b6f5c7	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya penat.	I['m/ am] tired.	\N	1	3	2026-05-31 01:57:15	2026-06-18 12:51:30
019e7bc1-9c72-73fd-9bd9-fcb97b76385d	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya dah sedia.	I['m/ am] ready.	\N	1	7	2026-05-31 01:59:06	2026-06-18 12:52:08
019e7bc1-9c70-7163-a98e-f76e93c46b00	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Awak dah sedia?	[You/Are you] ready?	\N	1	6	2026-05-31 01:59:06	2026-06-17 12:18:32
019e7bc4-4fbd-7261-8742-8047409d06ae	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Betul tu.	That's true.	\N	1	19	2026-05-31 02:02:03	2026-06-18 13:21:24
019e7bc1-9c74-7378-928d-e83b5579b9aa	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Bagi saya seminit	Give me a [moment/minute].	\N	1	8	2026-05-31 01:59:06	2026-06-17 12:20:05
019e7bc2-de0c-71bb-8a67-670ea9144baf	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Awak pasti ke?	[You/Are you] sure?	\N	1	14	2026-05-31 02:00:28	2026-06-18 12:54:15
019e7bc2-de0b-729e-b62c-b3dd0ea91312	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya tak kisah pun.	I [don't/do not] mind.	\N	1	13	2026-05-31 02:00:28	2026-06-17 12:21:23
019e7bc2-de0a-71cd-96f7-5d57aafe8804	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Terpulang pada awak.	[Up to you/It's up to you].	\N	1	12	2026-05-31 02:00:28	2026-06-18 13:20:42
019e7bc2-de0d-701c-bd79-d9b8fe5ce75b	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Saya tak pasti.	I['m/ am] not sure.	\N	1	15	2026-05-31 02:00:28	2026-06-18 12:54:36
019e7bd3-e098-73ff-8a54-e47c19e1888d	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Apa maksud awak?	What [you/do you] mean?	\N	1	8	2026-05-31 02:19:03	2026-06-19 00:32:43
019e7bd3-e099-706d-a85a-076e8a27e4fd	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya sesat.	I['m/ am] lost.	\N	1	9	2026-05-31 02:19:03	2026-06-19 00:33:00
019e7bd6-495f-72c3-b830-50016c9d6815	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Benda ni mahal sangat.	It['s/ is] too expensive.	\N	1	11	2026-05-31 02:21:41	2026-06-19 00:33:13
019e7bd6-4962-7084-aea1-b48824d0a213	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Benda ni agak murah.	It['s/ is] quite cheap.	\N	1	12	2026-05-31 02:21:41	2026-06-19 00:33:28
019e7bd6-4964-7360-b652-d96852b2d0de	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Di mana kaunter bayaran?	Where['s/ is] the cashier?	\N	1	14	2026-05-31 02:21:41	2026-06-19 00:34:56
019e7bd7-d2e9-71d7-acd6-b8c3e1a50c85	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Bukan perkara besar pun.	It['s/ is] no big deal.	\N	1	16	2026-05-31 02:23:22	2026-06-19 00:39:08
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
019e7cf3-6392-7147-9945-531411da9378	019e7cda-8953-7306-b15b-1df831470d8a	Jom kita jumpa.	Let's meet up.	\N	1	4	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cf3-6393-72d3-ad8b-f843b5ff362d	019e7cda-8953-7306-b15b-1df831470d8a	Kat mana kita patut jumpa?	Where should we meet?	\N	1	5	2026-05-31 07:33:06	2026-05-31 07:33:06
019e7cfc-dc52-713c-999d-8adef98f39e5	019e7cda-8953-7306-b15b-1df831470d8a	Terima kasih sebab sudi tunggu.	Thanks for waiting.	\N	1	9	2026-05-31 07:43:26	2026-05-31 07:43:26
019e7cfe-3096-72c3-9b4a-7808d24e38d9	019e7cda-8953-7306-b15b-1df831470d8a	Semuanya nampak okay	Everything looks good.	\N	1	11	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cfe-3099-7339-9422-d500fc10dbbb	019e7cda-8953-7306-b15b-1df831470d8a	Biar saya check dulu.	Let me check first.	\N	1	13	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cfe-309b-7041-9d4b-7f7766960244	019e7cda-8953-7306-b15b-1df831470d8a	Jangan lupa tau.	Don't forget.	\N	1	15	2026-05-31 07:44:53	2026-05-31 07:44:53
019e7cff-aa20-7110-b879-de04a31add4b	019e7cda-8953-7306-b15b-1df831470d8a	Ini awak punya ke?	Is this yours?	\N	1	17	2026-05-31 07:46:30	2026-05-31 07:46:30
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
019e7bd7-d2eb-71a8-93b9-2ab8d7895bf2	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Saya bangga dengan awak.	I['m/ am] proud of you.	\N	1	17	2026-05-31 02:23:22	2026-06-19 00:39:34
019e7bd7-d2ed-73c9-8680-12fd73518724	019e77fe-0aae-73a8-8cbc-ef043131f6ea	Awak pasti boleh buat punya.	[You got this/You can do it].	\N	1	18	2026-05-31 02:23:22	2026-06-19 00:39:57
019e7cf3-6390-7027-b3e8-39fa29e94469	019e7cda-8953-7306-b15b-1df831470d8a	Saya ada masa sekarang.	I['m/ am] free now.	\N	1	2	2026-05-31 07:33:06	2026-06-19 00:41:45
019e7cf3-6391-70c6-8f43-d30ded1d8fed	019e7cda-8953-7306-b15b-1df831470d8a	Saya sibuk sikit.	I['m/ am] a bit busy.	\N	1	3	2026-05-31 07:33:06	2026-06-19 00:42:00
019e7cfc-dc4c-7152-9cad-6a32ea60ccc4	019e7cda-8953-7306-b15b-1df831470d8a	Mana-mana pun okay.	Anywhere['s/ is] fine.	\N	1	6	2026-05-31 07:43:26	2026-06-19 00:42:28
019e7cfc-dc4f-7268-a74d-d13035b3a8f4	019e7cda-8953-7306-b15b-1df831470d8a	Saya dah lambat ni.	I['m/ am] running late.	\N	1	7	2026-05-31 07:43:26	2026-06-19 00:42:50
019e7cfc-dc51-7399-8a9a-c1b12c4dd99f	019e7cda-8953-7306-b15b-1df831470d8a	Maaf sebab lambat	Sorry [I'm late/for the delay].	\N	1	8	2026-05-31 07:43:26	2026-06-19 00:43:13
019e7cfe-3098-7271-ad52-bc450f20e491	019e7cda-8953-7306-b15b-1df831470d8a	Ada sesuatu yang tak kena ni.	Something['s/ is] wrong.	\N	1	12	2026-05-31 07:44:53	2026-06-19 00:44:01
019e7cfe-309a-702e-ba08-588ec86af5ac	019e7cda-8953-7306-b15b-1df831470d8a	Saya akan buat benda tu nanti.	I['ll/ will] do it later.	\N	1	14	2026-05-31 07:44:53	2026-06-19 00:44:25
019e7cff-aa1e-7077-8b0c-8e2f1986c4f4	019e7cda-8953-7306-b15b-1df831470d8a	Saya akan ingat.	I['ll/ will] remember.	\N	1	16	2026-05-31 07:46:30	2026-06-19 00:45:04
019e7cff-aa21-7325-b916-61e98f30d470	019e7cda-8953-7306-b15b-1df831470d8a	Bukan saya punya.	It['s/ is] not mine.	\N	1	18	2026-05-31 07:46:30	2026-06-19 00:45:31
019e7cff-aa22-72ef-98d9-4e07b392b8b6	019e7cda-8953-7306-b15b-1df831470d8a	Awak bergurau eh?	[You kidding/Are you kidding]?	\N	1	19	2026-05-31 07:46:30	2026-06-19 00:45:54
019e7cff-aa23-72c9-a034-dd6895ae1436	019e7cda-8953-7306-b15b-1df831470d8a	Saya serius ni.	I['m/ am] serious.	\N	1	20	2026-05-31 07:46:30	2026-06-19 00:46:09
019e7d06-2f43-70fb-a2c9-3fa6f1339975	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya akan ingat.	Ich werd' dran denken.	\N	1	16	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f45-71d5-b91b-aa415cf51731	019e7ce1-ef8c-71aa-9535-c73a17837d74	Ini awak punya ke?	Ist das deins?	\N	1	17	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f46-7184-813e-37cdd8833a5f	019e7ce1-ef8c-71aa-9535-c73a17837d74	Bukan saya punya.	Das ist nicht meins.	\N	1	18	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f48-70b1-8847-bf07e296b69d	019e7ce1-ef8c-71aa-9535-c73a17837d74	Awak bergurau eh?	Machst du Witze?	\N	1	19	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d06-2f49-7203-a4e8-a4b9e8c51bd0	019e7ce1-ef8c-71aa-9535-c73a17837d74	Saya serius ni.	Ich meine es ernst.	\N	1	20	2026-05-31 07:53:37	2026-05-31 07:53:37
019e7d0a-dcec-724f-a649-e8fe3a8020c4	019e7cda-a2e1-7354-a433-5f119e57ba21	Jom kita mula.	Let's get started.	\N	1	2	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0a-dcee-7319-ba75-bf757315aad3	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya perlukan bantuan sikit.	I need some help.	\N	1	4	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0a-dcef-705e-a006-7b9ac6aaa98b	019e7cda-a2e1-7354-a433-5f119e57ba21	Boleh awak tunjukkan pada saya?	Can you show me?	\N	1	5	2026-05-31 07:58:44	2026-05-31 07:58:44
019e7d0c-c21c-735b-bc5d-bca4915a7a19	019e7cda-a2e1-7354-a433-5f119e57ba21	Macam ni ke?	Like this?	\N	1	6	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c21f-7249-8732-bbf032f79ced	019e7cda-a2e1-7354-a433-5f119e57ba21	Ya, tepat sekali.	Yes, exactly.	\N	1	7	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c220-71d0-9af5-1a0b6c2f3b78	019e7cda-a2e1-7354-a433-5f119e57ba21	Bukan macam tu.	Not like that.	\N	1	8	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c221-71eb-a6e8-dbdbb00f0c95	019e7cda-a2e1-7354-a433-5f119e57ba21	Cuba lagi sekali.	Try again.	\N	1	9	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0c-c223-73a3-938a-7118a22af771	019e7cda-a2e1-7354-a433-5f119e57ba21	Cubalah dulu.	Give it a try.	\N	1	10	2026-05-31 08:00:48	2026-05-31 08:00:48
019e7d0d-f930-705b-bda4-3c92a93ba23a	019e7cda-a2e1-7354-a433-5f119e57ba21	Kerja yang bagus!	Good job!	\N	1	14	2026-05-31 08:02:08	2026-05-31 08:02:08
019e7d0d-f932-72b6-893a-352c7b362025	019e7cda-a2e1-7354-a433-5f119e57ba21	Teruskan usaha.	Keep it up.	\N	1	15	2026-05-31 08:02:08	2026-05-31 08:02:08
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
019e7d1d-340f-73b3-8498-f98cba3ac012	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya nak yang ini.	I want this one.	\N	1	2	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1d-3410-73f3-ab88-d5cc98e8bc2a	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya tak nak benda tu.	I don't want it.	\N	1	3	2026-05-31 08:18:46	2026-05-31 08:18:46
019e7d1f-ec06-72de-8298-e182e4db8d0e	019e7cda-bf7e-7056-8a29-ecdabcebee69	Sama je rasanya.	It makes no difference.	\N	1	6	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d1f-ec0a-70c2-8742-487288f4a1c1	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya rasa jauh lebih baik.	I feel much better.	\N	1	8	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d1f-ec0b-72c4-b96c-0676fa78d9e8	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tak perlu tergesa-gesa.	Take your time.	\N	1	9	2026-05-31 08:21:44	2026-05-31 08:21:44
019e7d24-094a-73d9-a175-a7a998323d39	019e7cda-bf7e-7056-8a29-ecdabcebee69	Boleh tolong bukakan pintu?	Can you open the door?	\N	1	11	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-094c-7087-8332-d3065ee44778	019e7cda-bf7e-7056-8a29-ecdabcebee69	Boleh tolong tutupkan tingkap?	Can you close the window?	\N	1	12	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-094d-710e-8bd2-5b1d2c084173	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tolong pasang lampu.	Turn on the light, please.	\N	1	13	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d24-094f-7376-b125-a7810c3dfb2f	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tolong tutup kipas.	Turn off the fan, please.	\N	1	14	2026-05-31 08:26:14	2026-05-31 08:26:14
019e7d0a-dced-73f8-81a0-c5a198492b9e	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya dah nak hampir siap ni.	I['m almost done/am almost done].	\N	1	3	2026-05-31 07:58:44	2026-06-19 00:48:05
019e7d0d-f92c-7375-ad64-0b3865261bf0	019e7cda-a2e1-7354-a433-5f119e57ba21	Benda ni sangat mudah.	It['s very easy/is very easy].	\N	1	11	2026-05-31 08:02:08	2026-06-19 00:48:29
019e7d0d-f92f-7309-8236-0a7127aa1647	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya akan cuba yang terbaik.	I['ll try my best/will try my best].	\N	1	13	2026-05-31 08:02:08	2026-06-19 00:49:11
019e7d0f-16f7-7084-8eb2-92c61e38ee88	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya penat sangat hari ni.	I['m so tired today/am so tired today].	\N	1	16	2026-05-31 08:03:21	2026-06-19 00:49:27
019e7d0f-16f9-72ac-99b2-9b839db9a47b	019e7cda-a2e1-7354-a433-5f119e57ba21	Saya nak balik rumah sekarang ni.	I['m going home now/am going home now].	\N	1	17	2026-05-31 08:03:21	2026-06-19 00:49:41
019e7d1d-340c-72af-a4be-7962e2bf5537	019e7cda-bf7e-7056-8a29-ecdabcebee69	Awak nak apa?	What [you want/do you want]?	\N	1	1	2026-05-31 08:18:46	2026-06-19 00:51:52
019e7d1d-3411-72d2-9657-1a68321cf580	019e7cda-bf7e-7056-8a29-ecdabcebee69	Awak lebih suka yang mana satu?	Which one [you prefer/do you prefer]?	\N	1	4	2026-05-31 08:18:46	2026-06-19 00:53:01
019e7d1d-3413-73e0-98c2-2ed578a41e97	019e7cda-bf7e-7056-8a29-ecdabcebee69	Mana-mana satu pun okay.	Either one['s/ is] fine.	\N	1	5	2026-05-31 08:18:46	2026-06-19 00:53:36
019e7d1f-ec08-711c-9aca-4e4630fe6d9a	019e7cda-bf7e-7056-8a29-ecdabcebee69	Awak rasa sihat ke?	[You feeling okay/Are you feeling okay]?	\N	1	7	2026-05-31 08:21:44	2026-06-19 00:54:29
019e7d24-0950-706a-9d12-8e0b8955bd86	019e7cda-bf7e-7056-8a29-ecdabcebee69	Panas betul hari ni.	It['s very hot today/ is very hot today].	\N	1	15	2026-05-31 08:26:14	2026-06-19 01:00:53
019e7d25-9127-7025-9d38-f45f4ed1d8e9	019e7cda-bf7e-7056-8a29-ecdabcebee69	Macam nak hujan dah ni.	It looks like rain.	\N	1	16	2026-05-31 08:27:54	2026-05-31 08:27:54
019e7d25-9129-703c-a0ba-cf9aa2072e79	019e7cda-bf7e-7056-8a29-ecdabcebee69	Jangan sampai basah.	Don't get wet.	\N	1	17	2026-05-31 08:27:54	2026-05-31 08:27:54
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
019e7d6f-e218-702c-9263-34fe8234a165	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saya dah ingat balik sekarang.	I remember now.	\N	1	3	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d6f-e219-7287-8c30-d6267b0f235d	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saya betul-betul tak ingat langsung.	I completely forgot.	\N	1	4	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d6f-e21a-7017-bc62-197f7d10d292	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Betul ke ni?	Is it correct?	\N	1	5	2026-05-31 09:49:04	2026-05-31 09:49:04
019e7d71-04cb-7102-8b93-42ee0ed9480b	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Tak ada masalah, saya boleh buat.	No problem, I can do it.	\N	1	9	2026-05-31 09:50:19	2026-05-31 09:50:19
019e7d71-04cd-72c0-9b6b-11346bb2d508	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Boleh tolong semak sekali lagi?	Can you double-check?	\N	1	10	2026-05-31 09:50:19	2026-05-31 09:50:19
019e7d72-ba9c-729c-af43-846672abe72c	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saja nak pastikan betul-betul.	Just to be sure.	\N	1	12	2026-05-31 09:52:11	2026-05-31 09:52:11
019e7d72-ba9d-7320-a0cf-e6f2db098c61	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Lega rasanya!	What a relief!	\N	1	13	2026-05-31 09:52:11	2026-05-31 09:52:11
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
019e7d25-912a-71f8-a284-f8cd70e956e0	019e7cda-bf7e-7056-8a29-ecdabcebee69	Saya duduk kat rumah je.	I['m staying at home/ am staying at home].	\N	1	18	2026-05-31 08:27:54	2026-06-19 01:01:11
019e7d25-912c-7215-b8dd-cf4e6271cf2e	019e7cda-bf7e-7056-8a29-ecdabcebee69	Hubungi saya bila awak free nanti.	Call me when [you're free/you are free].	\N	1	19	2026-05-31 08:27:54	2026-06-19 01:01:30
019e7d6f-e212-71c1-91b6-c992272eb1e4	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Apa benda tu?	What['s that/ is that]?	\N	1	1	2026-05-31 09:49:04	2026-06-19 01:02:49
019e7d6f-e215-7086-ad6b-6d919edf5056	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Apa nama benda ni?	What['s this called/ is this called]?	\N	1	2	2026-05-31 09:49:04	2026-06-19 01:03:07
019e7d71-04c6-7274-afcb-4753b7a9c7fb	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Itu betul.	That['s correct/ is correct].	\N	1	6	2026-05-31 09:50:19	2026-06-19 01:04:38
019e7d71-04c9-73f6-a23e-7d7046d5faba	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Itu salah.	That['s wrong/ is wrong].	\N	1	7	2026-05-31 09:50:19	2026-06-19 01:04:55
019e7d72-ba9e-710e-b0df-05ed8419446f	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Lega mendengarnya.	That['s a relief/ is a relief].	\N	1	14	2026-05-31 09:52:11	2026-06-19 01:06:17
019e7d7a-0c98-73d7-a1b1-494dd2afeff3	019e7ce2-3737-72c6-bf3f-365b2693356d	Lega mendengarnya.	Das ist beruhigend.	\N	1	14	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d7a-0c9a-739d-af42-f9a49204764b	019e7ce2-3737-72c6-bf3f-365b2693356d	Simpan elok-elok	Bewahr's gut auf.	\N	1	15	2026-05-31 10:00:11	2026-05-31 10:00:11
019e7d7b-af43-722f-a626-af90b6096d76	019e7ce2-3737-72c6-bf3f-365b2693356d	Kat mana saya patut letak benda ni?	Wo soll ich das hinlegen?	\N	1	16	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af45-73f2-9251-32319d90148c	019e7ce2-3737-72c6-bf3f-365b2693356d	Letak kat sini.	Leg es hierhin.	\N	1	17	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af47-716e-9209-a9209dffb640	019e7ce2-3737-72c6-bf3f-365b2693356d	Biarkan je kat situ.	Lass es einfach da liegen.	\N	1	18	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af48-72b7-8dd5-eb1a2254d9b6	019e7ce2-3737-72c6-bf3f-365b2693356d	Jangan sentuh benda tu.	Fass es nicht an!	\N	1	19	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7b-af49-734b-80a5-a474b87ee7e6	019e7ce2-3737-72c6-bf3f-365b2693356d	Terima kasih atas bantuan awak.	Danke für deine Hilfe.	\N	1	20	2026-05-31 10:01:58	2026-05-31 10:01:58
019e7d7f-1a5d-70fb-99c2-412018590694	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Belum ada apa-apa lagi buat masa ni.	Nothing yet.	\N	1	2	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d7f-1a5f-71a2-afe4-a2ede47d3bd2	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Biar saya fikirkan dulu pasal benda tu.	Let me think about it.	\N	1	3	2026-05-31 10:05:42	2026-05-31 10:05:42
019e7d81-0adc-70c7-a86a-2354c89ca66e	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Awak nampak segak/cantik hari ni.	You look great today.	\N	1	6	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d81-0ade-7047-a7c9-f841b6529cc4	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Terima kasih atas pujian tu.	Thanks for the compliment.	\N	1	7	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d81-0ae0-71df-bf32-7e4a847bcd11	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Boleh tak kita borak kejap lagi?	Can we talk later?	\N	1	8	2026-05-31 10:07:49	2026-05-31 10:07:49
019e7d84-1a77-72b3-a72b-093342862167	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Jumpa kat dalam nanti.	See you inside.	\N	1	13	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d84-1a7a-7279-8dd0-bee1f0165b53	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Boleh tolong hantarkan pautan/link pada saya?	Can you send me the link?	\N	1	15	2026-05-31 10:11:10	2026-05-31 10:11:10
019e7d85-d665-7000-8313-de657b1d6156	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Awak dah dapat ke?	Did you get it?	\N	1	17	2026-05-31 10:13:03	2026-05-31 10:13:03
019e7d85-d666-71dc-a739-84db5a964948	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Ya, saya dah dapat.	Yes, I got it.	\N	1	18	2026-05-31 10:13:03	2026-05-31 10:13:03
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
019e8666-89ce-70fe-8a91-490726a97112	019e865e-e466-71a2-88eb-238ba8dd32ab	Saya tak jumpa benda tu.	I can't find it.	\N	1	6	2026-06-02 03:35:27	2026-06-02 03:35:27
019e7d7f-1a60-7229-8e3e-26ddaf7c8b62	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya dah buat keputusan.	I['ve decided/ have decided].	\N	1	4	2026-05-31 10:05:42	2026-06-19 01:07:58
019e7d7f-1a61-700d-955d-9b59adcf99ed	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Berbaloi untuk dicuba.	It['s worth a try/ is worth a try].	\N	1	5	2026-05-31 10:05:42	2026-06-19 01:08:14
019e7d81-0ae1-7232-966b-812946915551	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya tengah ada mesyuarat ni.	I['m in a meeting/ am in a meeting].	\N	1	9	2026-05-31 10:07:49	2026-06-19 01:08:33
019e7d81-0ae2-70d8-a912-fd2707c662dd	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Nanti saya telefon awak balik.	I['ll call you back/ will call you back].	\N	1	10	2026-05-31 10:07:49	2026-06-19 01:08:54
019e7d84-1a76-718b-b622-097175e27e2d	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya tengah parking kereta ni.	I['m parking my car/ am parking my car].	\N	1	12	2026-05-31 10:11:10	2026-06-19 01:09:54
019e7d84-1a79-701f-8545-966ac7495649	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Benda ni dah yang paling terbaru.	It['s up to date/ is up to date].	\N	1	14	2026-05-31 10:11:10	2026-06-19 01:10:35
019e7d85-d663-71be-b3da-78c374aec05d	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Saya hantarkan benda tu sekarang juga.	I['ll send it now/ will send it now].	\N	1	16	2026-05-31 10:13:03	2026-06-19 01:10:59
019e7d85-d667-7039-ad8f-bc2985d9a237	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Itu sahaja buat masa sekarang.	That['s all for now/ is all for now].	\N	1	19	2026-05-31 10:13:03	2026-06-19 01:11:30
019e8665-1bea-7231-9f56-31aa6cf5ed79	019e865e-e466-71a2-88eb-238ba8dd32ab	Saya sangat gembira	I['m so glad/ am so glad].	\N	1	4	2026-06-02 03:33:53	2026-06-19 01:13:18
019e8665-1beb-7086-95b8-7d8a37667a6a	019e865e-e466-71a2-88eb-238ba8dd32ab	Awak tengah cari apa tu?	What [you looking for/are you looking for]?	\N	1	5	2026-06-02 03:33:53	2026-06-19 01:13:43
019e8666-89d3-735e-b4b7-21fe71e8cc43	019e865e-e466-71a2-88eb-238ba8dd32ab	Sertakan saya sekali.	Count me in.	\N	1	9	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8666-89d4-7261-ab07-8f814fd69fc9	019e865e-e466-71a2-88eb-238ba8dd32ab	Jangan kira saya sekali.	Count me out.	\N	1	10	2026-06-02 03:35:27	2026-06-02 03:35:27
019e8669-085f-71f7-8170-3edcf287392c	019e865e-e466-71a2-88eb-238ba8dd32ab	Jom kita buat perjanjian.	Let's make a deal.	\N	1	12	2026-06-02 03:38:10	2026-06-02 03:38:10
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
019e867b-6e92-716a-8c14-acd94ed97f5e	019e8660-815c-739c-b143-abbbe4c35c02	Sentiasa maklumkan saya perkembangan terbaru.	Keep me posted.	\N	1	4	2026-06-02 03:58:16	2026-06-02 03:58:16
019e867c-a794-7344-97de-140d136592b0	019e8660-815c-739c-b143-abbbe4c35c02	Awak boleh uruskan benda ni tak?	Can you handle this?	\N	1	7	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a796-7325-aae9-d88be43e1d5f	019e8660-815c-739c-b143-abbbe4c35c02	Serahkan je benda tu pada saya.	Leave it to me.	\N	1	8	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a797-7278-82c5-08b21e035ca1	019e8660-815c-739c-b143-abbbe4c35c02	Saya hargai masa yang awak luangkan.	I appreciate your time.	\N	1	9	2026-06-02 03:59:36	2026-06-02 03:59:36
019e867c-a798-7214-a1a2-33997e94e5f5	019e8660-815c-739c-b143-abbbe4c35c02	Maaf sebab mengganggu awak.	Sorry to bother you.	\N	1	10	2026-06-02 03:59:36	2026-06-02 03:59:36
019e8685-4720-719f-8f10-fede4814cd80	019e8660-815c-739c-b143-abbbe4c35c02	Saya kena semak semula untuk kepastian.	I need to double-check.	\N	1	15	2026-06-02 04:09:01	2026-06-02 04:09:01
019e8687-124f-7090-baef-19ae77981464	019e8660-815c-739c-b143-abbbe4c35c02	Semuanya dah siap sedia ke?	Is everything ready?	\N	1	16	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1252-720f-b27c-a851c1d45b42	019e8660-815c-739c-b143-abbbe4c35c02	Jom kita bersurai.	Let's call it a day.	\N	1	18	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1254-72a3-9264-0b921c51726f	019e8660-815c-739c-b143-abbbe4c35c02	Pergilah rehat secukupnya.	Get some rest.	\N	1	19	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8687-1255-710c-bb70-a524528be04c	019e8660-815c-739c-b143-abbbe4c35c02	Jumpa lagi esok.	See you tomorrow.	\N	1	20	2026-06-02 04:10:59	2026-06-02 04:10:59
019e8689-8368-7069-89b9-fbfba952ed9f	019e8661-ac77-72e9-8330-5e9deb107f20	Bagaimana perkembangannya?	Wie läuft's?	\N	1	1	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836a-731e-95dd-fe6c469bdfef	019e8661-ac77-72e9-8330-5e9deb107f20	Benda tu tengah berjalan lagi.	Ist noch in Arbeit.	\N	1	2	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836b-70c2-8417-1661a062682b	019e8661-ac77-72e9-8330-5e9deb107f20	Nanti saya beritahu awak balik.	Ich sag dir Bescheid.	\N	1	3	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8689-836c-71fd-a69e-e7ce53961bbf	019e8661-ac77-72e9-8330-5e9deb107f20	Sentiasa maklumkan saya perkembangan terbaru.	Halt mich auf dem Laufenden.	\N	1	4	2026-06-02 04:13:39	2026-06-02 04:13:39
019e8669-0861-70fb-9392-be9a8a78db15	019e865e-e466-71a2-88eb-238ba8dd32ab	Dua-dua pihak pun untung	It['s a win-win situation/ is a win-win situation].	\N	1	13	2026-06-02 03:38:10	2026-06-19 01:15:48
019e867b-6e8d-70b4-b6a1-2759262dcc83	019e8660-815c-739c-b143-abbbe4c35c02	Bagaimana perkembangannya?	What['s the status/ is the status]?	\N	1	1	2026-06-02 03:58:16	2026-06-19 01:17:35
019e867b-6e8f-71ed-a654-9747d478213d	019e8660-815c-739c-b143-abbbe4c35c02	Benda tu tengah berjalan lagi.	It['s still in progress/ is still in progress].	\N	1	2	2026-06-02 03:58:16	2026-06-19 01:17:49
019e867b-6e90-71f3-828a-df6365215d19	019e8660-815c-739c-b143-abbbe4c35c02	Nanti saya beritahu awak balik.	I['ll let you know/ will let you know].	\N	1	3	2026-06-02 03:58:16	2026-06-19 01:18:04
019e867b-6e93-7171-8cd2-27c0b6a93314	019e8660-815c-739c-b143-abbbe4c35c02	Terbaiklah!	That['s awesome/ is awesome]!	\N	1	5	2026-06-02 03:58:16	2026-06-19 01:18:20
019e867c-a792-71d1-a0a6-4d40bd25413b	019e8660-815c-739c-b143-abbbe4c35c02	Saya kagum betul.	I['m impressed/ am impressed].	\N	1	6	2026-06-02 03:59:36	2026-06-19 01:18:36
019e8685-471c-72f6-9304-2cecb29e9d4e	019e8660-815c-739c-b143-abbbe4c35c02	Awak dah dalam perjalanan ke?	[You on your way/Are you on your way]?	\N	1	12	2026-06-02 04:09:01	2026-06-19 01:19:18
019e8685-471d-71ab-bde0-c4d863945d73	019e8660-815c-739c-b143-abbbe4c35c02	Saya akan sampai sana sekejap lagi.	I['ll be there soon/ will be there soon].	\N	1	13	2026-06-02 04:09:01	2026-06-19 01:19:37
019e8685-471f-73f1-b93c-136d0ab3ceed	019e8660-815c-739c-b143-abbbe4c35c02	Ambil masa awak, tak perlu terburu-buru.	Take your time, [don't rush/do not rush].	\N	1	14	2026-06-02 04:09:01	2026-06-19 01:20:08
019e8687-1251-7072-9f33-b86c053afa88	019e8660-815c-739c-b143-abbbe4c35c02	Semua dah sedia, kita dah boleh gerak	We['re good to go/ are good to go].	\N	1	17	2026-06-02 04:10:59	2026-06-19 01:20:32
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
019e86b3-dcdf-70be-bf96-539bf1f81bac	019e8660-a777-734d-9e75-0d5007463fb1	Jom kita jadualkan semula.	Let's reschedule.	\N	1	3	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b3-dce1-734c-be60-7a14144083b4	019e8660-a777-734d-9e75-0d5007463fb1	Saya tak dapat datang.	I can't make it.	\N	1	4	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b3-dce2-7146-869c-7cbfa3e59a95	019e8660-a777-734d-9e75-0d5007463fb1	Ada hal mustahak tiba-tiba.	Something came up.	\N	1	5	2026-06-02 04:59:54	2026-06-02 04:59:54
019e86b5-840e-71b6-8a64-5a8d6c149d96	019e8660-a777-734d-9e75-0d5007463fb1	Kat mana kita patut parking?	Where should we park?	\N	1	7	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b5-8410-70f7-8567-0c339edb4024	019e8660-a777-734d-9e75-0d5007463fb1	Ikut saya.	Follow me.	\N	1	8	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b5-8411-700f-9aa8-cabddc6661a0	019e8660-a777-734d-9e75-0d5007463fb1	Tunjukkan jalan.	Lead the way.	\N	1	9	2026-06-02 05:01:43	2026-06-02 05:01:43
019e86b7-aa75-7370-88da-9163b187d411	019e8660-a777-734d-9e75-0d5007463fb1	Perkara tu masuk akal.	That makes sense.	\N	1	11	2026-06-02 05:04:04	2026-06-02 05:04:04
019e86b8-e3f8-716f-be4e-cedea1e1271a	019e8660-a777-734d-9e75-0d5007463fb1	Biar saya habiskan cakap dulu.	Let me finish first.	\N	1	16	2026-06-02 05:05:24	2026-06-02 05:05:24
019e86b8-e3fa-71d3-8743-f6869adf9d84	019e8660-a777-734d-9e75-0d5007463fb1	Ada betulnya juga point awak tu.	You have a point.	\N	1	17	2026-06-02 05:05:24	2026-06-02 05:05:24
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
019e86b5-840c-7326-a951-4ab726c5f286	019e8660-a777-734d-9e75-0d5007463fb1	Saya tengah rehat makan tengah hari ni.	I['m on my lunch break/ am on my lunch break].	\N	1	6	2026-06-02 05:01:43	2026-06-19 01:22:13
019e86b5-8412-72a1-9a54-59bbad366a24	019e8660-a777-734d-9e75-0d5007463fb1	Saya kehilangan kata-kata.	I['m lost for words/ am lost for words].	\N	1	10	2026-06-02 05:01:43	2026-06-19 01:22:37
019e86b7-aa78-72e5-8594-4bce895855f6	019e8660-a777-734d-9e75-0d5007463fb1	Awak masih dengar ke?	[You with me/Are you with me]?	\N	1	13	2026-06-02 05:04:04	2026-06-19 01:23:31
019e86b7-aa7a-705f-b00f-e5b11231c90e	019e8660-a777-734d-9e75-0d5007463fb1	Saya tengah dengar ni.	I['m listening/ am listening].	\N	1	14	2026-06-02 05:04:04	2026-06-19 01:23:46
019e86b7-aa7b-703a-8d1a-efce3e3982ed	019e8660-a777-734d-9e75-0d5007463fb1	Tolong jangan mencelah	[Don't interrupt, please/Do not interrupt, please].	\N	1	15	2026-06-02 05:04:04	2026-06-19 01:24:09
019e86b8-e3fb-70b0-bab8-430acfbeeb0b	019e8660-a777-734d-9e75-0d5007463fb1	Itu cerita lain pula dah.	That['s a different story/ is a different story].	\N	1	18	2026-06-02 05:05:24	2026-06-19 01:24:33
019e86dc-c30b-73c6-9232-ab7cc8aa7adc	019e8660-bfce-726a-9b1a-91ed8fa57632	Pada pendapat saya...	In my opinion	\N	1	2	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dc-c30c-73fc-a9eb-94d5025e13f1	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya langsung tak ada idea.	I have no idea.	\N	1	3	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dc-c30d-7397-9b0c-6c4c03fd3448	019e8660-bfce-726a-9b1a-91ed8fa57632	Jom kita cari jalan penyelesaian sama-sama.	Let's figure it out.	\N	1	4	2026-06-02 05:44:35	2026-06-02 05:44:35
019e86dd-f5ff-7150-ab31-c7e27359b9c3	019e8660-bfce-726a-9b1a-91ed8fa57632	Secepat yang mungkin.	As soon as possible.	\N	1	6	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f601-7251-a3f9-27317e021952	019e8660-bfce-726a-9b1a-91ed8fa57632	Boleh tolong hantarkan gambar?	Can you send a photo?	\N	1	7	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f602-710b-a12b-728ef1c03576	019e8660-bfce-726a-9b1a-91ed8fa57632	Hantarkan lokasi pada saya.	Send me the location.	\N	1	8	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86dd-f605-7021-b50e-36d90b7977b8	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya baru je sampai rumah.	I just got home.	\N	1	10	2026-06-02 05:45:53	2026-06-02 05:45:53
019e86df-5b9e-71e8-a8e5-cad9969925dc	019e8660-bfce-726a-9b1a-91ed8fa57632	Benda ni masih ada lagi ke?	Is it available?	\N	1	11	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86df-5ba1-7246-97d6-4a8e5e29eb28	019e8660-bfce-726a-9b1a-91ed8fa57632	Boleh bagi diskaun sikit?	Can I get a discount?	\N	1	13	2026-06-02 05:47:25	2026-06-02 05:47:25
019e86e2-91eb-712b-a066-034626207880	019e8660-bfce-726a-9b1a-91ed8fa57632	Jangan ambil hati ya.	No hard feelings.	\N	1	16	2026-06-02 05:50:55	2026-06-02 05:50:55
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
019e86ea-d7a1-7100-b977-c31fbb46d606	019e8660-d50d-7278-b630-c3586babcf71	Boleh awak simpan rahsia?	Can you keep a secret?	\N	1	3	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ea-d7a3-731d-aa0d-27ab42a0cee5	019e8660-d50d-7278-b630-c3586babcf71	Saya takkan bocorkan rahsia	My lips are sealed.	\N	1	4	2026-06-02 05:59:58	2026-06-02 05:59:58
019e86ec-42c1-718c-892e-f62dadd5904c	019e8660-d50d-7278-b630-c3586babcf71	Tak ada syarat apa-apa pun.	No strings attached.	\N	1	8	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86ec-42c3-73d0-a835-e500e1aa6edf	019e8660-d50d-7278-b630-c3586babcf71	Saya dah ada rancangan lain dah.	I have plans already.	\N	1	10	2026-06-02 06:01:31	2026-06-02 06:01:31
019e86f0-3bd0-71e3-8c3c-6ef221a6b321	019e8660-d50d-7278-b630-c3586babcf71	Jom kita buat benda ni cepat-cepat.	Let's make it quick.	\N	1	11	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86f0-3bd7-7044-bf53-9f284f768c72	019e8660-d50d-7278-b630-c3586babcf71	Boleh tolong kuatkan volume sikit?	Can you turn up the volume?	\N	1	13	2026-06-02 06:05:51	2026-06-02 06:05:51
019e86dd-f604-70c5-8749-e3640fbfc90c	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya kat luar sekarang ni.	I['m outside now/ am outside now].	\N	1	9	2026-06-02 05:45:53	2026-06-19 01:34:03
019e86df-5ba0-70b1-b70b-9e3b3e776a66	019e8660-bfce-726a-9b1a-91ed8fa57632	Stok dah habis.	It['s out of stock/ is out of stock].	\N	1	12	2026-06-02 05:47:25	2026-06-19 01:34:24
019e86df-5ba2-7143-b047-6edc8e40a8cf	019e8660-bfce-726a-9b1a-91ed8fa57632	Harganya berpatutan.	It['s a fair price/ is a fair price].	\N	1	14	2026-06-02 05:47:25	2026-06-19 01:34:42
019e86df-5ba4-739b-8d0f-057501fa369c	019e8660-bfce-726a-9b1a-91ed8fa57632	Saya ambil yang ini.	I['ll take it/ will take it].	\N	1	15	2026-06-02 05:47:25	2026-06-19 01:34:59
019e86e2-91ed-72c4-92c3-f011bbf70da6	019e8660-bfce-726a-9b1a-91ed8fa57632	Jangan salahkan diri awak sendiri.	[Don't blame yourself/Do not blame yourself].	\N	1	17	2026-06-02 05:50:55	2026-06-19 01:35:24
019e86ea-d79e-7018-91b4-733d60c39fa9	019e8660-d50d-7278-b630-c3586babcf71	Awak tengah buat apa tu?	What [you up to/are you up to]?	\N	1	1	2026-06-02 05:59:58	2026-06-19 01:36:54
019e86ea-d7a4-7342-80ff-9a96792b92c7	019e8660-d50d-7278-b630-c3586babcf71	Benda ni memang berbaloi.	It['s worth it/ is worth it].	\N	1	5	2026-06-02 05:59:58	2026-06-19 01:37:30
019e86ec-42be-70eb-a1be-198f7e4daae1	019e8660-d50d-7278-b630-c3586babcf71	Benda tu buang masa je.	It['s a waste of time/ is a waste of time].	\N	1	6	2026-06-02 06:01:31	2026-06-19 01:37:49
019e86ec-42bf-7199-ac90-835c7a798e65	019e8660-d50d-7278-b630-c3586babcf71	Ada udang di sebalik batu ke?	What['s the catch/ is the catch]?	\N	1	7	2026-06-02 06:01:31	2026-06-19 01:38:05
019e86ec-42c2-7247-b95e-476f294ba742	019e8660-d50d-7278-b630-c3586babcf71	Awak free tak hujung minggu ni?	[You free this weekend/Are you free this weekend]?	\N	1	9	2026-06-02 06:01:31	2026-06-19 01:38:26
019e86f0-3bd3-7206-a92e-63e5ba9fadf2	019e8660-d50d-7278-b630-c3586babcf71	Masa kita dah nak habis ni.	We['re running out of time/ are running out of time].	\N	1	12	2026-06-02 06:05:51	2026-06-19 01:38:51
019e86f0-3bdb-71eb-b748-e0ac8fdb5331	019e8660-d50d-7278-b630-c3586babcf71	Bunyi terlalu kuat.	It['s too loud/ is too loud].	\N	1	14	2026-06-02 06:05:51	2026-06-19 01:39:11
019e86f3-4aaa-7260-9848-db1cb26e1849	019e8660-d50d-7278-b630-c3586babcf71	Saya setuju dengan awak.	I['m with you/ am with you].	\N	1	16	2026-06-02 06:09:11	2026-06-19 01:39:50
019e86f3-4aac-7248-a7de-fe09e23159d0	019e8660-d50d-7278-b630-c3586babcf71	Jangan fikir bukan-bukan.	[Don't overthink it/Do not overthink it].	\N	1	17	2026-06-02 06:09:11	2026-06-19 01:40:08
019e86f3-4aad-7145-ad87-b3f095db5f83	019e8660-d50d-7278-b630-c3586babcf71	Biar masa yang menentukan.	Let nature take its course.	\N	1	18	2026-06-02 06:09:11	2026-06-02 06:09:11
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
019e872d-ad5f-734b-94ab-94b8fd75f38e	019e8660-efc4-705c-a666-3dd34556d4f8	Tak payah sibuk hal orang.	Mind your own business.	\N	1	4	2026-06-02 07:12:58	2026-06-02 07:12:58
019e872d-ad60-7162-beab-436fa3e8f362	019e8660-efc4-705c-a666-3dd34556d4f8	Adakah tempat tu jauh dari sini?	Is it far from here?	\N	1	5	2026-06-02 07:12:58	2026-06-02 07:12:58
019e872f-0635-7309-a073-a4b11b41ebc9	019e8660-efc4-705c-a666-3dd34556d4f8	Berapa lama masa yang diambil?	How long does it take?	\N	1	7	2026-06-02 07:14:26	2026-06-02 07:14:26
019e872f-0636-7029-bd43-d715769d570a	019e8660-efc4-705c-a666-3dd34556d4f8	Lebih kurang sepuluh minit.	About ten minutes.	\N	1	8	2026-06-02 07:14:26	2026-06-02 07:14:26
019e8734-3dbd-70fb-9738-bffbfdf0dc62	019e8660-efc4-705c-a666-3dd34556d4f8	Boleh tolong saya sikit?	Can you do me a favor?	\N	1	11	2026-06-02 07:20:08	2026-06-02 07:20:08
019e8734-3dc1-712b-bf83-bb5ea7cfc70c	019e8660-efc4-705c-a666-3dd34556d4f8	Terima kasih atas peringatan awal tu.	Thanks for the heads up.	\N	1	14	2026-06-02 07:20:08	2026-06-02 07:20:08
019e872d-ad5d-703e-a800-3665aabdd937	019e8660-efc4-705c-a666-3dd34556d4f8	Itu bukan urusan saya	It['s none of my business/ is none of my business].	\N	1	3	2026-06-02 07:12:58	2026-06-19 01:43:35
019e8735-f3d8-702e-a56f-08ca30dae088	019e8660-efc4-705c-a666-3dd34556d4f8	Beritahu saya kalau awak perlukan apa-apa.	Let me know if you need anything.	\N	1	16	2026-06-02 07:22:00	2026-06-02 07:22:00
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
019e872d-ad5c-739c-8381-9a8819cd477e	019e8660-efc4-705c-a666-3dd34556d4f8	Saja tengah termenung kejap.	I['m just thinking/ am just thinking].	\N	1	2	2026-06-02 07:12:58	2026-06-19 01:42:07
019e872f-0633-72b5-8b7d-4b6a788ae2dc	019e8660-efc4-705c-a666-3dd34556d4f8	Dah dekat sangat dah.	It['s just around the corner/ is just around the corner].	\N	1	6	2026-06-02 07:14:26	2026-06-19 01:44:07
019e872f-0638-734b-97a0-f88a8299e0f3	019e8660-efc4-705c-a666-3dd34556d4f8	Saya tengah nak cepat.	I['m in a hurry/ am in a hurry].	\N	1	9	2026-06-02 07:14:26	2026-06-19 01:44:28
019e872f-0639-72a0-9e91-5381345db959	019e8660-efc4-705c-a666-3dd34556d4f8	Jangan desak saya.	[Don't rush me/Do not rush me].	\N	1	10	2026-06-02 07:14:26	2026-06-19 01:44:51
019e8734-3dbf-712e-8c8d-15549cb5e553	019e8660-efc4-705c-a666-3dd34556d4f8	Apa yang awak perlukan?	What [you need/do you need]?	\N	1	12	2026-06-02 07:20:08	2026-06-19 01:45:18
019e8734-3dc3-72c7-b7d5-036ea741a5be	019e8660-efc4-705c-a666-3dd34556d4f8	Saya tengah buat benda tu sekarang.	I['m on it/ am on it].	\N	1	15	2026-06-02 07:20:08	2026-06-19 01:45:54
019e8735-f3da-7166-b841-e51481f4e9e0	019e8660-efc4-705c-a666-3dd34556d4f8	Saya tengah cuba sedaya upaya saya ni.	I['m doing my best/ am doing my best].	\N	1	17	2026-06-02 07:22:00	2026-06-19 01:46:12
019e8735-f3db-7264-ad14-b35af3be72ea	019e8660-efc4-705c-a666-3dd34556d4f8	Jangan putus asa.	[Don't give up/Do not give up].	\N	1	18	2026-06-02 07:22:00	2026-06-19 01:46:35
019e8735-f3dd-7008-8fad-dc22947654ae	019e8660-efc4-705c-a666-3dd34556d4f8	Awak dah buat dengan sangat bagus.	You['re doing great/ are doing great].	\N	1	19	2026-06-02 07:22:00	2026-06-19 01:47:00
019ec669-7637-701b-a3a7-1abe8c705361	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Benda ni dah rosak	It['s out of order/ is out of order].	\N	1	11	2026-06-14 13:54:20	2026-06-19 08:00:28
019e873b-74ee-7180-951c-07327df637c2	019e8661-eef9-7300-ac92-1cd27b454749	Biar saya yang uruskan perkara tu.	Ich regel das.	\N	1	13	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873b-74f0-7333-8b26-61573834f3b8	019e8661-eef9-7300-ac92-1cd27b454749	Terima kasih atas peringatan awal tu.	Danke für den Hinweis.	\N	1	14	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873b-74f2-71bd-bc7b-e3b7041f9081	019e8661-eef9-7300-ac92-1cd27b454749	Saya tengah buat benda tu sekarang.	Ich bin dran.	\N	1	15	2026-06-02 07:28:01	2026-06-02 07:28:01
019e873c-7a2c-71f5-bf2a-96102f9ef576	019e8661-eef9-7300-ac92-1cd27b454749	Let me know if you need anything.	Sag Bescheid, wenn du was brauchst.	\N	1	16	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a2e-7364-b3df-cf2420caf157	019e8661-eef9-7300-ac92-1cd27b454749	Saya tengah cuba sedaya upaya saya ni.	Ich gebe mein Bestes.	\N	1	17	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a2f-728f-87b3-1db31bfa52ff	019e8661-eef9-7300-ac92-1cd27b454749	Jangan putus asa.	Gib nicht auf!	\N	1	18	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a31-7033-b720-ee92ea873545	019e8661-eef9-7300-ac92-1cd27b454749	Awak dah buat dengan sangat bagus.	Du machst das super!	\N	1	19	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873c-7a32-7140-ab82-9a6e22be25b3	019e8661-eef9-7300-ac92-1cd27b454749	Jom kita teruskan lagi usaha ni.	Lass uns weitermachen.	\N	1	20	2026-06-02 07:29:08	2026-06-02 07:29:08
019e873f-72e3-719f-aa22-dbcbb38bba82	019e8661-0b15-7008-8f4f-e527ea492d4a	Harap semuanya berjalan lancar.	Hope for the best.	\N	1	2	2026-06-02 07:32:22	2026-06-02 07:32:22
019e873f-72e6-73aa-8e9c-b9fd9ba55250	019e8661-0b15-7008-8f4f-e527ea492d4a	Okay je bagi saya.	I can live with that.	\N	1	4	2026-06-02 07:32:22	2026-06-02 07:32:22
019e8741-16e0-71bb-84f5-06090f37fb21	019e8661-0b15-7008-8f4f-e527ea492d4a	Jom kita selesaikan salah faham ni elok-elok.	Let's clear the air.	\N	1	6	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8741-16e4-72dc-b4ff-bf78c0e2781f	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya tak ambil hati pun.	No offense taken.	\N	1	8	2026-06-02 07:34:10	2026-06-02 07:34:10
019e8742-a6b8-7016-94ff-ebd68db4e240	019e8661-0b15-7008-8f4f-e527ea492d4a	Masa yang akan menentukan segala-galanya.	Time will tell.	\N	1	12	2026-06-02 07:35:52	2026-06-02 07:35:52
019e8742-a6bb-72c6-859d-30ef347e57fa	019e8661-0b15-7008-8f4f-e527ea492d4a	Dipendekkan cerita...	To make a long story short	\N	1	14	2026-06-02 07:35:52	2026-06-02 07:35:52
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
019e875a-cff8-7013-a9cc-51aaf4503057	019e8661-212a-71ce-9281-dba09436e383	Lega mendengarnya.	That['s a relief to hear/ is a relief to hear].	\N	1	1	2026-06-02 08:02:16	2026-06-19 02:05:07
019e8750-1bb6-7000-aada-3a743bd4ffdd	019e8661-fc4e-7106-b27c-576f54e8b66a	Saya akan fikirkan masak-masak dulu.	Ich überleg's mir noch mal in Ruhe.	\N	1	16	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bb8-7175-b55e-699b0686c16a	019e8661-fc4e-7106-b27c-576f54e8b66a	Nak ambil, tak nak sudah.	Friss oder stirb.	\N	1	17	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bba-7133-8eee-6e54d0ae9b2a	019e8661-fc4e-7106-b27c-576f54e8b66a	Benda ni menepati standard yang ditetapkan.	Das entspricht dem Standard.	\N	1	18	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bbb-7245-84ef-1d1e97105247	019e8661-fc4e-7106-b27c-576f54e8b66a	Awak dah baca fikiran saya.	Du hast meine Gedanken gelesen.	\N	1	19	2026-06-02 07:50:34	2026-06-02 07:50:34
019e8750-1bbc-7175-bda9-5e0b95649241	019e8661-fc4e-7106-b27c-576f54e8b66a	Jom kita akhiri benda ni.	Lass uns zum Schluss kommen.	\N	1	20	2026-06-02 07:50:34	2026-06-02 07:50:34
019e875a-cffc-72b0-86fa-dededc555c99	019e8661-212a-71ce-9281-dba09436e383	Biar kita dengar dulu penjelasan mereka sampai habis.	Let's hear them out.	\N	1	4	2026-06-02 08:02:16	2026-06-02 08:02:16
019e875a-cffd-7269-b717-9b5545e72a08	019e8661-212a-71ce-9281-dba09436e383	Saya faham point yang awak cuba sampaikan.	I see your point.	\N	1	5	2026-06-02 08:02:16	2026-06-02 08:02:16
019e873f-72e4-7167-820d-30848e52a9de	019e8661-0b15-7008-8f4f-e527ea492d4a	Bukan kiamat pun.	It['s not the end of the world/ is not the end of the world].	\N	1	3	2026-06-02 07:32:22	2026-06-19 01:50:32
019e873f-72e7-70b2-a4aa-6b6d84748860	019e8661-0b15-7008-8f4f-e527ea492d4a	Itu memang tak mungkin sama sekali.	That['s out of the question/ is out of the question].	\N	1	5	2026-06-02 07:32:22	2026-06-19 01:50:54
019e8741-16e2-7069-a845-b46f8414c357	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya tak ada niat langsung nak buat awak terasa hati.	I [didn't mean to offend you/did not mean to offend you].	\N	1	7	2026-06-02 07:34:10	2026-06-19 01:51:20
019e8741-16e5-72d9-a44c-4935eeae00ff	019e8661-0b15-7008-8f4f-e527ea492d4a	Kita sependapat.	We['re on the same page/ are on the same page].	\N	1	9	2026-06-02 07:34:10	2026-06-19 01:52:28
019e8741-16e6-72ae-81d9-2a2b814350d9	019e8661-0b15-7008-8f4f-e527ea492d4a	Itu satu pandangan yang baik.	That['s a good point/ is a good point].	\N	1	10	2026-06-02 07:34:10	2026-06-19 01:52:50
019e8742-a6b9-732b-ab9c-2ddf084c2990	019e8661-0b15-7008-8f4f-e527ea492d4a	Panjang ceritanya kalau nak ikutkan.	It['s a long story/ is a long story].	\N	1	13	2026-06-02 07:35:52	2026-06-19 01:53:51
019e8742-a6bc-7368-9feb-a14a82fb2d8a	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya saja tengok-tengok je ni.	I['m just browsing/ am just browsing].	\N	1	15	2026-06-02 07:35:52	2026-06-19 01:54:28
019e8745-4ca6-7021-a293-cec4e4dbd1b7	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya akan fikirkan masak-masak dulu.	I['ll think it over/ will think it over].	\N	1	16	2026-06-02 07:38:46	2026-06-19 01:54:50
019e8745-4ca9-7155-bafc-68338a9d6e85	019e8661-0b15-7008-8f4f-e527ea492d4a	Benda ni menepati standard yang ditetapkan.	It['s up to par/ is up to par].	\N	1	18	2026-06-02 07:38:46	2026-06-19 01:55:11
019e875a-cffb-736b-8faa-8ac13e072fd7	019e8661-212a-71ce-9281-dba09436e383	Jangan cepat sangat buat andaian sendiri.	[Don't jump to conclusions/Do not jump to conclusions].	\N	1	3	2026-06-02 08:02:16	2026-06-19 02:06:41
019e875d-3784-73d9-853b-d01eadf77543	019e8661-212a-71ce-9281-dba09436e383	Saya mengaku saya salah.	I stand corrected.	\N	1	7	2026-06-02 08:04:53	2026-06-02 08:04:53
019e875d-3785-7293-83c1-0cb3ff1b5b8e	019e8661-212a-71ce-9281-dba09436e383	Jom kita bertolak ansur.	Let's meet halfway.	\N	1	8	2026-06-02 08:04:53	2026-06-02 08:04:53
019e8761-0bd9-7269-aafa-0667665308de	019e8661-212a-71ce-9281-dba09436e383	Boleh tolong tengok-tengokkan kejap benda ni?	Can you keep an eye on this?	\N	1	11	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8761-0bdc-731e-8758-01494d44e9f9	019e8661-212a-71ce-9281-dba09436e383	Jangan bagi hilang tau.	Don't lose it.	\N	1	13	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8761-0bdf-70a1-99c9-73966f71bd47	019e8661-212a-71ce-9281-dba09436e383	Kat mana awak dengar cerita tu?	Where did you hear that?	\N	1	15	2026-06-02 08:09:04	2026-06-02 08:09:04
019e8762-e7d0-7024-bca5-aa902b3950f7	019e8661-212a-71ce-9281-dba09436e383	Jangan percaya bulat-bulat cerita tu.	Take it with a grain of salt.	\N	1	17	2026-06-02 08:11:06	2026-06-02 08:11:06
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
019e8770-4da0-71a9-a059-7a632df86e10	019e8661-31a0-7221-b666-2d4327bb2cb5	Perasaan saya bercampur-baur pasal benda ni.	I have mixed feelings about this.	\N	1	3	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8770-4da1-73bf-b2a3-ded288a522eb	019e8661-31a0-7221-b666-2d4327bb2cb5	Jangan kita rumitkan lagi keadaan ni.	Let's not complicate things.	\N	1	4	2026-06-02 08:25:44	2026-06-02 08:25:44
019e8772-9b90-700d-887d-8dfd2e07dda4	019e8661-31a0-7221-b666-2d4327bb2cb5	Kita kena bertindak cepat.	We need to act fast.	\N	1	8	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8772-9b91-7260-a57c-d059e65eb166	019e8661-31a0-7221-b666-2d4327bb2cb5	Masa sangat penting sekarang ni.	Time is of the essence.	\N	1	9	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8772-9b92-73bc-a4ff-60a14f502f04	019e8661-31a0-7221-b666-2d4327bb2cb5	Boleh tolong ceritakan pada saya apa yang jadi?	Can you fill me in?	\N	1	10	2026-06-02 08:28:15	2026-06-02 08:28:15
019e8775-e5d2-70ea-b303-4250a93e94a3	019e8661-31a0-7221-b666-2d4327bb2cb5	Biar kita fikirkan dulu semalaman sebelum buat keputusan esok.	Let's sleep on it.	\N	1	14	2026-06-02 08:31:51	2026-06-02 08:31:51
019e8778-ed12-714e-9c78-a0bde8295379	019e8661-31a0-7221-b666-2d4327bb2cb5	Fikirkan tentang sudut positifnya.	Focus on the bright side.	\N	1	17	2026-06-02 08:35:09	2026-06-02 08:35:09
019e875d-3788-7187-820f-af6c19618b68	019e8661-212a-71ce-9281-dba09436e383	Saya sedia membantu awak bila-bila masa.	I['m at your service/ am at your service].	\N	1	10	2026-06-02 08:04:53	2026-06-19 02:07:52
019e8761-0bdb-7215-8539-1b561efedda0	019e8661-212a-71ce-9281-dba09436e383	Biar saya tolong tengokkan.	I['ll watch over it/ will watch over it].	\N	1	12	2026-06-02 08:09:04	2026-06-19 02:09:02
019e8761-0bde-70f9-8287-95225568244b	019e8661-212a-71ce-9281-dba09436e383	Saya akan simpan elok-elok	I['ll keep it safe/ will keep it safe].	\N	1	14	2026-06-02 08:09:04	2026-06-19 02:09:16
019e8762-e7ce-7278-81bc-30da49a984d6	019e8661-212a-71ce-9281-dba09436e383	Itu cuma khabar angin je.	It['s just a rumor/ is just a rumor].	\N	1	16	2026-06-02 08:11:06	2026-06-19 02:09:33
019e8762-e7d1-708a-95e7-be5f6f2e86a0	019e8661-212a-71ce-9281-dba09436e383	Kita tengok je nanti.	We['ll see about that/ will see about that].	\N	1	18	2026-06-02 08:11:06	2026-06-19 02:09:52
019e8770-4d9e-70b4-b82d-67e3e0d24338	019e8661-31a0-7221-b666-2d4327bb2cb5	Sangat jelas.	It['s crystal clear/ is crystal clear].	\N	1	2	2026-06-02 08:25:44	2026-06-19 02:20:30
019e8770-4da2-71ae-ba9e-982799457a3b	019e8661-31a0-7221-b666-2d4327bb2cb5	Benda tu kacang je.	It['s a walk in the park/ is a walk in the park].	\N	1	5	2026-06-02 08:25:44	2026-06-19 02:21:03
019e8772-9b8d-704e-b525-451d0cbe7331	019e8661-31a0-7221-b666-2d4327bb2cb5	Saya akan ambil maklum tentang perkara tu.	I['ll take note of that/ will take note of that].	\N	1	6	2026-06-02 08:28:15	2026-06-19 02:22:28
019e8772-9b8f-708d-af96-9f932d56c087	019e8661-31a0-7221-b666-2d4327bb2cb5	Jangan ambil ringan perkara tu.	[Don't take it for granted/Do not take it for granted].	\N	1	7	2026-06-02 08:28:15	2026-06-19 02:22:45
019e8775-e5cd-7282-8db5-960b28c5a871	019e8661-31a0-7221-b666-2d4327bb2cb5	Saya sedia mendengar.	I['m all ears/ am all ears].	\N	1	11	2026-06-02 08:31:51	2026-06-19 02:23:19
019e8775-e5cf-7059-815c-fb414cc15a9b	019e8661-31a0-7221-b666-2d4327bb2cb5	Itu satu pilihan alternatif yang baik.	That['s a good alternative/ is a good alternative].	\N	1	12	2026-06-02 08:31:51	2026-06-19 02:23:37
019e8775-e5d1-70f4-8ebb-b48043c0f7bd	019e8661-31a0-7221-b666-2d4327bb2cb5	Satu keputusan yang agak sukar untuk dibuat.	It['s a tough call/ is a tough call].	\N	1	13	2026-06-02 08:31:51	2026-06-19 02:23:49
019e8778-ed10-7199-bd6c-d099dcddf8f4	019e8661-31a0-7221-b666-2d4327bb2cb5	Yang lepas tu lepaslah.	[Don't look back/Do not look back].	\N	1	16	2026-06-02 08:35:09	2026-06-19 02:24:13
019e8778-ed13-7376-a77f-7cd152654973	019e8661-31a0-7221-b666-2d4327bb2cb5	Ada hikmah tersembunyi di sebalik apa yang berlaku.	It['s a blessing in disguise/ is a blessing in disguise].	\N	1	18	2026-06-02 08:35:09	2026-06-19 02:24:27
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
019e8792-6578-706e-9a8b-d942e912169b	019e8661-46ce-7395-8698-7e8833de16bc	Saya kena tenangkan fikiran kejap.	I need to clear my head.	\N	1	2	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8792-657c-70fd-af12-d97ec2303925	019e8661-46ce-7395-8698-7e8833de16bc	Jom kita mudahkan je benda ni	Let's keep it simple.	\N	1	5	2026-06-02 09:02:58	2026-06-02 09:02:58
019e8798-089d-733f-864c-36d19bba180e	019e8661-46ce-7395-8698-7e8833de16bc	Cakap berterus-terang je walaupun pahit.	Let's call a spade a spade.	\N	1	10	2026-06-02 09:09:08	2026-06-02 09:09:08
019e879b-2394-7097-9bd1-fedf1b5277c5	019e8661-46ce-7395-8698-7e8833de16bc	Jom kita bayar asing-asing bayar makan ni.	Let's split the bill.	\N	1	15	2026-06-02 09:12:31	2026-06-02 09:12:31
019e879d-88a3-701f-a5be-fcd959765787	019e8661-46ce-7395-8698-7e8833de16bc	Kuatkan semangat.	Keep your chin up.	\N	1	17	2026-06-02 09:15:08	2026-06-02 09:15:08
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
019e8778-ed17-7349-8d12-20eafaf61dc5	019e8661-31a0-7221-b666-2d4327bb2cb5	Kita dah hampir sampai ke garisan penamat.	We['re almost at the finish line/ are almost at the finish line].	\N	1	20	2026-06-02 08:35:09	2026-06-19 02:24:56
019e8792-6576-71e7-a967-56dec7dffa51	019e8661-46ce-7395-8698-7e8833de16bc	Apa jawapan muktamad awak?	What['s your final answer/ is your final answer]?	\N	1	1	2026-06-02 09:02:58	2026-06-19 02:29:34
019e8792-6579-70a5-bcc1-d1492222ab26	019e8661-46ce-7395-8698-7e8833de16bc	Jangan gopoh sangat bertindak sebelum masa yang sesuai.	[Don't jump the gun/Do not jump the gun].	\N	1	3	2026-06-02 09:02:58	2026-06-19 02:30:00
019e8792-657a-73cd-90e6-11ae316ab89a	019e8661-46ce-7395-8698-7e8833de16bc	Benda tu jadi tanpa disangka-sangka.	It['s out of the blue/ is out of the blue].	\N	1	4	2026-06-02 09:02:58	2026-06-19 02:30:18
019e8798-0899-7055-9849-054a2754b67e	019e8661-46ce-7395-8698-7e8833de16bc	Itu satu keuntungan untuk kita.	That['s a win for us/ is a win for us].	\N	1	7	2026-06-02 09:09:08	2026-06-19 02:31:15
019e8798-089a-7305-9671-10a45ae00f8f	019e8661-46ce-7395-8698-7e8833de16bc	Jangan tamak sangat bila dah beruntung.	[Don't push your luck/Do not push your luck].	\N	1	8	2026-06-02 09:09:08	2026-06-19 02:31:32
019e8798-089b-72e4-bb45-6dcd2efd882b	019e8661-46ce-7395-8698-7e8833de16bc	Dah terang-terang terpancar kat muka awak.	It['s written all over your face/ is written all over your face].	\N	1	9	2026-06-02 09:09:08	2026-06-19 02:31:52
019e879b-238e-7140-a566-c353e1e0df8f	019e8661-46ce-7395-8698-7e8833de16bc	Duit tunai saya dah nak habis ni	I['m running low on cash/ am running low on cash].	\N	1	11	2026-06-02 09:12:31	2026-06-19 02:32:04
019e879b-2390-71e5-be5f-d81a38fd550d	019e8661-46ce-7395-8698-7e8833de16bc	Dah ada kat hujung lidah saya dah ni.	It['s on the tip of my tongue/ is on the tip of my tongue].	\N	1	12	2026-06-02 09:12:31	2026-06-19 02:32:27
019e879b-2391-7284-b650-86f38e1f81df	019e8661-46ce-7395-8698-7e8833de16bc	Jangan buat kecoh kat sini.	[Don't make a scene/Do not make a scene].	\N	1	13	2026-06-02 09:12:31	2026-06-19 02:33:00
019e879d-88a1-70a0-9835-fb4b740f796d	019e8661-46ce-7395-8698-7e8833de16bc	Saya tak ada mood la sekarang ni.	I['m not in the mood/ am not in the mood].	\N	1	16	2026-06-02 09:15:08	2026-06-19 02:33:54
019e879d-88a4-717c-aa83-8b434c1b2fff	019e8661-46ce-7395-8698-7e8833de16bc	Lebih baik lambat daripada tak buat langsung.	It['s better late than never/ is better late than never].	\N	1	18	2026-06-02 09:15:08	2026-06-19 02:34:13
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
019ec382-7c3d-73cf-947b-80c21a331425	019e8b75-2405-71d6-b5e8-66088f26b38d	Apa hajat awak ke sini?	What brings you here?	\N	1	1	2026-06-14 00:22:49	2026-06-14 00:22:49
019ec382-7c43-719d-8c2d-53612d535bac	019e8b75-2405-71d6-b5e8-66088f26b38d	Jom kita skip dulu kali ni.	Let's give it a miss.	\N	1	5	2026-06-14 00:22:49	2026-06-14 00:22:49
019ec389-760d-7094-8cf8-f75a4ed444d4	019e8b75-2405-71d6-b5e8-66088f26b38d	Jom kita mula balik dari awal semula.	Let's start from scratch.	\N	1	9	2026-06-14 00:30:26	2026-06-14 00:30:26
019ec38c-c502-73c4-a40c-212b723d3e36	019e8b75-2405-71d6-b5e8-66088f26b38d	Jom kita buat biasa-biasa je	Let's keep a low profile.	\N	1	12	2026-06-14 00:34:03	2026-06-14 00:34:03
019ec38c-c507-7271-b91f-19043cc8f379	019e8b75-2405-71d6-b5e8-66088f26b38d	Boleh tak kita tunda ke lain kali?	I will take a rain check.	\N	1	15	2026-06-14 00:34:03	2026-06-14 00:34:03
019ec396-48f9-7299-b460-70d4d38edf35	019e8b75-2405-71d6-b5e8-66088f26b38d	Jangan pertaruhkan semua benda dalam satu tempat sahaja.	[Don't put all your eggs in one basket/Do not put all your eggs in one basket].	\N	1	19	2026-06-14 00:44:26	2026-06-19 02:40:04
019ec396-48f6-735b-90a4-61f2d426e1e0	019e8b75-2405-71d6-b5e8-66088f26b38d	Terima hakikat je lah.	Let's face the reality.	\N	1	17	2026-06-14 00:44:26	2026-06-14 00:44:26
019ec396-48f8-73cb-b0b7-4e99dd193c0d	019e8b75-2405-71d6-b5e8-66088f26b38d	Insting saya kuat mengatakan...	I have a gut feeling.	\N	1	18	2026-06-14 00:44:26	2026-06-14 00:44:26
019ec396-48fa-71b0-b47e-d23e3aba6559	019e8b75-2405-71d6-b5e8-66088f26b38d	Jom kita kasi jadi!	Let's make it happen.	\N	1	20	2026-06-14 00:44:26	2026-06-14 00:44:26
019ec39f-164d-703b-85f2-6702748d66df	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jom terus ke point penting.	Let's cut to the chase.	\N	1	2	2026-06-14 00:54:03	2026-06-14 00:54:03
019ec3aa-6353-717c-a61c-7e099acb7bcf	019ec37b-5730-7296-a3bd-711aa0f94fd4	Kita tengok dulu keadaan macam mana nanti.	Let's play it by ear.	\N	1	6	2026-06-14 01:06:24	2026-06-14 01:06:24
019ec3aa-6359-722e-84cd-eaa5bb5a3a8d	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jom kita tukar rancangan sekarang ni	Let's call an audible.	\N	1	10	2026-06-14 01:06:24	2026-06-14 01:06:24
019ec3ae-451f-735c-aafa-628768ee6ec3	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jom kita fokus semula pada kerja asal.	Let's get back on track.	\N	1	14	2026-06-14 01:10:38	2026-06-14 01:10:38
019ec3b4-d6b0-72c7-a481-24d94a25492d	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jom kita gerak sekarang.	Let's hit the road.	\N	1	18	2026-06-14 01:17:49	2026-06-14 01:17:49
019ec3b4-d6b2-70b6-b1ef-225ef1b1fad9	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jom kita terus mara ke depan.	Let's keep pushing forward.	\N	1	20	2026-06-14 01:17:49	2026-06-14 01:17:49
019ec3d4-3e63-707b-a7df-89718a98617b	019ec37b-764b-708b-89d1-7b9abe965897	Jom kita setelkan bahagian-bahagian kecil yang berbaki	Let's iron out the details.	\N	1	2	2026-06-14 01:52:07	2026-06-14 01:52:07
019ec382-7c40-7354-9983-55fbf52c17f2	019e8b75-2405-71d6-b5e8-66088f26b38d	Jangan menilai sesuatu dari luaran je	[Don't judge a book by its cover/Do not judge a book by its cover].	\N	1	3	2026-06-14 00:22:49	2026-06-19 02:35:46
019ec382-7c41-7173-8763-fdb94586f0ec	019e8b75-2405-71d6-b5e8-66088f26b38d	Susah nak cakap	It['s hard to tell/ is hard to tell].	\N	1	4	2026-06-14 00:22:49	2026-06-19 02:36:00
019ec389-760a-72ae-9bd3-eb6c7a2c4ecc	019e8b75-2405-71d6-b5e8-66088f26b38d	Jangan ambil hati sangat	[Don't take it to heart/Do not take it to heart].	\N	1	7	2026-06-14 00:30:26	2026-06-19 02:36:47
019ec389-760b-7205-8120-2094394db083	019e8b75-2405-71d6-b5e8-66088f26b38d	Hanya tinggal tunggu masa sahaja	It['s just a matter of time/ is just a matter of time].	\N	1	8	2026-06-14 00:30:26	2026-06-19 02:37:03
019ec389-760e-7102-ad8f-b56cce437eb8	019e8b75-2405-71d6-b5e8-66088f26b38d	Saya rasa kurang sihat sikit	I['m a bit under the weather/ am a bit under the weather].	\N	1	10	2026-06-14 00:30:26	2026-06-19 02:37:26
019ec38c-c500-7029-9cd2-1797cb7b0879	019e8b75-2405-71d6-b5e8-66088f26b38d	Itu jauh di luar kemampuan saya	That['s out of my league/ is out of my league].	\N	1	11	2026-06-14 00:34:03	2026-06-19 02:38:09
019ec38c-c504-70ad-a1ef-c8b9c7d80f82	019e8b75-2405-71d6-b5e8-66088f26b38d	Benda tu semua orang dah tahu.	It['s an open secret/ is an open secret].	\N	1	13	2026-06-14 00:34:03	2026-06-19 02:38:32
019ec38c-c506-72d3-b2f8-3142e77d65a3	019e8b75-2405-71d6-b5e8-66088f26b38d	Jangan putuskan hubungan	[Don't burn bridges/Do not burn bridges].	\N	1	14	2026-06-14 00:34:03	2026-06-19 02:38:50
019ec39f-164c-70d9-92e3-a9726b26d4b7	019ec37b-5730-7296-a3bd-711aa0f94fd4	Ada muslihat apa lagi?	What['s the catch this time/ is the catch this time]?	\N	1	1	2026-06-14 00:54:03	2026-06-19 02:43:06
019ec39f-164f-7095-81b2-ecb7154b7cec	019ec37b-5730-7296-a3bd-711aa0f94fd4	Peluang yang agak tipis.	It['s a long shot/ is a long shot].	\N	1	3	2026-06-14 00:54:03	2026-06-19 02:43:29
019ec39f-1650-739c-a2dd-45d6f0d69a0e	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jangan desak saya.	[Don't push me/Do not push me].	\N	1	4	2026-06-14 00:54:03	2026-06-19 02:43:43
019ec3aa-6355-705f-9297-c3254a7f760a	019ec37b-5730-7296-a3bd-711aa0f94fd4	Kacang je benda ni.	It['s a piece of cake/ is a piece of cake].	\N	1	7	2026-06-14 01:06:24	2026-06-19 02:44:36
019ec3aa-6357-714a-a919-7d6ff85d7566	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jangan yakin sangat, benda belum jadi	[Don't count your chickens before they hatch/Do not count your chickens before they hatch].	\N	1	8	2026-06-14 01:06:24	2026-06-19 02:44:52
019ec3aa-6358-7334-afd4-289a692c0b8d	019ec37b-5730-7296-a3bd-711aa0f94fd4	Saya tengah kejar masa ni.	I['m running against time/ am running against time].	\N	1	9	2026-06-14 01:06:24	2026-06-19 02:45:15
019ec3ae-451a-7123-bf1f-5ba85604123b	019ec37b-5730-7296-a3bd-711aa0f94fd4	Benda ni ada kebaikan dan ada juga keburukannya.	It['s a double-edged sword/ is a double-edged sword].	\N	1	11	2026-06-14 01:10:38	2026-06-19 02:45:35
019ec3ae-451c-7364-8197-a99c56277769	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jangan sebelah kan mana-mana pihak.	[Don't take sides/Do not take sides].	\N	1	12	2026-06-14 01:10:38	2026-06-19 02:45:48
019ec3ae-451e-73a7-b0d8-81345cbabcf0	019ec37b-5730-7296-a3bd-711aa0f94fd4	Saya belum buat keputusan lagi.	I['m on the fence/ am on the fence].	\N	1	13	2026-06-14 01:10:38	2026-06-19 02:46:13
019ec3b4-d6ac-704e-9c72-cc096c3cddef	019ec37b-5730-7296-a3bd-711aa0f94fd4	Jangan cari pasal bila keadaan dah tenang.	[Don't rock the boat/Do not rock the boat].	\N	1	16	2026-06-14 01:17:49	2026-06-19 02:48:12
019ec3b4-d6af-72ef-ba6e-30dfcdf6df3a	019ec37b-5730-7296-a3bd-711aa0f94fd4	Nanti saya beritahu awak awal-awal.	I['ll give you a heads up/ will give you a heads up].	\N	1	17	2026-06-14 01:17:49	2026-06-19 02:48:45
019ec3b4-d6b1-7218-b371-ca89ed0b30bd	019ec37b-5730-7296-a3bd-711aa0f94fd4	Kalau bukan sekarang, bila lagi?	It['s now or never/ is now or never].	\N	1	19	2026-06-14 01:17:49	2026-06-19 02:49:15
019ec3d4-3e61-71a1-8a32-5f7dc7bd17fd	019ec37b-764b-708b-89d1-7b9abe965897	Bila tarikh akhir?	What['s the deadline/ is the deadline]?	\N	1	1	2026-06-14 01:52:07	2026-06-19 02:51:03
019ec3e9-049c-7212-8d72-f38e16ad185a	019ec37b-764b-708b-89d1-7b9abe965897	Jom kita tukar-tukar idea	Let's bounce some ideas.	\N	1	6	2026-06-14 02:14:48	2026-06-14 02:14:48
019ec3e9-04a1-7307-99a3-ed16d28e5b1f	019ec37b-764b-708b-89d1-7b9abe965897	Jom kita tengok gambaran lebih besar.	Let's look at the big picture.	\N	1	10	2026-06-14 02:14:48	2026-06-14 02:14:48
019ec3f1-aa46-7283-a4f0-77d8204b67c8	019ec37b-764b-708b-89d1-7b9abe965897	Kita rahsiakan dulu benda ni	Let's keep it under wraps.	\N	1	14	2026-06-14 02:24:15	2026-06-14 02:24:15
019ec3f8-62bd-73e1-8504-27a04d5c7c29	019ec37b-764b-708b-89d1-7b9abe965897	Jom kita tukar topik	Let's drop the subject.	\N	1	18	2026-06-14 02:31:35	2026-06-14 02:31:35
019ec3f8-62bf-7289-90db-03670994a639	019ec37b-764b-708b-89d1-7b9abe965897	Jom kita manfaatkan peluang ni sebaik mungkin.	Let's make the most of it.	\N	1	20	2026-06-14 02:31:35	2026-06-14 02:31:35
019ec3fc-af8a-709f-bff1-2beaec6a8282	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jangan kita gopoh sangat buat keputusan.	Let's not rush into things.	\N	1	2	2026-06-14 02:36:17	2026-06-14 02:36:17
019ec3ff-33b0-71f5-b62f-9e2805df7bce	019ec37b-b37f-728b-a194-a6cb03aba0bf	Biar kita beri mereka masa dulu.	Let's give them some space.	\N	1	6	2026-06-14 02:39:02	2026-06-14 02:39:02
019ec3ff-33b6-72bb-83ca-2b9750666816	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jangan kita buat andaian sendiri	Let's not make assumptions.	\N	1	10	2026-06-14 02:39:02	2026-06-14 02:39:02
019ec406-8239-72bd-aaae-146839c2f20d	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jom kita kekal fokus pada matlamat asal.	Let's stay focused.	\N	1	14	2026-06-14 02:47:01	2026-06-14 02:47:01
019ec410-ecc4-730a-b650-f664f91af918	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jom kita tamatkan benda ni	Let's wrap things up.	\N	1	18	2026-06-14 02:58:24	2026-06-14 02:58:24
019ec410-ecc6-736e-aacd-f463bcebd46a	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jom kita mula dari awal balik	Let's make a fresh start.	\N	1	20	2026-06-14 02:58:24	2026-06-14 02:58:24
019ec420-dfd8-70f6-aa87-45a0a560ff65	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jom kita pertimbangkan baik buruk pilihan yang ada.	Let's weigh the options.	\N	1	2	2026-06-14 03:15:49	2026-06-14 03:15:49
019ec3d4-3e64-7352-b37b-d0ce5254cb2b	019ec37b-764b-708b-89d1-7b9abe965897	Benda ni nampak janggal	It['s out of place/ is out of place].	\N	1	3	2026-06-14 01:52:07	2026-06-19 02:51:19
019ec3d4-3e66-71c5-bc9e-d23c26aaab17	019ec37b-764b-708b-89d1-7b9abe965897	Jangan cepat hilang sabar	[Don't lose your temper/Do not lose your temper].	\N	1	4	2026-06-14 01:52:07	2026-06-19 02:51:32
019ec3d4-3e67-704a-9ddf-4207f913175b	019ec37b-764b-708b-89d1-7b9abe965897	Saya akan ikut nasihat awak.	I['ll take your advice/ will take your advice].	\N	1	5	2026-06-14 01:52:07	2026-06-19 02:51:46
019ec3e9-049e-7322-b635-78ea5eaf87f4	019ec37b-764b-708b-89d1-7b9abe965897	Semuanya dalam keadaan baik dan selamat.	It['s safe and sound/ is safe and sound].	\N	1	7	2026-06-14 02:14:48	2026-06-19 02:52:00
019ec3e9-049f-7278-b4eb-5d328f14ea78	019ec37b-764b-708b-89d1-7b9abe965897	Jangan heret saya dalam hal ni	[Don't drag me into this/Do not drag me into this].	\N	1	8	2026-06-14 02:14:48	2026-06-19 02:52:22
019ec3e9-04a0-7257-8e28-9dd6c088617e	019ec37b-764b-708b-89d1-7b9abe965897	Saya saja tengah buang masa	I['m just killing time/ am just killing time].	\N	1	9	2026-06-14 02:14:48	2026-06-19 02:52:44
019ec3f1-aa42-73e2-8f17-81d7870e4b62	019ec37b-764b-708b-89d1-7b9abe965897	Satu tugasan yang agak berat untuk dibuat.	It['s an uphill task/ is an uphill task].	\N	1	11	2026-06-14 02:24:15	2026-06-19 02:53:20
019ec3f1-aa44-73d7-a172-34bc393f4026	019ec37b-764b-708b-89d1-7b9abe965897	Jangan buat kerja di luar kemampuan	[Don't bite off more than you can chew/Do not bite off more than you can chew].	\N	1	12	2026-06-14 02:24:15	2026-06-19 02:54:25
019ec3f1-aa45-71e1-98d4-6ebea12478f7	019ec37b-764b-708b-89d1-7b9abe965897	Saya on je	I['m up for it/ am up for it].	\N	1	13	2026-06-14 02:24:15	2026-06-19 02:54:53
019ec3f1-aa47-7116-9fa9-4e7c4b4994f3	019ec37b-764b-708b-89d1-7b9abe965897	Tak payah fikir panjang pun	It['s a no-brainer/ is a no-brainer].	\N	1	15	2026-06-14 02:24:15	2026-06-19 02:55:07
019ec3f8-62b9-7097-8d68-7d5be966024f	019ec37b-764b-708b-89d1-7b9abe965897	Jangan memandai reka cerita kata aku cakap macam tu.	[Don't put words in my mouth/Do not put words in my mouth].	\N	1	16	2026-06-14 02:31:35	2026-06-19 02:55:21
019ec3f8-62bb-7191-a70a-a61e1c9488ad	019ec37b-764b-708b-89d1-7b9abe965897	Okey, kita ambil jalan tengah (sama-sama mengalah).	I['ll meet you halfway/ will meet you halfway].	\N	1	17	2026-06-14 02:31:35	2026-06-19 02:55:35
019ec3f8-62be-702b-ac93-b0fc56cdaeae	019ec37b-764b-708b-89d1-7b9abe965897	Benda tu ada terfikir juga	It['s at the back of my mind/ is at the back of my mind].	\N	1	19	2026-06-14 02:31:35	2026-06-19 02:55:51
019ec3fc-af88-7158-a1ab-744e184a29ab	019ec37b-b37f-728b-a194-a6cb03aba0bf	Apa langkah kita yang seterusnya?	What['s the next step/ is the next step]?	\N	1	1	2026-06-14 02:36:17	2026-06-19 02:57:23
019ec3fc-af8b-70cd-83ae-ba6e1df07b62	019ec37b-b37f-728b-a194-a6cb03aba0bf	Benda tu di luar kawalan saya dah sekarang.	It['s out of my hands now/ is out of my hands now].	\N	1	3	2026-06-14 02:36:17	2026-06-19 02:57:59
019ec3fc-af8d-7300-aa1f-b07e7d2a254c	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jangan asyik nak tuding jari (salahkan orang lain)	[Don't point fingers/Do not point fingers].	\N	1	4	2026-06-14 02:36:17	2026-06-19 02:58:21
019ec3fc-af8e-7103-b1ad-f06d554d05bf	019ec37b-b37f-728b-a194-a6cb03aba0bf	Saya bercakap berdasarkan pengalaman saya sendiri.	I['m speaking from experience/ am speaking from experience].	\N	1	5	2026-06-14 02:36:17	2026-06-19 02:58:45
019ec3ff-33b2-737a-b221-bfc4a439842e	019ec37b-b37f-728b-a194-a6cb03aba0bf	Saja nak tukar angin.	It['s a change of pace/ is a change of pace].	\N	1	7	2026-06-14 02:39:02	2026-06-19 02:58:58
019ec3ff-33b3-7396-afad-c6f5bced0626	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jangan bagi benda tu ganggu fikiran awak.	[Don't let it get to you/Do not let it get to you].	\N	1	8	2026-06-14 02:39:02	2026-06-19 02:59:22
019ec3ff-33b4-722c-b839-a17cfefe1194	019ec37b-b37f-728b-a194-a6cb03aba0bf	Saya terbuka kepada apa-apa cadangan.	I['m open to suggestions/ am open to suggestions].	\N	1	9	2026-06-14 02:39:02	2026-06-19 02:59:57
019ec406-8234-707f-8e9d-b6244a98ba0d	019ec37b-b37f-728b-a194-a6cb03aba0bf	Benda ni percuma	It['s on the house/ is on the house].	\N	1	11	2026-06-14 02:47:01	2026-06-19 03:00:19
019ec406-8236-7030-b0e6-775bc06827f1	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jangan paksa diri awak keterlaluan sangat.	[Don't push yourself too hard/Do not push yourself too hard].	\N	1	12	2026-06-14 02:47:01	2026-06-19 03:00:33
019ec406-8237-7319-9b9c-faa149f26b7b	019ec37b-b37f-728b-a194-a6cb03aba0bf	Nanti saya maklumkan semula pada awak pasal hal tu.	I['ll get back to you on that/ will get back to you on that].	\N	1	13	2026-06-14 02:47:01	2026-06-19 03:00:45
019ec406-823a-71c9-8e72-b372e4b0f358	019ec37b-b37f-728b-a194-a6cb03aba0bf	Ada hikmah tersembunyi di sebalik kejadian ni.	It['s a blessing in disguise/ is a blessing in disguise].	\N	1	15	2026-06-14 02:47:01	2026-06-19 03:01:08
019ec410-ecc1-73f6-ab46-077b0b11c60b	019ec37b-b37f-728b-a194-a6cb03aba0bf	Jangan hilang fokus	[Don't lose your focus/Do not lose your focus].	\N	1	16	2026-06-14 02:58:24	2026-06-19 03:01:33
019ec410-ecc3-7249-8b8f-708ad7a97a4a	019ec37b-b37f-728b-a194-a6cb03aba0bf	Saya sangat setuju dengan cadangan tu.	I['m all for it/ am all for it].	\N	1	17	2026-06-14 02:58:24	2026-06-19 03:01:50
019ec410-ecc5-7327-8542-a7ed600d5c4c	019ec37b-b37f-728b-a194-a6cb03aba0bf	Itu cuma salah faham kecil sahaja.	It['s just a misunderstanding/ is just a misunderstanding].	\N	1	19	2026-06-14 02:58:24	2026-06-19 03:02:06
019ec420-dfd6-7211-8f66-ae2674779ada	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Apa pelan sandaran kita?	What['s the backup plan/ is the backup plan]?	\N	1	1	2026-06-14 03:15:49	2026-06-19 03:04:44
019ec420-dfd9-70de-b682-4c15c50c5462	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Sediakan payung sebelum hujan.	It['s better to be safe than sorry/ is better to be safe than sorry].	\N	1	3	2026-06-14 03:15:49	2026-06-19 03:05:06
019ec420-dfda-7086-bb63-c7a21b2d6c38	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jangan berserah pada nasib semata-mata.	[Don't leave things to chance/Do not leave things to chance].	\N	1	4	2026-06-14 03:15:49	2026-06-19 03:05:26
019ec420-dfdd-702c-a0c4-05473cb7f191	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jom kita kemas meja ni.	Let's clear the table.	\N	1	6	2026-06-14 03:15:49	2026-06-14 03:15:49
019ec424-15e3-7105-9d37-09c08f66a290	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jom kita mula serius fokus pada kerja	Let's get down to business.	\N	1	14	2026-06-14 03:19:19	2026-06-14 03:19:19
019ec427-16c8-701e-acbc-ab54d674974c	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Biar kita tinggalkan hal tu setakat ni sahaja.	Let's leave it at that.	\N	1	18	2026-06-14 03:22:36	2026-06-14 03:22:36
019ec4a8-4305-7215-9f04-e4d2c38132d5	019ec37b-fe05-71b2-97e5-9878f88a413f	Jom kita cari pengalaman baru	Let's broaden our horizons.	\N	1	2	2026-06-14 05:43:42	2026-06-14 05:43:42
019ec4ae-2334-7310-a7d9-2259628ec7e4	019ec37b-fe05-71b2-97e5-9878f88a413f	Jom kita kekalkan sikap profesional	Let's keep things professional.	\N	1	6	2026-06-14 05:50:07	2026-06-14 05:50:07
019ec4ae-233a-70a3-bf3e-d884db2c09c3	019ec37b-fe05-71b2-97e5-9878f88a413f	Jom kita fikir dan bincang sama-sama.	Let's put our heads together.	\N	1	10	2026-06-14 05:50:07	2026-06-14 05:50:07
019ec4b0-cfad-700c-a6a4-382a1c6d1892	019ec37b-fe05-71b2-97e5-9878f88a413f	Jom kita mudahkan jalan yang ada.	Let's clear the path.	\N	1	14	2026-06-14 05:53:02	2026-06-14 05:53:02
019ec4b8-8192-71c3-989e-d708c3019f7f	019ec37b-fe05-71b2-97e5-9878f88a413f	Jom kita semak dan periksa semula bukti yang ada.	Let's re-examine the evidence.	\N	1	18	2026-06-14 06:01:26	2026-06-14 06:01:26
019ec4b8-8195-7237-b21c-d04a558b5684	019ec37b-fe05-71b2-97e5-9878f88a413f	Jom kita tinggalkan kesan yang mendalam.	Let's make a lasting impression.	\N	1	20	2026-06-14 06:01:26	2026-06-14 06:01:26
019ec4bc-d59b-7131-a3da-61fa929c8027	019ec37c-14b4-704a-974b-da1ab82de485	Jom kita selesaikan benda ni dari awal sebelum melarat.	Let's nip it in the bud.	\N	1	2	2026-06-14 06:06:10	2026-06-14 06:06:10
019ec4c5-a7f9-7134-bc49-d34400defa31	019ec37c-14b4-704a-974b-da1ab82de485	Jom kita simpan segala bukti rekod bertulis	Let's keep a paper trail.	\N	1	6	2026-06-14 06:15:48	2026-06-14 06:15:48
019ec4c5-a7fe-70ce-b8d2-140ff4f48bd2	019ec37c-14b4-704a-974b-da1ab82de485	Jom kita cari titik kesepakatan.	Let's find some common ground.	\N	1	10	2026-06-14 06:15:48	2026-06-14 06:15:48
019ec4ce-4199-73e0-9f40-cc314a9fbb6c	019ec37c-14b4-704a-974b-da1ab82de485	Jom kita teruskan momentum (semangat) ni	Let's keep the ball rolling.	\N	1	14	2026-06-14 06:25:12	2026-06-14 06:25:12
019ec420-dfdf-7183-ae71-6a22cc0790a2	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Benda ni betul-betul buat aku tersedar	It['s an eye-opener/ is an eye-opener].	\N	1	7	2026-06-14 03:15:49	2026-06-19 03:05:57
019ec420-dfe0-721e-89be-6c079be484e6	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jangan cabar kesabaran saya.	[Don't test my patience/Do not test my patience].	\N	1	8	2026-06-14 03:15:49	2026-06-19 03:06:09
019ec420-dfe1-72c6-a1ee-5e45a6201e95	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Saya sedia mengikut apa sahaja kemahuan awak.	I['m at your disposal/ am at your disposal].	\N	1	9	2026-06-14 03:15:49	2026-06-19 03:06:23
019ec420-dfe2-7187-87c3-7cca23b14e20	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Kita kena puji jugak lah	Let's give credit where it['s due/ is due].	\N	1	10	2026-06-14 03:15:49	2026-06-19 03:06:51
019ec424-15e1-73dd-a587-cdeab78818d6	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jangan melampaui batas.	[Don't cross the line/Do not cross the line].	\N	1	12	2026-06-14 03:19:19	2026-06-19 03:07:50
019ec424-15e2-71e3-a0b8-3d5890618454	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Saya akan ingat perkara tu baik-baik dalam fikiran.	I['ll keep that in mind/ will keep that in mind].	\N	1	13	2026-06-14 03:19:19	2026-06-19 03:08:04
019ec424-15e5-73e1-8832-786a081d269c	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Ini melibatkan soal prinsip diri.	It['s a matter of principle/ is a matter of principle].	\N	1	15	2026-06-14 03:19:19	2026-06-19 03:08:18
019ec427-16c5-72b4-9527-d845fab75ee2	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Jangan mungkir janji awak.	[Don't break your promise/Do not break your promise].	\N	1	16	2026-06-14 03:22:36	2026-06-19 03:08:34
019ec427-16c9-7130-ade8-d5c2a9a9768a	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Benda tu dah mampu awak capai.	It['s within your reach/ is within your reach].	\N	1	19	2026-06-14 03:22:36	2026-06-19 03:09:11
019ec427-16cb-714e-a34c-7be94f21ce36	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Kita dah berjaya cecah lima ratus ayat sepenuhnya!	We['ve officially hit five hundred/ have officially hit five hundred]!	\N	1	20	2026-06-14 03:22:36	2026-06-19 03:12:05
019ec4a8-4303-7023-8389-ec0232362ba5	019ec37b-fe05-71b2-97e5-9878f88a413f	Apa pandangan awak tentang hal ni?	What['s your take on this/ is your take on this]?	\N	1	1	2026-06-14 05:43:42	2026-06-19 03:14:16
019ec4a8-4306-70f1-96cd-a4a56cfdec15	019ec37b-fe05-71b2-97e5-9878f88a413f	Rasa macam nak luruh jantung	It['s a gut-wrenching feeling/ is a gut-wrenching feeling].	\N	1	3	2026-06-14 05:43:42	2026-06-19 03:14:39
019ec4a8-4308-7327-ac2d-eabd2c1da092	019ec37b-fe05-71b2-97e5-9878f88a413f	Jangan bagi diorang goyangkan (takut-takutkan) kau.	[Don't let them intimidate you/Do not let them intimidate you].	\N	1	4	2026-06-14 05:43:42	2026-06-19 03:15:04
019ec4ae-2336-70e9-a196-d452fb563371	019ec37b-fe05-71b2-97e5-9878f88a413f	Benda tu semua orang dah tahu sendiri (peraturan sedia maklum)	It['s an unwritten rule/ is an unwritten rule].	\N	1	7	2026-06-14 05:50:07	2026-06-19 03:15:31
019ec4ae-2337-7017-97ea-58f4805f472c	019ec37b-fe05-71b2-97e5-9878f88a413f	Jangan sesekali pandang rendah pada pihak lawan.	[Don't underestimate your opponent/Do not underestimate your opponent].	\N	1	8	2026-06-14 05:50:07	2026-06-19 03:16:10
019ec4ae-2339-7360-b433-8a7ed494aacb	019ec37b-fe05-71b2-97e5-9878f88a413f	Saya agak kesuntukan masa sikit hari ni.	I['m short on time today/ am short on time today].	\N	1	9	2026-06-14 05:50:07	2026-06-19 03:16:34
019ec4b0-cfa9-7166-9404-dd787f05e966	019ec37b-fe05-71b2-97e5-9878f88a413f	Ini satu peluang yang sangat jarang-jarang berlaku.	It['s a rare opportunity/ is a rare opportunity].	\N	1	11	2026-06-14 05:53:02	2026-06-19 03:17:00
019ec4b0-cfac-71f0-a5cc-bd9e98b8d23a	019ec37b-fe05-71b2-97e5-9878f88a413f	Saya sedar sepenuhnya tentang risiko yang ada.	I['m fully aware of the risk/ am fully aware of the risk].	\N	1	13	2026-06-14 05:53:02	2026-06-19 03:18:12
019ec4b0-cfae-7201-8b81-d1caf45693fe	019ec37b-fe05-71b2-97e5-9878f88a413f	Satu kenyataan pahit yang amat sukar untuk diterima.	It['s a hard pill to swallow/ is a hard pill to swallow].	\N	1	15	2026-06-14 05:53:02	2026-06-19 03:18:40
019ec4b8-818f-739c-b399-9fc44a7e1c5b	019ec37b-fe05-71b2-97e5-9878f88a413f	Jangan kurung diri awak dalam bilik.	[Don't lock yourself in the room/Do not lock yourself in the room].	\N	1	16	2026-06-14 06:01:26	2026-06-19 03:19:01
019ec4b8-8191-7241-b5c0-f79effdc901b	019ec37b-fe05-71b2-97e5-9878f88a413f	Saya memang sangat layak untuk tugasan ni.	I['m tailored for this job/ am tailored for this job].	\N	1	17	2026-06-14 06:01:26	2026-06-19 03:19:26
019ec4b8-8194-72ee-b6c8-aeebd98fd43b	019ec37b-fe05-71b2-97e5-9878f88a413f	Benda ni kena buat ikut turutan	It['s a step-by-step process/ is a step-by-step process].	\N	1	19	2026-06-14 06:01:26	2026-06-19 03:20:08
019ec4bc-d599-715a-b5dd-b144681840f8	019ec37c-14b4-704a-974b-da1ab82de485	Apa punca utama masalah ni?	What['s the root cause/ is the root cause]?	\N	1	1	2026-06-14 06:06:10	2026-06-19 03:56:50
019ec4bc-d59c-7346-8d06-18dedff57d19	019ec37c-14b4-704a-974b-da1ab82de485	Ini satu pencapaian yang sangat besar.	It['s a major breakthrough/ is a major breakthrough].	\N	1	3	2026-06-14 06:06:10	2026-06-19 03:57:06
019ec4bc-d59d-72bf-a902-a25eafc4fc0e	019ec37c-14b4-704a-974b-da1ab82de485	Jangan biarkan saya tertunggu-tunggu tanpa jawapan.	[Don't leave me hanging/Do not leave me hanging].	\N	1	4	2026-06-14 06:06:10	2026-06-19 03:57:23
019ec4bc-d59e-72ea-8096-96e2678f25d1	019ec37c-14b4-704a-974b-da1ab82de485	Saya sentiasa sedia berkhidmat	I['m at your beck and call/ am at your beck and call].	\N	1	5	2026-06-14 06:06:10	2026-06-19 03:57:41
019ec4c5-a7fc-70cc-ba30-97c68a2d1729	019ec37c-14b4-704a-974b-da1ab82de485	Jangan paksa aku jawab (depan orang).	[Don't put me on the spot/Do not put me on the spot].	\N	1	8	2026-06-14 06:15:48	2026-06-19 03:58:25
019ec4c5-a7fd-73f5-8f6c-8fa8515c8eb6	019ec37c-14b4-704a-974b-da1ab82de485	Saya menarik diri daripada perjanjian ni.	I['m pulling out of this deal/ am pulling out of this deal].	\N	1	9	2026-06-14 06:15:48	2026-06-19 03:58:38
019ec4ce-4195-7368-b4ff-f466518b6154	019ec37c-14b4-704a-974b-da1ab82de485	Perkara ni memang dah pasti sahih	It['s an absolute certainty/ is an absolute certainty].	\N	1	11	2026-06-14 06:25:12	2026-06-19 03:58:52
019ec4ce-4197-708c-8b71-98740079f088	019ec37c-14b4-704a-974b-da1ab82de485	Jangan paksa saya buat tindakan yang saya tak suka.	[Don't force my hand/Do not force my hand].	\N	1	12	2026-06-14 06:25:12	2026-06-19 03:59:05
019ec4ce-4198-73aa-b22f-f8bc8a30e654	019ec37c-14b4-704a-974b-da1ab82de485	Saya dah pusing kepala dah ni.	I['m losing my mind/ am losing my mind].	\N	1	13	2026-06-14 06:25:12	2026-06-19 03:59:17
019ec4d2-638f-72ad-a386-f94b96405f30	019ec37c-14b4-704a-974b-da1ab82de485	Kalau aku jadi kau...	If I were in your shoes	\N	1	17	2026-06-14 06:29:42	2026-06-14 06:29:42
019ec4d2-6390-7258-9204-cb3828743818	019ec37c-14b4-704a-974b-da1ab82de485	Jom kita kosongkan jadual kita.	Let's clear our schedule.	\N	1	18	2026-06-14 06:29:42	2026-06-14 06:29:42
019ec4d2-6393-7298-967a-983eb1edf244	019ec37c-14b4-704a-974b-da1ab82de485	Jom kita ikut peraturan yang ditetapkan.	Let's play by the rules.	\N	1	20	2026-06-14 06:29:42	2026-06-14 06:29:42
019ec4da-d11d-7300-ba4c-1bc7fdad3927	019ec37c-2acf-705a-8b65-f244c62ec79a	Jom kita luaskan lagi skop carian kita.	Let's broaden our search.	\N	1	2	2026-06-14 06:38:55	2026-06-14 06:38:55
019ec4ea-bd71-70cd-8195-033614fa02c3	019ec37c-2acf-705a-8b65-f244c62ec79a	Jom kita tapis pilihan yang ada	Let's narrow down the choices.	\N	1	6	2026-06-14 06:56:18	2026-06-14 06:56:18
019ec4ea-bd77-7151-8714-35bfb6412a1b	019ec37c-2acf-705a-8b65-f244c62ec79a	Jom kita beri saingan sengit pada mereka.	Let's give them a run for their money.	\N	1	10	2026-06-14 06:56:18	2026-06-14 06:56:18
019ec4ee-ad60-7051-8b3f-7e86bd4594b5	019ec37c-2acf-705a-8b65-f244c62ec79a	Jom kita tetapkan beberapa peraturan asas dari awal.	Let's set some ground rules.	\N	1	14	2026-06-14 07:00:36	2026-06-14 07:00:36
019ec4f4-7687-7046-84f7-888b60f5cc4b	019ec37c-2acf-705a-8b65-f244c62ec79a	Jom kita sambung semula dari tempat kita berhenti hari tu.	Let's pick up where we left off.	\N	1	18	2026-06-14 07:06:56	2026-06-14 07:06:56
019ec4f4-768a-731c-944c-f7afd299ae33	019ec37c-2acf-705a-8b65-f244c62ec79a	Jom kita tengok dari sudut positifnya.	Let's look on the bright side.	\N	1	20	2026-06-14 07:06:56	2026-06-14 07:06:56
019ec4fe-a136-73f8-a4fe-67c2427f1092	019ec37c-3d7b-72d6-b323-5e5668487e26	Jom kita pergi cari alas perut kejap	Let's grab a quick bite.	\N	1	2	2026-06-14 07:18:02	2026-06-14 07:18:02
019ec501-ccc5-70c6-aadd-11ab027e308c	019ec37c-3d7b-72d6-b323-5e5668487e26	Jom kita bahagikan tugas ni sama rata.	Let's split the work evenly.	\N	1	6	2026-06-14 07:21:30	2026-06-14 07:21:30
019ec501-cccb-7188-8e25-c52415abdcf7	019ec37c-3d7b-72d6-b323-5e5668487e26	Nanti apa-apa hal, kita contact lagi	Let's keep in touch.	\N	1	10	2026-06-14 07:21:30	2026-06-14 07:21:30
019ec508-0c52-7101-af8c-76b3dd06f08c	019ec37c-3d7b-72d6-b323-5e5668487e26	Jom kita berehat kejap.	Let's take a short break.	\N	1	14	2026-06-14 07:28:19	2026-06-14 07:28:19
019ec50c-4a8e-71a8-a620-f13ce1702f12	019ec37c-3d7b-72d6-b323-5e5668487e26	Jom kita tunggu sampai hujan berhenti dulu.	Let's wait for the rain to stop.	\N	1	18	2026-06-14 07:32:57	2026-06-14 07:32:57
019ec50c-4a91-72fb-9b77-f80588ed7ae6	019ec37c-3d7b-72d6-b323-5e5668487e26	Jom kita gerak balik	Let's head back home.	\N	1	20	2026-06-14 07:32:57	2026-06-14 07:32:57
019ec510-51b4-7147-8b69-6faff86300a6	019ec37c-51a2-7373-981b-a96898747a9c	Jom kita duduk dalam rumah je hari ni.	Let's stay indoors today.	\N	1	2	2026-06-14 07:37:21	2026-06-14 07:37:21
019ec4d2-638d-73c7-80ca-72432b265131	019ec37c-14b4-704a-974b-da1ab82de485	Jangan ungkit-ungkit lagi kisah lama.	[Don't dig up the past/Do not dig up the past].	\N	1	16	2026-06-14 06:29:42	2026-06-19 03:59:57
019ec4d2-6392-729c-ad8f-7710fa62b9b6	019ec37c-14b4-704a-974b-da1ab82de485	Benda tu macam bom jangka (menunggu masa nak jadi masalah besar).	It['s a ticking time bomb/ is a ticking time bomb].	\N	1	19	2026-06-14 06:29:42	2026-06-19 04:00:24
019ec4da-d11b-70d2-8fee-e6e7965fcc61	019ec37c-2acf-705a-8b65-f244c62ec79a	Apa kesimpulan penting yang kita dapat?	What['s the key takeaway/ is the key takeaway]?	\N	1	1	2026-06-14 06:38:55	2026-06-19 04:03:57
019ec4da-d120-70e4-ae69-262584473042	019ec37c-2acf-705a-8b65-f244c62ec79a	Jangan rumitkan sangat proses kerja tu.	[Don't overcomplicate the process/Do not overcomplicate the process].	\N	1	4	2026-06-14 06:38:55	2026-06-19 04:04:28
019ec4da-d121-7068-a152-f5e6c3162d2d	019ec37c-2acf-705a-8b65-f244c62ec79a	Saya masih buka peluang untuk mana-mana pilihan lain.	I['m keeping my options open/ am keeping my options open].	\N	1	5	2026-06-14 06:38:55	2026-06-19 04:04:43
019ec4ea-bd73-7397-993b-4e966116f71e	019ec37c-2acf-705a-8b65-f244c62ec79a	Satu pemandangan yang menyejukkan mata memandang.	It['s a sight for sore eyes/ is a sight for sore eyes].	\N	1	7	2026-06-14 06:56:18	2026-06-19 04:05:01
019ec4ea-bd76-718b-ba50-1d971c314661	019ec37c-2acf-705a-8b65-f244c62ec79a	Aku saja nak bagi korang fikir sudut sebaliknya...	I['m playing devil's advocate/ am playing devil's advocate].	\N	1	9	2026-06-14 06:56:18	2026-06-19 04:05:59
019ec4ee-ad5b-71f6-8c87-0bd79447660d	019ec37c-2acf-705a-8b65-f244c62ec79a	Benda tu sikit sangat kalau nak dibandingkan dengan jumlah keseluruhan.	It['s a drop in the ocean/ is a drop in the ocean].	\N	1	11	2026-06-14 07:00:36	2026-06-19 04:06:13
019ec4ee-ad5d-7256-a4d4-27b84c8a0265	019ec37c-2acf-705a-8b65-f244c62ec79a	Jangan letak harapan terlalu tinggi sangat pada benda tu.	[Don't put all your hopes on it/Do not put all your hopes on it].	\N	1	12	2026-06-14 07:00:36	2026-06-19 04:06:28
019ec4ee-ad5f-7042-88dd-1df11dfc99a6	019ec37c-2acf-705a-8b65-f244c62ec79a	Saya tengah cuba cabar had kemampuan diri saya ni.	I['m stretching my limits/ am stretching my limits].	\N	1	13	2026-06-14 07:00:36	2026-06-19 04:06:42
019ec4ee-ad61-71ee-b412-25c329030e36	019ec37c-2acf-705a-8b65-f244c62ec79a	Ini satu ujian untuk melihat sejauh mana kekuatan diri seseorang.	It['s a test of character/ is a test of character].	\N	1	15	2026-06-14 07:00:36	2026-06-19 04:06:56
019ec4f4-7684-72d8-a78c-114222280dc9	019ec37c-2acf-705a-8b65-f244c62ec79a	Kekalkan sikap tenang awak.	[Don't lose your composure/Do not lose your composure].	\N	1	16	2026-06-14 07:06:56	2026-06-19 04:07:12
019ec4f4-7686-72eb-874b-aa698fd8ecda	019ec37c-2acf-705a-8b65-f244c62ec79a	Saya bagi lampu hijau pada awak.	I['m giving you the green light/ am giving you the green light].	\N	1	17	2026-06-14 07:06:56	2026-06-19 04:07:29
019ec4fe-a134-71f5-b37e-5ee617f91a2e	019ec37c-3d7b-72d6-b323-5e5668487e26	Bunyi bising apa tu?	What['s that noise/ is that noise]?	\N	1	1	2026-06-14 07:18:02	2026-06-19 04:10:31
019ec4fe-a137-7246-8b1a-14cc22e82e80	019ec37c-3d7b-72d6-b323-5e5668487e26	Benda kecil je ni	It['s just a small matter/ is just a small matter].	\N	1	3	2026-06-14 07:18:02	2026-06-19 04:10:46
019ec4fe-a139-720e-9a0a-79b5c6a369d9	019ec37c-3d7b-72d6-b323-5e5668487e26	Jangan besar-besarkan cerita	[Don't make a big deal out of it/Do not make a big deal out of it].	\N	1	4	2026-06-14 07:18:02	2026-06-19 04:11:06
019ec4fe-a13a-701b-ab68-6c088e2729d9	019ec37c-3d7b-72d6-b323-5e5668487e26	Saya dah ubah keputusan (fikiran) pasal hal ni.	I['m having a change of heart/ am having a change of heart].	\N	1	5	2026-06-14 07:18:02	2026-06-19 04:11:23
019ec501-ccc7-72d1-88cb-5ce81ae79616	019ec37c-3d7b-72d6-b323-5e5668487e26	Padanan yang sangat sesuai	It['s a perfect match/ is a perfect match].	\N	1	7	2026-06-14 07:21:30	2026-06-19 04:11:36
019ec501-ccc9-7087-be96-46c5222e308d	019ec37c-3d7b-72d6-b323-5e5668487e26	Jangan biarkan pintu tu terbuka.	[Don't leave the door open/Do not leave the door open].	\N	1	8	2026-06-14 07:21:30	2026-06-19 04:11:49
019ec508-0c4d-7274-9a04-e12d04dc1256	019ec37c-3d7b-72d6-b323-5e5668487e26	Benda tu dah dekat sangat dah	It['s just around the corner/ is just around the corner].	\N	1	11	2026-06-14 07:28:19	2026-06-19 04:14:16
019ec508-0c4f-7072-bf48-cb435c71356f	019ec37c-3d7b-72d6-b323-5e5668487e26	Jangan bagi hilang kunci awak.	[Don't lose your keys/Do not lose your keys].	\N	1	12	2026-06-14 07:28:19	2026-06-19 04:14:30
019ec508-0c51-7332-9821-c720aee7a213	019ec37c-3d7b-72d6-b323-5e5668487e26	Bajet saya agak ketat bulan ni.	I['m a bit tight on budget/ am a bit tight on budget].	\N	1	13	2026-06-14 07:28:19	2026-06-19 04:14:46
019ec508-0c53-7044-985b-21e1c5a281fd	019ec37c-3d7b-72d6-b323-5e5668487e26	Benda ni lagi bagus daripada apa yang saya jangka	It['s better than I expected/ is better than I expected].	\N	1	15	2026-06-14 07:28:19	2026-06-19 04:14:58
019ec50c-4a8d-7172-b3d5-845169c43ef1	019ec37c-3d7b-72d6-b323-5e5668487e26	Saya buat benda ni demi kebaikan diri awak sendiri.	I['m doing this for your own good/ am doing this for your own good].	\N	1	17	2026-06-14 07:32:57	2026-06-19 04:15:33
019ec50c-4a90-7267-ac4b-6234851d497d	019ec37c-3d7b-72d6-b323-5e5668487e26	Benda tu berbaloi untuk dicuba.	It['s worth a try/ is worth a try].	\N	1	19	2026-06-14 07:32:57	2026-06-19 04:15:50
019ec510-51b2-7084-867e-cec67c0b8f7a	019ec37c-51a2-7373-981b-a96898747a9c	Apa rancangan awak malam ni?	What['s your plan for tonight/ is your plan for tonight]?	\N	1	1	2026-06-14 07:37:21	2026-06-19 04:17:28
019ec510-51b5-7034-9365-ded85c5ea376	019ec37c-51a2-7373-981b-a96898747a9c	Kat luar sana berangin betul.	It['s very windy outside/ is very windy outside].	\N	1	3	2026-06-14 07:37:21	2026-06-19 04:17:41
019ec510-51b7-72a2-90b2-1c2e943f0cf7	019ec37c-51a2-7373-981b-a96898747a9c	Jangan lupa kunci pagar	[Don't forget to lock the gate/Do not forget to lock the gate].	\N	1	4	2026-06-14 07:37:21	2026-06-19 04:17:57
019ec512-7473-7093-8a99-e00e5567042c	019ec37c-51a2-7373-981b-a96898747a9c	Jom kita pesan makanan.	Let's order some food.	\N	1	6	2026-06-14 07:39:41	2026-06-14 07:39:41
019ec512-7479-721e-82f8-63844da4d829	019ec37c-51a2-7373-981b-a96898747a9c	Jom kita jaga kebersihan tempat ni.	Let's keep the place clean.	\N	1	10	2026-06-14 07:39:41	2026-06-14 07:39:41
019ec515-e897-7238-83e2-17bbb61a3cc5	019ec37c-51a2-7373-981b-a96898747a9c	Jom kita semak ramalan cuaca dulu.	Let's check the weather forecast.	\N	1	14	2026-06-14 07:43:27	2026-06-14 07:43:27
019ec518-6e8c-73d6-a50b-ecd1396cbfe2	019ec37c-51a2-7373-981b-a96898747a9c	Jom kita ambil gambar ramai-ramai.	Let's take a group photo.	\N	1	18	2026-06-14 07:46:13	2026-06-14 07:46:13
019ec616-046e-718f-b90d-84d40895b3e5	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jom kita buat senarai barang yang nak beli.	Let's make a shopping list.	\N	1	2	2026-06-14 12:23:12	2026-06-14 12:23:12
019ec618-91f0-7183-bc88-dd36d4e19630	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jom kita tong-tong (kongsi) duit minyak.	Let's share the petrol money.	\N	1	6	2026-06-14 12:25:59	2026-06-14 12:25:59
019ec618-91f6-73c7-9ab2-cb382b02a011	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jom kita letak balik benda ni kat tempat asal.	Let's put this back.	\N	1	10	2026-06-14 12:25:59	2026-06-14 12:25:59
019ec619-df88-7146-82a6-d015229d889f	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jom kita cuba ikut jalan lain.	Let's try a different road.	\N	1	14	2026-06-14 12:27:24	2026-06-14 12:27:24
019ec61c-fa01-7276-83ee-367b8653c9fe	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jom kita jumpa dekat pintu masuk utama.	Let's meet at the main entrance.	\N	1	18	2026-06-14 12:30:48	2026-06-14 12:30:48
019ec61c-fa04-71b4-9c6b-c7f95f43bfca	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jom kita santai-santai hari ni.	Let's take it easy today.	\N	1	20	2026-06-14 12:30:48	2026-06-14 12:30:48
019ec621-f288-71db-811a-03d5f117744d	019ec42c-5a3b-7157-a167-92e44b712f0a	Jom kita tutup kipas tu.	Let's turn off the fan.	\N	1	2	2026-06-14 12:36:14	2026-06-14 12:36:14
019ec62e-06d0-70b7-b44a-38e865b6ce3b	019ec42c-5a3b-7157-a167-92e44b712f0a	Jom kita cari tempat letak kereta	Let's look for a parking spot.	\N	1	6	2026-06-14 12:49:25	2026-06-14 12:49:25
019ec62e-06d6-72de-9815-8a50572723a2	019ec42c-5a3b-7157-a167-92e44b712f0a	Jom kita set alarm (jam loceng)	Let's set an alarm.	\N	1	10	2026-06-14 12:49:25	2026-06-14 12:49:25
019ec62f-6e62-7002-9383-d8f22a099cb9	019ec42c-5a3b-7157-a167-92e44b712f0a	Jom kita ikut jalan pintas	Let's take a shortcut.	\N	1	14	2026-06-14 12:50:57	2026-06-14 12:50:57
019ec631-892a-714e-b9b8-7326edf9beec	019ec42c-5a3b-7157-a167-92e44b712f0a	Jom kita jumpa selepas makan tengah hari.	Let's meet after lunch.	\N	1	18	2026-06-14 12:53:15	2026-06-14 12:53:15
019ec512-7477-73c3-9952-71564109cf79	019ec37c-51a2-7373-981b-a96898747a9c	Jangan sentuh benda tu, panas.	[Don't touch that, it's hot/Do not touch that, it is hot].	\N	1	8	2026-06-14 07:39:41	2026-06-19 04:18:50
019ec512-7478-7115-aaa9-d769b4aa481c	019ec37c-51a2-7373-981b-a96898747a9c	Saya dah biasa dengan cuaca macam ni.	I['m used to this kind of weather/ am used to this kind of weather].	\N	1	9	2026-06-14 07:39:41	2026-06-19 04:19:11
019ec515-e892-7172-b076-3b5b1db52516	019ec37c-51a2-7373-981b-a96898747a9c	Saya rasa itu cuma salah faham je.	It['s a misunderstanding, I think/ is a misunderstanding, I think].	\N	1	11	2026-06-14 07:43:27	2026-06-19 04:19:42
019ec515-e894-7300-bf9b-907be161fc6a	019ec37c-51a2-7373-981b-a96898747a9c	Jangan biarkan lampu terpasang	[Don't leave the lights on/Do not leave the lights on].	\N	1	12	2026-06-14 07:43:27	2026-06-19 04:19:55
019ec515-e898-70e7-8fc1-921b74b8e952	019ec37c-51a2-7373-981b-a96898747a9c	Sekarang ni tengah hujan lebat	It['s heavy rain right now/ is heavy rain right now].	\N	1	15	2026-06-14 07:43:27	2026-06-19 04:20:31
019ec518-6e89-72bd-8a49-f8d43f615c3d	019ec37c-51a2-7373-981b-a96898747a9c	Jangan bagi air tu tumpah.	[Don't spill the water/Do not spill the water].	\N	1	16	2026-06-14 07:46:13	2026-06-19 04:20:46
019ec518-6e8b-70da-8e6d-b1de24f75a71	019ec37c-51a2-7373-981b-a96898747a9c	Saya cuma niat nak menolong je ni.	I['m just trying to help/ am just trying to help].	\N	1	17	2026-06-14 07:46:13	2026-06-19 04:21:01
019ec518-6e8e-7103-a7ff-c940748a6377	019ec37c-51a2-7373-981b-a96898747a9c	Pagi yang sangat indah	It['s a beautiful morning/ is a beautiful morning].	\N	1	19	2026-06-14 07:46:13	2026-06-19 04:21:17
019ec616-046c-717a-afc9-5b8f01709e34	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Pukul berapa sekarang ni?	What['s the time now/ is the time now]?	\N	1	1	2026-06-14 12:23:12	2026-06-19 07:11:02
019ec616-046f-70db-8156-21c61727f80b	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Sunyi betul kat sini.	It['s very quiet here/ is very quiet here].	\N	1	3	2026-06-14 12:23:12	2026-06-19 07:11:27
019ec616-0471-7085-8ee4-2f187b982ed9	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jangan tinggalkan kasut awak kat luar.	[Don't leave your shoes outside/Do not leave your shoes outside].	\N	1	4	2026-06-14 12:23:12	2026-06-19 07:11:43
019ec616-0472-7288-bc3f-3b0403fabd7d	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Saya tengah sarapan ni.	I['m having my breakfast/ am having my breakfast].	\N	1	5	2026-06-14 12:23:12	2026-06-19 07:12:00
019ec618-91f2-72cc-8d5d-07866f97c292	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Itu satu pilihan yang mudah.	It['s an easy choice/ is an easy choice].	\N	1	7	2026-06-14 12:25:59	2026-06-19 07:12:18
019ec618-91f3-7390-bdd6-58e396a172e6	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jangan minum terlalu banyak kafein.	[Don't drink too much caffeine/Do not drink too much caffeine].	\N	1	8	2026-06-14 12:25:59	2026-06-19 07:12:37
019ec618-91f5-7326-a5be-0b36eaca2929	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Saya tengah cari hadiah ni.	I['m looking for a gift/ am looking for a gift].	\N	1	9	2026-06-14 12:25:59	2026-06-19 07:12:57
019ec619-df86-7027-ae4a-8e10b124aa1f	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jangan lupa bawa payung awak.	[Don't forget your umbrella/Do not forget your umbrella].	\N	1	12	2026-06-14 12:27:24	2026-06-19 07:14:19
019ec619-df87-72af-8056-cc41b4c4e257	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Saya saja tengah mengemas ni.	I['m just cleaning up/ am just cleaning up].	\N	1	13	2026-06-14 12:27:24	2026-06-19 07:14:34
019ec619-df8a-70e5-af22-c311e80fc121	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Benda ni satu proses yang sangat ringkas.	It['s a very simple process/ is a very simple process].	\N	1	15	2026-06-14 12:27:24	2026-06-19 07:14:53
019ec61c-f9fe-722f-9d25-d90a20c870c6	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Jangan membazir makanan.	[Don't waste food/Do not waste food].	\N	1	16	2026-06-14 12:30:48	2026-06-19 07:15:08
019ec61c-fa03-732f-a40e-9b5ee8b59de7	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Warna yang cantik	It['s a nice color/ is a nice color].	\N	1	19	2026-06-14 12:30:48	2026-06-19 07:15:39
019ec621-f286-739f-8fe3-ad7e66f7dfba	019ec42c-5a3b-7157-a167-92e44b712f0a	Bau apa tu?	What['s that smell/ is that smell]?	\N	1	1	2026-06-14 12:36:14	2026-06-19 07:20:07
019ec621-f289-72ea-abd0-a049f43e338d	019ec42c-5a3b-7157-a167-92e44b712f0a	Kat luar dah mula nak gelap dah ni.	It['s getting dark outside/ is getting dark outside].	\N	1	3	2026-06-14 12:36:14	2026-06-19 07:20:31
019ec621-f28b-725b-a8ae-7e8120f57041	019ec42c-5a3b-7157-a167-92e44b712f0a	Jangan biarkan air paip ni terbiar terbuka	[Don't leave the water running/Do not leave the water running].	\N	1	4	2026-06-14 12:36:14	2026-06-19 07:20:56
019ec621-f28c-737d-8576-4c9980c24a95	019ec42c-5a3b-7157-a167-92e44b712f0a	Saya tengah cas telefon saya ni.	I['m charging my phone/ am charging my phone].	\N	1	5	2026-06-14 12:36:14	2026-06-19 07:21:17
019ec62e-06d2-7038-aea8-9f48cd5ef2db	019ec42c-5a3b-7157-a167-92e44b712f0a	Benda ni percuma	It['s free of charge/ is free of charge].	\N	1	7	2026-06-14 12:49:25	2026-06-19 07:21:30
019ec62e-06d3-7148-876e-e0703473cd2f	019ec42c-5a3b-7157-a167-92e44b712f0a	Jangan lintas jalan lagi	[Don't cross the road yet/Do not cross the road yet].	\N	1	8	2026-06-14 12:49:25	2026-06-19 07:21:43
019ec62f-6e5d-70d3-9626-79af6a723e3b	019ec42c-5a3b-7157-a167-92e44b712f0a	Hari ni hari cuti umum.	It['s a public holiday/ is a public holiday].	\N	1	11	2026-06-14 12:50:57	2026-06-19 07:22:13
019ec62f-6e5f-727d-a4ea-7456dbe9c520	019ec42c-5a3b-7157-a167-92e44b712f0a	Jangan buka tingkap tu.	[Don't open the window/Do not open the window].	\N	1	12	2026-06-14 12:50:57	2026-06-19 07:22:29
019ec62f-6e60-73c8-9470-087fbc1572b4	019ec42c-5a3b-7157-a167-92e44b712f0a	Saya dah betul-betul habis pilihan dah ni.	I['m clean out of options/ am clean out of options].	\N	1	13	2026-06-14 12:50:57	2026-06-19 07:22:50
019ec62f-6e63-738b-8a56-3889665179b6	019ec42c-5a3b-7157-a167-92e44b712f0a	Pedas betul makanan ni.	It['s very spicy/ is very spicy].	\N	1	15	2026-06-14 12:50:57	2026-06-19 07:23:07
019ec631-8926-728e-b9c4-f5b7ca887568	019ec42c-5a3b-7157-a167-92e44b712f0a	Jangan makan laju sangat.	[Don't eat too fast/Do not eat too fast].	\N	1	16	2026-06-14 12:53:15	2026-06-19 07:23:20
019ec631-8928-733a-bd08-127d7666cee3	019ec42c-5a3b-7157-a167-92e44b712f0a	Saya nak pergi berjalan-jalan kejap	I['m going for a walk/ am going for a walk].	\N	1	17	2026-06-14 12:53:15	2026-06-19 07:30:25
019ec631-892d-715f-945b-866a8ed736dc	019ec42c-5a3b-7157-a167-92e44b712f0a	Jom kita berhenti setakat ni dulu untuk hari ni.	Let's call it a day.	\N	1	20	2026-06-14 12:53:15	2026-06-14 12:53:15
019ec635-c2d4-7137-83d4-2c84a32e384e	019ec42c-7663-73ec-b13e-302ca2fc6882	Jom kita gosok baju.	Let's iron the clothes.	\N	1	2	2026-06-14 12:57:52	2026-06-14 12:57:52
019ec638-5851-730a-a3eb-ef8a720c077d	019ec42c-7663-73ec-b13e-302ca2fc6882	Jom kita semak tarikh luput dulu.	Let's check the expiry date.	\N	1	6	2026-06-14 13:00:41	2026-06-14 13:00:41
019ec638-5857-73bf-b2a2-664c4562ae8c	019ec42c-7663-73ec-b13e-302ca2fc6882	Jom kita ubah (laraskan) suhu tu sikit.	Let's adjust the temperature.	\N	1	10	2026-06-14 13:00:41	2026-06-14 13:00:41
019ec63f-a402-7229-90db-df28155bcef9	019ec42c-7663-73ec-b13e-302ca2fc6882	Jom kita periksa lock kunci tu sekali lagi (untuk kepastian)	Let's double-check the lock.	\N	1	14	2026-06-14 13:08:40	2026-06-14 13:08:40
019ec643-8c17-71ed-a5ef-2808bbf870ad	019ec42c-7663-73ec-b13e-302ca2fc6882	Jom kita cari tempat yang redup sikit.	Let's find a shaded spot.	\N	1	18	2026-06-14 13:12:56	2026-06-14 13:12:56
019ec643-8c1a-70f1-94e2-79b18f1e57ab	019ec42c-7663-73ec-b13e-302ca2fc6882	Jom kita beralih ke perkara seterusnya.	Let's move to the next one.	\N	1	20	2026-06-14 13:12:56	2026-06-14 13:12:56
019ec64a-08cc-7082-b6ba-5a7cb1d33dc5	019ec42c-acb5-725d-9503-732d956f190e	Jom kita pergi buang sampah tu.	Let's throw away the rubbish.	\N	1	2	2026-06-14 13:20:01	2026-06-14 13:20:01
019ec64f-8edb-723f-817a-44c156009b18	019ec42c-acb5-725d-9503-732d956f190e	Jom kita perlahankan sikit volume tu.	Let's turn down the volume.	\N	1	6	2026-06-14 13:26:03	2026-06-14 13:26:03
019ec64f-8ee1-70f9-808f-e60fb5bbb0e6	019ec42c-acb5-725d-9503-732d956f190e	Jom kita tukar bateri baharu.	Let's change the batteries.	\N	1	10	2026-06-14 13:26:03	2026-06-14 13:26:03
019ec652-3f94-72fd-8906-c877462929d9	019ec42c-acb5-725d-9503-732d956f190e	Jom kita ikat beg plastik tu kuat-kuat	Let's tie the plastic bag tightly.	\N	1	14	2026-06-14 13:28:59	2026-06-14 13:28:59
019ec654-ac59-72c9-98a6-45808a1d9823	019ec42c-acb5-725d-9503-732d956f190e	Jom kita semak balik resit tu.	Let's check the receipt again.	\N	1	18	2026-06-14 13:31:38	2026-06-14 13:31:38
019ec654-ac5c-705e-b822-778f806da13b	019ec42c-acb5-725d-9503-732d956f190e	Jom kita kekalkan usaha yang bagus ni.	Let's keep up the good work.	\N	1	20	2026-06-14 13:31:38	2026-06-14 13:31:38
019ec65b-0cf5-70c4-8bcd-d30a5d7de04c	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jom kita tutup kain langsir tu.	Let's close the curtains.	\N	1	2	2026-06-14 13:38:36	2026-06-14 13:38:36
019ec661-56b0-7294-8003-b00b94606785	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jom kita pastikan pintu sentiasa berkunci.	Let's keep the door locked.	\N	1	6	2026-06-14 13:45:28	2026-06-14 13:45:28
019ec661-56b6-71a8-8746-6885ef95d463	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jom kita kosongkan padang ni.	Let's clear the field.	\N	1	10	2026-06-14 13:45:28	2026-06-14 13:45:28
019ec635-c2d5-710e-ac13-a7fdb35d9ee3	019ec42c-7663-73ec-b13e-302ca2fc6882	Berabuk betul kat sini.	It['s very dusty here/ is very dusty here].	\N	1	3	2026-06-14 12:57:52	2026-06-19 07:36:34
019ec635-c2d7-7208-b879-13061bd3cb8d	019ec42c-7663-73ec-b13e-302ca2fc6882	Jangan sentuh cat yang tengah basah tu.	[Don't touch the wet paint/Do not touch the wet paint].	\N	1	4	2026-06-14 12:57:52	2026-06-19 07:36:52
019ec635-c2d8-73fc-8356-e257b181a623	019ec42c-7663-73ec-b13e-302ca2fc6882	Saya tengah basuh kain ni.	I['m doing the laundry/ am doing the laundry].	\N	1	5	2026-06-14 12:57:52	2026-06-19 07:37:08
019ec638-5853-70d9-ac37-2b7a3ed87521	019ec42c-7663-73ec-b13e-302ca2fc6882	Barang tu dah habis stok	It['s out of stock/ is out of stock].	\N	1	7	2026-06-14 13:00:41	2026-06-19 07:37:20
019ec638-5854-71d1-8352-8e775eb72752	019ec42c-7663-73ec-b13e-302ca2fc6882	Jangan tinggalkan beg awak tanpa dijaga.	[Don't leave your bag unattended/Do not leave your bag unattended].	\N	1	8	2026-06-14 13:00:41	2026-06-19 07:37:38
019ec63f-a3fd-70e8-97b9-a2a388aee0a3	019ec42c-7663-73ec-b13e-302ca2fc6882	Itu kesilapan biasa yang orang selalu buat.	It['s a common mistake/ is a common mistake].	\N	1	11	2026-06-14 13:08:40	2026-06-19 07:38:14
019ec63f-a3ff-701b-818e-6c3bf8ace2c2	019ec42c-7663-73ec-b13e-302ca2fc6882	Jangan lupa kemas barang-barang awak masuk beg.	[Don't forget to pack your things/Do not forget to pack your things].	\N	1	12	2026-06-14 13:08:40	2026-06-19 07:38:28
019ec63f-a401-7030-b381-1204eaaea4e2	019ec42c-7663-73ec-b13e-302ca2fc6882	Saya tengah cari gunting ni kat mana entah.	I['m looking for the scissors/ am looking for the scissors].	\N	1	13	2026-06-14 13:08:40	2026-06-19 07:38:46
019ec63f-a403-716f-b954-ffdee4f4fbe4	019ec42c-7663-73ec-b13e-302ca2fc6882	Silau sangat kat dalam ni.	It['s too bright in here/ is too bright in here].	\N	1	15	2026-06-14 13:08:40	2026-06-19 07:39:01
019ec643-8c14-721f-a018-0ae3c1327741	019ec42c-7663-73ec-b13e-302ca2fc6882	Jangan bagi tersadung (tersepak) wayar tu.	[Don't trip over the wire/Do not trip over the wire].	\N	1	16	2026-06-14 13:12:56	2026-06-19 07:39:15
019ec643-8c19-7089-8996-cf7cfdf6725c	019ec42c-7663-73ec-b13e-302ca2fc6882	Benda tu ada dekat dalam laci paling bawah.	It['s in the bottom drawer/ is in the bottom drawer].	\N	1	19	2026-06-14 13:12:56	2026-06-19 07:39:43
019ec64a-08ca-70ad-8f17-ceca1e36815e	019ec42c-acb5-725d-9503-732d956f190e	Bunyi bising apa kat luar tu?	What['s that noise outside/ is that noise outside]?	\N	1	1	2026-06-14 13:20:01	2026-06-19 07:52:11
019ec64a-08ce-72d8-b829-6b8d75a6c85d	019ec42c-acb5-725d-9503-732d956f190e	Licin betul kat sini.	It['s very slippery here/ is very slippery here].	\N	1	3	2026-06-14 13:20:01	2026-06-19 07:52:29
019ec64a-08cf-7329-93e7-f1fc034d4e36	019ec42c-acb5-725d-9503-732d956f190e	Jangan biarkan paip air tu menitik.	[Don't leave the tap leaking/Do not leave the tap leaking].	\N	1	4	2026-06-14 13:20:01	2026-06-19 07:52:45
019ec64a-08d0-732e-aa30-eeb0673475bf	019ec42c-acb5-725d-9503-732d956f190e	Saya tengah siapkan meja makan ni.	I['m setting up the table/ am setting up the table].	\N	1	5	2026-06-14 13:20:01	2026-06-19 07:53:05
019ec64f-8edd-735c-ae83-5949ea4c7cc0	019ec42c-acb5-725d-9503-732d956f190e	Benda ni masih baru lagi	It['s brand new/ is brand new].	\N	1	7	2026-06-14 13:26:03	2026-06-19 07:53:22
019ec64f-8ee0-7156-a44c-ebca34716a8e	019ec42c-acb5-725d-9503-732d956f190e	Saya tengah kupas buah ni.	I['m peeling the fruits/ am peeling the fruits].	\N	1	9	2026-06-14 13:26:03	2026-06-19 07:53:54
019ec652-3f8f-714a-a052-d26d2613da70	019ec42c-acb5-725d-9503-732d956f190e	Benda tu tersorok daripada pandangan.	It['s hidden from view/ is hidden from view].	\N	1	11	2026-06-14 13:28:59	2026-06-19 07:54:14
019ec652-3f91-73fd-adf1-883b5612212b	019ec42c-acb5-725d-9503-732d956f190e	Jangan lupa balas mesej tu nanti.	[Don't forget to reply to the message/Do not forget to reply to the message].	\N	1	12	2026-06-14 13:28:59	2026-06-19 07:54:28
019ec652-3f95-711a-85a7-3c47297df3dc	019ec42c-acb5-725d-9503-732d956f190e	Benda ni terlalu ketat untuk saya.	It['s too tight for me/ is too tight for me].	\N	1	15	2026-06-14 13:28:59	2026-06-19 07:54:57
019ec654-ac56-7233-82de-b7ed4d16f609	019ec42c-acb5-725d-9503-732d956f190e	Jangan pijak rumput tu.	[Don't step on the grass/Do not step on the grass].	\N	1	16	2026-06-14 13:31:38	2026-06-19 07:55:11
019ec654-ac58-72c6-bd56-e2e92e7ec782	019ec42c-acb5-725d-9503-732d956f190e	Saya cuma tengah lap cermin ni je.	I['m just wiping the glass/ am just wiping the glass].	\N	1	17	2026-06-14 13:31:38	2026-06-19 07:55:24
019ec654-ac5a-7026-ab25-d20963eefc6d	019ec42c-acb5-725d-9503-732d956f190e	Benda tu ada dekat atas rak bahagian tengah.	It['s on the middle shelf/ is on the middle shelf].	\N	1	19	2026-06-14 13:31:38	2026-06-19 07:55:38
019ec65b-0cf3-732c-bf67-915c47442a71	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Barisan panjang beratur tu untuk apa eh?	What['s that long line for/ is that long line for]?	\N	1	1	2026-06-14 13:38:36	2026-06-19 07:57:17
019ec65b-0cf6-72c5-86de-1a4d78c98a81	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Hari ni cuaca berangin betul	It['s very windy today/ is very windy today].	\N	1	3	2026-06-14 13:38:36	2026-06-19 07:57:34
019ec65b-0cf9-7125-8439-b3c80b6e07fb	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Saya tengah panaskan makanan ni kejap.	I['m heating up the food/ am heating up the food].	\N	1	5	2026-06-14 13:38:36	2026-06-19 07:58:40
019ec661-56b2-716e-8788-34eed3fdcfb8	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Itu semua kebetulan semata-mata	It['s a complete coincidence/ is a complete coincidence].	\N	1	7	2026-06-14 13:45:28	2026-06-19 07:59:02
019ec661-56b3-7232-ab17-5b16c0c401e4	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jangan duduk dekat sangat dengan skrin	[Don't sit too close to the screen/Do not sit too close to the screen].	\N	1	8	2026-06-14 13:45:28	2026-06-19 07:59:29
019ec661-56b5-73ae-9185-377129013790	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Saya saja tengah siram pokok-pokok bunga ni.	I['m just watering the plants/ am just watering the plants].	\N	1	9	2026-06-14 13:45:28	2026-06-19 07:59:59
019ec669-763c-70be-be8a-e7ea1f7b7a0f	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jom kita sapu lantai ni dulu bagi bersih.	Let's sweep the floor first.	\N	1	14	2026-06-14 13:54:20	2026-06-14 13:54:20
019ec66e-a501-71c4-b166-1fe228742b04	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jom kita semak baki yang tinggal.	Let's check the balance.	\N	1	18	2026-06-14 14:00:00	2026-06-14 14:00:00
019ec66e-a504-726a-8fca-11b8365236d7	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Kita dah berjaya cecah tujuh ratus!	We successfully reached seven hundred!	\N	1	20	2026-06-14 14:00:00	2026-06-14 14:00:00
019ec673-6050-71e7-acf0-2aceacc18611	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jom kita buka pintu belakang.	Let's open the back door.	\N	1	2	2026-06-14 14:05:10	2026-06-14 14:05:10
019ec678-5cb1-704c-90cf-e0d01f61483e	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jom kita cari kertas tisu.	Let's look for a tissue paper.	\N	1	6	2026-06-14 14:10:37	2026-06-14 14:10:37
019ec678-5cb7-738e-9a8d-069c72b3a450	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jom kita gantung kunci-kunci tu kat sini.	Let's hang the keys here.	\N	1	10	2026-06-14 14:10:37	2026-06-14 14:10:37
019ec67d-3a32-73eb-a980-0c9df5e99ea3	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jom kita susun rak buku ni bagi kemas.	Let's organize the bookshelf.	\N	1	14	2026-06-14 14:15:56	2026-06-14 14:15:56
019ec682-1833-7369-9a96-31d7d42c24dc	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jom kita periksa alamat tu sekali lagi	Let's double-check the address.	\N	1	18	2026-06-14 14:21:15	2026-06-14 14:21:15
019ec682-1835-7106-bafc-6cf58ab20c5c	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jom kita teruskan melangkah ke depan.	Let's keep moving forward.	\N	1	20	2026-06-14 14:21:15	2026-06-14 14:21:15
019ec976-c38b-7211-8409-4e9e6aa96679	019ec970-d0e7-71e9-9601-43ceb84b321a	Jom kita buka TV tu.	Let's switch on the television.	\N	1	2	2026-06-15 04:07:44	2026-06-15 04:07:44
019ec97c-715b-710c-bb80-6c779254b6bb	019ec970-d0e7-71e9-9601-43ceb84b321a	Jom kita cari penyeduk sampah.	Let's look for the dustpan.	\N	1	6	2026-06-15 04:13:56	2026-06-15 04:13:56
019ec97c-7161-70b6-91c5-94b9b732507f	019ec970-d0e7-71e9-9601-43ceb84b321a	Jarakkan diri sikit.	Let's keep the distance.	\N	1	10	2026-06-15 04:13:56	2026-06-15 04:13:56
019ec97f-f194-7127-8711-a542d0ea0a8d	019ec970-d0e7-71e9-9601-43ceb84b321a	Jom kita lap meja makan ni bagi bersih.	Let's wipe the dining table.	\N	1	14	2026-06-15 04:17:45	2026-06-15 04:17:45
019ec983-2846-7004-af18-46e8a86fd71b	019ec970-d0e7-71e9-9601-43ceb84b321a	Jom kita tengok tag harga dulu.	Let's check the price tag.	\N	1	18	2026-06-15 04:21:16	2026-06-15 04:21:16
019ec983-2849-7201-9484-a1e6357182a6	019ec970-d0e7-71e9-9601-43ceb84b321a	Jom kita terus beralih ke bahagian seterusnya.	Let's jump to the next part.	\N	1	20	2026-06-15 04:21:16	2026-06-15 04:21:16
019ec989-a61b-709b-a086-17fa4cfcae00	019ec970-edff-7092-b1be-ecd06cc0384f	Jom kita tutup dapur gas tu.	Let's switch off the stove.	\N	1	2	2026-06-15 04:28:21	2026-06-15 04:28:21
019ec669-763d-707f-a3e7-5f96ce21e954	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Benda ni berat sangat kalau nak angkat seorang diri.	It['s too heavy to lift alone/ is too heavy to lift alone].	\N	1	15	2026-06-14 13:54:20	2026-06-19 08:01:23
019ec66e-a4fe-713d-b0da-a45a9ea8bb52	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jangan bagi air kopi tu tumpah.	[Don't spill the coffee/Do not spill the coffee].	\N	1	16	2026-06-14 14:00:00	2026-06-19 08:01:44
019ec66e-a500-73f5-a283-47cfc4880b2a	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Saya tengah lipat kain selimut ni je.	I['m just folding the blankets/ am just folding the blankets].	\N	1	17	2026-06-14 14:00:00	2026-06-19 08:02:01
019ec66e-a502-700d-ae11-f79d6272c4ae	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Benda tu ada kat atas meja tepi	It['s on the side table/ is on the side table].	\N	1	19	2026-06-14 14:00:00	2026-06-19 08:02:19
019ec673-604e-7110-9095-3933245524aa	019ec42c-d3b1-70d6-9ca6-0249204ff259	Kesan kotoran apa dekat baju awak tu?	What['s that stain on your shirt/ is that stain on your shirt]?	\N	1	1	2026-06-14 14:05:10	2026-06-19 08:04:06
019ec673-6051-72f9-ac1d-77bf92f719c9	019ec42c-d3b1-70d6-9ca6-0249204ff259	Hari ni cuaca rasa agak bahang sikit.	It['s very humid today/ is very humid today].	\N	1	3	2026-06-14 14:05:10	2026-06-19 08:04:27
019ec673-6054-70cb-b776-429d1412c323	019ec42c-d3b1-70d6-9ca6-0249204ff259	Saya tengah seterika tali leher saya ni.	I['m ironing my necktie/ am ironing my necktie].	\N	1	5	2026-06-14 14:05:10	2026-06-19 08:05:37
019ec678-5cb3-70bb-aee5-5065b663a915	019ec42c-d3b1-70d6-9ca6-0249204ff259	Tepat pada waktunya.	It['s perfect timing/ is perfect timing].	\N	1	7	2026-06-14 14:10:37	2026-06-19 08:06:28
019ec678-5cb4-7155-a27f-b51de606a0e5	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jangan pijak lantai yang tengah basah tu.	[Don't step on the wet floor/Do not step on the wet floor].	\N	1	8	2026-06-14 14:10:37	2026-06-19 08:06:46
019ec678-5cb5-707b-8afd-760b6b176954	019ec42c-d3b1-70d6-9ca6-0249204ff259	Saya tengah asingkan surat-surat ni je.	I['m just sorting out the mail/ am just sorting out the mail].	\N	1	9	2026-06-14 14:10:37	2026-06-19 08:07:31
019ec67d-3a2d-719b-bdcd-84c159a3eab8	019ec42c-d3b1-70d6-9ca6-0249204ff259	Bahan ni memang jenis tahan lasak.	It['s a durable material/ is a durable material].	\N	1	11	2026-06-14 14:15:56	2026-06-19 08:08:18
019ec67d-3a31-7117-b179-28f61fb7f2bc	019ec42c-d3b1-70d6-9ca6-0249204ff259	Saya tengah cari pita pengukur ni.	I['m looking for the tape measure/ am looking for the tape measure].	\N	1	13	2026-06-14 14:15:56	2026-06-19 08:09:09
019ec67d-3a33-73db-99bf-7a2a0f6210fb	019ec42c-d3b1-70d6-9ca6-0249204ff259	Gelap sangat ni sampai tak nampak apa-apa.	It['s too dark to see/ is too dark to see].	\N	1	15	2026-06-14 14:15:56	2026-06-19 08:09:31
019ec682-1830-73ef-9383-83646cf71abb	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jangan bagi skrin tu tercalar.	[Don't scratch the screen/Do not scratch the screen].	\N	1	16	2026-06-14 14:21:15	2026-06-19 08:09:50
019ec682-1832-72fe-8650-443655944580	019ec42c-d3b1-70d6-9ca6-0249204ff259	Saya tengah hiris bawang ni je.	I['m just slicing the onions/ am just slicing the onions].	\N	1	17	2026-06-14 14:21:15	2026-06-19 08:10:11
019ec682-1834-71c2-b090-19db93f61a62	019ec42c-d3b1-70d6-9ca6-0249204ff259	Benda tu ada dekat beranda depan	It['s on the front porch/ is on the front porch].	\N	1	19	2026-06-14 14:21:15	2026-06-19 08:11:22
019ec976-c389-727f-9736-f35ef9bce8a8	019ec970-d0e7-71e9-9601-43ceb84b321a	Ada apa kat dalam beg plastik tu?	What['s inside that plastic bag/ is inside that plastic bag]?	\N	1	1	2026-06-15 04:07:44	2026-06-19 08:13:02
019ec976-c38e-713b-bb2e-e7ccc3c821bc	019ec970-d0e7-71e9-9601-43ceb84b321a	Jangan biarkan makanan tu terbuka tanpa ditutup.	[Don't leave the food uncovered/Do not leave the food uncovered].	\N	1	4	2026-06-15 04:07:44	2026-06-19 08:13:23
019ec976-c38f-7365-88bd-ee439cafa077	019ec970-d0e7-71e9-9601-43ceb84b321a	Saya tengah ikat tali kasut saya ni.	I['m tying my shoelaces/ am tying my shoelaces].	\N	1	5	2026-06-15 04:07:44	2026-06-19 08:13:41
019ec97c-715d-7178-b0c9-8b94ae3bebe4	019ec970-d0e7-71e9-9601-43ceb84b321a	Itu satu permintaan yang munasabah	It['s a reasonable request/ is a reasonable request].	\N	1	7	2026-06-15 04:13:56	2026-06-19 08:13:58
019ec97c-715e-71cf-be0d-f79bf4953bdb	019ec970-d0e7-71e9-9601-43ceb84b321a	Jangan sentuh serpihan kaca yang pecah tu.	[Don't touch the broken glass/Do not touch the broken glass].	\N	1	8	2026-06-15 04:13:56	2026-06-19 08:14:12
019ec97c-7160-72c7-977b-6466fb4741a6	019ec970-d0e7-71e9-9601-43ceb84b321a	Saya tengah periksa dompet saya ni.	I['m just checking my wallet/ am just checking my wallet].	\N	1	9	2026-06-15 04:13:56	2026-06-19 08:14:25
019ec97f-f191-734f-b1ca-80c5a8ef0ec7	019ec970-d0e7-71e9-9601-43ceb84b321a	Jangan lupa kunci laci tu nanti.	[Don't forget to lock the drawer/Do not forget to lock the drawer].	\N	1	12	2026-06-15 04:17:45	2026-06-19 08:14:56
019ec97f-f192-7289-84a4-27525cf12ed1	019ec970-d0e7-71e9-9601-43ceb84b321a	Saya tengah cari kalkulator ni kat mana entah.	I['m looking for the calculator/ am looking for the calculator].	\N	1	13	2026-06-15 04:17:45	2026-06-19 08:15:11
019ec97f-f195-73c9-9358-4e7111915e88	019ec970-d0e7-71e9-9601-43ceb84b321a	Bising sangat kat dalam ni sampai tak dengar.	It['s too noisy in here/ is too noisy in here].	\N	1	15	2026-06-15 04:17:45	2026-06-19 08:15:26
019ec983-2843-71bb-a542-cf58d7740198	019ec970-d0e7-71e9-9601-43ceb84b321a	Jangan bersandar dekat dinding tu.	[Don't lean against the wall/Do not lean against the wall].	\N	1	16	2026-06-15 04:21:16	2026-06-19 08:15:43
019ec983-2848-73ce-822b-7d276a07a0af	019ec970-d0e7-71e9-9601-43ceb84b321a	Benda tu ada dekat atas meja dapur.	It['s on the kitchen counter/ is on the kitchen counter].	\N	1	19	2026-06-15 04:21:16	2026-06-19 08:16:09
019ec989-a619-7395-b172-d59e0a412ccc	019ec970-edff-7092-b1be-ecd06cc0384f	Tag harga tu untuk barang yang mana satu?	What['s that price tag for/ is that price tag for]?	\N	1	1	2026-06-15 04:28:21	2026-06-19 08:17:48
019ec98d-1e81-72c4-8c2c-125abdf26934	019ec970-edff-7092-b1be-ecd06cc0384f	Jom kita cari extension wire (wayar penyambung)	Let's look for the extension wire.	\N	1	6	2026-06-15 04:32:09	2026-06-15 04:32:09
019ec98d-1e86-7253-8460-c777c1faa69e	019ec970-edff-7092-b1be-ecd06cc0384f	Jom kita pastikan pintu pagar sentiasa tertutup.	Let's keep the gate closed.	\N	1	10	2026-06-15 04:32:09	2026-06-15 04:32:09
019ec997-77b4-7137-b561-5251f949253a	019ec970-edff-7092-b1be-ecd06cc0384f	Jom kita mop lantai ruang tamu ni.	Let's mop the living room.	\N	1	14	2026-06-15 04:43:27	2026-06-15 04:43:27
019ec999-d48e-709c-b779-d072130e8585	019ec970-edff-7092-b1be-ecd06cc0384f	Jom kita periksa balik tarikh tu betul-betul.	Let's double-check the date.	\N	1	18	2026-06-15 04:46:02	2026-06-15 04:46:02
019ec999-d491-709d-a1ac-c614a88f62ee	019ec970-edff-7092-b1be-ecd06cc0384f	Jom kita beralih ke senarai yang seterusnya.	Let's move on to the next list.	\N	1	20	2026-06-15 04:46:02	2026-06-15 04:46:02
019ec99b-cf3a-7161-aa72-9c744c5b499e	019ec971-0440-7058-b50e-4406b1db8bbe	Jom kita buka aircond tu.	Let's turn on the air conditioner.	\N	1	2	2026-06-15 04:48:12	2026-06-15 04:48:12
019ec99f-0de6-72c4-93c5-892be54b6161	019ec971-0440-7058-b50e-4406b1db8bbe	Jom kita cari penyapu kejap.	Let's look for the broom.	\N	1	6	2026-06-15 04:51:44	2026-06-15 04:51:44
019ec99f-0dec-71bd-ac72-ba4e8ef1dc87	019ec971-0440-7058-b50e-4406b1db8bbe	Jom kita biarkan tingkap tu tertutup.	Let's keep the window shut.	\N	1	10	2026-06-15 04:51:44	2026-06-15 04:51:44
019ec9a0-dc3f-72b4-ace6-a51c5ce7f874	019ec971-0440-7058-b50e-4406b1db8bbe	Jom kita lap habuk ni.	Let's wipe the dust off.	\N	1	14	2026-06-15 04:53:43	2026-06-15 04:53:43
019ec9af-84a9-7219-bc76-c4a42de41dfa	019ec971-0440-7058-b50e-4406b1db8bbe	Jom kita semak jumlah keseluruhan harga.	Let's check the total amount.	\N	1	18	2026-06-15 05:09:43	2026-06-15 05:09:43
019ec9af-84ab-72b1-b0b6-8e2a0cd2a700	019ec971-0440-7058-b50e-4406b1db8bbe	Jom kita teruskan ke kumpulan seterusnya.	Let's proceed to the next group.	\N	1	20	2026-06-15 05:09:43	2026-06-15 05:09:43
019ecb25-9930-704d-aac8-9f8d84f68968	019ec971-15a1-73f3-9143-463db4e852d3	Jom kita tutup suis pemanas air tu.	Let's turn off the water heater.	\N	1	2	2026-06-15 11:58:19	2026-06-15 11:58:19
019ecb2a-b43f-7325-bf3b-ab83c87c189a	019ec971-15a1-73f3-9143-463db4e852d3	Jom kita cari pembuka tin.	Let's look for the can opener.	\N	1	6	2026-06-15 12:03:54	2026-06-15 12:03:54
019ecb2a-b444-703c-b2dc-1f05ba0c75d2	019ec971-15a1-73f3-9143-463db4e852d3	Jom kita malapkan sikit cahaya lampu.	Let's keep the lights low.	\N	1	10	2026-06-15 12:03:54	2026-06-15 12:03:54
019ec989-a61e-7281-85bd-e67c06de3c47	019ec970-edff-7092-b1be-ecd06cc0384f	Jangan biarkan seterika tu terpasang tanpa dijaga.	[Don't leave the iron plugged in/Do not leave the iron plugged in].	\N	1	4	2026-06-15 04:28:21	2026-06-19 08:19:01
019ec989-a61f-717e-8692-f8955bb08d63	019ec970-edff-7092-b1be-ecd06cc0384f	Saya tengah pasang kipas ni kejap.	I['m turning on the fan/ am turning on the fan].	\N	1	5	2026-06-15 04:28:21	2026-06-19 08:19:34
019ec98d-1e83-70f3-aa8b-2a382b6bf2ff	019ec970-edff-7092-b1be-ecd06cc0384f	Benda ni proses yang mudah dan tak pening.	It['s a straightforward process/ is a straightforward process].	\N	1	7	2026-06-15 04:32:09	2026-06-19 08:19:54
019ec98d-1e85-7244-affa-c25294febffd	019ec970-edff-7092-b1be-ecd06cc0384f	Saya tengah periksa paras air ni.	I['m just checking the water level/ am just checking the water level].	\N	1	9	2026-06-15 04:32:09	2026-06-19 08:20:31
019ec997-77af-7033-9224-b23e981a3efa	019ec970-edff-7092-b1be-ecd06cc0384f	Beg ni memang jenis ringan	It['s a lightweight bag/ is a lightweight bag].	\N	1	11	2026-06-15 04:43:27	2026-06-19 08:20:48
019ec997-77b1-73bb-a920-6c684af83e3e	019ec970-edff-7092-b1be-ecd06cc0384f	Jangan lupa pergi buang sampah tu nanti.	[Don't forget to clear the trash/Do not forget to clear the trash].	\N	1	12	2026-06-15 04:43:27	2026-06-19 08:21:02
019ec997-77b3-731c-9de4-b4283872a507	019ec970-edff-7092-b1be-ecd06cc0384f	Aku tengah cari ring kunci ni (gantungan kunci)	I['m looking for the key ring/ am looking for the key ring].	\N	1	13	2026-06-15 04:43:27	2026-06-19 08:21:19
019ec997-77b5-72ee-93f9-17b88c05d270	019ec970-edff-7092-b1be-ecd06cc0384f	Benda ni terlalu kecil untuk ukuran saya.	It['s too small for me/ is too small for me].	\N	1	15	2026-06-15 04:43:27	2026-06-19 08:21:36
019ec999-d48d-7066-9661-f2b5652489de	019ec970-edff-7092-b1be-ecd06cc0384f	Saya tengah kupas ubi kentang ni je.	I['m just peeling the potatoes/ am just peeling the potatoes].	\N	1	17	2026-06-15 04:46:02	2026-06-19 08:22:10
019ec999-d48f-7053-9320-2efd34ed0fe4	019ec970-edff-7092-b1be-ecd06cc0384f	Benda tu ada dekat atas rak kasut.	It['s on the shoe rack/ is on the shoe rack].	\N	1	19	2026-06-15 04:46:02	2026-06-19 08:22:25
019ec99b-cf38-7126-b667-32f83c843a00	019ec971-0440-7058-b50e-4406b1db8bbe	Ada apa kat dalam sampul surat tu?	What['s inside that envelope/ is inside that envelope]?	\N	1	1	2026-06-15 04:48:12	2026-06-19 08:23:49
019ec99b-cf3b-73da-aab3-44f5480356ef	019ec971-0440-7058-b50e-4406b1db8bbe	Malam ni cuaca berangin betul.	It['s very windy tonight/ is very windy tonight].	\N	1	3	2026-06-15 04:48:12	2026-06-19 08:24:12
019ec99b-cf3d-7313-b7da-c63379466325	019ec971-0440-7058-b50e-4406b1db8bbe	Saya tengah cas laptop saya ni.	I['m charging my laptop/ am charging my laptop].	\N	1	5	2026-06-15 04:48:12	2026-06-19 08:25:09
019ec99f-0de8-72b7-8665-5ded812962b6	019ec971-0440-7058-b50e-4406b1db8bbe	Harganya berpatutan sangat dah tu.	It['s a fair price/ is a fair price].	\N	1	7	2026-06-15 04:51:44	2026-06-19 08:25:25
019ec99f-0de9-70f1-b0ed-1b63e6bfac66	019ec971-0440-7058-b50e-4406b1db8bbe	Jangan sentuh bahagian tepi yang tajam tu.	[Don't touch the sharp edge/Do not touch the sharp edge].	\N	1	8	2026-06-15 04:51:44	2026-06-19 08:25:40
019ec99f-0dea-71b1-b09b-aa4c60be7612	019ec971-0440-7058-b50e-4406b1db8bbe	Saya tengah bersihkan cermin ni je	I['m just cleaning the mirror/ am just cleaning the mirror].	\N	1	9	2026-06-15 04:51:44	2026-06-19 08:26:00
019ec9a0-dc3a-7394-93cd-f123c1044d16	019ec971-0440-7058-b50e-4406b1db8bbe	Ini cuma penyelesaian sementara sahaja.	It['s a temporary solution/ is a temporary solution].	\N	1	11	2026-06-15 04:53:43	2026-06-19 08:26:17
019ec9a0-dc3c-71c6-810c-ffb9302df776	019ec971-0440-7058-b50e-4406b1db8bbe	Jangan lupa bagi kucing makan nanti.	[Don't forget to feed the cat/Do not forget to feed the cat].	\N	1	12	2026-06-15 04:53:43	2026-06-19 08:26:30
019ec9a0-dc40-7303-b304-ca47dd33a4e5	019ec971-0440-7058-b50e-4406b1db8bbe	Benda ni terlalu longgar untuk saya.	It['s too loose for me/ is too loose for me].	\N	1	15	2026-06-15 04:53:43	2026-06-19 08:26:58
019ec9af-84a6-7319-bbbc-4c4563faafca	019ec971-0440-7058-b50e-4406b1db8bbe	Jangan bersandar dekat cermin tu.	[Don't lean on the glass/Do not lean on the glass].	\N	1	16	2026-06-15 05:09:43	2026-06-19 08:27:12
019ec9af-84a8-70bd-a5b2-eb07ae7a7b6d	019ec971-0440-7058-b50e-4406b1db8bbe	Saya tengah jerang air ni je	I['m just boiling some water/ am just boiling some water].	\N	1	17	2026-06-15 05:09:43	2026-06-19 08:27:31
019ec9af-84aa-7365-aea5-671f4b097a40	019ec971-0440-7058-b50e-4406b1db8bbe	Benda tu ada dekat atas meja ruang tamu.	It['s on the coffee table/ is on the coffee table].	\N	1	19	2026-06-15 05:09:43	2026-06-19 08:27:57
019ecb25-992d-71c4-abe1-81a735791ded	019ec971-15a1-73f3-9143-463db4e852d3	Bunyi bising apa dekat dapur tu?	What['s that noise in the kitchen/ is that noise in the kitchen]?	\N	1	1	2026-06-15 11:58:19	2026-06-19 08:29:39
019ecb25-9931-73e4-9b67-02e4bbb2d27e	019ec971-15a1-73f3-9143-463db4e852d3	Petang ni cuaca nampak mendung betul.	It['s very cloudy this afternoon/ is very cloudy this afternoon].	\N	1	3	2026-06-15 11:58:19	2026-06-19 08:30:07
019ecb25-9933-708e-8b31-4145ede84590	019ec971-15a1-73f3-9143-463db4e852d3	Saya tengah potong roti ni.	I['m slicing the bread/ am slicing the bread].	\N	1	5	2026-06-15 11:58:19	2026-06-19 08:32:37
019ecb2a-b441-71af-bfa1-0bb6de946ecd	019ec971-15a1-73f3-9143-463db4e852d3	Itu betul-betul kesilapan yang tidak disengajakan.	It['s an honest mistake/ is an honest mistake].	\N	1	7	2026-06-15 12:03:54	2026-06-19 08:32:51
019ecb2a-b442-70a4-a64b-50b3850785b5	019ec971-15a1-73f3-9143-463db4e852d3	Jangan sentuh bahagian permukaan yang melekit tu.	[Don't touch the sticky surface/Do not touch the sticky surface].	\N	1	8	2026-06-15 12:03:54	2026-06-19 08:33:06
019ecb2a-b443-70bd-8e5c-d4eefc3635d5	019ec971-15a1-73f3-9143-463db4e852d3	Saya tengah susun barang dalam beg saya ni je	I['m just organizing my bag/ am just organizing my bag].	\N	1	9	2026-06-15 12:03:54	2026-06-19 08:33:20
019ecb2d-17c9-7266-8a3b-62b039b415d8	019ec971-15a1-73f3-9143-463db4e852d3	Ukurannya memang ngam-ngam	It['s a perfect fit/ is a perfect fit].	\N	1	11	2026-06-15 12:06:30	2026-06-19 08:33:40
019ecb2d-17cf-73bd-9dac-6b2bd69d2bd0	019ec971-15a1-73f3-9143-463db4e852d3	Jom kita sental/berus lantai ni.	Let's scrub the floor.	\N	1	14	2026-06-15 12:06:30	2026-06-15 12:06:30
019ecb2f-c973-7213-ae7a-662f75682ab9	019ec971-15a1-73f3-9143-463db4e852d3	Jom kita periksa label ukuran saiz baju dulu.	Let's check the size tag.	\N	1	18	2026-06-15 12:09:27	2026-06-15 12:09:27
019ecb2f-c975-73cc-946a-35b88456ab31	019ec971-15a1-73f3-9143-463db4e852d3	Kita dah berjaya cecah lapan ratus ayat !	We officially reached eight hundred!	\N	1	20	2026-06-15 12:09:27	2026-06-15 12:09:27
019ecb35-c614-7246-9b7f-9a714d2d72cd	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Berapa lama masa nak sampai ke sana?	How long does it take to get there?	\N	1	1	2026-06-15 12:15:59	2026-06-15 12:15:59
019ecb35-c617-7124-9b85-1e5921c324c6	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Saya langsung tak tahu apa yang dah jadi.	I have no idea what happened.	\N	1	3	2026-06-15 12:15:59	2026-06-15 12:15:59
019ecb35-c618-7256-817b-ab2360ed75f7	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Nanti maklumkan perkembangan pasal hal ni dekat saya.	Keep me updated on this.	\N	1	4	2026-06-15 12:15:59	2026-06-15 12:15:59
019ecb35-c619-70ea-adc8-e837ff785e41	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Ada kedai makan dekat-dekat sini tak?	Is there any restaurant nearby?	\N	1	5	2026-06-15 12:15:59	2026-06-15 12:15:59
019ecb39-13ee-7287-9312-447c034b93f7	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Awak dah terlepas isi penting	You missed the whole point.	\N	1	6	2026-06-15 12:19:36	2026-06-15 12:19:36
019ecb39-13f1-736c-a859-4862a6311c86	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Buat macam rumah sendiri.	Make yourself at home.	\N	1	8	2026-06-15 12:19:36	2026-06-15 12:19:36
019ecb39-13f3-7148-a1e7-793e123a40c2	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Benda ni masuk akal tak pada awak?	Does it make any sense to you?	\N	1	9	2026-06-15 12:19:36	2026-06-15 12:19:36
019ecb39-13f4-72b9-b714-e9351db6516f	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Saya kena ambil nafas kejap.	I need to catch my breath.	\N	1	10	2026-06-15 12:19:36	2026-06-15 12:19:36
019ecb3e-3691-70e6-995f-6478f9d21b82	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Lewat sikit tak apa daripada tak datang langsung.	Better late than never.	\N	1	11	2026-06-15 12:25:12	2026-06-15 12:25:12
019ecb3e-3693-7397-8e15-fbe87c4781c6	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Giliran siapa pulak sekarang ni?	Whose turn is it now?	\N	1	12	2026-06-15 12:25:12	2026-06-15 12:25:12
019ecb3e-3696-706e-bd0b-15780595b02e	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Ambil masa awak, tak payah gopoh.	Take your time, no rush.	\N	1	14	2026-06-15 12:25:12	2026-06-15 12:25:12
019ecb3e-3697-70a9-afdd-21266ffb2e04	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Awak boleh setelkan benda ni seorang diri tak?	Can you handle this on your own?	\N	1	15	2026-06-15 12:25:12	2026-06-15 12:25:12
019ecb40-7492-703a-a9db-3e0475c03077	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Siapa yang cerita kat awak pasal hal tu?	Who told you that story?	\N	1	18	2026-06-15 12:27:39	2026-06-15 12:27:39
019ecb40-7493-7164-8564-3a6ffc9bd3b6	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Saya betul-betul terlupa pasal masa.	I completely lost track of time.	\N	1	19	2026-06-15 12:27:39	2026-06-15 12:27:39
019ecb40-7495-7340-8630-38c8639f8ac0	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Dah sedia nak pesan makanan?	Are you ready to order?	\N	1	20	2026-06-15 12:27:39	2026-06-15 12:27:39
019ecb45-646c-70ed-98e9-20a859977d09	019ec971-3c06-73d6-a46f-37e35b743d3c	Macam mana eja nama awak?	How do you spell your name?	\N	1	1	2026-06-15 12:33:03	2026-06-15 12:33:03
019ecb45-646e-7281-86c9-080666c6c286	019ec971-3c06-73d6-a46f-37e35b743d3c	Masukkan nama saya sekali untuk esok.	Count me in for tomorrow.	\N	1	2	2026-06-15 12:33:03	2026-06-15 12:33:03
019ecb45-646f-71b5-8c0f-648c4665cc7e	019ec971-3c06-73d6-a46f-37e35b743d3c	Saya rasa macam tak sedap hati lah pasal benda ni.	I have a bad feeling about this.	\N	1	3	2026-06-15 12:33:03	2026-06-15 12:33:03
019ecb45-6471-70a4-a051-cceaff4ffe3c	019ec971-3c06-73d6-a46f-37e35b743d3c	Ikut kiri melainkan jika memotong.	Keep left unless overtaking.	\N	1	4	2026-06-15 12:33:03	2026-06-15 12:33:03
019ecb45-6472-7126-af81-77e6efd5466f	019ec971-3c06-73d6-a46f-37e35b743d3c	Ada orang duduk ke dekat kerusi ni?	Is this seat taken?	\N	1	5	2026-06-15 12:33:03	2026-06-15 12:33:03
019ece7f-8073-7228-ba30-062cf8546842	019ec971-3c06-73d6-a46f-37e35b743d3c	Ngam-ngam sampai tepat waktu.	I barely made it on time.	\N	1	7	2026-06-16 03:35:22	2026-06-16 03:35:22
019ece7f-8075-714d-b1ad-16a5d38bb0e7	019ec971-3c06-73d6-a46f-37e35b743d3c	Ikut suka awak lah kalau macam tu.	Suit yourself then.	\N	1	8	2026-06-16 03:35:22	2026-06-16 03:35:22
019ece7f-8076-700d-ade7-77a090222d19	019ec971-3c06-73d6-a46f-37e35b743d3c	Awak rasa makanan ni rasa pelik tak?	Does this taste weird to you?	\N	1	9	2026-06-16 03:35:22	2026-06-16 03:35:22
019ece7f-8077-726b-9d7c-b998f824227f	019ec971-3c06-73d6-a46f-37e35b743d3c	Saya kena tenangkan fikiran kejap.	I need to clear my head.	\N	1	10	2026-06-16 03:35:22	2026-06-16 03:35:22
019ece83-33a3-72a2-b948-cbaf92f22cdf	019ec971-3c06-73d6-a46f-37e35b743d3c	Kalau tak pecah ruyung, manakan dapat sagunya.	No pain, no gain.	\N	1	11	2026-06-16 03:39:25	2026-06-16 03:39:25
019ece83-33a5-7042-a259-72ec121a74ed	019ec971-3c06-73d6-a46f-37e35b743d3c	Kereta siapa yang tengah halang laluan ni?	Whose car is blocking the way?	\N	1	12	2026-06-16 03:39:25	2026-06-16 03:39:25
019ece83-33a8-72e0-aa3a-c712f461fe52	019ec971-3c06-73d6-a46f-37e35b743d3c	Siapa cepat, dia dapat.	First come, first served.	\N	1	14	2026-06-16 03:39:25	2026-06-16 03:39:25
019ece83-33a9-721a-a419-868135c8e044	019ec971-3c06-73d6-a46f-37e35b743d3c	Boleh awak cakap kuat sikit tak?	Can you speak up a bit?	\N	1	15	2026-06-16 03:39:25	2026-06-16 03:39:25
019ece87-3006-721a-bcd9-61d09288a6cf	019ec971-3c06-73d6-a46f-37e35b743d3c	Siapa yang bertanggungjawab dekat tempat ni?	Who is in charge of this place?	\N	1	18	2026-06-16 03:43:46	2026-06-16 03:43:46
019ece87-3008-72b4-879c-96bb0940adae	019ec971-3c06-73d6-a46f-37e35b743d3c	Saya betul-betul terlupa langsung pasal rancangan tu.	I totally forgot about that plan.	\N	1	19	2026-06-16 03:43:46	2026-06-16 03:43:46
019ece87-3009-73ea-a0bc-ec10c49ae7bc	019ec971-3c06-73d6-a46f-37e35b743d3c	Awak dah rasa sihat sikit ke sekarang?	Are you feeling any better now?	\N	1	20	2026-06-16 03:43:46	2026-06-16 03:43:46
019ece8d-d4d8-73c4-a9ca-2eb02a7120cb	019ec971-4b22-7178-8c67-fb890ecf9225	Macam mana awak boleh tahu pasal hal tu?	How did you find out about it?	\N	1	1	2026-06-16 03:51:02	2026-06-16 03:51:02
019ece8d-d4db-7172-a0f7-7597a7721b27	019ec971-4b22-7178-8c67-fb890ecf9225	Ambil je la baki tu	Keep the change.	\N	1	2	2026-06-16 03:51:02	2026-06-16 03:51:02
019ece8d-d4dc-7175-9f9e-fed74e3f1d7c	019ec971-4b22-7178-8c67-fb890ecf9225	Saya ada satu pengakuan nak dibuat.	I have a confession to make.	\N	1	3	2026-06-16 03:51:02	2026-06-16 03:51:02
019ecb2d-17d0-7041-a504-1582f6406dc5	019ec971-15a1-73f3-9143-463db4e852d3	Benda ni berat sangat nak angkat seorang diri.	It['s too heavy to carry alone/ is too heavy to carry alone].	\N	1	15	2026-06-15 12:06:30	2026-06-19 08:34:40
019ecb2f-c970-7277-9292-383813d467bd	019ec971-15a1-73f3-9143-463db4e852d3	Jangan bagi kuah sup tu tumpah.	[Don't spill the soup/Do not spill the soup].	\N	1	16	2026-06-15 12:09:27	2026-06-19 08:34:56
019ecb2f-c974-7069-a761-89ec86190403	019ec971-15a1-73f3-9143-463db4e852d3	Benda tu ada dekat atas meja kecil tepi katil.	It['s on the bedside table/ is on the bedside table].	\N	1	19	2026-06-15 12:09:27	2026-06-19 08:35:28
019ecb35-c616-73cd-9b90-04a7e23a28e8	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Jaga tepi kain sendiri.	[Mind your own business/Do not interfere in other people's business].	\N	1	2	2026-06-15 12:15:59	2026-06-19 08:57:27
019ecb39-13f0-727e-947c-2080ce6e1939	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Saya tak dapat nak bezakan.	I [can't tell the difference/ cannot tell the difference].	\N	1	7	2026-06-15 12:19:36	2026-06-19 08:58:23
019ecb40-748f-7395-a05c-bcac6eadc826	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Saya dah berubah fikiran pasal hal tu.	I['ve changed my mind about it/ have changed my mind about it].	\N	1	16	2026-06-15 12:27:39	2026-06-19 08:59:19
019ecb40-7491-733f-ba30-c1e06b1e3cc2	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Lagipun benda tu dah tak penting dah.	It [doesn't matter anyway/ does not matter anyway].	\N	1	17	2026-06-15 12:27:39	2026-06-19 08:59:34
019ece7f-8071-7124-a3f0-09f8f4691240	019ec971-3c06-73d6-a46f-37e35b743d3c	Awak tolong saya, nanti saya tolong awak balik.	You scratch my back, I['ll scratch yours/ will scratch yours].	\N	1	6	2026-06-16 03:35:22	2026-06-19 09:01:42
019ece83-33a6-735c-b3dc-7e72e40cac9b	019ec971-3c06-73d6-a46f-37e35b743d3c	Saya dah tak tahan dah dengan cuaca panas ni.	I [can't stand this heat anymore/ cannot stand this heat anymore].	\N	1	13	2026-06-16 03:39:25	2026-06-19 09:02:11
019ece87-3003-7096-bfa3-afc728be27d8	019ec971-3c06-73d6-a46f-37e35b743d3c	Saya rasa pernah nampak benda ni dekat mana-mana sebelum ni.	I['ve seen this somewhere before/ have seen this somewhere before].	\N	1	16	2026-06-16 03:43:46	2026-06-19 09:02:29
019ece87-3005-7184-ba3e-404ce415f6b2	019ec971-3c06-73d6-a46f-37e35b743d3c	Harga benda ni mahal gila.	It [costs an arm and a leg/ costs an arm and a leg].	\N	1	17	2026-06-16 03:43:46	2026-06-19 09:02:45
019ece8d-d4dd-7162-b69d-81ffe6d2b2dd	019ec971-4b22-7178-8c67-fb890ecf9225	Ada rezeki kita jumpa lagi.	See you when I see you.	\N	1	4	2026-06-16 03:51:02	2026-06-16 03:51:02
019ecf46-c231-7225-a504-fb343da3e74f	019ec971-7fed-7348-8560-c8f39615787b	Saya hampir tak dapat nak lelapkan mata langsung semalam.	I barely slept a wink last night.	\N	1	7	2026-06-16 07:13:01	2026-06-16 07:13:01
019ecf46-c232-7242-a201-7ee1d32ea71e	019ec971-7fed-7348-8560-c8f39615787b	Jangan segan-segan nak tanya kalau awak perlukan bantuan.	Feel free to ask if you need help.	\N	1	8	2026-06-16 07:13:01	2026-06-16 07:13:01
019ece8d-d4df-7364-ab40-5ccedf1593b3	019ec971-4b22-7178-8c67-fb890ecf9225	tren (LRT/MRT) lambat sampai tak harini?	Is there any delay on the train?	\N	1	5	2026-06-16 03:51:02	2026-06-16 03:54:36
019ece97-7886-70b1-9cac-c3143e777244	019ec971-4b22-7178-8c67-fb890ecf9225	Apa yang awak tanam, itulah yang awak tuai.	You reap what you sow.	\N	1	6	2026-06-16 04:01:33	2026-06-16 04:01:33
019ece97-7889-736a-8d03-ba32d5279943	019ec971-4b22-7178-8c67-fb890ecf9225	Silakan.	Be my guest.	\N	1	8	2026-06-16 04:01:33	2026-06-16 04:01:33
019ece97-788b-71e6-86d7-fb9cdfe03270	019ec971-4b22-7178-8c67-fb890ecf9225	Baju ni nampak sesuai tak dengan saya?	Does this dress look good on me?	\N	1	9	2026-06-16 04:01:33	2026-06-16 04:01:33
019ece97-788c-71f3-8269-5dc44c7485aa	019ec971-4b22-7178-8c67-fb890ecf9225	Saya nak renggangkan kaki kejap	I need to stretch my legs.	\N	1	10	2026-06-16 04:01:33	2026-06-16 04:01:33
019ecea0-c20d-71d0-8f44-f4f3345d9b8e	019ec971-4b22-7178-8c67-fb890ecf9225	Tindakan lebih membuktikan daripada sekadar kata-kata.	Actions speak louder than words.	\N	1	11	2026-06-16 04:11:42	2026-06-16 04:11:42
019ecea0-c20f-704b-9fde-90d1e60be87f	019ec971-4b22-7178-8c67-fb890ecf9225	Giliran siapa pulak nak memandu sekarang ni?	Whose turn is it to drive?	\N	1	12	2026-06-16 04:11:42	2026-06-16 04:11:42
019ecea0-c212-73bf-9b36-f79477b0b2d3	019ec971-4b22-7178-8c67-fb890ecf9225	Biar lambat, janji konsisten.	Slow and steady wins the race.	\N	1	14	2026-06-16 04:11:42	2026-06-16 04:11:42
019ecea0-c213-73e7-b74b-d805caa56da0	019ec971-4b22-7178-8c67-fb890ecf9225	Boleh tak awak turunkan saya kat sini je?	Can you drop me off here?	\N	1	15	2026-06-16 04:11:42	2026-06-16 04:11:42
019ecea6-915e-7310-becf-48c97dc33b66	019ec971-4b22-7178-8c67-fb890ecf9225	Kos nak menginap kat sana mahal gila.	It costs a fortune to stay there.	\N	1	17	2026-06-16 04:18:03	2026-06-16 04:18:03
019ecea6-915f-713c-9ba6-679317c3f14b	019ec971-4b22-7178-8c67-fb890ecf9225	Lagipun, siapa yang cadangkan tempat ni sebenarnya?	Who suggested this place anyway?	\N	1	18	2026-06-16 04:18:03	2026-06-16 04:18:03
019ecea6-9160-7188-b3d0-ca8d80d662c1	019ec971-4b22-7178-8c67-fb890ecf9225	Saya terus hilang selera makan langsung.	I completely lost my appetite.	\N	1	19	2026-06-16 04:18:03	2026-06-16 04:18:03
019ecea6-9161-71ae-a8dc-58659c0200e8	019ec971-4b22-7178-8c67-fb890ecf9225	Awak ni dah hilang akal ke?	Are you out of your mind?	\N	1	20	2026-06-16 04:18:03	2026-06-16 04:18:03
019eceb3-7109-7297-8ad5-ed205d2e8745	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Berapa jauh stesen minyak yang paling dekat?	How far is the nearest gas station?	\N	1	1	2026-06-16 04:32:06	2026-06-16 04:32:06
019eceb3-710b-7077-b422-409619c6dabd	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Fokus pandangan awak dekat jalan raya	Keep your eyes on the road.	\N	1	2	2026-06-16 04:32:06	2026-06-16 04:32:06
019eceb3-710d-7319-920e-8508f08cf92c	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Perasaan saya bercampur-baur la pasal hal ni	I have mixed feelings about this.	\N	1	3	2026-06-16 04:32:06	2026-06-16 04:32:06
019eceb3-710f-706a-a72b-bdd779bca43b	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Ada pilihan makanan vegetarian tak kat sini?	Is there any vegetarian option available?	\N	1	5	2026-06-16 04:32:06	2026-06-16 04:32:06
019eceba-6776-72cb-80cd-05bad6c03a00	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Aku hampir tak cam kau dengan gaya rambut macam tu.	I barely recognized you with that haircut.	\N	1	7	2026-06-16 04:39:43	2026-06-16 04:39:43
019eceba-6778-7168-b9e8-2a23cb167c96	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Mestilah boleh, silakan.	By all means, go ahead.	\N	1	8	2026-06-16 04:39:43	2026-06-16 04:39:43
019eceba-6779-70b4-b0eb-b6eb802cef20	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Awak rasa warna ni nampak terang sangat tak?	Does this color look too bright?	\N	1	9	2026-06-16 04:39:43	2026-06-16 04:39:43
019eceba-677a-70f4-9a92-281027640a3e	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Saya kena pergi ambil angin luar kejap.	I need to get some fresh air.	\N	1	10	2026-06-16 04:39:43	2026-06-16 04:39:43
019ecebd-6f68-71db-836a-ba9b93cb9c8c	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Kejujuran itu adalah tindakan yang paling terbaik.	Honesty is the best policy.	\N	1	11	2026-06-16 04:43:01	2026-06-16 04:43:01
019ecebd-6f6a-731a-8276-75996c56323f	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Jaket siapa yang tertinggal dekat atas kerusi ni?	Whose jacket is left on the chair?	\N	1	12	2026-06-16 04:43:01	2026-06-16 04:43:01
019ecebd-6f6d-72eb-bfc5-8f43c9b2c56a	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Setiap yang berlaku pasti ada hikmah yang tersendiri.	Every cloud has a silver lining.	\N	1	14	2026-06-16 04:43:01	2026-06-16 04:43:01
019ecebd-6f6e-7004-abd3-925101d41c58	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Boleh tolong hulurkan garam tu dekat saya tak?	Can you pass me the salt?	\N	1	15	2026-06-16 04:43:01	2026-06-16 04:43:01
019ececf-570a-723b-afd8-0672cf093e96	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Harga benda ni jauh lebih mahal daripada apa yang saya agak.	It costs way more than I expected.	\N	1	17	2026-06-16 05:02:35	2026-06-16 05:02:35
019ececf-570b-7114-a3af-fbeeb03b02c4	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Siapa yang bagi kebenaran tukar benda ni tanpa bagitahu saya?	Who authorized this change without telling me?	\N	1	18	2026-06-16 05:02:35	2026-06-16 05:02:35
019ececf-570d-7062-a776-9aa33ebb987d	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Saya betul-betul sesat jalan dekat dalam bangunan ni tadi.	I completely lost my way in the building.	\N	1	19	2026-06-16 05:02:35	2026-06-16 05:02:35
019ececf-570e-7377-9c36-427849e0fa61	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Awak ada kira jumlah mata (skor) sekarang ke?	Are you keeping track of the score?	\N	1	20	2026-06-16 05:02:35	2026-06-16 05:02:35
019ecf43-6612-736f-979e-0d7055d87b47	019ec971-7fed-7348-8560-c8f39615787b	Macam mana saya nak pergi ke perhentian bas dari sini?	How do I get to the bus stop from here?	\N	1	1	2026-06-16 07:09:21	2026-06-16 07:09:21
019ecf43-6614-701d-9a9c-55ae831faa41	019ec971-7fed-7348-8560-c8f39615787b	Tolong perlahankan sikit suara awak.	Keep your voice down, please.	\N	1	2	2026-06-16 07:09:21	2026-06-16 07:09:21
019ecf43-6615-739c-8039-9c32879302c2	019ec971-7fed-7348-8560-c8f39615787b	Jadual saya agak padat sikit petang ni.	I have a tight schedule this afternoon.	\N	1	3	2026-06-16 07:09:21	2026-06-16 07:09:21
019ecf43-6616-719b-b570-fe6f5e8ce344	019ec971-7fed-7348-8560-c8f39615787b	Cuba tengok kalau awak boleh betulkan selak pintu ni.	See if you can fix this latch.	\N	1	4	2026-06-16 07:09:21	2026-06-16 07:09:21
019ecf43-6617-7110-901e-21e057993b32	019ec971-7fed-7348-8560-c8f39615787b	Ada farmasi yang buka lagi ke jam macam ni?	Is there any pharmacy open at this hour?	\N	1	5	2026-06-16 07:09:21	2026-06-16 07:09:21
019ecf46-c234-702a-b2cb-63fffd80f0ca	019ec971-7fed-7348-8560-c8f39615787b	Awak rasa corak ni nampak serabut sangat tak?	Does this pattern look too messy?	\N	1	9	2026-06-16 07:13:01	2026-06-16 07:13:01
019ecf46-c235-7130-8f69-8fbf9590df2c	019ec971-7fed-7348-8560-c8f39615787b	Saya kena pergi perbaharui lesen memandu saya.	I need to renew my driving license.	\N	1	10	2026-06-16 07:13:01	2026-06-16 07:13:01
019ecea0-c210-7345-b3e7-3263cf7228fc	019ec971-4b22-7178-8c67-fb890ecf9225	Saya dah tak boleh tahan dengan bunyi bising ni.	I [can't put up with this noise/ cannot put up with this noise].	\N	1	13	2026-06-16 04:11:42	2026-06-19 09:05:57
019ecea6-915c-73af-8ac3-82b4989f8590	019ec971-4b22-7178-8c67-fb890ecf9225	Dah lama dah aku nak tanya kau...	I['ve been meaning to ask you/ have been meaning to ask you].	\N	1	16	2026-06-16 04:18:03	2026-06-19 09:07:21
019eceba-6774-726b-81bc-902f443340be	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Jangan menilai sesuatu hanya daripada luaran sahaja.	You [can't judge a book by its cover/ cannot judge a book by its cover].	\N	1	6	2026-06-16 04:39:43	2026-06-19 09:11:05
019ecebd-6f6b-7130-a281-c05d5abee12c	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Saya dah tak boleh bersabar dengan perangai macam ni.	I [can't put up with this attitude/ cannot put up with this attitude].	\N	1	13	2026-06-16 04:43:01	2026-06-19 09:18:20
019ececf-5708-7000-8395-f314d989a531	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Dah lama dah saya tertunggu-tunggu hari ni.	I['ve been looking forward to this day/ have been looking forward to this day].	\N	1	16	2026-06-16 05:02:35	2026-06-19 09:18:46
019ecf46-c22f-72c0-8927-167c1ab76ba3	019ec971-7fed-7348-8560-c8f39615787b	Awak janganlah ambil mudah sangat pasal sesuatu benda.	You [shouldn't take things for granted/ should not take things for granted].	\N	1	6	2026-06-16 07:13:01	2026-06-19 09:21:57
019ecf4d-f668-7110-8c99-c5223b5b8cfc	019ec971-7fed-7348-8560-c8f39615787b	Makin banyak berlatih, makin mahir.	Practice makes perfect.	\N	1	11	2026-06-16 07:20:53	2026-06-16 07:20:53
019ecf4d-f66a-7010-8b41-7be6f01dad07	019ec971-7fed-7348-8560-c8f39615787b	Giliran siapa pulak nak basuh pinggan sekarang ni?	Whose turn is it to wash the dishes?	\N	1	12	2026-06-16 07:20:53	2026-06-16 07:20:53
019ecf4d-f66e-70e6-ab09-ea3cc67beee0	019ec971-7fed-7348-8560-c8f39615787b	Boleh tolong pegang benda ni kejap tak?	Can you hold this for a second?	\N	1	15	2026-06-16 07:20:53	2026-06-16 07:20:53
019ecf50-cc75-71d3-b6a3-5f7a5e88e5fc	019ec971-7fed-7348-8560-c8f39615787b	Benda tu perlukan usaha yang banyak kalau nak buat.	It takes a lot of effort to do that.	\N	1	17	2026-06-16 07:23:59	2026-06-16 07:23:59
019ecf50-cc76-72bc-8755-e9dfd70379d7	019ec971-7fed-7348-8560-c8f39615787b	Siapa yang biarkan paip air terbuka dekat dalam bilik air?	Who left the tap running in the bathroom?	\N	1	18	2026-06-16 07:23:59	2026-06-16 07:23:59
019ecf50-cc78-71cc-a7c8-927249c54cc1	019ec971-7fed-7348-8560-c8f39615787b	Saya betul-betul lupa kat mana saya letak kereta tadi.	I completely forgot where I parked my car.	\N	1	19	2026-06-16 07:23:59	2026-06-16 07:23:59
019ecf50-cc79-71fe-bbf9-dfedad435b79	019ec971-7fed-7348-8560-c8f39615787b	Awak ada rancang nak pergi mana-mana ke esok?	Are you planning to go anywhere tomorrow?	\N	1	20	2026-06-16 07:23:59	2026-06-16 07:23:59
019ecf62-2283-730f-b61b-f6cd03026c55	019ec971-9105-70ba-bfc2-c66fd8419534	Macam mana awak selalu luangkan masa hujung minggu?	How do you usually spend your weekend?	\N	1	1	2026-06-16 07:42:55	2026-06-16 07:42:55
019ecf62-2285-73cd-add4-26878b50bb3b	019ec971-9105-70ba-bfc2-c66fd8419534	Jaga jarak awak dari kawasan tepi tu.	Keep your distance from the edge.	\N	1	2	2026-06-16 07:42:55	2026-06-16 07:42:55
019ecf62-2286-73fe-8303-b6d82f23ab52	019ec971-9105-70ba-bfc2-c66fd8419534	Kepala saya rasa sakit mencucuk-cucuk sangat sekarang ni.	I have a splitting headache right now.	\N	1	3	2026-06-16 07:42:55	2026-06-16 07:42:55
019ecf62-2288-7274-98fb-d1ed3a5e3f1c	019ec971-9105-70ba-bfc2-c66fd8419534	Cuba tengok kalau ada apa-apa baucar diskaun.	See if there is any discount voucher.	\N	1	4	2026-06-16 07:42:55	2026-06-16 07:42:55
019ecf62-2289-7389-b0d5-7cc7e6f359bd	019ec971-9105-70ba-bfc2-c66fd8419534	Ada jalan pintas tak nak elak kesesakan lalu lintas (jem) ni?	Is there any shortcut to avoid the traffic?	\N	1	5	2026-06-16 07:42:55	2026-06-16 07:42:55
019ecf66-6fda-70a9-9307-fc462a952d62	019ec971-9105-70ba-bfc2-c66fd8419534	Saya hampir dah tak kenal tempat ni lagi.	I barely recognized this place anymore.	\N	1	7	2026-06-16 07:47:37	2026-06-16 07:47:37
019ecf66-6fdb-7107-bf4b-74fb172802e6	019ec971-9105-70ba-bfc2-c66fd8419534	Pastikan awak periksa kunci tu dua kali.	Make sure you double-check the lock.	\N	1	8	2026-06-16 07:47:37	2026-06-16 07:47:37
019ecf66-6fdc-7026-8dd7-28b222fabb43	019ec971-9105-70ba-bfc2-c66fd8419534	Awak rasa ton warna ni nampak gelap sangat tak untuk bilik ni?	Does this shade look too dark for the room?	\N	1	9	2026-06-16 07:47:37	2026-06-16 07:47:37
019ecf66-6fdd-7200-b5a7-f650e80d5cf1	019ec971-9105-70ba-bfc2-c66fd8419534	Saya kena pergi tambah nilai kad Touch 'n Go saya.	I need to top up my Touch 'n Go card.	\N	1	10	2026-06-16 07:47:37	2026-06-16 07:47:37
019ecf6b-1111-70c1-adba-95f2a861db02	019ec971-9105-70ba-bfc2-c66fd8419534	Giliran siapa pulak nak kunci pejabat sekarang ni?	Whose turn is it to lock up the office?	\N	1	12	2026-06-16 07:52:40	2026-06-16 07:52:40
019ecf6b-1114-7080-8bf6-c7d606e67d54	019ec971-9105-70ba-bfc2-c66fd8419534	Siapa yang bertindak awal, dia yang akan dapat hasil dulu.	The early bird catches the worm.	\N	1	14	2026-06-16 07:52:40	2026-06-16 07:52:40
019ecf6b-1115-71e4-b2c4-9323cc5f34a6	019ec971-9105-70ba-bfc2-c66fd8419534	Boleh awak cadangkan tempat menarik untuk dilawati?	Can you recommend a good place to visit?	\N	1	15	2026-06-16 07:52:40	2026-06-16 07:52:40
019ecf6d-13c9-71f8-abd1-2a00ab118d93	019ec971-9105-70ba-bfc2-c66fd8419534	Benda ni memang perlukan kesabaran yang tinggi nak hadap.	It takes a lot of patience to deal with this.	\N	1	17	2026-06-16 07:54:52	2026-06-16 07:54:52
019ecf6d-13ca-7319-a967-037f116bab6f	019ec971-9105-70ba-bfc2-c66fd8419534	Siapa yang biarkan pintu peti ais terbuka luas ni?	Who left the fridge door wide open?	\N	1	18	2026-06-16 07:54:52	2026-06-16 07:54:52
019ecf6d-13cc-71ff-bb7e-01ca6d9269c4	019ec971-9105-70ba-bfc2-c66fd8419534	Saya betul-betul terlupa nak balas mesej awak tadi.	I completely forgot to reply to your text.	\N	1	19	2026-06-16 07:54:52	2026-06-16 07:54:52
019ecf6d-13cd-7080-be2f-ada442dc946d	019ec971-9105-70ba-bfc2-c66fd8419534	Awak jangka ada tetamu nak datang ke petang ni?	Are you expecting any guests this evening?	\N	1	20	2026-06-16 07:54:52	2026-06-16 07:54:52
019ecf7a-23da-7136-bb02-232ecaeb1875	019ec971-a979-71b1-9e94-a481f27f69f6	Macam mana awak boleh kawal diri untuk kekal tenang macam tu sekali?	How do you manage to stay so calm?	\N	1	1	2026-06-16 08:09:08	2026-06-16 08:09:08
019ecf7a-23dc-710d-834b-625890525a7e	019ec971-a979-71b1-9e94-a481f27f69f6	Tolong jangan sentuh barang-barang pameran tu.	Keep your hands off the display items.	\N	1	2	2026-06-16 08:09:08	2026-06-16 08:09:08
019ecf7a-23dd-73a9-86c5-f5677dff2b88	019ec971-a979-71b1-9e94-a481f27f69f6	Tekak saya rasa macam perit sikit hari ni.	I have a scratchy throat today.	\N	1	3	2026-06-16 08:09:08	2026-06-16 08:09:08
019ecf7a-23de-7082-a374-87a06824adf5	019ec971-a979-71b1-9e94-a481f27f69f6	Cuba tengok kalau awak boleh muatkan benda ni dalam kereta.	See if you can squeeze this into the car.	\N	1	4	2026-06-16 08:09:08	2026-06-16 08:09:08
019ecf7a-23df-70a0-ae6d-d1fc4c262d00	019ec971-a979-71b1-9e94-a481f27f69f6	Ada dikenakan caj penghantaran tak untuk kawasan ni?	Is there any delivery charge for this area?	\N	1	5	2026-06-16 08:09:08	2026-06-16 08:09:08
019ecf7c-759f-70de-9cf6-0983cf366199	019ec971-a979-71b1-9e94-a481f27f69f6	Barang padan dengan harga yang kita bayar.	You get what you pay for.	\N	1	6	2026-06-16 08:11:40	2026-06-16 08:11:40
019ecf7c-75a1-7034-83c6-9a2c559e6336	019ec971-a979-71b1-9e94-a481f27f69f6	Sekali imbas tadi saya hampir tak perasan pun apa bezanya.	I barely noticed the difference at first glance.	\N	1	7	2026-06-16 08:11:40	2026-06-16 08:11:40
019ecf7c-75a3-70a9-9668-8823a28efc4c	019ec971-a979-71b1-9e94-a481f27f69f6	Awak rasa kain ni nampak kasar sangat tak pada kulit awak?	Does this fabric feel too rough for you?	\N	1	9	2026-06-16 08:11:40	2026-06-16 08:11:40
019ecf7c-75a5-73eb-988e-1670f316fe29	019ec971-a979-71b1-9e94-a481f27f69f6	Saya kena pergi perbaharui pasport saya tak lama lagi.	I need to renew my passport soon.	\N	1	10	2026-06-16 08:11:40	2026-06-16 08:11:40
019ecf7f-a8b6-7164-8ff7-e1946f1e50a1	019ec971-a979-71b1-9e94-a481f27f69f6	Fikir masak-masak sebelum bertindak.	Look before you leap.	\N	1	11	2026-06-16 08:15:10	2026-06-16 08:15:10
019ecf7f-a8b8-72d9-a27c-f7e61e5cd608	019ec971-a979-71b1-9e94-a481f27f69f6	Giliran siapa pulak nak pergi buang sampah sekarang ni?	Whose turn is it to throw the garbage?	\N	1	12	2026-06-16 08:15:10	2026-06-16 08:15:10
019ecf7f-a8bb-7103-9c62-d30689c970eb	019ec971-a979-71b1-9e94-a481f27f69f6	Setiap orang pasti akan ada masa untuk dia berjaya atau bersinar juga nanti.	Every dog has its day.	\N	1	14	2026-06-16 08:15:10	2026-06-16 08:15:10
019ecf4d-f66c-73f5-9443-278a5b0bc702	019ec971-7fed-7348-8560-c8f39615787b	Masa cepat betul berlalu bila kita tengah seronok.	Time flies when [you're having fun/ you are having fun].	\N	1	14	2026-06-16 07:20:53	2026-06-19 09:22:51
019ecf50-cc73-7279-835b-2274491ddea5	019ec971-7fed-7348-8560-c8f39615787b	Dah seminggu saya berlatih buat benda ni.	I['ve been practicing this for a week/ have been practicing this for a week].	\N	1	16	2026-06-16 07:23:59	2026-06-19 09:23:10
019ecf6b-110f-734d-8583-4ec3fcf7198b	019ec971-9105-70ba-bfc2-c66fd8419534	Jangan buat andaian sebelum benda tu betul-betul jadi.	[Don't count your chickens before they hatch/Do not count your chickens before they hatch].	\N	1	11	2026-06-16 07:52:40	2026-06-19 09:27:49
019ecf6b-1112-73df-a525-8cf8d9e54cf0	019ec971-9105-70ba-bfc2-c66fd8419534	Saya belum boleh bagitahu awak rahsia tu buat masa ni.	I [can't tell you the secret yet/ cannot tell you the secret yet].	\N	1	13	2026-06-16 07:52:40	2026-06-19 09:28:08
019ecf6d-13c7-706a-bb13-8ca36f854e6e	019ec971-9105-70ba-bfc2-c66fd8419534	Sejak menjak dua tiga hari ni saya kerap tidur lewat sangat.	I['ve been staying up late these past few days/ have been staying up late these past few days].	\N	1	16	2026-06-16 07:54:52	2026-06-19 09:28:56
019ecf7c-75a2-7082-97f7-dddf91d9681a	019ec971-a979-71b1-9e94-a481f27f69f6	Pastikan awak tak terlajak tidur pulak esok pagi.	Make sure you [don't oversleep tomorrow/ do not oversleep tomorrow].	\N	1	8	2026-06-16 08:11:40	2026-06-19 09:32:48
019ecf7f-a8bc-7349-b99b-1a5c192cdf9a	019ec971-a979-71b1-9e94-a481f27f69f6	Boleh awak cadangkan tempat makan tengah hari yang best?	Can you recommend a good place for lunch?	\N	1	15	2026-06-16 08:15:10	2026-06-16 08:15:10
019ecfda-5d20-70c9-b85c-5e521b2c7314	019ec971-a979-71b1-9e94-a481f27f69f6	Benda ni memang perlukan banyak latihan kalau nak bagi buat dengan betul.	It takes a lot of practice to get it right.	\N	1	17	2026-06-16 09:54:14	2026-06-16 09:54:14
019ecfda-5d21-7258-8c6d-a82338998b2a	019ec971-a979-71b1-9e94-a481f27f69f6	Siapa yang biarkan pintu pagar utama terbuka luas tadi?	Who left the main gate wide open just now?	\N	1	18	2026-06-16 09:54:14	2026-06-16 09:54:14
019ecfda-5d23-70d0-ac59-b4dd523dab87	019ec971-a979-71b1-9e94-a481f27f69f6	Saya betul-betul terlupa nak tutup suis seterika tadi.	I completely forgot to turn off the iron.	\N	1	19	2026-06-16 09:54:14	2026-06-16 09:54:14
019ecfda-5d24-7030-98d7-cbc1d4cb4ae3	019ec971-a979-71b1-9e94-a481f27f69f6	Awak ada rancang nak ambil cuti ke minggu depan?	Are you planning to take a leave next week?	\N	1	20	2026-06-16 09:54:14	2026-06-16 09:54:14
019ecfe4-4517-7047-bdab-de7f6ccb7c7d	019ec971-c320-7098-82fd-5a43571272aa	Macam mana awak sabar dengan jalan jem setiap pagi?	How do you cope with the traffic every morning?	\N	1	1	2026-06-16 10:05:04	2026-06-16 10:05:04
019ecfe4-4519-7122-8db4-2288440fd0f4	019ec971-c320-7098-82fd-5a43571272aa	Susun kasut awak bagi kemas dekat atas rak tu.	Keep your shoes tidy on the rack.	\N	1	2	2026-06-16 10:05:04	2026-06-16 10:05:04
019ecfe4-451a-72a3-a33a-8beead59880a	019ec971-c320-7098-82fd-5a43571272aa	Leher saya rasa sakit sebab salah tidur semalam.	I have a stiff neck from sleeping wrongly.	\N	1	3	2026-06-16 10:05:04	2026-06-16 10:05:04
019ecfe4-451c-73d6-b7fa-85d0df0fddfb	019ec971-c320-7098-82fd-5a43571272aa	Cuba tengok kalau awak boleh dapatkan balik duit (refund) untuk benda ni.	See if you can get a refund for this.	\N	1	4	2026-06-16 10:05:04	2026-06-16 10:05:04
019ecfe4-451d-7026-8200-140c86bffe99	019ec971-c320-7098-82fd-5a43571272aa	Ada apa-apa barang atas nama saya tak?	Is there any parcel under my name?	\N	1	5	2026-06-16 10:05:04	2026-06-16 10:05:04
019ecfe8-00b8-718b-b0ab-77ad442ede59	019ec971-c320-7098-82fd-5a43571272aa	Saya hampir tak cam suara awak tadi dalam telefon.	I barely recognized your voice over the phone.	\N	1	7	2026-06-16 10:09:08	2026-06-16 10:09:08
019ecfe8-00ba-7333-87ce-e90dbde7f02a	019ec971-c320-7098-82fd-5a43571272aa	Awak rasa kuah sup ni rasa agak tawar sikit tak?	Does this soup taste a bit bland to you?	\N	1	9	2026-06-16 10:09:08	2026-06-16 10:09:08
019ecfe8-00bb-7389-99d9-2ff7541d1c5d	019ec971-c320-7098-82fd-5a43571272aa	Saya kena pergi tunaikan cek ni dekat bank.	I need to cash this cheque at the bank.	\N	1	10	2026-06-16 10:09:08	2026-06-16 10:09:08
019ecff2-3848-7189-973c-f86a9ec59c00	019ec971-c320-7098-82fd-5a43571272aa	Baik beringat sebelum kena.	Better safe than sorry.	\N	1	11	2026-06-16 10:20:18	2026-06-16 10:20:18
019ecff2-384a-7161-828b-10790e5a689d	019ec971-c320-7098-82fd-5a43571272aa	Giliran siapa pulak nak kena ambil budak-budak tu?	Whose turn is it to pick up the kids?	\N	1	12	2026-06-16 10:20:18	2026-06-16 10:20:18
019ecff2-384e-71f3-8f81-dfe043686d32	019ec971-c320-7098-82fd-5a43571272aa	Boleh awak cadangkan mekanik kereta yang boleh dipercayai dekat-dekat sini?	Can you recommend a reliable mechanic nearby?	\N	1	15	2026-06-16 10:20:18	2026-06-16 10:20:18
019ecff6-2800-73c4-9b45-c9f94ddb6fb9	019ec971-c320-7098-82fd-5a43571272aa	Bukan senang nak ada keberanian untuk mengaku kesilapan sendiri.	It takes a lot of courage to admit mistakes.	\N	1	17	2026-06-16 10:24:36	2026-06-16 10:24:36
019ecff6-2801-7278-a8ee-d2fc112a2f94	019ec971-c320-7098-82fd-5a43571272aa	Siapa yang tinggalkan kesan tapak kaki berlumpur atas lantai ni?	Who left these muddy footprints on the floor?	\N	1	18	2026-06-16 10:24:36	2026-06-16 10:24:36
019ecff6-2802-71f4-9c9b-2e231d2518a0	019ec971-c320-7098-82fd-5a43571272aa	Saya betul-betul terlupa nak kunci pintu pagar belakang tadi.	I completely forgot to lock the back gate.	\N	1	19	2026-06-16 10:24:36	2026-06-16 10:24:36
019ecff6-2803-70c5-9541-bd2ba87cccce	019ec971-c320-7098-82fd-5a43571272aa	Awak ada nak pergi perjumpaan hujung minggu ni ke?	Are you attending the gathering this weekend?	\N	1	20	2026-06-16 10:24:36	2026-06-16 10:24:36
019ecffa-5847-7136-b623-fa04a8a7f908	019ec971-d8bf-72a9-86a8-551a5706f0dc	Macam mana awak kekalkan motivasi diri untuk bersenam?	How do you keep yourself motivated to exercise?	\N	1	1	2026-06-16 10:29:10	2026-06-16 10:29:10
019ecffa-5849-73b7-bb9f-4ae51763ec62	019ec971-d8bf-72a9-86a8-551a5706f0dc	Pastikan meja kerja awak bersih daripada barang bersepah.	Keep your workspace free of clutter.	\N	1	2	2026-06-16 10:29:10	2026-06-16 10:29:10
019ecffa-584c-720c-8e4a-7c2cbe97e638	019ec971-d8bf-72a9-86a8-551a5706f0dc	Cuba tengok kalau awak boleh ambil sudut yang lagi cantik untuk gambar tu.	See if you can get a better angle for the photo.	\N	1	4	2026-06-16 10:29:10	2026-06-16 10:29:10
019ecffa-584d-7391-851a-5f6c1132b70d	019ec971-d8bf-72a9-86a8-551a5706f0dc	Ada kedai makan yang mesra vegetarian tak dekat-dekat sini?	Is there any vegetarian-friendly restaurant nearby?	\N	1	5	2026-06-16 10:29:10	2026-06-16 10:29:10
019ecfff-bb8d-70e5-8187-09a17fcf8565	019ec971-d8bf-72a9-86a8-551a5706f0dc	Saya hampir dah tak cam pekan ni selepas sepuluh tahun.	I barely recognized the town after ten years.	\N	1	7	2026-06-16 10:35:03	2026-06-16 10:35:03
019ecfff-bb8f-71f3-b0ca-1cab727af965	019ec971-d8bf-72a9-86a8-551a5706f0dc	Awak rasa tekstur benda ni nampak melekit sangat tak pada tangan?	Does this texture feel too sticky to you?	\N	1	9	2026-06-16 10:35:03	2026-06-16 10:35:03
019ecfff-bb90-712e-a9d9-9274a38a4644	019ec971-d8bf-72a9-86a8-551a5706f0dc	Saya kena pergi setelkan bil-bil tertunggak saya hari ni.	I need to settle my outstanding bills today.	\N	1	10	2026-06-16 10:35:03	2026-06-16 10:35:03
019ed005-7e6d-72e1-ba51-78d6e100ff27	019ec971-d8bf-72a9-86a8-551a5706f0dc	Orang yang sekepala (sama perangai) selalunya akan berkawan bersama.	Birds of a feather flock together.	\N	1	11	2026-06-16 10:41:21	2026-06-16 10:41:21
019ed005-7e6f-71b8-abca-9afb5f6c22f7	019ec971-d8bf-72a9-86a8-551a5706f0dc	Giliran siapa pulak yang kena uruskan meeting kali ni?	Whose turn is it to host the meeting?	\N	1	12	2026-06-16 10:41:21	2026-06-16 10:41:21
019ed005-7e73-7304-8018-28d8775ba06d	019ec971-d8bf-72a9-86a8-551a5706f0dc	Boleh awak cadangkan ejen penjual kereta yang boleh dipercayai kat sini?	Can you recommend a trustable car dealer here?	\N	1	15	2026-06-16 10:41:21	2026-06-16 10:41:21
019ecfe8-00b6-7247-a3c1-5b629abe1914	019ec971-c320-7098-82fd-5a43571272aa	Awak jangan cepat sangat nak nilai orang.	You [shouldn't judge someone so quickly/ should not judge someone so quickly].	\N	1	6	2026-06-16 10:09:08	2026-06-19 09:39:04
019ecff2-384b-71f2-bfa3-ad5c97a90ecd	019ec971-c320-7098-82fd-5a43571272aa	Saya tak dapat nak bayangkan tinggal dekat tempat yang sibuk macam ni.	I [can't imagine living in such a busy place/ cannot imagine living in such a busy place].	\N	1	13	2026-06-16 10:20:18	2026-06-19 09:40:22
019ecff2-384d-7058-b4a2-d080ca81dbb5	019ec971-c320-7098-82fd-5a43571272aa	Suatu kejayaan takkan terhasil dalam masa satu hari je	Rome [wasn't built in a day/ was not built in a day].	\N	1	14	2026-06-16 10:20:18	2026-06-19 09:40:47
019ecff6-27fe-705a-be7c-69689e6f559c	019ec971-c320-7098-82fd-5a43571272aa	Sejak menjak ni saya rasa badan macam kurang sihat sikit.	I['ve been feeling a bit under the weather lately/ have been feeling a bit under the weather lately].	\N	1	16	2026-06-16 10:24:36	2026-06-19 09:41:25
019ecffa-584b-7158-b955-4b24036a6438	019ec971-d8bf-72a9-86a8-551a5706f0dc	Pandangan saya rasa kabur kalau tak pakai cermin mata.	I have blurry vision without my glasses.	\N	1	3	2026-06-16 10:29:10	2026-06-19 09:45:06
019ecfff-bb8b-7036-9979-13dac4679e50	019ec971-d8bf-72a9-86a8-551a5706f0dc	Awak janganlah cepat sangat buat tuduhan tanpa bukti.	You [shouldn't jump to conclusions without proof/ should not jump to conclusions without proof].	\N	1	6	2026-06-16 10:35:03	2026-06-19 09:45:41
019ed005-7e71-7090-8721-d4263860fad4	019ec971-d8bf-72a9-86a8-551a5706f0dc	Saya tak dapat nak bayangkan macam mana nak hadap tekanan ni seorang diri.	I [can't imagine coping with this pressure alone/ cannot imagine coping with this pressure alone].	\N	1	13	2026-06-16 10:41:21	2026-06-19 09:46:23
019ed005-7e72-7379-9556-82a22be63bab	019ec971-d8bf-72a9-86a8-551a5706f0dc	Jangan letakkan semua risiko dalam satu tempat sahaja	[Don't put all your eggs in one basket/Do not put all your eggs in one basket].	\N	1	14	2026-06-16 10:41:21	2026-06-19 09:46:40
019ed008-452f-705c-9ce0-d2f28678a535	019ec971-d8bf-72a9-86a8-551a5706f0dc	Sejak menjak minggu ni saya rasa macam agak serabut	I['ve been feeling a bit overwhelmed this week/ have been feeling a bit overwhelmed this week].	\N	1	16	2026-06-16 10:44:23	2026-06-19 09:47:23
019ed008-4531-7362-9d18-5d20c935d1b3	019ec971-d8bf-72a9-86a8-551a5706f0dc	Benda ni memang perlukan kerjasama kumpulan yang kuat kalau nak bagi berjaya.	It takes a lot of teamwork to pull this off.	\N	1	17	2026-06-16 10:44:23	2026-06-16 10:44:23
019ed008-4533-71c6-af4c-0805dca2bb9d	019ec971-d8bf-72a9-86a8-551a5706f0dc	Siapa yang biarkan tuala basah atas katil ni?	Who left these wet towels on the bed?	\N	1	18	2026-06-16 10:44:23	2026-06-16 10:44:23
019ed008-4534-7362-84e7-8151b0bb651d	019ec971-d8bf-72a9-86a8-551a5706f0dc	Saya betul-betul terlupa nak buat salinan fail saya tadi.	I completely forgot to back up my files.	\N	1	19	2026-06-16 10:44:23	2026-06-16 10:44:23
019ed008-4536-72d1-ab4b-3a0499b61868	019ec971-d8bf-72a9-86a8-551a5706f0dc	Awak ada rancang nak mendaftar untuk kursus tu ke?	Are you planning to sign up for the course?	\N	1	20	2026-06-16 10:44:23	2026-06-16 10:44:23
019ed00e-b1ab-705d-a55a-ae77e79f0c65	019ed008-c390-7118-b4d0-c7bc854dcaf4	Macam mana awak pantau perbelanjaan harian awak?	How do you keep track of your daily expenses?	\N	1	1	2026-06-16 10:51:24	2026-06-16 10:51:24
019ed00e-b1ad-70ca-bc5c-0fee7d874e05	019ed008-c390-7118-b4d0-c7bc854dcaf4	Pastikan kata laluan awak disimpan selamat dan rahsia.	Keep your password safe and confidential.	\N	1	2	2026-06-16 10:51:24	2026-06-16 10:51:24
019ed00e-b1b0-71fc-ace5-811a2ff7f954	019ed008-c390-7118-b4d0-c7bc854dcaf4	Cuba tengok kalau awak boleh dapat diskaun lagi murah dekat tempat lain.	See if you can get a better discount elsewhere.	\N	1	4	2026-06-16 10:51:24	2026-06-16 10:51:24
019ed00e-b1b1-7056-8594-264d18b8cb3d	019ed008-c390-7118-b4d0-c7bc854dcaf4	Ada apa-apa pengangkutan awam tak dekat kawasan sini?	Is there any public transport available nearby?	\N	1	5	2026-06-16 10:51:24	2026-06-16 10:51:24
019ed010-e70c-7202-a66e-5d9c0199d595	019ed008-c390-7118-b4d0-c7bc854dcaf4	Saya hampir tak perasan masa berlalu cepat sangat tadi.	I barely noticed the time passing by just now.	\N	1	7	2026-06-16 10:53:49	2026-06-16 10:53:49
019ed010-e70d-7049-8c0b-13793e79fb5b	019ed008-c390-7118-b4d0-c7bc854dcaf4	Pastikan awak periksa resit tu dua kali sebelum keluar	Make sure you double-check the receipt before leaving.	\N	1	8	2026-06-16 10:53:49	2026-06-16 10:53:49
019ed010-e70f-701a-bca4-568fdf00d69d	019ed008-c390-7118-b4d0-c7bc854dcaf4	Saya kena jelaskan hutang tertunggak saya sebelum minggu ni.	I need to clear my outstanding debt by this week.	\N	1	10	2026-06-16 10:53:49	2026-06-16 10:53:49
019ed014-e9cf-700f-91a1-11f155bbe65e	019ed008-c390-7118-b4d0-c7bc854dcaf4	Ketawa itu adalah ubat yang paling mujarab untuk hilangkan stres.	Laughter is the best medicine.	\N	1	11	2026-06-16 10:58:12	2026-06-16 10:58:12
019ed014-e9d1-73b8-9cfd-2d4fa65e84ca	019ed008-c390-7118-b4d0-c7bc854dcaf4	Giliran siapa pulak nak bayar makan sekarang ni?	Whose turn is it to pay for the meal?	\N	1	12	2026-06-16 10:58:12	2026-06-16 10:58:12
019ed014-e9d4-72a6-b400-6b819091c944	019ed008-c390-7118-b4d0-c7bc854dcaf4	Masuk kandang kambing mengembek, masuk kandang kerbau menguak.	When in Rome, do as the Romans do.	\N	1	14	2026-06-16 10:58:12	2026-06-16 10:58:12
019ed014-e9d5-72a1-89f4-0dd258eed880	019ed008-c390-7118-b4d0-c7bc854dcaf4	Boleh awak cadangkan tempat yang best untuk beli barang dapur?	Can you recommend a good place to buy groceries?	\N	1	15	2026-06-16 10:58:12	2026-06-16 10:58:12
019ed01a-4d69-73d6-9e35-1a9c73959a30	019ed008-c390-7118-b4d0-c7bc854dcaf4	Benda ni memang perlukan disiplin yang tinggi kalau nak capai matlamat.	It takes a lot of discipline to achieve this goal.	\N	1	17	2026-06-16 11:04:05	2026-06-16 11:04:05
019ed01a-4d6b-730b-aedf-ccdd18c935e3	019ed008-c390-7118-b4d0-c7bc854dcaf4	Siapa yang biarkan pinggan mangkuk kotor ni terbiar dalam sinki semalaman?	Who left these dirty dishes in the sink overnight?	\N	1	18	2026-06-16 11:04:05	2026-06-16 11:04:05
019ed01a-4d6c-7273-86ab-628d3a0ad141	019ed008-c390-7118-b4d0-c7bc854dcaf4	Saya betul-betul terlupa nak kunci pintu kereta tadi.	I completely forgot to lock the car door just now.	\N	1	19	2026-06-16 11:04:05	2026-06-16 11:04:05
019ed01a-4d6d-70ff-9b99-010c0d8537dd	019ed008-c390-7118-b4d0-c7bc854dcaf4	Tahniah! Kita dah berjaya capai sasaran seribu ayat semuanya!	We officially accomplished our one thousand sentences target!	\N	1	20	2026-06-16 11:04:05	2026-06-16 11:04:05
019ed00e-b1ae-7188-b839-a740e593b8c6	019ed008-c390-7118-b4d0-c7bc854dcaf4	Aku rasa macam tak sedap hatilah, macam ada benda tak kena	I have a gut feeling that something is wrong.	\N	1	3	2026-06-16 10:51:24	2026-06-17 02:39:10
019e7b92-2866-73bb-b02e-aec30e8df203	019e720d-251d-70c9-859b-dbad677ca8bc	Maaf, saya nak beli yang ini.	Excuse me, I [wanna/want to] buy this.	\N	1	1	2026-05-31 01:07:16	2026-06-17 10:42:14
019e7d72-ba9a-70ec-bf23-727cc4f9c3d1	019e7cda-d8e8-703f-940a-1d6087ab6dc3	Saya pasti tentang perkara ni.	I['m sure about this/ am sure about this].	\N	1	11	2026-05-31 09:52:11	2026-06-19 01:05:48
019e71e1-3273-7288-ac2e-40fac328fb6d	019e71d7-71e3-71b8-8003-6b0e9ed89ef9	Wei, nak pergi minum kopi sekarang tak?	Hey, do you [wanna/want to] grab some coffee now?	\N	1	10	2026-05-29 03:57:24	2026-06-17 11:09:42
019e7d7f-1a5b-72dd-a55a-a7da49735008	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Apa perkembangan terbaru?	What['s the update/ is the update]?	\N	1	1	2026-05-31 10:05:42	2026-06-19 01:07:40
019e7bab-79fa-7084-96ab-cb12e2c8c5cb	019e720d-5252-70fc-bed5-16a997fd50f2	Tahniah!	[Congrats/Congratulations]!	\N	1	18	2026-05-31 01:34:55	2026-06-17 12:16:16
019e7bc2-de08-73f7-aa5d-83b23cdf54e1	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Tak ada hal lah.	[Don't/Do not] mention it.	\N	1	11	2026-05-31 02:00:28	2026-06-17 12:20:29
019e7b96-cf88-70e2-ad7f-9d5b79ce5710	019e720d-251d-70c9-859b-dbad677ca8bc	Wei! Dah bertahun rasanya sejak kali terakhir kita jumpa.	Hey! It['s/ has] been years since we last met.	\N	1	19	2026-05-31 01:12:21	2026-06-18 11:58:52
019e7bbf-eaf4-71b3-a44e-9a3c0765bb53	019e77fd-ea28-71d0-9d94-a0c18b8a418e	Ada cerita baru tak?	What['s/ is] new?	\N	1	1	2026-05-31 01:57:15	2026-06-18 12:51:07
019e7cf3-638e-73cf-bd65-d882118a0864	019e7cda-8953-7306-b15b-1df831470d8a	Awak ada masa tak hari ni?	[You free today/Are you free today]?	\N	1	1	2026-05-31 07:33:06	2026-06-19 00:41:31
019e7d0a-dcea-71d9-9b64-2f60bd0440af	019e7cda-a2e1-7354-a433-5f119e57ba21	Apa rancangannya?	What['s the plan/is the plan]?	\N	1	1	2026-05-31 07:58:44	2026-06-19 00:47:50
019e7d0d-f92e-71c8-9e87-8e418d7cb4ba	019e7cda-a2e1-7354-a433-5f119e57ba21	Benda ni terlalu susah.	It['s too difficult/is too difficult].	\N	1	12	2026-05-31 08:02:08	2026-06-19 00:48:46
019e7d1f-ec0c-7072-b101-058c3f2dd9e5	019e7cda-bf7e-7056-8a29-ecdabcebee69	Tak ada apa yang nak dikejarkan.	There['s no rush/ is no rush].	\N	1	10	2026-05-31 08:21:44	2026-06-19 00:56:25
019e7d84-1a74-706f-9e70-b79d2e6eb897	019e7cda-fbd6-7030-b3ee-29c8e0d5fc78	Awak dah nak sampai ke?	[You almost here/Are you almost here]?	\N	1	11	2026-05-31 10:11:10	2026-06-19 01:09:13
019e8666-89d0-70c8-9de6-3b2f2993682d	019e865e-e466-71a2-88eb-238ba8dd32ab	Kat mana awak letak benda tu hari tu?	Where did you put it?	\N	1	7	2026-06-02 03:35:27	2026-06-19 01:14:31
019e8666-89d1-72be-978e-62df9bdb8c6a	019e865e-e466-71a2-88eb-238ba8dd32ab	Saya tak sabar menantikannya.	I['m looking forward to it/ am looking forward to it].	\N	1	8	2026-06-02 03:35:27	2026-06-19 01:15:02
019e8669-085d-7084-a950-e467519b5663	019e865e-e466-71a2-88eb-238ba8dd32ab	Benda tu tak boleh dibawa bincang dah.	That['s non-negotiable/ is non-negotiable].	\N	1	11	2026-06-02 03:38:10	2026-06-19 01:15:26
019e8685-471a-7118-9af9-5071e2ec6296	019e8660-815c-739c-b143-abbbe4c35c02	Tak menyusahkan langsung pun.	It['s no trouble at all/ is no trouble at all].	\N	1	11	2026-06-02 04:09:01	2026-06-19 01:18:56
019e86b3-dcde-7185-9e84-ff5b0b66c6c5	019e8660-a777-734d-9e75-0d5007463fb1	Mana-mana masa pun okay bagi saya.	Anytime['s fine with me/ is fine with me].	\N	1	2	2026-06-02 04:59:54	2026-06-19 01:21:44
019e86b7-aa77-734c-b76b-67d1b28a0857	019e8660-a777-734d-9e75-0d5007463fb1	Macam tak masuk akal je.	It [doesn't make sense/does not make sense].	\N	1	12	2026-06-02 05:04:04	2026-06-19 01:23:07
019e86dc-c309-7074-acfa-8bb3e43425a3	019e8660-bfce-726a-9b1a-91ed8fa57632	Apa pendapat awak?	What['s your opinion/ is your opinion]?	\N	1	1	2026-06-02 05:44:35	2026-06-19 01:33:09
019ed010-e70e-7010-815e-543f016e382f	019ed008-c390-7118-b4d0-c7bc854dcaf4	Awak rasa kain ni akan mengecut tak lepas kena basuh?	Does this fabric shrink after [being washed/ washing it]?	\N	1	9	2026-06-16 10:53:49	2026-06-19 09:50:39
019ed014-e9d2-73cb-a967-3dc0fac24ea9	019ed008-c390-7118-b4d0-c7bc854dcaf4	Saya tak dapat nak bayangkan kalau kena hadap masalah ni sekali lagi.	I [can't imagine dealing with this issue again/ cannot imagine dealing with this issue again].	\N	1	13	2026-06-16 10:58:12	2026-06-19 09:51:19
019e86dc-c30e-7179-8972-64347aafcef8	019e8660-bfce-726a-9b1a-91ed8fa57632	Benda ni tak penting sangat pun.	It['s not urgent/ is not urgent].	\N	1	5	2026-06-02 05:44:35	2026-06-19 01:33:41
019e86ea-d7a0-7305-bf37-56ec4725403b	019e8660-d50d-7278-b630-c3586babcf71	Saya tengah santai-santai je ni.	I['m just relaxing/ am just relaxing].	\N	1	2	2026-06-02 05:59:58	2026-06-19 01:37:09
019e86f0-3bdc-7241-a9fc-a9125b46d17b	019e8660-d50d-7278-b630-c3586babcf71	Awak boleh tangkap tak apa saya cakap?	[You following me/Are you following me]?	\N	1	15	2026-06-02 06:05:51	2026-06-19 01:39:30
019e86f3-4aaf-709d-931d-431f9e8684c0	019e8660-d50d-7278-b630-c3586babcf71	Haa, macam tu lah baru betul.	That['s more like it/ is more like it].	\N	1	19	2026-06-02 06:09:11	2026-06-19 01:40:28
019e872d-ad5a-726b-b8d7-3adf99140fe8	019e8660-efc4-705c-a666-3dd34556d4f8	Apa yang awak tengah fikirkan tu?	What['s on your mind/ is on your mind]?	\N	1	1	2026-06-02 07:12:58	2026-06-19 01:41:44
019e8734-3dc0-73a2-804d-4238677e1281	019e8660-efc4-705c-a666-3dd34556d4f8	Biar saya yang uruskan perkara tu.	I['ll handle it/ will handle it].	\N	1	13	2026-06-02 07:20:08	2026-06-19 01:45:39
019e873f-72e1-73d6-80ac-44ce9db6206d	019e8661-0b15-7008-8f4f-e527ea492d4a	Apa perkara paling buruk yang boleh berlaku?	What['s the worst that can happen/ is the worst that can happen]?	\N	1	1	2026-06-02 07:32:22	2026-06-19 01:49:56
019e8742-a6b6-729d-ab61-d22069452fb2	019e8661-0b15-7008-8f4f-e527ea492d4a	Saya pegang kata-kata awak.	I['ll take your word for it/ will take your word for it].	\N	1	11	2026-06-02 07:35:52	2026-06-19 01:53:14
019e875a-cffa-73cd-8e77-caadd6f9800c	019e8661-212a-71ce-9281-dba09436e383	Macam terlalu bagus sangat sampai rasa susah nak percaya.	It['s too good to be true/ is too good to be true].	\N	1	2	2026-06-02 08:02:16	2026-06-19 02:06:16
019e875d-3782-718d-a136-0ab0fddf5a7d	019e8661-212a-71ce-9281-dba09436e383	Itu satu pandangan berasas.	That['s a fair point/ is a fair point].	\N	1	6	2026-06-02 08:04:53	2026-06-19 02:07:08
019e875d-3787-7280-9bf5-fa9d874a47c0	019e8661-212a-71ce-9281-dba09436e383	Benda tu dah di luar bidang kuasa saya.	It['s out of my hands/ is out of my hands].	\N	1	9	2026-06-02 08:04:53	2026-06-19 02:07:34
019e8762-e7d3-7096-80e4-c10c9cde2e04	019e8661-212a-71ce-9281-dba09436e383	Itu pun dah kira baik daripada tak ada langsung.	It['s better than nothing/ is better than nothing].	\N	1	19	2026-06-02 08:11:06	2026-06-19 02:18:53
019e8775-e5d3-735f-9e7c-dbd57b553a0a	019e8661-31a0-7221-b666-2d4327bb2cb5	Saya akan sentiasa sokong awak.	I['ll stand by you/ will stand by you].	\N	1	15	2026-06-02 08:31:51	2026-06-19 02:24:01
019e8778-ed15-7272-9a03-87c9fafdddda	019e8661-31a0-7221-b666-2d4327bb2cb5	Awak dah berada di landasan yang betul.	You['re on the right track/ are on the right track].	\N	1	19	2026-06-02 08:35:09	2026-06-19 02:24:39
019e8798-0897-71cf-a81d-690a6a7d1c42	019e8661-46ce-7395-8698-7e8833de16bc	Biar saya yang uruskan hal tu.	I['ll take care of it/ will take care of it].	\N	1	6	2026-06-02 09:09:08	2026-06-19 02:31:01
019e879b-2392-71ff-9706-feddb83b97c8	019e8661-46ce-7395-8698-7e8833de16bc	Kecil betul dunia ni.	It['s a small world/ is a small world].	\N	1	14	2026-06-02 09:12:31	2026-06-19 02:33:27
019ec382-7c3f-7379-8ac9-69abb7f8393a	019e8b75-2405-71d6-b5e8-66088f26b38d	Saya kebetulan lalu dekat sini je.	I['m just passing by/ am just passing by].	\N	1	2	2026-06-14 00:22:49	2026-06-19 02:35:26
019ec389-7608-7336-9264-c9c8e9ea0bea	019e8b75-2405-71d6-b5e8-66088f26b38d	Saya tak tahu nak cakap apa dah.	I['m at a loss for words/ am at a loss for words].	\N	1	6	2026-06-14 00:30:26	2026-06-19 02:36:28
019ec396-48f4-71d7-9d09-02177bf14d4f	019e8b75-2405-71d6-b5e8-66088f26b38d	Cakap memang mudah daripada nak buat.	It['s easier said than done/ is easier said than done].	\N	1	16	2026-06-14 00:44:26	2026-06-19 02:39:46
019ec39f-1651-71ee-9f1e-69e8d85c225f	019ec37b-5730-7296-a3bd-711aa0f94fd4	Saya akan fikirkan cara yang lebih kreatif	I['ll think outside the box/ will think outside the box].	\N	1	5	2026-06-14 00:54:03	2026-06-19 02:44:21
019ec3ae-4520-7181-9171-6f512d8e1b5c	019ec37b-5730-7296-a3bd-711aa0f94fd4	Benda dah lepas, tak payah kenang lagi.	It['s water under the bridge/ is water under the bridge].	\N	1	15	2026-06-14 01:10:38	2026-06-19 02:46:47
019ec420-dfdb-7191-af4c-dde647778746	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Saya akan tetap dengan pendirian saya.	I['ll stand my ground/ will stand my ground].	\N	1	5	2026-06-14 03:15:49	2026-06-19 03:05:46
019ec424-15df-7282-8a36-c5bc1237d862	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Itu memang mustahil	That['s out of the question/ is out of the question].	\N	1	11	2026-06-14 03:19:19	2026-06-19 03:07:16
019ec427-16c7-7379-a3fa-97b7c498bba2	019ec37b-e1e6-7276-81d4-8d1ea3f652d7	Kesabaran saya dah semakin menipis ni.	I['m running out of patience/ am running out of patience].	\N	1	17	2026-06-14 03:22:36	2026-06-19 03:08:49
019ec4a8-4309-7159-b075-7014e67912b9	019ec37b-fe05-71b2-97e5-9878f88a413f	Biar saya ambil alih urusan ni seterusnya.	I['ll take it from here/ will take it from here].	\N	1	5	2026-06-14 05:43:42	2026-06-19 03:15:17
019ec4b0-cfab-7273-9ee7-ee108d81a2b1	019ec37b-fe05-71b2-97e5-9878f88a413f	Jangan biarkan peluang keemasan ni terlepas begitu sahaja.	[Don't let the opportunity slip away/Do not let the opportunity slip away].	\N	1	12	2026-06-14 05:53:02	2026-06-19 03:17:33
019ec4c5-a7fb-70d1-b7e5-aadd52299949	019ec37c-14b4-704a-974b-da1ab82de485	Benda tu satu perkara yang saya langsung tak faham.	It['s a closed book to me/ is a closed book to me].	\N	1	7	2026-06-14 06:15:48	2026-06-19 03:58:06
019ec4ce-419b-7310-a5b7-f99196edd595	019ec37c-14b4-704a-974b-da1ab82de485	Benda tu memang cari nahas	It['s a recipe for disaster/ is a recipe for disaster].	\N	1	15	2026-06-14 06:25:12	2026-06-19 03:59:36
019ec4da-d11e-710a-ad55-7ef1e18bb462	019ec37c-2acf-705a-8b65-f244c62ec79a	Benda ni ada baik buruk dia.	It['s a blessing and a curse/ is a blessing and a curse].	\N	1	3	2026-06-14 06:38:55	2026-06-19 04:04:09
019ec4ea-bd74-713c-a3b7-51e5d382b9c8	019ec37c-2acf-705a-8b65-f244c62ec79a	Jangan biar mereka pengaruhi kau (sampai salah buat keputusan).	[Don't let them cloud your judgment/Do not let them cloud your judgment].	\N	1	8	2026-06-14 06:56:18	2026-06-19 04:05:28
019ec4f4-7688-7115-b2e7-7b1c7ace3a90	019ec37c-2acf-705a-8b65-f244c62ec79a	Langkah kita ni dah betul dah ni.	It['s a step in the right direction/ is a step in the right direction].	\N	1	19	2026-06-14 07:06:56	2026-06-19 04:07:42
019ec501-ccca-706f-8363-acd4ef2eca25	019ec37c-3d7b-72d6-b323-5e5668487e26	I am keeping my fingers crossed.	I['m keeping my fingers crossed/ am keeping my fingers crossed].	\N	1	9	2026-06-14 07:21:30	2026-06-19 04:12:13
019ec50c-4a8b-701a-88a0-29122bf0dca4	019ec37c-3d7b-72d6-b323-5e5668487e26	Jangan tinggalkan barang-barang awak kat sini.	[Don't leave your things here/Do not leave your things here].	\N	1	16	2026-06-14 07:32:57	2026-06-19 04:15:15
019ec510-51b8-73af-9fa7-521e9eb495a6	019ec37c-51a2-7373-981b-a96898747a9c	Saya dah lambat (lewat) sikit ni	I['m running a bit late/ am running a bit late].	\N	1	5	2026-06-14 07:37:21	2026-06-19 04:18:14
019ec512-7475-70c3-8d1d-0fdf46e22ebd	019ec37c-51a2-7373-981b-a96898747a9c	Harganya berpatutan	It['s a reasonable price/ is a reasonable price].	\N	1	7	2026-06-14 07:39:41	2026-06-19 04:18:36
019ec515-e895-708f-a071-8b4cd0fc86a8	019ec37c-51a2-7373-981b-a96898747a9c	Saya tengah cari dompet saya ni.	I['m looking for my wallet/ am looking for my wallet].	\N	1	13	2026-06-14 07:43:27	2026-06-19 04:20:09
019ec518-6e8f-71e4-a2c2-014357559f42	019ec37c-51a2-7373-981b-a96898747a9c	Kita dah berjaya cecah enam ratus ayat semuanya!	We['ve officially reached six hundred/ have officially reached six hundred]!	\N	1	20	2026-06-14 07:46:13	2026-06-19 04:21:37
019ec619-df84-73bc-bcac-f4e0973bec14	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Agak ramai orang sikit hari ni.	It['s a bit crowded today/ is a bit crowded today].	\N	1	11	2026-06-14 12:27:24	2026-06-19 07:13:38
019ec61c-fa00-7281-bfdc-a144989e3216	019ec42c-33c3-71bc-81d9-280a8cd57e9a	Saya tengah tunggu parcel (barang) sampai ni.	I['m waiting for a parcel/ am waiting for a parcel].	\N	1	17	2026-06-14 12:30:48	2026-06-19 07:15:25
019ec62e-06d5-7065-917b-f3d348c99506	019ec42c-5a3b-7157-a167-92e44b712f0a	Saya ada masalah nak tidur la	I['m having trouble sleeping/ am having trouble sleeping].	\N	1	9	2026-06-14 12:49:25	2026-06-19 07:22:00
019ec631-892b-7062-a159-9c9243138e49	019ec42c-5a3b-7157-a167-92e44b712f0a	Benda tu ada dekat atas rak paling atas.	It['s on the top shelf/ is on the top shelf].	\N	1	19	2026-06-14 12:53:15	2026-06-19 07:30:45
019ec635-c2d2-7139-abaa-2c630ffd76ad	019ec42c-7663-73ec-b13e-302ca2fc6882	Ada apa kat dalam kotak tu?	What['s inside the box/ is inside the box]?	\N	1	1	2026-06-14 12:57:52	2026-06-19 07:36:11
019ec638-5856-7205-af0a-8bff1a16919f	019ec42c-7663-73ec-b13e-302ca2fc6882	Saya rasa sejuk sikit la badan ni.	I['m feeling a bit chilly/ am feeling a bit chilly].	\N	1	9	2026-06-14 13:00:41	2026-06-19 07:37:56
019ec643-8c16-705d-8c6f-792a2129453d	019ec42c-7663-73ec-b13e-302ca2fc6882	Saya tengah isi air dalam botol ni.	I['m filling up the water bottle/ am filling up the water bottle].	\N	1	17	2026-06-14 13:12:56	2026-06-19 07:39:27
019ec64f-8ede-7072-8d45-8954ee839d84	019ec42c-acb5-725d-9503-732d956f190e	Jangan duduk atas lantai.	[Don't sit on the floor/Do not sit on the floor].	\N	1	8	2026-06-14 13:26:03	2026-06-19 07:53:38
019ec652-3f92-71c4-ae69-04a6528aa77d	019ec42c-acb5-725d-9503-732d956f190e	Saya tengah cari alat kawalan jauh ni.	I['m looking for the remote control/ am looking for the remote control].	\N	1	13	2026-06-14 13:28:59	2026-06-19 07:54:42
019ec65b-0cf7-72c6-9311-7dc2836296fa	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jangan tinggalkan kunci tersangkut dekat pintu.	[Don't leave the key in the lock/Do not leave the key in the lock].	\N	1	4	2026-06-14 13:38:36	2026-06-19 07:58:16
019ec669-7639-7103-ae9d-8899496564d4	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Jangan lupa cabut charger tu.	[Don't forget to unplug the charger/Do not forget to unplug the charger].	\N	1	12	2026-06-14 13:54:20	2026-06-19 08:00:47
019ec669-763b-73c4-a9a0-04ad5f25a05f	019ec42c-c1ca-70a3-a405-ea3f99285c2e	Aku tengah cari pasangan stoking ni (cari sebelah lagi)	I['m looking for the matching socks/ am looking for the matching socks].	\N	1	13	2026-06-14 13:54:20	2026-06-19 08:01:04
019ec673-6052-703a-a820-54c3ad9597db	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jangan biarkan enjin kereta terbiar terpasang	[Don't leave the car engine running/Do not leave the car engine running].	\N	1	4	2026-06-14 14:05:10	2026-06-19 08:05:09
019ec67d-3a2f-708e-a1d4-e39ebd23e1d6	019ec42c-d3b1-70d6-9ca6-0249204ff259	Jangan lupa cermin tingkap tu dinaikkan (cermin kereta)	[Don't forget to wind up the window/Do not forget to wind up the window].	\N	1	12	2026-06-14 14:15:56	2026-06-19 08:08:44
019ec976-c38c-7285-a989-1d546fd5c395	019ec970-d0e7-71e9-9601-43ceb84b321a	Malam ni cuaca dah mula rasa sejuk	It['s getting chilly tonight/ is getting chilly tonight].	\N	1	3	2026-06-15 04:07:44	2026-06-19 08:13:12
019ec97f-f18f-7096-8ff3-16c291fae66b	019ec970-d0e7-71e9-9601-43ceb84b321a	Kawasan kejiranan ni sangat sunyi	It['s a very quiet neighborhood/ is a very quiet neighborhood].	\N	1	11	2026-06-15 04:17:45	2026-06-19 08:14:41
019ec983-2845-7385-9565-20c5106951c2	019ec970-d0e7-71e9-9601-43ceb84b321a	Saya tengah lipat kain baju ni je.	I['m just folding the clothes/ am just folding the clothes].	\N	1	17	2026-06-15 04:21:16	2026-06-19 08:15:54
019ec989-a61c-7300-8338-50a35c14b4e2	019ec970-edff-7092-b1be-ecd06cc0384f	Kat luar tu panas terik sangat	It['s scorching hot outside/ is scorching hot outside].	\N	1	3	2026-06-15 04:28:21	2026-06-19 08:18:45
019ec98d-1e84-7004-98f0-f722d57b0326	019ec970-edff-7092-b1be-ecd06cc0384f	Jangan sentuh soket elektrik tu.	[Don't touch the electrical socket/Do not touch the electrical socket].	\N	1	8	2026-06-15 04:32:09	2026-06-19 08:20:11
019ec999-d48b-7055-8a87-e224d32ea8fc	019ec970-edff-7092-b1be-ecd06cc0384f	Jangan hempas pintu tu kuat-kuat.	[Don't slam the door/Do not slam the door].	\N	1	16	2026-06-15 04:46:02	2026-06-19 08:21:54
019ec99b-cf3c-702d-9a8f-185dcd9a111e	019ec971-0440-7058-b50e-4406b1db8bbe	Jangan sampai tertinggal payung awak pula.	[Don't leave your umbrella behind/Do not leave your umbrella behind].	\N	1	4	2026-06-15 04:48:12	2026-06-19 08:24:50
019ec9a0-dc3e-731e-b71b-eaa8892a39a4	019ec971-0440-7058-b50e-4406b1db8bbe	Saya tengah cari pengetip kuku ni kat mana entah.	I['m looking for the nail clipper/ am looking for the nail clipper].	\N	1	13	2026-06-15 04:53:43	2026-06-19 08:26:43
019ecb25-9932-7060-8f8c-f59c7b677ec8	019ec971-15a1-73f3-9143-463db4e852d3	Jangan biarkan kepala tong gas terbuka.	[Don't leave the gas tank open/Do not leave the gas tank open].	\N	1	4	2026-06-15 11:58:19	2026-06-19 08:32:24
019ecb2d-17cc-73ae-9455-8e7aa8dbc383	019ec971-15a1-73f3-9143-463db4e852d3	Jangan lupa kunci mangga tu nanti.	[Don't forget to lock the padlock/Do not forget to lock the padlock].	\N	1	12	2026-06-15 12:06:30	2026-06-19 08:34:07
019ecb2d-17cd-73f4-b249-9b51f70c184a	019ec971-15a1-73f3-9143-463db4e852d3	Saya tengah cari lampu suluh ni.	I['m looking for the flashlight/ am looking for the flashlight].	\N	1	13	2026-06-15 12:06:30	2026-06-19 08:34:25
019ecb2f-c972-72de-b1ef-d979ec6a175d	019ec971-15a1-73f3-9143-463db4e852d3	Saya tengah bilas pinggang-mangkuk ni je.	I['m just rinsing the plates/ am just rinsing the plates].	\N	1	17	2026-06-15 12:09:27	2026-06-19 08:35:11
019ecb3e-3695-7089-8e2f-3077d8911e7a	019ec971-2ac3-7330-a7d1-d0cf4839ea62	Saya tak boleh tanggung risiko hilang benda ni.	I [can't afford to lose this/ cannot afford to lose this].	\N	1	13	2026-06-15 12:25:12	2026-06-19 08:58:53
019ece97-7888-7377-9e68-d2fa278a9e31	019ec971-4b22-7178-8c67-fb890ecf9225	Saya hampir tak dengar apa-apa langsung.	I [can't hear anything at all/ cannot hear anything at all].	\N	1	7	2026-06-16 04:01:33	2026-06-19 09:05:19
019eceb3-710e-70f9-be5a-6573a26b8a6e	019ec971-6e6a-72df-b722-d4ed8f9d6c27	Tengoklah sendiri kalau awak tak percaya cakap saya.	See for yourself if you [don't believe me/ do not believe me].	\N	1	4	2026-06-16 04:32:06	2026-06-19 09:10:35
019ecf4d-f66b-725b-a484-386307738ccf	019ec971-7fed-7348-8560-c8f39615787b	Saya tak dapat nak datang makan malam nanti.	I [can't make it to the dinner later/ cannot make it to the dinner later].	\N	1	13	2026-06-16 07:20:53	2026-06-19 09:22:35
019ecf66-6fd8-72e2-921e-89e700ad865a	019ec971-9105-70ba-bfc2-c66fd8419534	Awak tak boleh dapat semua benda dalam satu masa (kena ada pengorbanan).	You [can't have your cake and eat it too/ cannot have your cake and eat it too].	\N	1	6	2026-06-16 07:47:37	2026-06-19 09:27:15
019ecf7f-a8b9-72ae-9fa1-1a2b2fd8ee93	019ec971-a979-71b1-9e94-a481f27f69f6	Saya tak boleh nak jamin apa-apa buat masa sekarang ni.	I [can't guarantee anything at the moment/ cannot guarantee anything at the moment].	\N	1	13	2026-06-16 08:15:10	2026-06-19 09:33:20
019ecfda-5d1e-7331-8a6c-6fa8b7c7ab5e	019ec971-a979-71b1-9e94-a481f27f69f6	Sejak menjak ni saya tengah kurangkan minum air manis.	I['ve been cutting down on sweet drinks lately/ have been cutting down on sweet drinks lately].	\N	1	16	2026-06-16 09:54:14	2026-06-19 09:34:06
019ecfe8-00b9-7077-91b2-130c08759ea0	019ec971-c320-7098-82fd-5a43571272aa	Pastikan awak tak terlepas panggilan terakhir.	Make sure you [don't miss the final call/ do not miss the final call].	\N	1	8	2026-06-16 10:09:08	2026-06-19 09:39:22
019ecfff-bb8e-7103-9e37-fca09a82f68d	019ec971-d8bf-72a9-86a8-551a5706f0dc	Pastikan awak tak terbocorkan apa-apa maklumat sensitif.	Make sure you [don't leak any sensitive info/ do not leak any sensitive info].	\N	1	8	2026-06-16 10:35:03	2026-06-19 09:46:01
019ed010-e70a-735d-8a66-4e73f727d6ef	019ed008-c390-7118-b4d0-c7bc854dcaf4	Awak janganlah ambil serius sangat dengan kata-kata dia tu.	You [shouldn't take his words too seriously/ should not take his words too seriously].	\N	1	6	2026-06-16 10:53:49	2026-06-19 09:49:49
019ed01a-4d67-7083-b88e-9cf4a24ad36a	019ed008-c390-7118-b4d0-c7bc854dcaf4	Saya dah mula pantau perkembangan saya secara konsisten sejak hari pertama lagi.	I['ve been tracking my progress since day one/ have been tracking my progress since day one].	\N	1	16	2026-06-16 11:04:05	2026-06-19 09:51:41
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

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 16, true);


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

\unrestrict qtrjgqqhbvbb4ead1kh8HeCYZGYHbePlmr8a0LLEXBxRks0E51mezKzaUQoEvN5

