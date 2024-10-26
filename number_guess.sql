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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 28);
INSERT INTO public.games VALUES (2, 1, 944);
INSERT INTO public.games VALUES (3, 2, 948);
INSERT INTO public.games VALUES (4, 2, 979);
INSERT INTO public.games VALUES (5, 1, 584);
INSERT INTO public.games VALUES (6, 1, 903);
INSERT INTO public.games VALUES (7, 1, 818);
INSERT INTO public.games VALUES (8, 3, 620);
INSERT INTO public.games VALUES (9, 3, 109);
INSERT INTO public.games VALUES (10, 4, 340);
INSERT INTO public.games VALUES (11, 4, 767);
INSERT INTO public.games VALUES (12, 3, 204);
INSERT INTO public.games VALUES (13, 3, 189);
INSERT INTO public.games VALUES (14, 3, 942);
INSERT INTO public.games VALUES (15, 5, 478);
INSERT INTO public.games VALUES (16, 5, 635);
INSERT INTO public.games VALUES (17, 6, 26);
INSERT INTO public.games VALUES (18, 6, 443);
INSERT INTO public.games VALUES (19, 5, 189);
INSERT INTO public.games VALUES (20, 5, 522);
INSERT INTO public.games VALUES (21, 5, 892);
INSERT INTO public.games VALUES (22, 7, 858);
INSERT INTO public.games VALUES (23, 7, 866);
INSERT INTO public.games VALUES (24, 8, 392);
INSERT INTO public.games VALUES (25, 8, 132);
INSERT INTO public.games VALUES (26, 7, 208);
INSERT INTO public.games VALUES (27, 7, 306);
INSERT INTO public.games VALUES (28, 7, 581);
INSERT INTO public.games VALUES (29, 9, 697);
INSERT INTO public.games VALUES (30, 9, 644);
INSERT INTO public.games VALUES (31, 10, 89);
INSERT INTO public.games VALUES (32, 10, 231);
INSERT INTO public.games VALUES (33, 9, 104);
INSERT INTO public.games VALUES (34, 9, 334);
INSERT INTO public.games VALUES (35, 9, 10);
INSERT INTO public.games VALUES (36, 11, 574);
INSERT INTO public.games VALUES (37, 11, 392);
INSERT INTO public.games VALUES (38, 12, 971);
INSERT INTO public.games VALUES (39, 12, 316);
INSERT INTO public.games VALUES (40, 11, 134);
INSERT INTO public.games VALUES (41, 11, 915);
INSERT INTO public.games VALUES (42, 11, 42);
INSERT INTO public.games VALUES (43, 14, 10);
INSERT INTO public.games VALUES (44, 15, 76);
INSERT INTO public.games VALUES (45, 15, 596);
INSERT INTO public.games VALUES (46, 16, 414);
INSERT INTO public.games VALUES (47, 16, 533);
INSERT INTO public.games VALUES (48, 15, 677);
INSERT INTO public.games VALUES (49, 15, 491);
INSERT INTO public.games VALUES (50, 15, 130);
INSERT INTO public.games VALUES (51, 17, 266);
INSERT INTO public.games VALUES (52, 17, 409);
INSERT INTO public.games VALUES (53, 18, 746);
INSERT INTO public.games VALUES (54, 18, 544);
INSERT INTO public.games VALUES (55, 17, 618);
INSERT INTO public.games VALUES (56, 17, 192);
INSERT INTO public.games VALUES (57, 17, 651);
INSERT INTO public.games VALUES (58, 19, 807);
INSERT INTO public.games VALUES (59, 19, 960);
INSERT INTO public.games VALUES (60, 20, 878);
INSERT INTO public.games VALUES (61, 20, 564);
INSERT INTO public.games VALUES (62, 19, 904);
INSERT INTO public.games VALUES (63, 19, 481);
INSERT INTO public.games VALUES (64, 19, 703);
INSERT INTO public.games VALUES (65, 21, 559);
INSERT INTO public.games VALUES (66, 21, 476);
INSERT INTO public.games VALUES (67, 22, 782);
INSERT INTO public.games VALUES (68, 22, 709);
INSERT INTO public.games VALUES (69, 21, 194);
INSERT INTO public.games VALUES (70, 21, 28);
INSERT INTO public.games VALUES (71, 21, 939);
INSERT INTO public.games VALUES (72, 23, 81);
INSERT INTO public.games VALUES (73, 23, 504);
INSERT INTO public.games VALUES (74, 24, 930);
INSERT INTO public.games VALUES (75, 24, 197);
INSERT INTO public.games VALUES (76, 23, 745);
INSERT INTO public.games VALUES (77, 23, 264);
INSERT INTO public.games VALUES (78, 23, 146);
INSERT INTO public.games VALUES (79, 25, 730);
INSERT INTO public.games VALUES (80, 25, 389);
INSERT INTO public.games VALUES (81, 26, 649);
INSERT INTO public.games VALUES (82, 26, 97);
INSERT INTO public.games VALUES (83, 25, 51);
INSERT INTO public.games VALUES (84, 25, 636);
INSERT INTO public.games VALUES (85, 25, 182);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1729911288027');
INSERT INTO public.users VALUES (2, 'user_1729911288026');
INSERT INTO public.users VALUES (3, 'user_1729911343292');
INSERT INTO public.users VALUES (4, 'user_1729911343291');
INSERT INTO public.users VALUES (5, 'user_1729911398363');
INSERT INTO public.users VALUES (6, 'user_1729911398362');
INSERT INTO public.users VALUES (7, 'user_1729911426433');
INSERT INTO public.users VALUES (8, 'user_1729911426432');
INSERT INTO public.users VALUES (9, 'user_1729911445345');
INSERT INTO public.users VALUES (10, 'user_1729911445344');
INSERT INTO public.users VALUES (11, 'user_1729911466895');
INSERT INTO public.users VALUES (12, 'user_1729911466894');
INSERT INTO public.users VALUES (13, 'M');
INSERT INTO public.users VALUES (14, 'Mary-Ellen Lavigne');
INSERT INTO public.users VALUES (15, 'user_1729911621741');
INSERT INTO public.users VALUES (16, 'user_1729911621740');
INSERT INTO public.users VALUES (17, 'user_1729911791997');
INSERT INTO public.users VALUES (18, 'user_1729911791996');
INSERT INTO public.users VALUES (19, 'user_1729911825545');
INSERT INTO public.users VALUES (20, 'user_1729911825544');
INSERT INTO public.users VALUES (21, 'user_1729911837948');
INSERT INTO public.users VALUES (22, 'user_1729911837947');
INSERT INTO public.users VALUES (23, 'user_1729911851516');
INSERT INTO public.users VALUES (24, 'user_1729911851515');
INSERT INTO public.users VALUES (25, 'user_1729912162219');
INSERT INTO public.users VALUES (26, 'user_1729912162218');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 85, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 26, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

