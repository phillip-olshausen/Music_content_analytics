SELECT
    popularity,
    danceability,
    energy,
    valence,
    acousticness,
    tempo
FROM spotify_tracks
WHERE popularity IS NOT NULL
  AND danceability IS NOT NULL
  AND energy IS NOT NULL
  AND valence IS NOT NULL
  AND acousticness IS NOT NULL
  AND tempo IS NOT NULL;
