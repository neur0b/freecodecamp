--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description character varying(30),
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(8,1),
    diameter integer NOT NULL,
    has_life boolean,
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    distance_from_earth numeric(8,2),
    diameter integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    distance_from_earth numeric(8,2),
    diameter integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    distance_from_earth numeric(8,2),
    diameter integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: zodiac; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.zodiac (
    sign_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.zodiac OWNER TO freecodecamp;

--
-- Name: zodiac_sign_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.zodiac_sign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.zodiac_sign_id_seq OWNER TO freecodecamp;

--
-- Name: zodiac_sign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.zodiac_sign_id_seq OWNED BY public.zodiac.sign_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: zodiac sign_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac ALTER COLUMN sign_id SET DEFAULT nextval('public.zodiac_sign_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lattea', 'La galassia in cui viviamo', 100, 34.5, 50, true, 'Ovale');
INSERT INTO public.galaxy VALUES (2, 'Cane Maggiore', 'nome molto buffo', 1010, 44.5, 60, false, 'Ellittica');
INSERT INTO public.galaxy VALUES (3, 'Ellittica sagittario', 'nome molto arcano', 140, 44.4, 70, false, 'Ellittica');
INSERT INTO public.galaxy VALUES (4, 'Urssa major II', 'nome molto alatino', 140, 44.4, 70, false, 'Ellittica');
INSERT INTO public.galaxy VALUES (5, 'Nube Magellano', 'nome storico', 140, 44.4, 70, false, 'Nebulosa');
INSERT INTO public.galaxy VALUES (6, 'Nana del Boote', 'nome tedesco', 140, 44.4, 70, false, 'Nana');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna', 'la più vicina', false, 44.40, 34, 3, 3);
INSERT INTO public.moon VALUES (2, 'phobos', 'quella strana', false, 45.50, 45, 4, 4);
INSERT INTO public.moon VALUES (3, 'deinos', 'la terribile', false, 23.20, 34, 3, 6);
INSERT INTO public.moon VALUES (4, 'panico', 'la terribile', false, 23.20, 34, 3, 5);
INSERT INTO public.moon VALUES (5, 'carnevale', 'la terribile', false, 23.20, 34, 3, 2);
INSERT INTO public.moon VALUES (6, 'pasqua', 'la terribile', false, 23.20, 34, 3, 1);
INSERT INTO public.moon VALUES (7, 'millanta', 'la terribile', false, 23.20, 34, 3, 11);
INSERT INTO public.moon VALUES (8, 'hui', 'la terribile', false, 23.20, 34, 3, 1);
INSERT INTO public.moon VALUES (9, 'micros', 'la terribile', false, 23.20, 34, 3, 1);
INSERT INTO public.moon VALUES (10, 'deini', 'la terribile', false, 23.20, 34, 3, 12);
INSERT INTO public.moon VALUES (11, 'mammamia', 'la terribile', false, 23.20, 34, 3, 7);
INSERT INTO public.moon VALUES (12, 'mimimi', 'la terribile', false, 23.20, 34, 3, 5);
INSERT INTO public.moon VALUES (13, 'icaro', 'la terribile', false, 23.20, 34, 3, 4);
INSERT INTO public.moon VALUES (14, 'dedalo', 'la terribile', false, 23.20, 34, 3, 8);
INSERT INTO public.moon VALUES (15, 'teseo', 'la terribile', false, 23.20, 34, 3, 6);
INSERT INTO public.moon VALUES (16, 'cricri', 'la terribile', false, 23.20, 34, 3, 6);
INSERT INTO public.moon VALUES (17, 'mari', 'la terribile', false, 23.20, 34, 3, 6);
INSERT INTO public.moon VALUES (18, 'drrs', 'la terribile', false, 23.20, 34, 3, 6);
INSERT INTO public.moon VALUES (19, 'daas', 'la terribile', false, 23.20, 34, 3, 6);
INSERT INTO public.moon VALUES (20, 'rrs', 'la terribile', false, 23.20, 34, 3, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Il più vicino', false, 12.12, 2, 2, 7);
INSERT INTO public.planet VALUES (2, 'Venere', 'La prima', false, 12.32, 3, 4, 7);
INSERT INTO public.planet VALUES (3, 'Terra', 'La casa', true, 12.52, 6, 6, 7);
INSERT INTO public.planet VALUES (4, 'Marte', 'Il rosso', false, 12.53, 4, 5, 7);
INSERT INTO public.planet VALUES (5, 'Giove', 'Il grande', false, 32.53, 44, 4, 7);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Il vecchio', false, 31.53, 42, 4, 7);
INSERT INTO public.planet VALUES (7, 'Urano', 'Il mistico', false, 32.53, 423, 4, 7);
INSERT INTO public.planet VALUES (8, 'Nettuno', 'Il marino', false, 32.53, 424, 4, 7);
INSERT INTO public.planet VALUES (9, 'Plutone', 'Il lontano', false, 32.53, 424, 4, 7);
INSERT INTO public.planet VALUES (10, 'Digiworld', 'Il gioioso', false, 32.53, 424, 4, 3);
INSERT INTO public.planet VALUES (11, 'Pokeworld', 'avventuriero', false, 32.53, 424, 4, 2);
INSERT INTO public.planet VALUES (12, 'Gormitiland', 'Orrido', false, 32.53, 424, 4, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima centauri', 'La stella vicina', false, 566.67, 345, 4234, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'La stella famosa', false, 566.67, 345, 4234, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'La stella famosina', false, 566.67, 345, 4234, 1);
INSERT INTO public.star VALUES (4, 'Barnard', 'Quasi inglese', false, 566.67, 345, 4234, 1);
INSERT INTO public.star VALUES (5, 'Wolf 359', 'Risolve Problemi', false, 566.67, 345, 4234, 1);
INSERT INTO public.star VALUES (6, 'Luyten', 'Quasi mistica', false, 566.67, 345, 4234, 1);
INSERT INTO public.star VALUES (7, 'Sole', 'La vita', false, 566.67, 345, 4234, 1);


--
-- Data for Name: zodiac; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.zodiac VALUES (1, 'scorpio', 7);
INSERT INTO public.zodiac VALUES (2, 'libra', 8);
INSERT INTO public.zodiac VALUES (3, 'sagitta', 11);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: zodiac_sign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.zodiac_sign_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: zodiac zodiac_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac
    ADD CONSTRAINT zodiac_name_key UNIQUE (name);


--
-- Name: zodiac zodiac_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac
    ADD CONSTRAINT zodiac_pkey PRIMARY KEY (sign_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: zodiac zodiac_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.zodiac
    ADD CONSTRAINT zodiac_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

