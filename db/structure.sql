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

--
-- Name: pack_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.pack_type AS ENUM (
    'core',
    'hero',
    'scenario',
    'campaign',
    'print-n-play'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: identities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.identities (
    id bigint NOT NULL,
    alter_ego character varying NOT NULL,
    hero character varying NOT NULL,
    features character varying[] DEFAULT '{}'::character varying[],
    pack_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: modular_encounter_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.modular_encounter_sets (
    id bigint NOT NULL,
    name character varying NOT NULL,
    difficulty integer,
    pack_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: modular_encounter_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.modular_encounter_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: modular_encounter_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.modular_encounter_sets_id_seq OWNED BY public.modular_encounter_sets.id;


--
-- Name: packs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.packs (
    id bigint NOT NULL,
    name character varying NOT NULL,
    pack_type public.pack_type NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: packs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.packs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: packs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.packs_id_seq OWNED BY public.packs.id;


--
-- Name: scenarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scenarios (
    id bigint NOT NULL,
    name character varying,
    features character varying[] DEFAULT '{}'::character varying[],
    pack_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: scenarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scenarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scenarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.scenarios_id_seq OWNED BY public.scenarios.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: modular_encounter_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modular_encounter_sets ALTER COLUMN id SET DEFAULT nextval('public.modular_encounter_sets_id_seq'::regclass);


--
-- Name: packs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.packs ALTER COLUMN id SET DEFAULT nextval('public.packs_id_seq'::regclass);


--
-- Name: scenarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenarios ALTER COLUMN id SET DEFAULT nextval('public.scenarios_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: modular_encounter_sets modular_encounter_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modular_encounter_sets
    ADD CONSTRAINT modular_encounter_sets_pkey PRIMARY KEY (id);


--
-- Name: packs packs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.packs
    ADD CONSTRAINT packs_pkey PRIMARY KEY (id);


--
-- Name: scenarios scenarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenarios
    ADD CONSTRAINT scenarios_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_identities_on_alter_ego; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_identities_on_alter_ego ON public.identities USING btree (alter_ego);


--
-- Name: index_identities_on_alter_ego_and_hero; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_identities_on_alter_ego_and_hero ON public.identities USING btree (alter_ego, hero);


--
-- Name: index_identities_on_hero; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_identities_on_hero ON public.identities USING btree (hero);


--
-- Name: index_identities_on_pack_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_identities_on_pack_id ON public.identities USING btree (pack_id);


--
-- Name: index_modular_encounter_sets_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_modular_encounter_sets_on_name ON public.modular_encounter_sets USING btree (name);


--
-- Name: index_modular_encounter_sets_on_pack_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_modular_encounter_sets_on_pack_id ON public.modular_encounter_sets USING btree (pack_id);


--
-- Name: index_packs_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_packs_on_name ON public.packs USING btree (name);


--
-- Name: index_scenarios_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_scenarios_on_name ON public.scenarios USING btree (name);


--
-- Name: index_scenarios_on_pack_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_scenarios_on_pack_id ON public.scenarios USING btree (pack_id);


--
-- Name: scenarios fk_rails_19851f151f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenarios
    ADD CONSTRAINT fk_rails_19851f151f FOREIGN KEY (pack_id) REFERENCES public.packs(id);


--
-- Name: identities fk_rails_718a2274b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT fk_rails_718a2274b3 FOREIGN KEY (pack_id) REFERENCES public.packs(id);


--
-- Name: modular_encounter_sets fk_rails_7358c1921c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.modular_encounter_sets
    ADD CONSTRAINT fk_rails_7358c1921c FOREIGN KEY (pack_id) REFERENCES public.packs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200906002438'),
('20200906010027'),
('20200906013546'),
('20200906014555');


