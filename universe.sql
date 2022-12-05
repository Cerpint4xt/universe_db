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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    date_discovered integer NOT NULL
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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning character varying(50) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    constellation_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    date_of_discovery integer,
    gravity numeric(6,5),
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
    name character varying(30) NOT NULL,
    number_of_moons integer NOT NULL,
    volume numeric(18,0) NOT NULL,
    gravity numeric(5,2),
    has_rings boolean
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
    name character varying(30) NOT NULL,
    distance_in_light_years numeric(5,2) NOT NULL,
    brightness_of_star numeric(3,2) NOT NULL,
    approval_date date,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Vesta', 1807);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 1802);
INSERT INTO public.asteroid VALUES (3, 'Sylvia', 1866);
INSERT INTO public.asteroid VALUES (4, 'Eunomia', 1851);
INSERT INTO public.asteroid VALUES (5, 'Juno', 1804);
INSERT INTO public.asteroid VALUES (6, 'Psyche', 1852);
INSERT INTO public.asteroid VALUES (7, 'Fortuna', 1852);
INSERT INTO public.asteroid VALUES (8, 'Elektra', 1873);
INSERT INTO public.asteroid VALUES (9, 'Iris', 1847);
INSERT INTO public.asteroid VALUES (10, 'Nemesis', 1872);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Aquarius', NULL, 'Water-bearer', 1);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 'Ram', 2);
INSERT INTO public.constellation VALUES (3, 'Bootes', NULL, 'Herdsman', 3);
INSERT INTO public.constellation VALUES (4, 'Capricornus', NULL, 'Sea goat', 4);
INSERT INTO public.constellation VALUES (5, 'Centaurus', NULL, 'Centaur', 5);
INSERT INTO public.constellation VALUES (6, 'Cetus', NULL, 'Sea monster (later interpreted as a whale)', 9);
INSERT INTO public.constellation VALUES (7, 'Leo', NULL, 'Lion', 7);
INSERT INTO public.constellation VALUES (8, 'Ophiuchus', NULL, 'Serpent-bearer', 12);
INSERT INTO public.constellation VALUES (9, 'Pegasus', NULL, 'Pegasus (mythological winged horse)', 10);
INSERT INTO public.constellation VALUES (10, 'Sagittarius', NULL, 'Archer', 11);
INSERT INTO public.constellation VALUES (11, 'Taurus', NULL, 'Bull', 8);
INSERT INTO public.constellation VALUES (12, 'Virgo', NULL, 'Virgin or maiden', 13);
INSERT INTO public.constellation VALUES (13, 'Coma Berenices', 1536, 'Berenice`s hair', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 'It seems to rotate in the opposite direction to what it should according to its shape.', false, 5);
INSERT INTO public.galaxy VALUES (2, 'Centaurus A', 'Named because it`s located in the Centaurus constellation', true, 5);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'It looks like an eye with a dark stripe underneath', false, 7);
INSERT INTO public.galaxy VALUES (4, 'Coma Pinwheel Galaxy', 'It looks like a paper pinwheel', false, 7);
INSERT INTO public.galaxy VALUES (5, 'Malin 1', 'Named after its discoverer, David Malin', false, 7);
INSERT INTO public.galaxy VALUES (6, 'Mice Galaxies', 'Two galaxies with long tails that look like a mouse', false, 7);
INSERT INTO public.galaxy VALUES (7, 'Needle Galaxy', 'Named because of its thin appearance', false, 7);
INSERT INTO public.galaxy VALUES (8, 'Butterfly Galaxies', 'Binary galaxies. It looks like a pair of butterfly wings', false, 13);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 'Looks like a sombrero', false, 13);
INSERT INTO public.galaxy VALUES (10, 'Little Sombrero Galaxy', 'It looks like a sombrero, but it’s smaller than the Sombrero Galaxy', false, 10);
INSERT INTO public.galaxy VALUES (11, 'Milky Way', 'Our own galaxy. It is said to look like a band of light', true, 11);
INSERT INTO public.galaxy VALUES (12, 'Wolf-Lundmark-Melotte', 'Named after the astronomers that co-discovered it', false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1.62000, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 1877, 0.00000, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 1877, 0.01000, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 1.80000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 1.32000, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 1.43000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 1.24000, 5);
INSERT INTO public.moon VALUES (8, 'Cyllene', 2003, 0.00000, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1789, 0.11000, 6);
INSERT INTO public.moon VALUES (10, 'Titan', 1655, 1.35000, 6);
INSERT INTO public.moon VALUES (11, 'Atlas', 1980, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 1684, 0.23000, 6);
INSERT INTO public.moon VALUES (13, 'Calypso', 1980, 0.00000, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', 1851, 0.25000, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 1787, 0.35000, 7);
INSERT INTO public.moon VALUES (16, 'Puck', 1986, 0.03000, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 1787, 0.37000, 7);
INSERT INTO public.moon VALUES (19, 'Larissa', 1982, 0.03000, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 1989, 0.07000, 8);
INSERT INTO public.moon VALUES (21, 'Galatea', 1989, 0.02000, 8);
INSERT INTO public.moon VALUES (22, 'Psamathe', 2003, 0.00000, 8);
INSERT INTO public.moon VALUES (23, 'Triton', 1846, 0.78000, 8);
INSERT INTO public.moon VALUES (24, 'Charon', 1978, 0.28000, 9);
INSERT INTO public.moon VALUES (25, 'Hydra', 2005, 0.05000, 9);
INSERT INTO public.moon VALUES (26, 'Kerberos', 2011, NULL, 9);
INSERT INTO public.moon VALUES (27, 'Nix', 2005, 0.00000, 9);
INSERT INTO public.moon VALUES (28, 'Styx', 2012, NULL, 9);
INSERT INTO public.moon VALUES (18, 'Rosalind', 1986, 0.00000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 60827208742, 3.70, false);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 928425345893, 8.87, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1083206916846, 9.81, false);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 163115609799, 3.71, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 80, 1431281810739360, 24.79, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 84, 827129915150897, 10.40, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 68334355695584, 8.87, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 6252703987421, 11.15, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 6387259783, 0.66, false);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, 452331448, 0.28, false);
INSERT INTO public.planet VALUES (11, 'Haumea', 2, 1980000000, 0.40, true);
INSERT INTO public.planet VALUES (12, 'Eris', 1, 6590000000, 0.82, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', 612.00, 2.90, '2016-08-21', 11);
INSERT INTO public.star VALUES (2, 'Hamal', 66.00, 2.01, '2016-07-20', 11);
INSERT INTO public.star VALUES (3, 'Arcturus', 37.00, 0.05, '2016-06-30', 11);
INSERT INTO public.star VALUES (4, 'Deneb Algedi', 39.00, 2.85, '2017-02-01', 11);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 4.36, 0.01, '2016-11-06', 11);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', 30.00, 4.26, NULL, 11);
INSERT INTO public.star VALUES (7, 'Regulus', 77.00, 1.36, '2016-06-30', 11);
INSERT INTO public.star VALUES (8, 'Aldebaran', 65.23, 0.85, '2016-06-30', 11);
INSERT INTO public.star VALUES (9, 'Diphda', 96.22, 2.04, '2016-08-21', 11);
INSERT INTO public.star VALUES (10, 'Enif', 688.20, 2.40, '2016-07-20', 11);
INSERT INTO public.star VALUES (11, 'Kaus Australis', 143.20, 1.85, '2016-07-20', 11);
INSERT INTO public.star VALUES (12, 'Rasalhague', 48.60, 2.08, '2016-07-20', 11);
INSERT INTO public.star VALUES (13, 'Spica', 260.90, 1.04, '2016-06-30', 11);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 13, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 38, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: constellation constellation_star_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey1 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

