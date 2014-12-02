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
    previous_version character varying(100),
    status character varying(255) NOT NULL,
    major character varying(30),
    minor character varying(30),
    patch character varying(30)
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
    previous_version character varying(100),
    status character varying(255) NOT NULL,
    major character varying(30),
    minor character varying(30),
    patch character varying(30),
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
b6cfec5f-a1df-4f7d-a420-e20486f280bd	1417558542498	appstore_admin	t	\N	appstore_admin	\N	\N	f	admin	$2a$04$VL8e2OD4HpRPAK9.MzDEE.DbvKVahiq9QXxHejcwyj34ocuuXKK2a	\N	\N	\N	admin	n/a	1	f	f	1
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
b6cfec5f-a1df-4f7d-a420-e20486f280bd	1417558542507	appstore_admin	b6cfec5f-a1df-4f7d-a420-e20486f280bd
\.


--
-- Data for Name: app_store_publisher_member; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_publisher_member (uuid, ctime, account, publisher) FROM stdin;
3d6ffc31-0a00-4393-94f5-c4037b1844dc	1417558542513	b6cfec5f-a1df-4f7d-a420-e20486f280bd	b6cfec5f-a1df-4f7d-a420-e20486f280bd
\.


--
-- Data for Name: cloud_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app (uuid, ctime, active_version, author, name, publisher) FROM stdin;
a5f1d79d-89a9-4857-a917-7389e2000dc4	1417558542629	6204b215-375f-46eb-a958-40ff01701268	b6cfec5f-a1df-4f7d-a420-e20486f280bd	email	b6cfec5f-a1df-4f7d-a420-e20486f280bd
8831d632-7de7-427d-aba9-2bb336b07504	1417558543424	aedd397f-f7f0-41d4-acc1-26d8db0b577f	b6cfec5f-a1df-4f7d-a420-e20486f280bd	gitlab	b6cfec5f-a1df-4f7d-a420-e20486f280bd
5c6e75e1-f801-4ba1-992b-fc3797fa842c	1417558543964	074ab560-c351-4bf7-bc2b-64d10e29b3da	b6cfec5f-a1df-4f7d-a420-e20486f280bd	jira	b6cfec5f-a1df-4f7d-a420-e20486f280bd
9d2babfc-49c9-44c7-aeb5-4b7bfded7b80	1417558544586	271634ce-22d1-4b01-af46-cd9eb19d4a76	b6cfec5f-a1df-4f7d-a420-e20486f280bd	kanban	b6cfec5f-a1df-4f7d-a420-e20486f280bd
74dc0a5d-1fce-4aa6-ba14-741decd0ce35	1417558545269	0f7ce846-a251-4bf8-afec-d506b67b7331	b6cfec5f-a1df-4f7d-a420-e20486f280bd	kandan	b6cfec5f-a1df-4f7d-a420-e20486f280bd
4f3b6a28-b653-46d6-964f-3680a2e7296e	1417558546422	546a03da-8ae7-4070-81dc-84d8a5348eb0	b6cfec5f-a1df-4f7d-a420-e20486f280bd	owncloud	b6cfec5f-a1df-4f7d-a420-e20486f280bd
a3d86544-ac43-4c40-90a8-f1739201e271	1417558546900	e6183504-08fc-42b9-8bec-d91263e0ecae	b6cfec5f-a1df-4f7d-a420-e20486f280bd	phabricator	b6cfec5f-a1df-4f7d-a420-e20486f280bd
1f2fb1a3-7524-416f-b23f-d3e6c62cef55	1417558547453	5f3cecfd-a6ea-4f6f-aa71-2b81699ccd51	b6cfec5f-a1df-4f7d-a420-e20486f280bd	phplist	b6cfec5f-a1df-4f7d-a420-e20486f280bd
f0b82679-3fcb-4efb-b601-ee02c548313c	1417558548468	fa6885aa-71c6-4821-ae00-426806286698	b6cfec5f-a1df-4f7d-a420-e20486f280bd	roundcube	b6cfec5f-a1df-4f7d-a420-e20486f280bd
4a123eda-5894-461e-9a29-a66d46cc5802	1417558549881	a2b6b054-e493-4b95-8d3c-919fedb1e3c4	b6cfec5f-a1df-4f7d-a420-e20486f280bd	roundcube-calendar	b6cfec5f-a1df-4f7d-a420-e20486f280bd
\.


--
-- Data for Name: cloud_app_client; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app_client (uuid, ctime, client_url, client_url_sha, cloud_app, type) FROM stdin;
\.


--
-- Data for Name: cloud_app_version; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app_version (uuid, ctime, app, author, bundle_url, bundle_url_sha, blurb, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, previous_version, status, major, minor, patch) FROM stdin;
6204b215-375f-46eb-a958-40ff01701268	1417558542984	a5f1d79d-89a9-4857-a917-7389e2000dc4	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/email-bundle.tar.gz	c6f6b8f82ad4488af9dab3d27522b965df87124abac4337d5ce5369d75b07a1b	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	PUBLISHED	1	0	0
aedd397f-f7f0-41d4-acc1-26d8db0b577f	1417558543600	8831d632-7de7-427d-aba9-2bb336b07504	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	b772e184bdb96b46a7d81124da2d26c5673a7d3afc4dc275b4e0b5d0a5a91c42	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	PUBLISHED	1	0	0
074ab560-c351-4bf7-bc2b-64d10e29b3da	1417558544144	5c6e75e1-f801-4ba1-992b-fc3797fa842c	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/jira-bundle.tar.gz	c276f58bd0c70cf8e3d2ecb4215ff33a431d946f27cfbf40a6a2c076db7d2007	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	PUBLISHED	1	0	0
271634ce-22d1-4b01-af46-cd9eb19d4a76	1417558544797	9d2babfc-49c9-44c7-aeb5-4b7bfded7b80	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/kanban-bundle.tar.gz	432f7eaa859d42fa2c4d6931b4b36fe9d6152443afdd614a702b030ca558203a	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	PUBLISHED	1	0	0
0f7ce846-a251-4bf8-afec-d506b67b7331	1417558545666	74dc0a5d-1fce-4aa6-ba14-741decd0ce35	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/kandan-bundle.tar.gz	bb951a2fe06986b640c41fee238099e68258c9697b58f4449a72fc0fb73ae3c2	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	PUBLISHED	1	0	0
546a03da-8ae7-4070-81dc-84d8a5348eb0	1417558546565	4f3b6a28-b653-46d6-964f-3680a2e7296e	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	20bb892ec9698936012f11ee8ce4594a9325258bf4c5e3f74f1bbd8d8930e0b7	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	PUBLISHED	1	0	0
e6183504-08fc-42b9-8bec-d91263e0ecae	1417558547096	a3d86544-ac43-4c40-90a8-f1739201e271	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	12bb26e49e6dc6007a110e99aa212ef72212db997bb017c19a54fceccf08a19d	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	PUBLISHED	1	0	0
5f3cecfd-a6ea-4f6f-aa71-2b81699ccd51	1417558547643	1f2fb1a3-7524-416f-b23f-d3e6c62cef55	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/phplist-bundle.tar.gz	d6fef926f0cddf134a016842bd20f43a0da411c3cf0e42dc6925826b898340fe	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	PUBLISHED	1	0	0
fa6885aa-71c6-4821-ae00-426806286698	1417558548918	f0b82679-3fcb-4efb-b601-ee02c548313c	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	18a5592841742258885aa5cf74fffb7d82117aa8cacf2678473de9b855b9064a	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	PUBLISHED	1	0	0
a2b6b054-e493-4b95-8d3c-919fedb1e3c4	1417558550430	4a123eda-5894-461e-9a29-a66d46cc5802	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	dffd033efdd4c3f984808f23bdce5ac826e5d3a3d81ec15aeae92add3d1185ee	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	PUBLISHED	1	0	0
\.


--
-- Data for Name: published_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY published_app (uuid, ctime, app, author, bundle_url, bundle_url_sha, blurb, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, previous_version, status, major, minor, patch, approved_by) FROM stdin;
a5f1d79d-89a9-4857-a917-7389e2000dc4	1417558543379	a5f1d79d-89a9-4857-a917-7389e2000dc4	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/email-bundle.tar.gz	c6f6b8f82ad4488af9dab3d27522b965df87124abac4337d5ce5369d75b07a1b	Provides services for sending and receiving Internet email	Provides secure SMTP and IMAP services	http://cloudstead.io/downloads/icons/email-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/email-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
8831d632-7de7-427d-aba9-2bb336b07504	1417558543920	8831d632-7de7-427d-aba9-2bb336b07504	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/gitlab-bundle.tar.gz	b772e184bdb96b46a7d81124da2d26c5673a7d3afc4dc275b4e0b5d0a5a91c42	A git repository manager, similar to Github	A git repository manager, similar to Github	http://cloudstead.io/downloads/icons/gitlab-large.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	http://cloudstead.io/downloads/icons/gitlab-small.png	850a992b34139f6a788a4f7a1c34e7ed381dd4c937f028067128cb15df042042	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
5c6e75e1-f801-4ba1-992b-fc3797fa842c	1417558544545	5c6e75e1-f801-4ba1-992b-fc3797fa842c	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/jira-bundle.tar.gz	c276f58bd0c70cf8e3d2ecb4215ff33a431d946f27cfbf40a6a2c076db7d2007	A popular issue tracker made by Atlassian	A popular issue tracker made by Atlassian	http://cloudstead.io/downloads/icons/jira-large.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	http://cloudstead.io/downloads/icons/jira-small.png	ce50cb2d891a4801b45d68ff2cb84ff77981d8f1e5f7a2d54b124f071190c552	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
9d2babfc-49c9-44c7-aeb5-4b7bfded7b80	1417558545224	9d2babfc-49c9-44c7-aeb5-4b7bfded7b80	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/kanban-bundle.tar.gz	432f7eaa859d42fa2c4d6931b4b36fe9d6152443afdd614a702b030ca558203a	Simple project management with Kanban boards	Simple project management with Kanban boards	http://cloudstead.io/downloads/icons/kanban-large.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	http://cloudstead.io/downloads/icons/kanban-small.png	8243aca0e8223d1f4413c41c562e22a362eb473808b6eeb0762fe369a30c58c6	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
74dc0a5d-1fce-4aa6-ba14-741decd0ce35	1417558546383	74dc0a5d-1fce-4aa6-ba14-741decd0ce35	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/kandan-bundle.tar.gz	bb951a2fe06986b640c41fee238099e68258c9697b58f4449a72fc0fb73ae3c2	An instant messenger that's great for groups	An instant messenger that's great for groups	http://cloudstead.io/downloads/icons/kandan-large.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	http://cloudstead.io/downloads/icons/kandan-small.png	b7bafbfe8544327489da3774c1f40a6a96a2f8522e9956559f3db4580408f8b7	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
4f3b6a28-b653-46d6-964f-3680a2e7296e	1417558546861	4f3b6a28-b653-46d6-964f-3680a2e7296e	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/owncloud-bundle.tar.gz	20bb892ec9698936012f11ee8ce4594a9325258bf4c5e3f74f1bbd8d8930e0b7	Cloud file storage, similar to DropBox	Cloud file storage, similar to DropBox	http://cloudstead.io/downloads/icons/owncloud-large.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	http://cloudstead.io/downloads/icons/owncloud-small.png	81af6cad4b691dbca672a7475e4a54acdf6ba9a8b3b91d06d7226ae08c018c46	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
a3d86544-ac43-4c40-90a8-f1739201e271	1417558547415	a3d86544-ac43-4c40-90a8-f1739201e271	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/phabricator-bundle.tar.gz	12bb26e49e6dc6007a110e99aa212ef72212db997bb017c19a54fceccf08a19d	An open source software engineering platform	An open source software engineering platform	http://cloudstead.io/downloads/icons/phabricator-large.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	http://cloudstead.io/downloads/icons/phabricator-small.png	3694043aa420ad88d601e5427bc150f574a873529090b2a050710962a3410a01	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
1f2fb1a3-7524-416f-b23f-d3e6c62cef55	1417558548429	1f2fb1a3-7524-416f-b23f-d3e6c62cef55	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/phplist-bundle.tar.gz	d6fef926f0cddf134a016842bd20f43a0da411c3cf0e42dc6925826b898340fe	Email list manager. Great for marketing and communications.	Email list manager. Great for marketing and communications.	http://cloudstead.io/downloads/icons/phplist-large.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	http://cloudstead.io/downloads/icons/phplist-small.png	e5a3a7f53bbd56fd00ea3a1d9f5eb67f4d1b5ebb643479c19f2cbf8cd1f7f498	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
f0b82679-3fcb-4efb-b601-ee02c548313c	1417558549843	f0b82679-3fcb-4efb-b601-ee02c548313c	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/roundcube-bundle.tar.gz	18a5592841742258885aa5cf74fffb7d82117aa8cacf2678473de9b855b9064a	Webmail for your cloudstead	Webmail for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-large.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	http://cloudstead.io/downloads/icons/roundcube-small.png	9b66a778c51de8e58e3649697f18b59086108085a6f0e834c73164064633555c	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
4a123eda-5894-461e-9a29-a66d46cc5802	1417558551519	4a123eda-5894-461e-9a29-a66d46cc5802	b6cfec5f-a1df-4f7d-a420-e20486f280bd	http://cloudstead.io/downloads/roundcube-calendar-bundle.tar.gz	dffd033efdd4c3f984808f23bdce5ac826e5d3a3d81ec15aeae92add3d1185ee	Web calendar for your cloudstead	Web calendar for your cloudstead	http://cloudstead.io/downloads/icons/roundcube-calendar-large.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	http://cloudstead.io/downloads/icons/roundcube-calendar-small.png	0aaba50b427087d2ea5b0407fa32ad4e9af44becf17522666d6e05b6492d0f70	\N	NEW	1	0	0	b6cfec5f-a1df-4f7d-a420-e20486f280bd
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

