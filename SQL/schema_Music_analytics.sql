DROP TABLE IF EXISTS spotify_tracks;

CREATE TABLE spotify_tracks (
  track_id            TEXT,
  track_name          TEXT,
  artist_name         TEXT,
  album_name          TEXT,
  genre               TEXT,
  popularity          INTEGER,
  duration_ms         INTEGER,
  explicit            BOOLEAN,
  danceability        DOUBLE PRECISION,
  energy              DOUBLE PRECISION,
  key                 INTEGER,
  loudness            DOUBLE PRECISION,
  mode                INTEGER,
  speechiness         DOUBLE PRECISION,
  acousticness        DOUBLE PRECISION,
  instrumentalness    DOUBLE PRECISION,
  liveness            DOUBLE PRECISION,
  valence             DOUBLE PRECISION,
  tempo               DOUBLE PRECISION,
  time_signature      INTEGER
);

SELECT * FROM spotify_tracks LIMIT 5;

