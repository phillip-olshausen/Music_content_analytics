SELECT
    genre,
    COUNT(*) AS track_count,
    AVG(popularity) AS avg_popularity
FROM spotify_tracks
WHERE genre IS NOT NULL
GROUP BY genre
HAVING COUNT(*) >= 100
ORDER BY avg_popularity DESC;
