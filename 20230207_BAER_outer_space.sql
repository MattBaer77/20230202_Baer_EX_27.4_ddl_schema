-- from the terminal run:
-- psql < 20230207_BAER_outer_space.sql

DROP DATABASE IF EXISTS baer_outer_space;

CREATE DATABASE baer_outer_space;

\c baer_outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star_name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_name INTEGER REFERENCES stars ON DELETE SET NULL,
  galaxy_name INTEGER REFERENCES galaxies ON DELETE SET NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  orbits_around_id INTEGER REFERENCES planets ON DELETE SET NULL
);

INSERT INTO galaxies
  (galaxy_name)
VALUES
  ('Milky Way');

INSERT INTO stars
  (star_name)
VALUES
  ('The SUN'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, star_name, galaxy_name)
VALUES
  ('Earth', 1, 1, 1), 
  ('Mars', 1.88, 1, 1), 
  ('Venus', 0.62, 1, 1), 
  ('Neptune', 164.8, 1, 1), 
  ('Proxima Centauri b', 1, 2, 1), 
  ('Gliese 876 b', 1, 3, 1); 

INSERT INTO moons
  (moon_name, orbits_around_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);

-- SELECT * FROM moons JOIN planets ON moons.orbits_around_id = planets.id;
-- SELECT * FROM planets JOIN stars ON planets.star_name = stars.id JOIN galaxies ON planets.galaxy_name = galaxies.id;