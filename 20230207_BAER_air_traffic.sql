-- from the terminal run:
-- psql < 20230207_BAER_air_traffic.sql

DROP DATABASE IF EXISTS baer_air_traffic;

CREATE DATABASE baer_air_traffic;

\c baer_air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  countries_id INTEGER REFERENCES countries ON DELETE SET NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  from_city_id INTEGER REFERENCES cities ON DELETE SET NULL,
  to_city_id INTEGER REFERENCES cities ON DELETE SET NULL,
  airline_id INTEGER REFERENCES airlines ON DELETE SET NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  flight_id INTEGER REFERENCES flights ON DELETE CASCADE,
  passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  seat TEXT NOT NULL
);

INSERT INTO countries
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');


INSERT INTO cities
  (city_name, countries_id)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 1),
  ('Seattle', 1),
  ('Paris', 3),
  ('Dubai', 4),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charolette', 1),
  ('Sao Paolo', 5),
  ('London', 6),
  ('Las Vegas', 1),
  ('Mexico City', 7),
  ('Casablanca', 8),
  ('Beijing', 9),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Santiago', 10);



INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer','Finch'),
  ('Thadeus','Gathercoal'),
  ('Sonja','Pauley'),
  ('Waneta','Skeleton'),
  ('Berkie','Wycliff'),
  ('Alvin','Leates'),
  ('Cory','Squibbes');

INSERT INTO flights
  (from_city_id, to_city_id, airline_id, departure, arrival)
VALUES
  (1, 4, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (2, 11, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (3, 12, 3, '2018-01-02 07:00:00','2018-01-02 08:03:00'),
  (4, 3, 3, '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (5, 14, 4, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (6, 15, 5, '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (7, 9, 1, '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (8, 16, 5, '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (9, 17, 6, '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (10, 18, 7, '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO tickets
  (flight_id, passenger_id, seat)
VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (4, 1, '20A'),
  (5, 4, '23D'),
  (6, 2, '18C'),
  (7, 5, '9E'),
  (8, 6, '1A'),
  (9, 5, '32B'),
  (10,7, '10D');

-- SELECT * FROM tickets JOIN flights ON tickets.flight_id = flights.id JOIN passengers ON tickets.passenger_id = passengers.id JOIN airlines ON flights.airline_id = airlines.id JOIN cities AS arrivals ON flights.from_city_id = arrivals.id JOIN countries AS arrival_countries ON arrivals.countries_id = arrival_countries.id JOIN cities ON flights.to_city_id = cities.id JOIN countries ON cities.countries_id = countries.id;