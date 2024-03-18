CREATE TABLE public.crew_basic_info
(
    nconst character(15) COLLATE pg_catalog."default" NOT NULL,
    primaryname character varying(200) COLLATE pg_catalog."default" NOT NULL,
    birthyear integer,
    deathyear integer,
    primaryprofession character varying(100) COLLATE pg_catalog."default",
    knownfortitles character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT crew_basic_info_pkey PRIMARY KEY (nconst)
);

CREATE TABLE public.title_basics
(
    tconst character(20) COLLATE pg_catalog."default" NOT NULL,
    titletype character varying(1000) COLLATE pg_catalog."default",
    primarytitle character varying(3000) COLLATE pg_catalog."default",
    originaltitle character varying(3000) COLLATE pg_catalog."default",
    isadult boolean,
    startyear integer,
    endyear integer,
    runtimeminutes integer,
    genres character varying(5000) COLLATE pg_catalog."default",
    CONSTRAINT title_basics_pkey PRIMARY KEY (tconst)
);

CREATE TABLE public.title_crew
(
    tconst character(20) COLLATE pg_catalog."default" NOT NULL,
    directors character varying(20000) COLLATE pg_catalog."default",
    writers character varying(20000) COLLATE pg_catalog."default",
    CONSTRAINT title_crew_pkey PRIMARY KEY (tconst)
);

CREATE TABLE public.title_episode
(
    tconst character(20) COLLATE pg_catalog."default" NOT NULL,
    parenttconst character(20) COLLATE pg_catalog."default",
    seasonnumber integer,
    episodenumber integer,
    CONSTRAINT title_episode_pkey PRIMARY KEY (tconst)
);

CREATE TABLE public.title_info
(
    titleid character varying(10) COLLATE pg_catalog."default" NOT NULL,
    ordering integer NOT NULL,
    title character varying(5000) COLLATE pg_catalog."default",
    region character varying(50) COLLATE pg_catalog."default",
    language character varying(50) COLLATE pg_catalog."default",
    types character varying(50) COLLATE pg_catalog."default",
    attributes character varying COLLATE pg_catalog."default",
    isoriginaltitle boolean,
    CONSTRAINT title_info_pkey PRIMARY KEY (titleid, ordering)
);

CREATE TABLE public.title_principal_crew
(
    tconst character(20) COLLATE pg_catalog."default" NOT NULL,
    ordering integer NOT NULL,
    nconst character(20) COLLATE pg_catalog."default" NOT NULL,
    category character varying(5000) COLLATE pg_catalog."default",
    job character varying(5000) COLLATE pg_catalog."default",
    characters character varying(5000) COLLATE pg_catalog."default",
    CONSTRAINT title_principal_crew_pkey PRIMARY KEY (tconst, ordering)
);

CREATE TABLE public.title_ratings
(
    tconst character(20) COLLATE pg_catalog."default" NOT NULL,
    averagerating numeric(5,2),
    numvotes integer,
    CONSTRAINT title_ratings_pkey PRIMARY KEY (tconst)
);