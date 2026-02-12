SELECT
    artist_name,
    COUNT(*) AS track_count,
    AVG(popularity) AS avg_popularity
FROM spotify_tracks
WHERE artist_name IS NOT NULL
GROUP BY artist_name
ORDER BY track_count DESC
LIMIT 100;
