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
    name character varying(100) NOT NULL,
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
    name character varying(100) NOT NULL,
    author character varying(100),
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
    approved_by character varying(100),
    bundle_sha character varying(80) NOT NULL,
    status character varying(20) NOT NULL,
    version character varying(100) NOT NULL
);


ALTER TABLE public.cloud_app_version OWNER TO cloudos_appstore_test;

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
9d4c7239-8421-44a8-ab91-affe9bcc31ae	1432360076671	admin	t	\N	_@_	\N	\N	f	cloudstead	$2a$04$w9NLZx5NCdLvnGIHL/f9A.OKOIHMtdOZlsKBsrvORQFzA8E8Z1lnO	\N	\N	\N	cloudstead	\N	________	1	t	f	\N
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
bb8196a6-9256-4136-9c28-e5b0ae55c354	1432360076877	admin	9d4c7239-8421-44a8-ab91-affe9bcc31ae
\.


--
-- Data for Name: app_store_publisher_member; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY app_store_publisher_member (uuid, ctime, account, activation, activation_expiration, active, publisher) FROM stdin;
da6500a0-17e2-42d6-bb40-512915a4896a	1432360076909	9d4c7239-8421-44a8-ab91-affe9bcc31ae	\N	\N	t	bb8196a6-9256-4136-9c28-e5b0ae55c354
\.


--
-- Data for Name: cloud_app; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app (uuid, ctime, name, author, publisher) FROM stdin;
\.


--
-- Data for Name: cloud_app_client; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app_client (uuid, ctime, client_url, client_url_sha, cloud_app, type) FROM stdin;
\.


--
-- Data for Name: cloud_app_version; Type: TABLE DATA; Schema: public; Owner: cloudos_appstore_test
--

COPY cloud_app_version (uuid, ctime, app, approved_by, bundle_sha, status, version) FROM stdin;
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
-- Name: cloud_app_version_app_version_key; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app_version
    ADD CONSTRAINT cloud_app_version_app_version_key UNIQUE (app, version);


--
-- Name: cloud_app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudos_appstore_test; Tablespace: 
--

ALTER TABLE ONLY cloud_app_version
    ADD CONSTRAINT cloud_app_version_pkey PRIMARY KEY (uuid);


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

