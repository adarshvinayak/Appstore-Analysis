# Unlocking App Store Insights: A Data-Driven Exploration

### About Apple App Store

The Apple App Store is a digital distribution platform developed by Apple Inc. It allows users to browse and download applications (apps) for their iOS devices.

### Dataset

For this project, two datasets were used:

- <a href=https://github.com/adarshvinayak/Appstore-Analysis/blob/main/AppleStore.csv> **AppleStore** </a>: This dataset contains information about various apps available on the Apple App Store, including details such as app name, user ratings, genre, and pricing.

- <a href=https://github.com/adarshvinayak/Appstore-Analysis/blob/main/appleStore_description.zip> **AppleStore_description** </a>: This dataset includes app descriptions, which were combined from multiple sources to enrich the analysis.

### Problem Statement

The objective of this project was to gain insights into app trends and patterns on the Apple App Store. Specifically, the goal was to identify factors affecting app ratings, categorize app genres, and provide recommendations for positioning new apps.

## Process

- **Exploratory Data Analysis (EDA)**: The analysis began with performing EDA to understand the datasets better. Key steps included:
    - Identifying unique apps in both datasets.
    - Checking for missing values in crucial fields.
    - Determining the number of apps per genre.
    - Analyzing app ratings, including minimum, maximum, and average ratings.

- **Data Analysis**: Various analyses were conducted to derive meaningful insights, such as:
    - Comparing ratings between paid and free apps.
    - Investigating the impact of multilingual support on ratings.
    - Identifying genres with lower average ratings.
    - Exploring the relationship between app description length and user ratings.
    - Identifying top-rated apps for each genre.

## Recommendations

- **Paid vs Free Apps**:
  - Paid apps tend to have better ratings, possibly due to increased engagement or perceived value.

- **Language Support**:
  - Apps supporting languages between 10 and 30 tend to receive higher ratings. Targeting the right languages is essential.

- **Low Rated Apps**:
  - Apps in the FINANCE and BOOK genres have lower ratings, possibly due to unmet user needs or lower quality.

- **Description Length**:
  - Longer app descriptions correlate positively with higher ratings. Comprehensive descriptions can help set user expectations.

- **High Competition Genres**:
  - Genres like GAMES and ENTERTAINMENT have the most ratings, indicating high competition.

<a href=https://github.com/adarshvinayak/Appstore-Analysis/blob/main/Apple%20App%20Store%20Analysis.sql> <i> Code </a>
