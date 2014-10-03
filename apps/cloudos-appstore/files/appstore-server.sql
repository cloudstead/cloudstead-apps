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
-- Name: app_footprint; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE app_footprint (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    cloud_app character varying(100) NOT NULL,
    cpus integer NOT NULL,
    memory integer NOT NULL
);


ALTER TABLE public.app_footprint OWNER TO appstore;

--
-- Name: app_price; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
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


ALTER TABLE public.app_price OWNER TO appstore;

--
-- Name: app_store_account; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE app_store_account (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    admin boolean NOT NULL,
    consumer_tos integer,
    email character varying(255) NOT NULL,
    hashed_password character varying(200) NOT NULL,
    reset_token character varying(30),
    reset_token_ctime bigint,
    publisher_tos integer
);


ALTER TABLE public.app_store_account OWNER TO appstore;

--
-- Name: app_store_publisher; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE app_store_publisher (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    name character varying(255) NOT NULL,
    owner character varying(100) NOT NULL
);


ALTER TABLE public.app_store_publisher OWNER TO appstore;

--
-- Name: app_store_publisher_member; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE app_store_publisher_member (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    account character varying(100) NOT NULL,
    publisher character varying(100) NOT NULL
);


ALTER TABLE public.app_store_publisher_member OWNER TO appstore;

--
-- Name: cloud_app; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE cloud_app (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    active_version character varying(100),
    author character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    publisher character varying(100) NOT NULL
);


ALTER TABLE public.cloud_app OWNER TO appstore;

--
-- Name: cloud_app_client; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE cloud_app_client (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    client_url character varying(1024) NOT NULL,
    client_url_sha character varying(200) NOT NULL,
    cloud_app character varying(100) NOT NULL,
    type character varying(255)
);


ALTER TABLE public.cloud_app_client OWNER TO appstore;

--
-- Name: cloud_app_version; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE cloud_app_version (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    app character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    description character varying(16384) NOT NULL,
    large_icon_url character varying(1024) NOT NULL,
    large_icon_url_sha character varying(200) NOT NULL,
    metadata character varying(65536),
    small_icon_url character varying(1024) NOT NULL,
    small_icon_url_sha character varying(200) NOT NULL,
    previous_version character varying(100),
    server_config_url character varying(1024) NOT NULL,
    server_config_url_sha character varying(200) NOT NULL,
    status character varying(255) NOT NULL,
    major character varying(30),
    minor character varying(30),
    patch character varying(30)
);


ALTER TABLE public.cloud_app_version OWNER TO appstore;

--
-- Name: published_app; Type: TABLE; Schema: public; Owner: appstore; Tablespace: 
--

CREATE TABLE published_app (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    app character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    description character varying(16384) NOT NULL,
    large_icon_url character varying(1024) NOT NULL,
    large_icon_url_sha character varying(200) NOT NULL,
    metadata character varying(65536),
    small_icon_url character varying(1024) NOT NULL,
    small_icon_url_sha character varying(200) NOT NULL,
    previous_version character varying(100),
    server_config_url character varying(1024) NOT NULL,
    server_config_url_sha character varying(200) NOT NULL,
    status character varying(255) NOT NULL,
    major character varying(30),
    minor character varying(30),
    patch character varying(30),
    approved_by character varying(100) NOT NULL
);


ALTER TABLE public.published_app OWNER TO appstore;

--
-- Data for Name: app_footprint; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY app_footprint (uuid, ctime, cloud_app, cpus, memory) FROM stdin;
\.


--
-- Data for Name: app_price; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY app_price (uuid, ctime, cloud_app, initial_cost, iso_currency, monthly_fixed_cost, payment_required) FROM stdin;
\.


--
-- Data for Name: app_store_account; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY app_store_account (uuid, ctime, admin, consumer_tos, email, hashed_password, reset_token, reset_token_ctime, publisher_tos) FROM stdin;
5248813b-c1eb-47ba-96ff-eece5e66fe76	1412351608722	t	\N	uZYOG1412351608344@example.com	$2a$04$KDgTHSSAmm2k3f/Mk6Kre.b7D9N7qZuuaEnduN0WSUSs0J9UJ1s12	\N	\N	1
\.


--
-- Data for Name: app_store_publisher; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY app_store_publisher (uuid, ctime, name, owner) FROM stdin;
5248813b-c1eb-47ba-96ff-eece5e66fe76	1412351608790	fzUNmS7tIy4JsEPjCBLL	5248813b-c1eb-47ba-96ff-eece5e66fe76
\.


--
-- Data for Name: app_store_publisher_member; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY app_store_publisher_member (uuid, ctime, account, publisher) FROM stdin;
5f28e4f8-232c-4e83-8ec5-2221c9dd3f00	1412351608802	5248813b-c1eb-47ba-96ff-eece5e66fe76	5248813b-c1eb-47ba-96ff-eece5e66fe76
\.


--
-- Data for Name: cloud_app; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY cloud_app (uuid, ctime, active_version, author, name, publisher) FROM stdin;
\.


--
-- Data for Name: cloud_app_client; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY cloud_app_client (uuid, ctime, client_url, client_url_sha, cloud_app, type) FROM stdin;
\.


--
-- Data for Name: cloud_app_version; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY cloud_app_version (uuid, ctime, app, author, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, previous_version, server_config_url, server_config_url_sha, status, major, minor, patch) FROM stdin;
\.


--
-- Data for Name: published_app; Type: TABLE DATA; Schema: public; Owner: appstore
--

COPY published_app (uuid, ctime, app, author, description, large_icon_url, large_icon_url_sha, metadata, small_icon_url, small_icon_url_sha, previous_version, server_config_url, server_config_url_sha, status, major, minor, patch, approved_by) FROM stdin;
\.


--
-- Name: app_footprint_cloud_app_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_footprint
    ADD CONSTRAINT app_footprint_cloud_app_key UNIQUE (cloud_app);


--
-- Name: app_footprint_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_footprint
    ADD CONSTRAINT app_footprint_pkey PRIMARY KEY (uuid);


--
-- Name: app_price_cloud_app_iso_currency_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_price
    ADD CONSTRAINT app_price_cloud_app_iso_currency_key UNIQUE (cloud_app, iso_currency);


--
-- Name: app_price_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_price
    ADD CONSTRAINT app_price_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_account_email_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_account
    ADD CONSTRAINT app_store_account_email_key UNIQUE (email);


--
-- Name: app_store_account_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_account
    ADD CONSTRAINT app_store_account_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_publisher_member_account_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_account_key UNIQUE (account);


--
-- Name: app_store_publisher_member_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_pkey PRIMARY KEY (uuid);


--
-- Name: app_store_publisher_member_publisher_account_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_publisher_account_key UNIQUE (publisher, account);


--
-- Name: app_store_publisher_member_publisher_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher_member
    ADD CONSTRAINT app_store_publisher_member_publisher_key UNIQUE (publisher);


--
-- Name: app_store_publisher_name_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher
    ADD CONSTRAINT app_store_publisher_name_key UNIQUE (name);


--
-- Name: app_store_publisher_owner_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher
    ADD CONSTRAINT app_store_publisher_owner_key UNIQUE (owner);


--
-- Name: app_store_publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY app_store_publisher
    ADD CONSTRAINT app_store_publisher_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_app_client_cloud_app_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY cloud_app_client
    ADD CONSTRAINT cloud_app_client_cloud_app_key UNIQUE (cloud_app);


--
-- Name: cloud_app_client_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY cloud_app_client
    ADD CONSTRAINT cloud_app_client_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_app_name_key; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY cloud_app
    ADD CONSTRAINT cloud_app_name_key UNIQUE (name);


--
-- Name: cloud_app_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY cloud_app
    ADD CONSTRAINT cloud_app_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
--

ALTER TABLE ONLY cloud_app_version
    ADD CONSTRAINT cloud_app_version_pkey PRIMARY KEY (uuid);


--
-- Name: published_app_pkey; Type: CONSTRAINT; Schema: public; Owner: appstore; Tablespace: 
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

