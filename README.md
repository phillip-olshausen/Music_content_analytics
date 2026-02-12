
# Music Content Analytics: Structural Drivers of Hit Probability

### SQL-First Product Analytics with Lift Modeling & Catalog Dynamics

------------------------------------------------------------------------

## Executive Summary

This project investigates structural drivers of track performance using
a large-scale Spotify track dataset (\~90k tracks).

Rather than stopping at descriptive averages, the analysis transitions
to **probability-based lift modeling**, estimating how audio features
alter breakout likelihood relative to platform-wide baselines. In this project we specifically look at "dancability" but the idea can be extended to other audio features.

The core contribution is a shift from:

> "What is popular?"

to

> "Which characteristics meaningfully increase the probability of
> becoming a hit?"

All metrics are computed in **PostgreSQL**, ensuring analytical
transparency and reproducibility.\
Visualizations are produced in **Tableau** as a communication layer
only.

------------------------------------------------------------------------

## Dataset

**Source:** Public Spotify Tracks dataset (Kaggle distribution)\
**Scale:** 89,741 tracks\
**Target Variable:** Popularity (0--100 scale)

**Key features used:** - Danceability - Energy - Valence -
Acousticness - Genre - Artist metadata

A "Hit" is defined as:

    Popularity ≥ 70

This yields:

-   Total tracks: 89,741\
-   Hits: 3,126\
-   Overall hit rate: **3.48%**

This low baseline reinforces that breakout success is rare and
structurally meaningful.

------------------------------------------------------------------------

## Methodological Framework

The analysis proceeds in four stages:

1.  Catalog concentration analysis (long-tail dynamics)
2.  Feature-level descriptive analysis (binned averages)
3.  Genre-level structural comparison
4.  Probability lift modeling (core contribution)

The project intentionally separates:

-   Mean performance (average popularity)
-   Breakout probability (hit rate)
-   Relative performance (lift vs baseline)

This mirrors how growth and discovery teams reason about platform
dynamics.

------------------------------------------------------------------------

# 1️⃣ Long-Tail Catalog Dynamics (Top 10 Artists)

![Long-tail distribution of artist catalog
size](Tableau/long_tail_top10.png)

### Question

Is catalog representation concentrated among a small subset of artists?

### Approach

-   Count tracks per artist
-   Rank top 10 by catalog size
-   Compute average popularity per artist

### Insight

The distribution is highly skewed, confirming long-tail dynamics:

-   A small number of artists dominate catalog representation.
-   Catalog size does not necessarily correlate with higher average
    popularity.

**Implication:**\
Catalog scale and breakout probability are structurally distinct
phenomena.

------------------------------------------------------------------------

# 2️⃣ Average Popularity Across Danceability Deciles

![Average popularity by danceability
deciles](Tableau/popularity_by_danceability_decile1.png)

### Approach

-   Bin danceability into deciles (equal-width buckets)
-   Compute average popularity per bin

### Insight

Average popularity increases across mid-to-high danceability ranges.

However, mean popularity alone does not capture breakout dynamics.\
This motivates probability-based analysis.

------------------------------------------------------------------------

# 3️⃣ Genre-Level Performance (Top 30, ≥100 Tracks)

![Average popularity by
genre](Tableau/genre_top30.png)

### Approach

-   Filter genres with at least 100 tracks
-   Rank top 30 by average popularity

### Insight

Popularity varies meaningfully across genres, indicating structural
audience differences.

However, genre does not fully explain performance variance, reinforcing
the importance of feature-level analysis.

------------------------------------------------------------------------

# 4️⃣ Hit Probability Lift by Danceability Decile (Core Analysis)

![Hit probability lift by danceability
decile](Tableau/danceability_hit_lift.png)

### Why Lift?

Lift measures relative over- or under-performance:

    Lift = P(hit | bin) / P(hit overall)

Baseline lift = 1.0

-   Lift \> 1 → Over-indexing in hits
-   Lift \< 1 → Under-indexing

------------------------------------------------------------------------

### Results

-   Highest danceability decile:
    -   Hit rate ≈ 5.6%\
    -   Lift ≈ **1.60×**
-   Lowest danceability bins:
    -   Lift \< 0.4

This reveals a **monotonic structural relationship**:

Higher danceability systematically increases breakout probability.

------------------------------------------------------------------------

### Interpretation

This is not a minor correlation effect --- it is a probabilistic
reweighting of success likelihood.

Tracks in the highest danceability decile are approximately **60% more
likely than average to become hits**.

This finding has direct relevance for:

-   Editorial prioritization
-   Discovery ranking signals
-   Promotion candidate selection
-   Feature engineering for recommendation systems

------------------------------------------------------------------------

## Analytical Rigor

-   All aggregations computed in SQL
-   No over-aggregation in Tableau
-   Decile binning performed explicitly
-   Lift computed against true global baseline (3.48%)
-   Clear separation between descriptive and probabilistic metrics



------------------------------------------------------------------------

## Repository Structure

    python/
      data_preprocessing.ipynb

    sql/
      schema_Music_analytics.sql
      queries/
        long_tail.sql
        popularity_vs_features.sql
        genre_popularity.sql
        hit_metrics.sql

    tableau_graphics/
      long_tail_top10.png
      popularity_by_danceability_decile.png
      genre_top30.png
      danceability_hit_lift.png

------------------------------------------------------------------------

## Conclusion

This analysis demonstrates a progression from catalog structure to
breakout probability modeling.

The key takeaway:

> Danceability is not merely correlated with popularity --- it
> materially alters hit probability.

By reframing the problem in probabilistic terms, the project transitions
from exploratory analytics to product-relevant insight generation.

------------------------------------------------------------------------

**Author:** Phillip Olshausen
