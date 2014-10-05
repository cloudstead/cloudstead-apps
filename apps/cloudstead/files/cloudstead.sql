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
-- Name: account_device; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE account_device (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    account character varying(255),
    auth_time bigint,
    device_id character varying(255),
    device_name character varying(255)
);


ALTER TABLE public.account_device OWNER TO cloudstead;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE admin (
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
    last_login bigint,
    last_name character varying(25) NOT NULL,
    mobile_phone character varying(30),
    mobile_phone_country_code integer,
    mobile_phone_verification_code character varying(100),
    mobile_phone_verification_code_created_at bigint,
    mobile_phone_verified boolean NOT NULL,
    suspended boolean NOT NULL,
    two_factor boolean NOT NULL,
    hashed_password character varying(200) NOT NULL,
    reset_token character varying(30),
    reset_token_ctime bigint,
    tos_version integer
);


ALTER TABLE public.admin OWNER TO cloudstead;

--
-- Name: cloud_os; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE cloud_os (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    name character varying(30) NOT NULL,
    admin_uuid character varying(255),
    instance_json character varying(1024),
    running boolean NOT NULL,
    s3access_key character varying(255),
    s3secret_key character varying(255)
);


ALTER TABLE public.cloud_os OWNER TO cloudstead;

--
-- Name: cloud_os_event; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE cloud_os_event (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    cloud_os_uuid character varying(255),
    message_key character varying(255)
);


ALTER TABLE public.cloud_os_event OWNER TO cloudstead;

--
-- Name: service_key; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE service_key (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    host character varying(255),
    key character varying(255)
);


ALTER TABLE public.service_key OWNER TO cloudstead;

--
-- Data for Name: account_device; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY account_device (uuid, ctime, account, auth_time, device_id, device_name) FROM stdin;
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY admin (uuid, ctime, name, admin, auth_id, email, email_verification_code, email_verification_code_created_at, email_verified, first_name, last_login, last_name, mobile_phone, mobile_phone_country_code, mobile_phone_verification_code, mobile_phone_verification_code_created_at, mobile_phone_verified, suspended, two_factor, hashed_password, reset_token, reset_token_ctime, tos_version) FROM stdin;
\.


--
-- Data for Name: cloud_os; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY cloud_os (uuid, ctime, name, admin_uuid, instance_json, running, s3access_key, s3secret_key) FROM stdin;
\.


--
-- Data for Name: cloud_os_event; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY cloud_os_event (uuid, ctime, cloud_os_uuid, message_key) FROM stdin;
\.


--
-- Data for Name: service_key; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY service_key (uuid, ctime, host, key) FROM stdin;
\.


--
-- Name: account_device_account_device_id_key; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY account_device
    ADD CONSTRAINT account_device_account_device_id_key UNIQUE (account, device_id);


--
-- Name: account_device_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY account_device
    ADD CONSTRAINT account_device_pkey PRIMARY KEY (uuid);


--
-- Name: admin_email_key; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- Name: admin_name_key; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_name_key UNIQUE (name);


--
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_os_event_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY cloud_os_event
    ADD CONSTRAINT cloud_os_event_pkey PRIMARY KEY (uuid);


--
-- Name: cloud_os_name_key; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY cloud_os
    ADD CONSTRAINT cloud_os_name_key UNIQUE (name);


--
-- Name: cloud_os_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY cloud_os
    ADD CONSTRAINT cloud_os_pkey PRIMARY KEY (uuid);


--
-- Name: service_key_pkey; Type: CONSTRAINT; Schema: public; Owner: cloudstead; Tablespace: 
--

ALTER TABLE ONLY service_key
    ADD CONSTRAINT service_key_pkey PRIMARY KEY (uuid);


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

