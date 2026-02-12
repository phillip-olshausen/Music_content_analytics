
# Spotify Content Analytics: Hit Probability & Catalog Dynamics

## Overview

This project analyzes structural patterns in a large-scale Spotify track
dataset using PostgreSQL and Tableau.

The objective is not only to describe popularity patterns, but to
identify signals associated with breakout tracks and understand catalog
concentration effects across artists and genres.

The project moves from descriptive analytics to probability-based lift
analysis, reflecting how product and growth teams reason about content
performance.

------------------------------------------------------------------------

## Dataset

-   Source: Public Spotify Tracks Dataset (Kaggle)
-   \~90,000 tracks
-   Features include:
    -   Popularity (0--100)
    -   Audio features (danceability, energy, valence, acousticness,
        tempo, etc.)
    -   Genre
    -   Artist metadata

All preprocessing was performed in Python, with core analysis conducted
in PostgreSQL and visualized in Tableau.

------------------------------------------------------------------------

## Tools & Stack

-   Python (data cleaning / export)
-   PostgreSQL (aggregation, lift computation, binning logic)
-   Tableau (visualization & presentation layer)

------------------------------------------------------------------------

# Analysis Sections

## 1. Long-Tail Distribution of Artist Catalog Size (Top 10)

**Question:** Is catalog representation concentrated among a small
number of artists?

Method: - Count tracks per artist - Compute average popularity per
artist - Select Top 10 artists by catalog size

Insight:

The distribution is heavily skewed. A small number of artists dominate
catalog representation, confirming strong long-tail dynamics.

However, high catalog size does not necessarily imply high average
popularity --- indicating catalog volume and hit probability are
distinct phenomena.

------------------------------------------------------------------------

## 2. Average Track Popularity Across Danceability Deciles

**Question:** How does popularity vary across danceability ranges?

Method: - Bin danceability into deciles - Compute average popularity per
bin

Insight:

Average popularity increases steadily across mid-to-high danceability
ranges, suggesting that more danceable tracks tend to perform better on
average.

However, average popularity alone does not capture breakout probability
--- motivating a deeper probability-based analysis.

------------------------------------------------------------------------

## 3. Average Popularity by Genre (Top 30, min. 100 tracks)

**Question:** Do certain genres systematically outperform others?

Method: - Filter genres with ≥ 100 tracks - Rank Top 30 by average
popularity

Insight:

Popularity varies meaningfully across genres, indicating structural
differences in audience engagement and platform exposure.

Genre alone does not fully explain popularity outcomes, reinforcing the
need for feature-level analysis.

------------------------------------------------------------------------

## 4. Hit Probability Lift by Danceability Decile (Core Analysis)

### Defining a Hit

Hit = Popularity ≥ 70

Overall hit rate: 3.48%

### Method

1.  Bin danceability into 10 equal-width buckets.
2.  Compute:
    -   Hit rate per bin
    -   Lift = (Hit Rate per Bin) / (Overall Hit Rate)

### Key Result

Tracks in the highest danceability decile show:

-   \~5.6% hit rate
-   1.60x lift vs average

This indicates they are 60% more likely than average to become hits.

Conversely, low danceability tracks show extreme under-indexing (lift \<
0.4).

### Interpretation

This is a monotonic structural relationship rather than random noise.

Rather than merely correlating with popularity, danceability
significantly alters breakout probability --- a more decision-relevant
metric for:

-   Editorial curation
-   Discovery algorithms
-   Promotion prioritization
-   Content strategy

------------------------------------------------------------------------

# Why This Project Is Product-Relevant

This project demonstrates:

-   Ability to move beyond descriptive averages
-   Understanding of probability and lift metrics
-   Translation of SQL aggregation into decision-oriented insight
-   Clear separation between correlation and probabilistic over-indexing

It reflects how platform analytics teams evaluate:

-   Feature impact
-   Content distribution dynamics
-   Breakout likelihood rather than mean performance

------------------------------------------------------------------------

# Repository Structure

python/ data_preprocessing.ipynb

sql/ schema.sql hit_probability_analysis.sql genre_analysis.sql
long_tail_analysis.sql

tableau_graphics/ long_tail_top10.png
popularity_by_danceability_decile.png genre_top30.png
danceability_hit_lift.png

------------------------------------------------------------------------

# Conclusion

This project demonstrates a structured progression:

1.  Catalog concentration analysis
2.  Feature-based descriptive analysis
3.  Genre-level structural differences
4.  Probability-based lift modeling

The final lift analysis transforms the project from exploratory
analytics into strategic content evaluation --- aligning closely with
real-world product and growth decision frameworks.
