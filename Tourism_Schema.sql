--
-- PostgreSQL database dump
--

\restrict 0vkpPyBI8iNYQZPK67Cd7aoHm9NFMRlIDxWBwqRAhzBZBEgR850zVyqOzqY4xwd

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-07 22:30:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16389)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    clientid integer NOT NULL,
    name character varying(200) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(100)
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16388)
-- Name: client_clientid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_clientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_clientid_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 219
-- Name: client_clientid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_clientid_seq OWNED BY public.client.clientid;


--
-- TOC entry 222 (class 1259 OID 16403)
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager (
    managerid integer NOT NULL,
    name character varying(200) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(100)
);


ALTER TABLE public.manager OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16402)
-- Name: manager_managerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manager_managerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manager_managerid_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 221
-- Name: manager_managerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manager_managerid_seq OWNED BY public.manager.managerid;


--
-- TOC entry 226 (class 1259 OID 16430)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    serviceid integer NOT NULL,
    name character varying(200) NOT NULL,
    category character varying(50) NOT NULL,
    price numeric(8,2) NOT NULL
);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16429)
-- Name: service_serviceid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_serviceid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_serviceid_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 225
-- Name: service_serviceid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_serviceid_seq OWNED BY public.service.serviceid;


--
-- TOC entry 228 (class 1259 OID 16441)
-- Name: tourorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tourorder (
    orderid integer NOT NULL,
    clientid integer NOT NULL,
    managerid integer NOT NULL,
    packageid integer,
    serviceid integer,
    orderdate date NOT NULL,
    persons integer DEFAULT 1,
    totalprice numeric(10,2) NOT NULL
);


ALTER TABLE public.tourorder OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16440)
-- Name: tourorder_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tourorder_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tourorder_orderid_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 227
-- Name: tourorder_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tourorder_orderid_seq OWNED BY public.tourorder.orderid;


--
-- TOC entry 224 (class 1259 OID 16417)
-- Name: tourpackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tourpackage (
    packageid integer NOT NULL,
    name character varying(200) NOT NULL,
    price numeric(10,2) NOT NULL,
    durationdays integer NOT NULL
);


ALTER TABLE public.tourpackage OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16416)
-- Name: tourpackage_packageid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tourpackage_packageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tourpackage_packageid_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 223
-- Name: tourpackage_packageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tourpackage_packageid_seq OWNED BY public.tourpackage.packageid;


--
-- TOC entry 4770 (class 2604 OID 16392)
-- Name: client clientid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN clientid SET DEFAULT nextval('public.client_clientid_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16406)
-- Name: manager managerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager ALTER COLUMN managerid SET DEFAULT nextval('public.manager_managerid_seq'::regclass);


--
-- TOC entry 4773 (class 2604 OID 16433)
-- Name: service serviceid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN serviceid SET DEFAULT nextval('public.service_serviceid_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 16444)
-- Name: tourorder orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourorder ALTER COLUMN orderid SET DEFAULT nextval('public.tourorder_orderid_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 16420)
-- Name: tourpackage packageid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourpackage ALTER COLUMN packageid SET DEFAULT nextval('public.tourpackage_packageid_seq'::regclass);


--
-- TOC entry 4948 (class 0 OID 16389)
-- Dependencies: 220
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (clientid, name, phone, email) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 16403)
-- Dependencies: 222
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manager (managerid, name, phone, email) FROM stdin;
\.


--
-- TOC entry 4954 (class 0 OID 16430)
-- Dependencies: 226
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (serviceid, name, category, price) FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 16441)
-- Dependencies: 228
-- Data for Name: tourorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tourorder (orderid, clientid, managerid, packageid, serviceid, orderdate, persons, totalprice) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 16417)
-- Dependencies: 224
-- Data for Name: tourpackage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tourpackage (packageid, name, price, durationdays) FROM stdin;
\.


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 219
-- Name: client_clientid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_clientid_seq', 1, false);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 221
-- Name: manager_managerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.manager_managerid_seq', 1, false);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 225
-- Name: service_serviceid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_serviceid_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 227
-- Name: tourorder_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tourorder_orderid_seq', 1, false);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 223
-- Name: tourpackage_packageid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tourpackage_packageid_seq', 1, false);


--
-- TOC entry 4777 (class 2606 OID 16401)
-- Name: client client_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_email_key UNIQUE (email);


--
-- TOC entry 4779 (class 2606 OID 16399)
-- Name: client client_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_phone_key UNIQUE (phone);


--
-- TOC entry 4781 (class 2606 OID 16397)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientid);


--
-- TOC entry 4783 (class 2606 OID 16415)
-- Name: manager manager_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_email_key UNIQUE (email);


--
-- TOC entry 4785 (class 2606 OID 16413)
-- Name: manager manager_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_phone_key UNIQUE (phone);


--
-- TOC entry 4787 (class 2606 OID 16411)
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (managerid);


--
-- TOC entry 4793 (class 2606 OID 16439)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (serviceid);


--
-- TOC entry 4795 (class 2606 OID 16452)
-- Name: tourorder tourorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourorder
    ADD CONSTRAINT tourorder_pkey PRIMARY KEY (orderid);


--
-- TOC entry 4789 (class 2606 OID 16428)
-- Name: tourpackage tourpackage_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourpackage
    ADD CONSTRAINT tourpackage_name_key UNIQUE (name);


--
-- TOC entry 4791 (class 2606 OID 16426)
-- Name: tourpackage tourpackage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourpackage
    ADD CONSTRAINT tourpackage_pkey PRIMARY KEY (packageid);


--
-- TOC entry 4796 (class 2606 OID 16453)
-- Name: tourorder tourorder_clientid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourorder
    ADD CONSTRAINT tourorder_clientid_fkey FOREIGN KEY (clientid) REFERENCES public.client(clientid);


--
-- TOC entry 4797 (class 2606 OID 16458)
-- Name: tourorder tourorder_managerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourorder
    ADD CONSTRAINT tourorder_managerid_fkey FOREIGN KEY (managerid) REFERENCES public.manager(managerid);


--
-- TOC entry 4798 (class 2606 OID 16463)
-- Name: tourorder tourorder_packageid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourorder
    ADD CONSTRAINT tourorder_packageid_fkey FOREIGN KEY (packageid) REFERENCES public.tourpackage(packageid);


--
-- TOC entry 4799 (class 2606 OID 16468)
-- Name: tourorder tourorder_serviceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourorder
    ADD CONSTRAINT tourorder_serviceid_fkey FOREIGN KEY (serviceid) REFERENCES public.service(serviceid);


-- Completed on 2026-01-07 22:30:48

--
-- PostgreSQL database dump complete
--

\unrestrict 0vkpPyBI8iNYQZPK67Cd7aoHm9NFMRlIDxWBwqRAhzBZBEgR850zVyqOzqY4xwd

