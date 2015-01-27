--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: app_footprint; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE app_footprint (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    cloud_app character varying(100) NOT NULL,
    cpus integer NOT NULL,
    memory integer NOT NULL
);


ALTER TABLE public.app_footprint OWNER TO cloudos_appstore_test;

--
-- Name: app_price; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE app_price (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    cloud_app character varying(100) NOT NULL,
    initial_cost integer NOT NULL,
    iso_currency character varying(3),
    monthly_fixed_cost integer NOT NULL,
    payment_required boolean NOT NULL
);


ALTER TABLE public.app_price OWNER TO cloudos_appstore_test;

--
-- Name: app_store_account; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE app_store_account (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    name character varying(100) NOT NULL,
    admin boolean NOT NULL,
    auth_id character varying(30),
    email character varying(255) NOT NULL,
    email_verification_code character varying(100),
    email_verification_code_created_at bigint,
    email_verified boolean NOT NULL,
    first_name character varying(25) NOT NULL,
    hashed_password character varying(200) NOT NULL,
    reset_token character varying(30),
    reset_token_ctime bigint,
    last_login bigint,
    last_name character varying(25) NOT NULL,
    mobile_phone character varying(30),
    mobile_phone_country_code integer,
    suspended boolean NOT NULL,
    two_factor boolean NOT NULL,
    tos_version integer
);


ALTER TABLE public.app_store_account OWNER TO cloudos_appstore_test;

--
-- Name: app_store_cloud_account; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE app_store_cloud_account (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    ucid character varying(100) NOT NULL,
    uri character varying(255) NOT NULL
);


ALTER TABLE public.app_store_cloud_account OWNER TO cloudos_appstore_test;

--
-- Name: app_store_publisher; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE app_store_publisher (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    name character varying(255) NOT NULL,
    owner character varying(100) NOT NULL
);


ALTER TABLE public.app_store_publisher OWNER TO cloudos_appstore_test;

--
-- Name: app_store_publisher_member; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE app_store_publisher_member (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    account character varying(100) NOT NULL,
    publisher character varying(100) NOT NULL
);


ALTER TABLE public.app_store_publisher_member OWNER TO cloudos_appstore_test;

--
-- Name: cloud_app; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE cloud_app (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    active_version character varying(100),
    author character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    publisher character varying(100) NOT NULL
);


ALTER TABLE public.cloud_app OWNER TO cloudos_appstore_test;

--
-- Name: cloud_app_client; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE cloud_app_client (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    client_url character varying(1024) NOT NULL,
    client_url_sha character varying(200) NOT NULL,
    cloud_app character varying(100) NOT NULL,
    type character varying(255)
);


ALTER TABLE public.cloud_app_client OWNER TO cloudos_appstore_test;

--
-- Name: cloud_app_version; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE cloud_app_version (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    app character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    bundle_url character varying(1024) NOT NULL,
    bundle_url_sha character varying(200) NOT NULL,
    blurb character varying(200) NOT NULL,
    description character varying(16384) NOT NULL,
    large_icon_url character varying(1024) NOT NULL,
    large_icon_url_sha character varying(200) NOT NULL,
    metadata character varying(65536),
    small_icon_url character varying(1024) NOT NULL,
    small_icon_url_sha character varying(200) NOT NULL,
    taskbar_icon_alt_text character varying(30),
    taskbar_icon_url character varying(1024),
    taskbar_icon_url_sha character varying(200),
    interactive boolean NOT NULL,
    status character varying(255) NOT NULL,
    version character varying(255) NOT NULL
);


ALTER TABLE public.cloud_app_version OWNER TO cloudos_appstore_test;

--
-- Name: published_app; Type: TABLE; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

CREATE TABLE published_app (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    app character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    bundle_url character varying(1024) NOT NULL,
    bundle_url_sha character varying(200) NOT NULL,
    blurb character varying(200) NOT NULL,
    description character varying(16384) NOT NULL,
    large_icon_url character varying(1024) NOT NULL,
    large_icon_url_sha character varying(200) NOT NULL,
    metadata character varying(65536),
    small_icon_url character varying(1024) NOT NULL,
    small_icon_url_sha character varying(200) NOT NULL,
    taskbar_icon_alt_text character varying(30),
    taskbar_icon_url character varying(1024),
    taskbar_icon_url_sha character varying(200),
    interactive boolean NOT NULL,
    status character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    approved_by character varying(100) NOT NULL
);


ALTER TABLE public.published_app OWNER TO cloudos_appstore_test;

--
-- Data for Name: app_footprint; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_footprint (uuid, ctime, cloud_app, cpus, memory) FROM stdin;
\.


--
-- Data for Name: app_price; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_price (uuid, ctime, cloud_app, initial_cost, iso_currency, monthly_fixed_cost, payment_required) FROM stdin;
\.


--
-- Data for Name: app_store_account; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_account (uuid, ctime, name, admin, auth_id, email, email_verification_code, email_verification_code_created_at, email_verified, first_name, hashed_password, reset_token, reset_token_ctime, last_login, last_name, mobile_phone, mobile_phone_country_code, suspended, two_factor, tos_version) FROM stdin;
d090ed22-a9a0-4f27-a4f0-4864fbc13d87	1422381720687	appstore_admin	t	\N	appstore_admin	\N	\N	f	admin	$2a$04$m/b5TsIGDOVQ/MuVk97C.O0l7SftpjjNUxa2EVzJ78TAyQljIC.ai	\N	\N	\N	admin	n/a	1	f	f	1
\.


--
-- Data for Name: app_store_cloud_account; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_cloud_account (uuid, ctime, ucid, uri) FROM stdin;
\.


--
-- Data for Name: app_store_publisher; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_publisher (uuid, ctime, name, owner) FROM stdin;
d090ed22-a9a0-4f27-a4f0-4864fbc13d87	1422381720703	appstore_admin	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
\.


--
-- Data for Name: app_store_publisher_member; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_publisher_member (uuid, ctime, account, publisher) FROM stdin;
db2cd81a-4168-4532-8506-d8f37e84886e	1422381720720	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
\.


--
-- Data for Name: cloud_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app (uuid, ctime, active_version, author, name, publisher) FROM stdin;
0e84f39e-82ca-4069-95ad-9afb3e9dfa13	1422381720912	c15f4426-f670-4fd9-ad00-ba74c4569b7b	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	email	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
d5f8eb03-746d-417f-b104-7d39d2ea5920	1422381723668	78778388-ebcf-47c2-ac0e-fbd53dc0cb8c	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	gitlab	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
276b80f7-46a8-429f-804d-12d12a5cc0ee	1422381725252	a01adb69-12ca-44fa-83d5-3bf66d8f1742	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	jira	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
090fa446-aebc-490b-9d86-ed08550571e1	1422381726851	697c0851-17af-46d0-bc02-8faa86985326	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	kanban	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
9fc533b6-aec6-437e-88a3-57431df15f5a	1422381728469	30173cd2-a213-46d9-8973-fd753c7d9950	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	kandan	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
547ed5e5-222c-4ce5-85c0-c30f8039fdcc	1422381731043	a95c1034-c004-42bf-9727-a33cb879041d	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	owncloud	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
0c03bbd1-58a3-4de2-bd2b-d58a406e0eac	1422381733210	0b3665eb-d81a-4fde-9514-6fe59e70d169	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	phabricator	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
3a382fec-dfee-469a-b352-94847f4834a8	1422381734547	f907ec9a-47fe-4d5c-ae19-e53de1d565f5	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	phplist	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
21145c31-abb7-4123-8db2-f0baeedf4faf	1422381736027	95a50306-cb00-433d-b43f-8a3448facfd1	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	roundcube	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
5a05a3f5-0506-466c-b4ed-b8c142e71ff7	1422381739977	f949e922-ed85-47eb-b208-103f0da9fc2b	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	roundcube-calendar	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
cd8d34c7-e401-484f-8da9-bdff46d664d7	1422381741386	760be4b8-ae53-43c7-a84d-73a164d5ac12	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	limesurvey	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
a5eedadf-cde7-4012-a6e6-3d1ee0f89ade	1422381742816	96819cbb-c456-42ce-a035-1dad2a3e85b2	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	etherpad	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
\.


--
-- Data for Name: cloud_app_client; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app_client (uuid, ctime, client_url, client_url_sha, cloud_app, type) FROM stdin;
\.


--
-- Data for Name: cloud_app_version; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app_version (uuid, ctime, app, author, bundle_url, bundle_url_sha, blurb, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, taskbar_icon_alt_text, taskbar_icon_url, taskbar_icon_url_sha, interactive, status, version) FROM stdin;
c15f4426-f670-4fd9-ad00-ba74c4569b7b	1422381722227	0e84f39e-82ca-4069-95ad-9afb3e9dfa13	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/email-bundle.tar.gz	247af5155d1fa318a4d51e3036743620b4edc6decb1ca48d9801e7c6d2387e15	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	\N	\N	f	PUBLISHED	1.0.0
78778388-ebcf-47c2-ac0e-fbd53dc0cb8c	1422381724178	d5f8eb03-746d-417f-b104-7d39d2ea5920	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	67145397f50fe82c3d5fcd1fd1027464b18a92cb7710734c6b4f4a50dcfa5d5c	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	t	PUBLISHED	1.0.0
a01adb69-12ca-44fa-83d5-3bf66d8f1742	1422381725764	276b80f7-46a8-429f-804d-12d12a5cc0ee	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/jira-bundle.tar.gz	78c8a342e3a818def04b42e30586d3f611f2e431aba5e557f75c8b1624bcd483	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	t	PUBLISHED	1.0.0
697c0851-17af-46d0-bc02-8faa86985326	1422381727355	090fa446-aebc-490b-9d86-ed08550571e1	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/kanban-bundle.tar.gz	8a4eb3203c3c513c60816156fc4a9b967cec68940ad1bcff179d393069fc185c	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	t	PUBLISHED	1.0.0
30173cd2-a213-46d9-8973-fd753c7d9950	1422381729389	9fc533b6-aec6-437e-88a3-57431df15f5a	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/kandan-bundle.tar.gz	0e552d3ddf78c604fbe3eeb56aba37bf041ca5192a1f021a5fc1eb2bc86e018f	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	t	PUBLISHED	1.0.0
a95c1034-c004-42bf-9727-a33cb879041d	1422381731537	547ed5e5-222c-4ce5-85c0-c30f8039fdcc	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	2feaa5e737d2aab4bdfa4f5458a83fbf938c4e1a12dff9be6a4580d2c3b7c9ab	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	t	PUBLISHED	1.0.0
0b3665eb-d81a-4fde-9514-6fe59e70d169	1422381733641	0c03bbd1-58a3-4de2-bd2b-d58a406e0eac	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	5b7258380d6f44e886604cbea9acee52b27558076fd34b37464295d2984c6dfc	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	t	PUBLISHED	1.0.0
f907ec9a-47fe-4d5c-ae19-e53de1d565f5	1422381734997	3a382fec-dfee-469a-b352-94847f4834a8	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/phplist-bundle.tar.gz	997cac9c5c4d88199a0f4834fecf66b93a94beb923b1d02b2b12afe1e7b421d3	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	t	PUBLISHED	1.0.0
95a50306-cb00-433d-b43f-8a3448facfd1	1422381738049	21145c31-abb7-4123-8db2-f0baeedf4faf	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	4b6a78c2f8a96b86349fd32f58ce4b9c224147a6953e2fd6c2444e0f58bee2cb	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	t	PUBLISHED	1.0.0
f949e922-ed85-47eb-b208-103f0da9fc2b	1422381740416	5a05a3f5-0506-466c-b4ed-b8c142e71ff7	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	39dc1ecb9ec40febd800ffcf15b5f3d01c5bb9a06c21789e3ec50ba997c2ff66	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	t	PUBLISHED	1.0.0
760be4b8-ae53-43c7-a84d-73a164d5ac12	1422381741828	cd8d34c7-e401-484f-8da9-bdff46d664d7	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/limesurvey-bundle.tar.gz	8072ad25b1c232abee9acf6f77a23eb717f84dae34c4797a2eebebfa09500e28	Web surveys, made easy.	Create surveys, send them out and view reports on the responses	http://cloudstead.io/downloads/icons/limesurvey-large.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	t	PUBLISHED	1.0.0
96819cbb-c456-42ce-a035-1dad2a3e85b2	1422381744006	a5eedadf-cde7-4012-a6e6-3d1ee0f89ade	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/etherpad-bundle.tar.gz	b6e9aad15fd72399885cdc6055caf7930ec53bf03324797e65aeeb13d5d9ff7d	Collaborative document editing.	Create documents and let multiple people work on them together	http://cloudstead.io/downloads/icons/etherpad-large.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	t	PUBLISHED	1.0.0
\.


--
-- Data for Name: published_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY published_app (uuid, ctime, app, author, bundle_url, bundle_url_sha, blurb, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, taskbar_icon_alt_text, taskbar_icon_url, taskbar_icon_url_sha, interactive, status, version, approved_by) FROM stdin;
0e84f39e-82ca-4069-95ad-9afb3e9dfa13	1422381723576	0e84f39e-82ca-4069-95ad-9afb3e9dfa13	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/email-bundle.tar.gz	247af5155d1fa318a4d51e3036743620b4edc6decb1ca48d9801e7c6d2387e15	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	\N	\N	f	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
d5f8eb03-746d-417f-b104-7d39d2ea5920	1422381725182	d5f8eb03-746d-417f-b104-7d39d2ea5920	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	67145397f50fe82c3d5fcd1fd1027464b18a92cb7710734c6b4f4a50dcfa5d5c	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
276b80f7-46a8-429f-804d-12d12a5cc0ee	1422381726775	276b80f7-46a8-429f-804d-12d12a5cc0ee	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/jira-bundle.tar.gz	78c8a342e3a818def04b42e30586d3f611f2e431aba5e557f75c8b1624bcd483	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
090fa446-aebc-490b-9d86-ed08550571e1	1422381728382	090fa446-aebc-490b-9d86-ed08550571e1	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/kanban-bundle.tar.gz	8a4eb3203c3c513c60816156fc4a9b967cec68940ad1bcff179d393069fc185c	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
9fc533b6-aec6-437e-88a3-57431df15f5a	1422381730978	9fc533b6-aec6-437e-88a3-57431df15f5a	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/kandan-bundle.tar.gz	0e552d3ddf78c604fbe3eeb56aba37bf041ca5192a1f021a5fc1eb2bc86e018f	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
547ed5e5-222c-4ce5-85c0-c30f8039fdcc	1422381733130	547ed5e5-222c-4ce5-85c0-c30f8039fdcc	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	2feaa5e737d2aab4bdfa4f5458a83fbf938c4e1a12dff9be6a4580d2c3b7c9ab	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
0c03bbd1-58a3-4de2-bd2b-d58a406e0eac	1422381734484	0c03bbd1-58a3-4de2-bd2b-d58a406e0eac	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	5b7258380d6f44e886604cbea9acee52b27558076fd34b37464295d2984c6dfc	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
3a382fec-dfee-469a-b352-94847f4834a8	1422381735969	3a382fec-dfee-469a-b352-94847f4834a8	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/phplist-bundle.tar.gz	997cac9c5c4d88199a0f4834fecf66b93a94beb923b1d02b2b12afe1e7b421d3	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
21145c31-abb7-4123-8db2-f0baeedf4faf	1422381739914	21145c31-abb7-4123-8db2-f0baeedf4faf	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	4b6a78c2f8a96b86349fd32f58ce4b9c224147a6953e2fd6c2444e0f58bee2cb	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
5a05a3f5-0506-466c-b4ed-b8c142e71ff7	1422381741323	5a05a3f5-0506-466c-b4ed-b8c142e71ff7	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	39dc1ecb9ec40febd800ffcf15b5f3d01c5bb9a06c21789e3ec50ba997c2ff66	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
cd8d34c7-e401-484f-8da9-bdff46d664d7	1422381742751	cd8d34c7-e401-484f-8da9-bdff46d664d7	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/limesurvey-bundle.tar.gz	8072ad25b1c232abee9acf6f77a23eb717f84dae34c4797a2eebebfa09500e28	Web surveys, made easy.	Create surveys, send them out and view reports on the responses	http://cloudstead.io/downloads/icons/limesurvey-large.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
a5eedadf-cde7-4012-a6e6-3d1ee0f89ade	1422381745260	a5eedadf-cde7-4012-a6e6-3d1ee0f89ade	d090ed22-a9a0-4f27-a4f0-4864fbc13d87	http://cloudstead.io/downloads/etherpad-bundle.tar.gz	b6e9aad15fd72399885cdc6055caf7930ec53bf03324797e65aeeb13d5d9ff7d	Collaborative document editing.	Create documents and let multiple people work on them together	http://cloudstead.io/downloads/icons/etherpad-large.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	t	NEW	1.0.0	d090ed22-a9a0-4f27-a4f0-4864fbc13d87
\.


--
-- Name: app_footprint_cloud_app_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_footprint
    ADD CONSTRAINT app_footprint_cloud_app_key UNIQUE (cloud_app);


--
-- Name: app_footprint_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_footprint
    ADD CONSTRAINT app_footprint_pkey PRIMARY KEY (uuid);


--
-- Name: app_price_cloud_app_iso_currency_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_price
    ADD CONSTRAINT app_price_cloud_app_iso_currency_key UNIQUE (cloud_app, iso_currency);


--
-- Name: app_price_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_price
    ADD CONSTRAINT app_price_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_account_email_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_account
    ADD CONSTRAINT app_store_account_email_key UNIQUE (email);


--
-- Name: app_store_account_name_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_account
    ADD CONSTRAINT app_store_account_name_key UNIQUE (name);


--
-- Name: app_store_account_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_account
    ADD CONSTRAINT app_store_account_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_cloud_account_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_cloud_account
    ADD CONSTRAINT app_store_cloud_account_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_cloud_account_ucid_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_cloud_account
    ADD CONSTRAINT app_store_cloud_account_ucid_key UNIQUE (ucid);


--
-- Name: app_store_cloud_account_uri_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_cloud_account
    ADD CONSTRAINT app_store_cloud_account_uri_key UNIQUE (uri);


--
-- Name: app_store_publisher_member_account_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_account_key UNIQUE (account);


--
-- Name: app_store_publisher_member_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_publisher_member_publisher_account_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_publisher_account_key UNIQUE (publisher, account);


--
-- Name: app_store_publisher_member_publisher_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_publisher_key UNIQUE (publisher);


--
-- Name: app_store_publisher_name_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher
    ADD CONSTRAINT app_store_publisher_name_key UNIQUE (name);


--
-- Name: app_store_publisher_owner_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher
    ADD CONSTRAINT app_store_publisher_owner_key UNIQUE (owner);


--
-- Name: app_store_publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher
    ADD CONSTRAINT app_store_publisher_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_app_client_cloud_app_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app_client
    ADD CONSTRAINT cloud_app_client_cloud_app_key UNIQUE (cloud_app);


--
-- Name: cloud_app_client_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app_client
    ADD CONSTRAINT cloud_app_client_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_app_name_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app
    ADD CONSTRAINT cloud_app_name_key UNIQUE (name);


--
-- Name: cloud_app_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app
    ADD CONSTRAINT cloud_app_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app_version
    ADD CONSTRAINT cloud_app_version_pkey PRIMARY KEY (uuid);


--
-- Name: published_app_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY published_app
    ADD CONSTRAINT published_app_pkey PRIMARY KEY (uuid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

