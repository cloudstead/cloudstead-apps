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
    locale character varying(40),
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

COPY app_store_account (uuid, ctime, name, admin, auth_id, email, email_verification_code, email_verification_code_created_at, email_verified, first_name, hashed_password, reset_token, reset_token_ctime, last_login, last_name, locale, mobile_phone, mobile_phone_country_code, suspended, two_factor, tos_version) FROM stdin;
e86b941c-e4d9-4386-8f38-96f2db127ac9	1425521508366	appstore_admin	t	\N	appstore_admin	\N	\N	f	admin	$2a$04$jqaF8LkKBgSRSomNqyxiw.MjPl8rw9K3.Pq2gVYejepT8XTNpPEam	\N	\N	\N	admin	\N	n/a-------	1	f	f	1
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
e86b941c-e4d9-4386-8f38-96f2db127ac9	1425521508380	appstore_admin	e86b941c-e4d9-4386-8f38-96f2db127ac9
\.


--
-- Data for Name: app_store_publisher_member; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_publisher_member (uuid, ctime, account, publisher) FROM stdin;
dd52793f-f1a0-41f0-9ae9-cb9b93dd3107	1425521508401	e86b941c-e4d9-4386-8f38-96f2db127ac9	e86b941c-e4d9-4386-8f38-96f2db127ac9
\.


--
-- Data for Name: cloud_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app (uuid, ctime, active_version, author, name, publisher) FROM stdin;
8c70df08-dd2b-4941-aacb-e35f477d9f2f	1425521508590	2a2824df-2cd9-47cf-ac80-2e8e4591fdc8	e86b941c-e4d9-4386-8f38-96f2db127ac9	email	e86b941c-e4d9-4386-8f38-96f2db127ac9
849465c9-9568-4105-a8d0-08383671ca97	1425521509683	7d9485f9-8a0b-4537-b69f-480a1ca100f2	e86b941c-e4d9-4386-8f38-96f2db127ac9	gitlab	e86b941c-e4d9-4386-8f38-96f2db127ac9
2d5857f5-02d6-4dec-bbda-034bea4d8d26	1425521510402	79ea9501-1209-42a4-9591-d7a8b2e8a084	e86b941c-e4d9-4386-8f38-96f2db127ac9	jira	e86b941c-e4d9-4386-8f38-96f2db127ac9
00642d61-c04d-4d13-993a-1e67378ef7a0	1425521511154	e06c90ec-fe8a-4933-9227-8ddf18a21f70	e86b941c-e4d9-4386-8f38-96f2db127ac9	kanban	e86b941c-e4d9-4386-8f38-96f2db127ac9
6e0e4b68-c479-4cba-a565-cb97b6e1e0f6	1425521511837	967f414e-d5f2-418d-ac81-a7b1c940774c	e86b941c-e4d9-4386-8f38-96f2db127ac9	kandan	e86b941c-e4d9-4386-8f38-96f2db127ac9
2dcf956b-d359-4bdb-aea9-8da25c62cd97	1425521512790	4f205628-981e-4a78-9156-3619a41f4161	e86b941c-e4d9-4386-8f38-96f2db127ac9	owncloud	e86b941c-e4d9-4386-8f38-96f2db127ac9
f1427728-d9f1-4b3c-9eab-f85f8f59df0e	1425521513485	aaad9d3d-3701-4494-9a25-690be9fec8aa	e86b941c-e4d9-4386-8f38-96f2db127ac9	phabricator	e86b941c-e4d9-4386-8f38-96f2db127ac9
89bf9d07-fd04-4fd1-817d-76e358d78de5	1425521514157	14f4d87c-10b2-48ee-ac5a-8dcaa948143a	e86b941c-e4d9-4386-8f38-96f2db127ac9	phplist	e86b941c-e4d9-4386-8f38-96f2db127ac9
f192ec43-0198-498d-91a9-98563be9adda	1425521514814	224b05b2-cd9c-4b1f-969a-501f2e26781a	e86b941c-e4d9-4386-8f38-96f2db127ac9	roundcube	e86b941c-e4d9-4386-8f38-96f2db127ac9
a88f66e8-874f-41bc-83de-be3ede02bba8	1425521516080	94a42e91-c418-47c8-a20c-d84c6813fd76	e86b941c-e4d9-4386-8f38-96f2db127ac9	roundcube-calendar	e86b941c-e4d9-4386-8f38-96f2db127ac9
84be60d6-3a1f-451e-b2f7-75e29411a96a	1425521516724	43982319-d54c-4b16-af3b-817a79ff35b2	e86b941c-e4d9-4386-8f38-96f2db127ac9	limesurvey	e86b941c-e4d9-4386-8f38-96f2db127ac9
738fb622-1acb-4cb3-aa50-dde0b5217f87	1425521517399	962c61d5-3f59-47b1-9069-47337314857a	e86b941c-e4d9-4386-8f38-96f2db127ac9	etherpad	e86b941c-e4d9-4386-8f38-96f2db127ac9
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
2a2824df-2cd9-47cf-ac80-2e8e4591fdc8	1425521509043	8c70df08-dd2b-4941-aacb-e35f477d9f2f	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/email-bundle.tar.gz	361fa1e71693b208be5b51a8a04b2d0da26f39a2cc0326c5e0804df47f4f92f6	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	\N	\N	f	PUBLISHED	1.0.0
7d9485f9-8a0b-4537-b69f-480a1ca100f2	1425521509891	849465c9-9568-4105-a8d0-08383671ca97	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	b7802960e2412b26ba8386c841047c746ae42411b07a5da9ff366d2528f10b39	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	t	PUBLISHED	1.0.0
79ea9501-1209-42a4-9591-d7a8b2e8a084	1425521510654	2d5857f5-02d6-4dec-bbda-034bea4d8d26	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/jira-bundle.tar.gz	3f8126890d47a428862db34e9ef882f15b9cc6781bfa6c4c1fe137b1182640cb	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	t	PUBLISHED	1.0.0
e06c90ec-fe8a-4933-9227-8ddf18a21f70	1425521511366	00642d61-c04d-4d13-993a-1e67378ef7a0	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/kanban-bundle.tar.gz	896728168dbedf806286d8c8e5fb5b16910d6af6f0548f19b370729a71c9e572	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	t	PUBLISHED	1.0.0
967f414e-d5f2-418d-ac81-a7b1c940774c	1425521512138	6e0e4b68-c479-4cba-a565-cb97b6e1e0f6	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/kandan-bundle.tar.gz	2e08e80e2b3c17680a1f05387f7f35eea80a323e109e395dea39e04821edc4a9	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	t	PUBLISHED	1.0.0
4f205628-981e-4a78-9156-3619a41f4161	1425521512986	2dcf956b-d359-4bdb-aea9-8da25c62cd97	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	0b9967809d97ba143e106005f85eebb5bd3a53fd94eeff2865da34db44d462bc	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	t	PUBLISHED	1.0.0
aaad9d3d-3701-4494-9a25-690be9fec8aa	1425521513683	f1427728-d9f1-4b3c-9eab-f85f8f59df0e	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	de0a679049b96c485d3b69b0331cd189cb1230f34df8f93b6c1a877204c6ec6a	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	t	PUBLISHED	1.0.0
14f4d87c-10b2-48ee-ac5a-8dcaa948143a	1425521514353	89bf9d07-fd04-4fd1-817d-76e358d78de5	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/phplist-bundle.tar.gz	22fa47877492bf1898716c00a8fb85d7c405e032917c2ea0b7d1e704cba07f65	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	t	PUBLISHED	1.0.0
224b05b2-cd9c-4b1f-969a-501f2e26781a	1425521515366	f192ec43-0198-498d-91a9-98563be9adda	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	652d03e9a1c6998529a3b95204a76eb3fcfbfd35cbb3832d07aecedbe60c68f6	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	t	PUBLISHED	1.0.0
94a42e91-c418-47c8-a20c-d84c6813fd76	1425521516280	a88f66e8-874f-41bc-83de-be3ede02bba8	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	68a2e0395bd8fd2b7b1604acd11d67dfaa15a40d51d1e79d21eaef071f5f8ad6	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	t	PUBLISHED	1.0.0
43982319-d54c-4b16-af3b-817a79ff35b2	1425521516923	84be60d6-3a1f-451e-b2f7-75e29411a96a	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/limesurvey-bundle.tar.gz	b5462ce80940a5ab09c91d7785651b8a1a4679966462576e1cf28a4bb3f4f02e	Web surveys, made easy.	Create surveys, send them out and view reports on the responses	http://cloudstead.io/downloads/icons/limesurvey-large.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	t	PUBLISHED	1.0.0
962c61d5-3f59-47b1-9069-47337314857a	1425521517652	738fb622-1acb-4cb3-aa50-dde0b5217f87	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/etherpad-bundle.tar.gz	a6d95fc70dbf1d44dbff2a98b0bef20a8ffa5daafb0914d8719395c1760f0e0b	Collaborative document editing.	Create documents and let multiple people work on them together	http://cloudstead.io/downloads/icons/etherpad-large.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	t	PUBLISHED	1.0.0
\.


--
-- Data for Name: published_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY published_app (uuid, ctime, app, author, bundle_url, bundle_url_sha, blurb, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, taskbar_icon_alt_text, taskbar_icon_url, taskbar_icon_url_sha, interactive, status, version, approved_by) FROM stdin;
8c70df08-dd2b-4941-aacb-e35f477d9f2f	1425521509594	8c70df08-dd2b-4941-aacb-e35f477d9f2f	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/email-bundle.tar.gz	361fa1e71693b208be5b51a8a04b2d0da26f39a2cc0326c5e0804df47f4f92f6	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	\N	\N	f	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
849465c9-9568-4105-a8d0-08383671ca97	1425521510321	849465c9-9568-4105-a8d0-08383671ca97	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	b7802960e2412b26ba8386c841047c746ae42411b07a5da9ff366d2528f10b39	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
2d5857f5-02d6-4dec-bbda-034bea4d8d26	1425521511090	2d5857f5-02d6-4dec-bbda-034bea4d8d26	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/jira-bundle.tar.gz	3f8126890d47a428862db34e9ef882f15b9cc6781bfa6c4c1fe137b1182640cb	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
00642d61-c04d-4d13-993a-1e67378ef7a0	1425521511764	00642d61-c04d-4d13-993a-1e67378ef7a0	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/kanban-bundle.tar.gz	896728168dbedf806286d8c8e5fb5b16910d6af6f0548f19b370729a71c9e572	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
6e0e4b68-c479-4cba-a565-cb97b6e1e0f6	1425521512724	6e0e4b68-c479-4cba-a565-cb97b6e1e0f6	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/kandan-bundle.tar.gz	2e08e80e2b3c17680a1f05387f7f35eea80a323e109e395dea39e04821edc4a9	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
2dcf956b-d359-4bdb-aea9-8da25c62cd97	1425521513414	2dcf956b-d359-4bdb-aea9-8da25c62cd97	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	0b9967809d97ba143e106005f85eebb5bd3a53fd94eeff2865da34db44d462bc	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
f1427728-d9f1-4b3c-9eab-f85f8f59df0e	1425521514093	f1427728-d9f1-4b3c-9eab-f85f8f59df0e	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	de0a679049b96c485d3b69b0331cd189cb1230f34df8f93b6c1a877204c6ec6a	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
89bf9d07-fd04-4fd1-817d-76e358d78de5	1425521514751	89bf9d07-fd04-4fd1-817d-76e358d78de5	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/phplist-bundle.tar.gz	22fa47877492bf1898716c00a8fb85d7c405e032917c2ea0b7d1e704cba07f65	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
f192ec43-0198-498d-91a9-98563be9adda	1425521516006	f192ec43-0198-498d-91a9-98563be9adda	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	652d03e9a1c6998529a3b95204a76eb3fcfbfd35cbb3832d07aecedbe60c68f6	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
a88f66e8-874f-41bc-83de-be3ede02bba8	1425521516666	a88f66e8-874f-41bc-83de-be3ede02bba8	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	68a2e0395bd8fd2b7b1604acd11d67dfaa15a40d51d1e79d21eaef071f5f8ad6	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
84be60d6-3a1f-451e-b2f7-75e29411a96a	1425521517332	84be60d6-3a1f-451e-b2f7-75e29411a96a	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/limesurvey-bundle.tar.gz	b5462ce80940a5ab09c91d7785651b8a1a4679966462576e1cf28a4bb3f4f02e	Web surveys, made easy.	Create surveys, send them out and view reports on the responses	http://cloudstead.io/downloads/icons/limesurvey-large.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
738fb622-1acb-4cb3-aa50-dde0b5217f87	1425521517967	738fb622-1acb-4cb3-aa50-dde0b5217f87	e86b941c-e4d9-4386-8f38-96f2db127ac9	http://cloudstead.io/downloads/etherpad-bundle.tar.gz	a6d95fc70dbf1d44dbff2a98b0bef20a8ffa5daafb0914d8719395c1760f0e0b	Collaborative document editing.	Create documents and let multiple people work on them together	http://cloudstead.io/downloads/icons/etherpad-large.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	t	NEW	1.0.0	e86b941c-e4d9-4386-8f38-96f2db127ac9
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

