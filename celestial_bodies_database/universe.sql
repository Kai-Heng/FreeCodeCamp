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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass_in_solar_masses numeric,
    age_in_billion_years numeric,
    black_hole_type character varying(50),
    is_active boolean,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass_in_billion_solar_masses numeric,
    age_in_billion_years numeric,
    galaxy_type character varying(255),
    has_spiral_arms boolean
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
    name character varying(255) NOT NULL,
    mass_in_yg numeric,
    age_in_billion_years numeric,
    moon_type character varying(255),
    is_spherical boolean,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    mass_in_yg numeric,
    age_in_billion_years numeric,
    planet_type character varying(255),
    has_moons boolean,
    has_atmosphere boolean,
    has_rings boolean,
    star_id integer NOT NULL,
    orbital_period_in_days integer
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
    name character varying(255) NOT NULL,
    mass_in_solar_masses numeric,
    age_in_billion_years numeric,
    spectral_type character varying(255),
    has_planets boolean,
    galaxy_id integer NOT NULL,
    surface_temperature_in_kelvin integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (4, 'Sagittarius A*', 4150000, NULL, 'Supermassive', false, 'Supermassive black hole at the center of the Milky Way.', 1);
INSERT INTO public.black_hole VALUES (5, 'M31*', 140000000, NULL, 'Supermassive', false, 'Supermassive black hole at the center of the Andromeda Galaxy.', 2);
INSERT INTO public.black_hole VALUES (6, 'Cygnus X-1', 21, NULL, 'Stellar', true, 'Stellar-mass black hole in an X-ray binary system.', 1);
INSERT INTO public.black_hole VALUES (7, 'Gaia BH1', 9.6, NULL, 'Stellar', false, 'Dormant stellar-mass black hole discovered through the motion of its companion star.', 1);
INSERT INTO public.black_hole VALUES (8, 'LMC X-1', 10.9, NULL, 'Stellar', true, 'Stellar-mass black hole in an X-ray binary system in the Large Magellanic Cloud.', 4);
INSERT INTO public.black_hole VALUES (9, 'LMC X-3', 7, NULL, 'Stellar', true, 'Stellar-mass black hole in an X-ray binary system in the Large Magellanic Cloud', 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 13.6, 'Barred Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1500, 13.0, 'Barred Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 100, 12.0, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 150, 12.0, 'Irregular', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 500, 12.0, 'Spiral', true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 1000, 12.0, 'Spiral', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 73.42, 4.5, 'Rocky', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.00001066, NULL, 'Rocky', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000001476, NULL, 'Rocky', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 89.32, 4.5, 'Volcanic', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 48, 4.5, 'Icy/Ocean', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 148.2, 4.5, 'Icy/Rocky', true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 107.6, 4.5, 'Icy/Rocky', true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 0.00208, NULL, 'Irregular Rocky', false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 0.0042, NULL, 'Irregular', false, 5);
INSERT INTO public.moon VALUES (10, 'Titan', 134.5, 4.5, 'Icy/Atmospheric', true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 0.108, 4.5, 'Icy/Ocean', true, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 2.307, 4.5, 'Icy', true, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', 1.806, 4.5, 'Icy', true, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 1.095, 4.5, 'Icy', true, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 0.617, 4.5, 'Icy', true, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 0.0375, 4.5, 'Icy', true, 6);
INSERT INTO public.moon VALUES (17, 'Hyperion', 0.00562, NULL, 'Irregular Icy', false, 6);
INSERT INTO public.moon VALUES (18, 'Titania', 3.527, 4.5, 'Icy/Rocky', true, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 3.014, 4.5, 'Icy/Rocky', true, 7);
INSERT INTO public.moon VALUES (20, 'Umbriel', 1.275, 4.5, 'Icy/Rocky', true, 7);
INSERT INTO public.moon VALUES (21, 'Ariel', 1.251, 4.5, 'Icy/Rocky', true, 7);
INSERT INTO public.moon VALUES (22, 'Miranda', 0.0659, 4.5, 'Icy/Rocky', true, 7);
INSERT INTO public.moon VALUES (23, 'Triton', 21.39, NULL, 'Icy/Captured', true, 8);
INSERT INTO public.moon VALUES (24, 'Proteus', 0.044, NULL, 'Irregular Icy', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 330.1, 4.5, 'Terrestrial', false, false, false, 1, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 4867, 4.5, 'Terrestrial', false, true, false, 1, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 5972, 4.54, 'Terrestrial', true, true, false, 1, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 641.7, 4.5, 'Terrestrial', true, true, false, 1, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1898000, 4.5, 'Gas Giant', true, true, true, 1, 4333);
INSERT INTO public.planet VALUES (6, 'Saturn', 568300, 4.5, 'Gas Giant', true, true, true, 1, 10759);
INSERT INTO public.planet VALUES (7, 'Uranus', 86810, 4.5, 'Ice Giant', true, true, true, 1, 30687);
INSERT INTO public.planet VALUES (8, 'Neptune', 102400, 4.5, 'Ice Giant', true, true, true, 1, 60190);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 7620, NULL, 'Super-Earth', NULL, NULL, NULL, 4, 11);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 1550, NULL, 'Terrestrial', NULL, NULL, NULL, 4, 5);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', NULL, NULL, 'Super-Earth Candidate', NULL, NULL, NULL, 4, 1900);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 b', 8240, NULL, 'Terrestrial', NULL, false, NULL, 6, 2);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1 c', 7820, NULL, 'Terrestrial', NULL, NULL, NULL, 6, 2);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1 d', 2320, NULL, 'Terrestrial', NULL, NULL, NULL, 6, 4);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1 e', 4130, NULL, 'Terrestrial', NULL, NULL, NULL, 6, 6);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1 f', 6220, NULL, 'Terrestrial', NULL, NULL, NULL, 6, 9);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1 g', 7880, NULL, 'Terrestrial', NULL, NULL, NULL, 6, 12);
INSERT INTO public.planet VALUES (18, 'TRAPPIST-1 h', 1950, NULL, 'Terrestrial', NULL, NULL, NULL, 6, 19);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, 4.6, 'G2V', true, 1, 5772);
INSERT INTO public.star VALUES (2, 'Sirius A', 2.06, 0.24, 'A1V', NULL, 1, 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 16.5, 0.008, 'M-type Supergiant', NULL, 1, 3500);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.122, 4.85, 'M5.5Ve', true, 1, 3042);
INSERT INTO public.star VALUES (5, 'Vega', 2.18, 0.455, 'A0V', NULL, 1, 9602);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 0.089, 7.6, 'M8V', true, 1, 2566);
INSERT INTO public.star VALUES (7, 'M31-V1', NULL, NULL, 'Cepheid Variable', NULL, 2, NULL);
INSERT INTO public.star VALUES (8, 'R136a1', 197, 0.001, 'WN5h', NULL, 4, 46000);
INSERT INTO public.star VALUES (9, 'S Doradus', NULL, NULL, 'Luminous Blue Variable', NULL, 4, NULL);
INSERT INTO public.star VALUES (10, 'V838 Monocerotis', NULL, NULL, 'Eruptive Variable', NULL, 1, NULL);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

