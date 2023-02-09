-- from the terminal run:
-- psql < 20230207_BAER_music.sql

DROP DATABASE IF EXISTS baer_music;

CREATE DATABASE baer_music;

\c baer_music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_title TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album INTEGER REFERENCES albums ON DELETE SET NULL
);

CREATE TABLE artists_songs
(
  id SERIAL PRIMARY KEY,
  artist_id INTEGER REFERENCES artists ON DELETE SET NULL,
  song_id INTEGER REFERENCES songs ON DELETE SET NULL
);

CREATE TABLE producers_songs
(
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES producers ON DELETE SET NULL,
  song_id INTEGER REFERENCES songs ON DELETE SET NULL
);

INSERT INTO producers
(producer_name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO artists
(artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boysz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Jucy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');


INSERT INTO albums
(album_title)
VALUES
('Middle of Nowhere'),
('A Night at the Opera'),
('Daydream'),
('A Star Is Born'),
('Silver Side Up'),
('The Bluprint 3'),
('Prism'),
('Hands All Over'),
('Let Go'),
('The Writing''s on the Wall');

INSERT INTO songs
(title, duration_in_seconds, release_date, album)
VALUES
('MMMBop', 238, '04-15-1997', 1),
('Bohemian Rhapsody', 355, '10-31-1975', 2),
('One Sweet Day', 282, '11-14-1995', 3),
('Shallow', 216, '09-27-2018', 4),
('How You Remind Me', 233, '08-21-2001', 5),
('New York State Of Mind', 276, '10-20-2009', 6),
('Dark Horse', 215, '12-17-2013', 7),
('Moves Like Jagger', 201, '06-21-2011', 8),
('Complicated', 244, '05-14-2002', 9),
('Say My Name', 240, '11-07-1999', 10);

INSERT INTO artists_songs
(artist_id, song_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,3),
(5,4),
(6,4),
(7,5),
(8,6),
(9,6),
(10,7),
(11,7),
(12,8),
(13,8),
(14,9),
(15,10);

INSERT INTO producers_songs
(producer_id, song_id)
VALUES
(1,1),
(2,1),
(3,2),
(4,3),
(5,4),
(6,5),
(7,6),
(8,7),
(9,7),
(10,8),
(11,8),
(12,9),
(13,10);

-- SELECT * FROM songs JOIN artists_songs ON songs.id = artists_songs.song_id JOIN artists ON artists_songs.artist_id = artists.id;
-- SELECT * FROM songs JOIN producers_songs ON songs.id = producers_songs.song_id JOIN producers ON producers_songs.producer_id = producers.id;