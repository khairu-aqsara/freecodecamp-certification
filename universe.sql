--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: astronaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronaut (
    astronaut_id integer NOT NULL,
    name character varying(100) NOT NULL,
    active boolean NOT NULL,
    mission_count integer NOT NULL,
    galaxy_id integer,
    specializations text,
    height_cm numeric(5,2) NOT NULL
);


ALTER TABLE public.astronaut OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronaut_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronaut_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronaut_astronaut_id_seq OWNED BY public.astronaut.astronaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_million_years integer NOT NULL,
    is_active boolean NOT NULL,
    description text,
    num_stars integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_tidally_locked boolean NOT NULL,
    composition text,
    orbit_days integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    diameter_km integer NOT NULL,
    orbit_distance numeric(8,2),
    is_gas_giant boolean NOT NULL,
    atmosphere_type text
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    magnitude numeric(7,2) NOT NULL,
    temperature integer NOT NULL,
    age_in_million_years integer,
    is_supernova_candidate boolean NOT NULL,
    is_main_sequence boolean NOT NULL
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
-- Name: astronaut astronaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut ALTER COLUMN astronaut_id SET DEFAULT nextval('public.astronaut_astronaut_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: astronaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronaut VALUES (1, 'Neil Armstrong', false, 4, 1, 'Pilot, Engineer', 180.34);
INSERT INTO public.astronaut VALUES (2, 'Valentina Tereshkova', false, 1, 1, 'Cosmonaut, Engineer', 170.00);
INSERT INTO public.astronaut VALUES (3, 'Jane Stellar', true, 2, 2, 'Astrobiologist', 168.22);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, true, 'Our home galaxy', 250000000, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, true, 'Nearest major galaxy', 1000000000, 2537500.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 9000, true, 'Third-largest in Local Group', 40000000, 3000000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13000, false, 'Distinct bulge shape', 800000000, 31000000.00, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 8000, true, 'Interacting spiral galaxy', 100000000, 23000000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 6000, false, 'Has a dark band of absorbing dust', 700000000, 17700000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3475, false, true, 'Rocky', 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, true, 'Rocky', 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, false, 'Rocky', 1);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, true, true, 'Sulfur', 2);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3122, true, true, 'Ice', 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, true, true, 'Silicate-Ice', 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820, true, true, 'Rocky-Ice', 17);
INSERT INTO public.moon VALUES (8, 'Betelmoon', 5, 2100, false, false, 'Ice', 10);
INSERT INTO public.moon VALUES (9, 'Primea', 6, 2300, false, true, 'Rocky', 28);
INSERT INTO public.moon VALUES (10, 'Whirl Alpha', 7, 1980, false, false, 'Rocky', 12);
INSERT INTO public.moon VALUES (11, 'Whirl Beta', 8, 1000, false, true, 'Ice', 8);
INSERT INTO public.moon VALUES (12, 'Tri Luna', 9, 3500, false, true, 'Rocky', 32);
INSERT INTO public.moon VALUES (13, 'Tri Beta', 9, 1500, false, false, 'Ice', 12);
INSERT INTO public.moon VALUES (14, 'Tri Minor Alpha', 10, 900, false, true, 'Rocky', 6);
INSERT INTO public.moon VALUES (15, 'Tri Minor Beta', 10, 600, false, false, 'Metallic', 4);
INSERT INTO public.moon VALUES (16, 'Andro Alpha', 6, 2500, false, true, 'Rocky', 21);
INSERT INTO public.moon VALUES (17, 'Andro Beta', 6, 1300, false, false, 'Ice', 6);
INSERT INTO public.moon VALUES (18, 'Andro Minor A', 11, 700, false, true, 'Rocky', 3);
INSERT INTO public.moon VALUES (19, 'Mars II Luna', 12, 1600, false, true, 'Metallic', 23);
INSERT INTO public.moon VALUES (20, 'Mars II Beta', 12, 1050, false, true, 'Rocky', 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 12742, 1.00, false, 'Nitrogen-Oxygen');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 6779, 1.52, false, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 139820, 5.20, true, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (4, 'Proximab', 2, false, 10700, 0.05, false, 'Unknown');
INSERT INTO public.planet VALUES (5, 'Betelplanet', 3, false, 50000, 8.00, true, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (6, 'Androprime', 4, true, 12098, 1.08, false, 'Methane-Nitrogen');
INSERT INTO public.planet VALUES (7, 'Whirlpool1', 5, false, 15000, 1.20, true, 'Hydrogen');
INSERT INTO public.planet VALUES (8, 'Whirlpool2', 5, false, 32000, 2.30, true, 'Hydrogen-Helium');
INSERT INTO public.planet VALUES (9, 'Triangulum Terra', 6, true, 12900, 1.44, false, 'Oxygen-Nitrogen');
INSERT INTO public.planet VALUES (10, 'Triangulum Minor', 6, false, 5400, 3.14, false, 'None');
INSERT INTO public.planet VALUES (11, 'Andro Minor', 4, false, 7000, 2.33, false, 'Carbon Dioxide');
INSERT INTO public.planet VALUES (12, 'Mars II', 1, false, 6300, 2.29, false, 'Trace Atmosphere');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.83, 5778, 4600, false, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 15.45, 3042, 4500, false, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, -5.85, 3500, 8000, true, false);
INSERT INTO public.star VALUES (4, 'Andromeda A', 2, 3.50, 6350, 7000, true, true);
INSERT INTO public.star VALUES (5, 'Whirlpool Alpha', 5, 4.70, 6830, 6000, false, true);
INSERT INTO public.star VALUES (6, 'Triangulum Prime', 3, 0.60, 5100, 3500, false, true);


--
-- Name: astronaut_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronaut_astronaut_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronaut astronaut_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_name_key UNIQUE (name);


--
-- Name: astronaut astronaut_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_pkey PRIMARY KEY (astronaut_id);


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
-- Name: astronaut astronaut_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronaut
    ADD CONSTRAINT astronaut_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

