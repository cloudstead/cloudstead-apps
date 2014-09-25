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
-- Name: admin; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE admin (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    email character varying(255),
    email_verification_code character varying(255),
    email_verification_code_created_at bigint,
    email_verified boolean NOT NULL,
    mobile_phone character varying(255),
    mobile_phone_verification_code character varying(255),
    mobile_phone_verification_code_created_at bigint,
    mobile_phone_verified boolean NOT NULL,
    hashed_password character varying(200) NOT NULL,
    reset_token character varying(30),
    reset_token_ctime bigint
);


ALTER TABLE public.admin OWNER TO cloudstead;

--
-- Name: cloud_os; Type: TABLE; Schema: public; Owner: cloudstead; Tablespace: 
--

CREATE TABLE cloud_os (
    uuid character varying(100) NOT NULL,
    ctime bigint NOT NULL,
    admin_uuid character varying(255),
    instance_json character varying(1024),
    name character varying(20),
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
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY admin (uuid, ctime, email, email_verification_code, email_verification_code_created_at, email_verified, mobile_phone, mobile_phone_verification_code, mobile_phone_verification_code_created_at, mobile_phone_verified, hashed_password, reset_token, reset_token_ctime) FROM stdin;
\.


--
-- Data for Name: cloud_os; Type: TABLE DATA; Schema: public; Owner: cloudstead
--

COPY cloud_os (uuid, ctime, admin_uuid, instance_json, name, running, s3access_key, s3secret_key) FROM stdin;
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

