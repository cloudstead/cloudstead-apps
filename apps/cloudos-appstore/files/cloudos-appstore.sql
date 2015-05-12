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
    activation character varying(100),
    activation_expiration bigint,
    active boolean NOT NULL,
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
66109ecb-d83d-4cf9-bf10-839c334d9206	1431431327372	appstore_admin	t	\N	appstore_admin	\N	\N	f	admin	$2a$04$BXxRVvevSKrDFntLl.Ov1e8iHNg4qc32p2t63xsKN8A589oqLVIka	\N	\N	\N	admin	\N	n/a-------	1	f	f	1
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
66109ecb-d83d-4cf9-bf10-839c334d9206	1431431327383	appstore_admin	66109ecb-d83d-4cf9-bf10-839c334d9206
\.


--
-- Data for Name: app_store_publisher_member; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_publisher_member (uuid, ctime, account, activation, activation_expiration, active, publisher) FROM stdin;
43503942-3c22-4b35-9dc5-43a9ea92921d	1431431327392	66109ecb-d83d-4cf9-bf10-839c334d9206	\N	\N	t	66109ecb-d83d-4cf9-bf10-839c334d9206
\.


--
-- Data for Name: cloud_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app (uuid, ctime, active_version, author, name, publisher) FROM stdin;
d219f0bb-d625-4427-8cdb-ee6b67ebd2d0	1431431327552	32e86e7e-4a6b-4adb-99c0-99c5e367240f	66109ecb-d83d-4cf9-bf10-839c334d9206	email	66109ecb-d83d-4cf9-bf10-839c334d9206
1874770d-5efb-45b0-8dba-2d253c4e1178	1431431329081	f860c18e-f0de-4c21-a9fa-cdf37da4e6af	66109ecb-d83d-4cf9-bf10-839c334d9206	gitlab	66109ecb-d83d-4cf9-bf10-839c334d9206
6bf4b06b-01a7-47d2-8ee6-456d43055b40	1431431330012	ce487131-cb8b-4249-913a-57c78ba21a39	66109ecb-d83d-4cf9-bf10-839c334d9206	jira	66109ecb-d83d-4cf9-bf10-839c334d9206
7993d021-9ac0-4608-a06f-d34fb77b9e6a	1431431330941	99bbc86b-704e-4424-b697-f9b57cd65396	66109ecb-d83d-4cf9-bf10-839c334d9206	kanban	66109ecb-d83d-4cf9-bf10-839c334d9206
534f6b13-9767-47e7-9a76-8541d0baf4e0	1431431331705	25ed66e5-bbe7-407b-8431-19fa8f7c234c	66109ecb-d83d-4cf9-bf10-839c334d9206	kandan	66109ecb-d83d-4cf9-bf10-839c334d9206
3b4c0e96-69a4-4a4a-996f-9776472ab905	1431431332699	4a6a1764-54e7-4970-a2f7-d6d5cc719589	66109ecb-d83d-4cf9-bf10-839c334d9206	owncloud	66109ecb-d83d-4cf9-bf10-839c334d9206
9426b821-d6da-4fb0-8834-89e47f7956b6	1431431333497	dbb85d22-b60d-42ae-8c9d-667eefe641e9	66109ecb-d83d-4cf9-bf10-839c334d9206	phabricator	66109ecb-d83d-4cf9-bf10-839c334d9206
ae84b816-16b0-48f1-81a7-68a9e09b297a	1431431334233	5f01be4a-c107-410d-9598-e4af10967b0c	66109ecb-d83d-4cf9-bf10-839c334d9206	phplist	66109ecb-d83d-4cf9-bf10-839c334d9206
93cd8838-bfdc-4819-bdcd-faca00800824	1431431335098	e2756903-31fc-4abc-970b-b0a06e4e5be1	66109ecb-d83d-4cf9-bf10-839c334d9206	roundcube	66109ecb-d83d-4cf9-bf10-839c334d9206
eceee5a0-de5e-46d4-bde9-d156e875c5b7	1431431338314	d3b5c9b3-155f-4b47-ac0b-4bc45483ab2c	66109ecb-d83d-4cf9-bf10-839c334d9206	roundcube-calendar	66109ecb-d83d-4cf9-bf10-839c334d9206
52f29cac-6a33-40d7-90b3-4bc218e60c1b	1431431339025	9a9a25ef-73cc-415c-8faa-163c510edf71	66109ecb-d83d-4cf9-bf10-839c334d9206	limesurvey	66109ecb-d83d-4cf9-bf10-839c334d9206
bfcf1f42-60a4-4501-9e78-22d369dc648f	1431431339800	4c8295a8-032b-47bc-9898-29fa7ffb095f	66109ecb-d83d-4cf9-bf10-839c334d9206	etherpad	66109ecb-d83d-4cf9-bf10-839c334d9206
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
32e86e7e-4a6b-4adb-99c0-99c5e367240f	1431431328241	d219f0bb-d625-4427-8cdb-ee6b67ebd2d0	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/email-bundle.tar.gz	8be18bc3cc00c9965e4a281d17a3bf5db7a83a6aa814a2638d04d18b767eedaf	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	\N	\N	f	PUBLISHED	1.0.0
f860c18e-f0de-4c21-a9fa-cdf37da4e6af	1431431329424	1874770d-5efb-45b0-8dba-2d253c4e1178	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	590904fe256deae08e6411ceb04867eeca2534225d1744335dd09678ce1bc986	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	t	PUBLISHED	1.0.0
ce487131-cb8b-4249-913a-57c78ba21a39	1431431330260	6bf4b06b-01a7-47d2-8ee6-456d43055b40	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/jira-bundle.tar.gz	802507f02ee628aeaaa72285d1a31ad09577c7607da35c6154a607e708b4975d	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	t	PUBLISHED	1.0.0
99bbc86b-704e-4424-b697-f9b57cd65396	1431431331182	7993d021-9ac0-4608-a06f-d34fb77b9e6a	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/kanban-bundle.tar.gz	3f15f8be4afdc5f5b7a3f740c959d1039ef81647cec8673218f166d05e9413ea	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	t	PUBLISHED	1.0.0
25ed66e5-bbe7-407b-8431-19fa8f7c234c	1431431332045	534f6b13-9767-47e7-9a76-8541d0baf4e0	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/kandan-bundle.tar.gz	5fc0569e50639779fdb002c36c818694ddf4dc15e6cce1ba8cb476ab7262539d	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	t	PUBLISHED	1.0.0
4a6a1764-54e7-4970-a2f7-d6d5cc719589	1431431332941	3b4c0e96-69a4-4a4a-996f-9776472ab905	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	a0c7daea1b148eae9548b0557bd4e446c88455e69a6e0b5f5b1cb9d900e4c942	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	t	PUBLISHED	1.0.0
dbb85d22-b60d-42ae-8c9d-667eefe641e9	1431431333741	9426b821-d6da-4fb0-8834-89e47f7956b6	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	56ecb34befaf0ae7e25960f2edfa5f9f5a80cf7343092db93e66955fcd4f4bc6	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	t	PUBLISHED	1.0.0
5f01be4a-c107-410d-9598-e4af10967b0c	1431431334522	ae84b816-16b0-48f1-81a7-68a9e09b297a	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/phplist-bundle.tar.gz	0742f47960bde578109ea33648c1327a2030544b36c6c988e86d1ffa1fc410c0	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	t	PUBLISHED	1.0.0
e2756903-31fc-4abc-970b-b0a06e4e5be1	1431431336128	93cd8838-bfdc-4819-bdcd-faca00800824	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	7791312bf0afec9f8eba7a476e386deba72ac2bd6cb4090833f9e05c17c384a0	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	t	PUBLISHED	1.0.0
d3b5c9b3-155f-4b47-ac0b-4bc45483ab2c	1431431338544	eceee5a0-de5e-46d4-bde9-d156e875c5b7	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	7693914f438bfd8a33e5e41671f62b67674c4dd07e2835b31ec4737dd35a5a42	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	t	PUBLISHED	1.0.0
9a9a25ef-73cc-415c-8faa-163c510edf71	1431431339277	52f29cac-6a33-40d7-90b3-4bc218e60c1b	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/limesurvey-bundle.tar.gz	0cd570ae8558d382a24e48095e8abd231774e3f1e49fe10e6b8db81dabb28ff6	Web surveys, made easy.	Create surveys, send them out and view reports on the responses	http://cloudstead.io/downloads/icons/limesurvey-large.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	t	PUBLISHED	1.0.0
4c8295a8-032b-47bc-9898-29fa7ffb095f	1431431340271	bfcf1f42-60a4-4501-9e78-22d369dc648f	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/etherpad-bundle.tar.gz	e545316bc350f9703ea10ee863777ccd132d4329306d61dc532fff84141c152e	Collaborative document editing.	Create documents and let multiple people work on them together	http://cloudstead.io/downloads/icons/etherpad-large.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	t	PUBLISHED	1.0.0
\.


--
-- Data for Name: published_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY published_app (uuid, ctime, app, author, bundle_url, bundle_url_sha, blurb, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, taskbar_icon_alt_text, taskbar_icon_url, taskbar_icon_url_sha, interactive, status, version, approved_by) FROM stdin;
d219f0bb-d625-4427-8cdb-ee6b67ebd2d0	1431431329027	d219f0bb-d625-4427-8cdb-ee6b67ebd2d0	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/email-bundle.tar.gz	8be18bc3cc00c9965e4a281d17a3bf5db7a83a6aa814a2638d04d18b767eedaf	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	\N	\N	f	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
1874770d-5efb-45b0-8dba-2d253c4e1178	1431431329961	1874770d-5efb-45b0-8dba-2d253c4e1178	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	590904fe256deae08e6411ceb04867eeca2534225d1744335dd09678ce1bc986	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
6bf4b06b-01a7-47d2-8ee6-456d43055b40	1431431330842	6bf4b06b-01a7-47d2-8ee6-456d43055b40	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/jira-bundle.tar.gz	802507f02ee628aeaaa72285d1a31ad09577c7607da35c6154a607e708b4975d	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
7993d021-9ac0-4608-a06f-d34fb77b9e6a	1431431331651	7993d021-9ac0-4608-a06f-d34fb77b9e6a	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/kanban-bundle.tar.gz	3f15f8be4afdc5f5b7a3f740c959d1039ef81647cec8673218f166d05e9413ea	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
534f6b13-9767-47e7-9a76-8541d0baf4e0	1431431332646	534f6b13-9767-47e7-9a76-8541d0baf4e0	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/kandan-bundle.tar.gz	5fc0569e50639779fdb002c36c818694ddf4dc15e6cce1ba8cb476ab7262539d	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
3b4c0e96-69a4-4a4a-996f-9776472ab905	1431431333448	3b4c0e96-69a4-4a4a-996f-9776472ab905	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	a0c7daea1b148eae9548b0557bd4e446c88455e69a6e0b5f5b1cb9d900e4c942	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
9426b821-d6da-4fb0-8834-89e47f7956b6	1431431334183	9426b821-d6da-4fb0-8834-89e47f7956b6	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	56ecb34befaf0ae7e25960f2edfa5f9f5a80cf7343092db93e66955fcd4f4bc6	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
ae84b816-16b0-48f1-81a7-68a9e09b297a	1431431335054	ae84b816-16b0-48f1-81a7-68a9e09b297a	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/phplist-bundle.tar.gz	0742f47960bde578109ea33648c1327a2030544b36c6c988e86d1ffa1fc410c0	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
93cd8838-bfdc-4819-bdcd-faca00800824	1431431338262	93cd8838-bfdc-4819-bdcd-faca00800824	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	7791312bf0afec9f8eba7a476e386deba72ac2bd6cb4090833f9e05c17c384a0	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
eceee5a0-de5e-46d4-bde9-d156e875c5b7	1431431338979	eceee5a0-de5e-46d4-bde9-d156e875c5b7	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	7693914f438bfd8a33e5e41671f62b67674c4dd07e2835b31ec4737dd35a5a42	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
52f29cac-6a33-40d7-90b3-4bc218e60c1b	1431431339756	52f29cac-6a33-40d7-90b3-4bc218e60c1b	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/limesurvey-bundle.tar.gz	0cd570ae8558d382a24e48095e8abd231774e3f1e49fe10e6b8db81dabb28ff6	Web surveys, made easy.	Create surveys, send them out and view reports on the responses	http://cloudstead.io/downloads/icons/limesurvey-large.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	\N	http://cloudstead.io/downloads/icons/limesurvey-small.png	e861f1ddf8521de5ef3578fa1131f225707790b3ab467ee2af2b45f87ba714c7	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
bfcf1f42-60a4-4501-9e78-22d369dc648f	1431431340866	bfcf1f42-60a4-4501-9e78-22d369dc648f	66109ecb-d83d-4cf9-bf10-839c334d9206	http://cloudstead.io/downloads/etherpad-bundle.tar.gz	e545316bc350f9703ea10ee863777ccd132d4329306d61dc532fff84141c152e	Collaborative document editing.	Create documents and let multiple people work on them together	http://cloudstead.io/downloads/icons/etherpad-large.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	\N	http://cloudstead.io/downloads/icons/etherpad-small.png	6de8876ad4e74c057ebe20f15ccf36b67350b62f8d9421b0a054277b9ea4f1c8	t	NEW	1.0.0	66109ecb-d83d-4cf9-bf10-839c334d9206
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
-- Name: app_store_publisher_member_activation_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_activation_key UNIQUE (activation);


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

