--Define a hit
SELECT
  COUNT(*) AS total_tracks,
  SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END) AS hit_tracks,
  ROUND(
    SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END)::numeric
    / COUNT(*),
    4
  ) AS overall_hit_rate
FROM spotify_tracks;

--Hit Rate based on dancability
WITH binned AS (
  SELECT
    popularity,
    width_bucket(danceability, 0, 1, 10) AS dance_bin
  FROM spotify_tracks
  WHERE danceability IS NOT NULL
)


SELECT
  dance_bin,
  COUNT(*) AS tracks_in_bin,
  SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END) AS hits,
  ROUND(
    SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END)::numeric
    / COUNT(*),
    4
  ) AS hit_rate
FROM binned
GROUP BY dance_bin
ORDER BY dance_bin;

--compute lift
WITH overall AS (
  SELECT
    SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END)::numeric
    / COUNT(*) AS overall_hit_rate
  FROM spotify_tracks
),
binned AS (
  SELECT
    popularity,
    width_bucket(danceability, 0, 1, 10) AS dance_bin
  FROM spotify_tracks
  WHERE danceability IS NOT NULL
)

SELECT
  dance_bin,
  COUNT(*) AS tracks_in_bin,
  ROUND(
    SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END)::numeric
    / COUNT(*),
    4
  ) AS hit_rate,
  ROUND(
    (
      SUM(CASE WHEN popularity >= 70 THEN 1 ELSE 0 END)::numeric
      / COUNT(*)
    )
    /
    (SELECT overall_hit_rate FROM overall),
    3
  ) AS lift_vs_average
FROM binned
GROUP BY dance_bin
ORDER BY dance_bin;
