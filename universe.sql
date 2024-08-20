--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    mass numeric(20,10)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    diameter_in_ly numeric(15,8),
    redshift numeric(10,8),
    discovery_year integer,
    number_of_stars bigint
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
    name character varying(100) NOT NULL,
    is_ice_moon boolean,
    diameter numeric(6,2),
    mass numeric(30,2),
    orbital_period double precision,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    atmosphere_composition text,
    discovery_year integer,
    orbital_period double precision,
    mass numeric(15,10),
    radius numeric(10,6),
    is_habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    discovery_year integer,
    mass numeric(10,6),
    luminosity numeric(15,10),
    is_main_sequence boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939300000.0000000000);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 259000000.0000000000);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 420000000.0000000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 220000.00000000, 0.00100000, 1785, 1000000000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 100000.00000000, 0.00000000, 1610, 200000000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 98000.00000000, 0.00400000, 1781, 2000000000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 60000.00000000, 0.00300000, 1784, 50000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'Spiral', 60000.00000000, 0.00100000, 1773, 200000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Spiral', 49000.00000000, 0.00300000, 1780, 100000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 3474.00, 73490000000000000000000.00, 27.321582, 1);
INSERT INTO public.moon VALUES (2, 'Io', false, 3643.00, 89310000000000000000000.00, 1.769, 3);
INSERT INTO public.moon VALUES (3, 'Europa', true, 3121.60, 47990000000000000000000.00, 3.551, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 5268.00, 148100000000000000000000.00, 7.155, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', true, 4800.00, 107500000000000000000000.00, 16.689, 3);
INSERT INTO public.moon VALUES (6, 'Titan', true, 5150.00, 134500000000000000000000.00, 15.945, 4);
INSERT INTO public.moon VALUES (7, 'Rhea', true, 1528.00, 5263000000000000000000.00, 4.518, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, 504.00, 108000000000000000000.00, 1.37, 4);
INSERT INTO public.moon VALUES (9, 'Tethys', true, 1062.00, 617400000000000000000.00, 1.888, 4);
INSERT INTO public.moon VALUES (10, 'Dione', true, 1122.00, 1095000000000000000000.00, 2.737, 4);
INSERT INTO public.moon VALUES (11, 'Miranda', false, 471.60, 65900000000000000000.00, 1.413, 9);
INSERT INTO public.moon VALUES (12, 'Ariel', false, 1167.00, 1350000000000000000000.00, 2.52, 9);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 1169.00, 1168000000000000000000.00, 4.114, 9);
INSERT INTO public.moon VALUES (14, 'Titania', false, 1578.00, 3527000000000000000000.00, 8.706, 9);
INSERT INTO public.moon VALUES (15, 'Oberon', false, 1522.00, 3114000000000000000000.00, 13.463, 9);
INSERT INTO public.moon VALUES (16, 'Phobos', false, 22.40, 10650000000000000.00, 0.3189, 2);
INSERT INTO public.moon VALUES (17, 'Deimos', false, 12.40, 1476000000000000.00, 1.263, 2);
INSERT INTO public.moon VALUES (18, 'Charon', false, 1212.00, 1586000000000000000000.00, 6.387, 10);
INSERT INTO public.moon VALUES (19, 'Haumea I', true, 816.00, 420000000000000000000.00, 0.203, 11);
INSERT INTO public.moon VALUES (20, 'Eris I', false, 2326.00, 4470000000000000000000.00, 1.319, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 'Nitrogen, Oxygen', 0, 365.256, 5.9720000000, 6371.000000, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 'Carbon Dioxide, Nitrogen', 0, 687, 0.6410000000, 3389.500000, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 'Hydrogen, Helium', 0, 4332.589, 1898.0000000000, 6911.000000, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 'Hydrogen, Helium', 0, 10759, 568.0000000000, 5832.000000, false, 1);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 'Exoplanet', 'Unknown', 2009, 290, 2.4000000000, 2.400000, false, 2);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 'Exoplanet', 'Unknown', 2016, 11.2, 1.1700000000, 1.000000, true, 4);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', 'Hot Jupiter', 'Hydrogen, Helium', 1999, 3.524, 0.6980000000, 1120.000000, false, 5);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1d', 'Exoplanet', 'Unknown', 2017, 4.045, 0.2920000000, 0.760000, true, 6);
INSERT INTO public.planet VALUES (9, 'Uranus', 'Ice Giant', 'Hydrogen, Helium, Methane', 0, 30687, 86.8100000000, 2536.000000, false, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 'Ice Giant', 'Hydrogen, Helium, Methane', 0, 60182, 102.4300000000, 2462.000000, false, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Exoplanet', 'Unknown', 2014, 130, 0.5570000000, 1.150000, true, 3);
INSERT INTO public.planet VALUES (12, 'HD 189733 b', 'Hot Jupiter', 'Hydrogen, Helium', 2005, 2.218, 1.1500000000, 9640.000000, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main Sequence', 1862, 2.063100, 1.7120345678, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 1836, 18.500000, 12000.0000000000, false, 1);
INSERT INTO public.star VALUES (3, 'Polaris', 'Supergiant', 1779, 5.400000, 1400.0000000000, false, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Main Sequence', 1915, 0.123000, 0.0015296489, true, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Main Sequence', 1839, 1.100000, 1.5192000000, true, 2);
INSERT INTO public.star VALUES (6, 'Arcturus', 'Red Giant', 1680, 1.200000, 170.0000000000, false, 3);
INSERT INTO public.star VALUES (7, 'Vega', 'Main Sequence', 1850, 2.135000, 37.0000000000, true, 3);
INSERT INTO public.star VALUES (8, 'Rigel', 'Blue Supergiant', 1830, 21.000000, 12000.0000000000, false, 3);
INSERT INTO public.star VALUES (9, 'Altair', 'Main Sequence', 1854, 1.890000, 10.0000000000, true, 4);
INSERT INTO public.star VALUES (10, 'Spica', 'Binary Star', 1830, 11.400000, 1200.0000000000, false, 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


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
-- Name: asteroid unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

