# Social Media Analytics Project

## Project Overview

This project simulates a social media platform dataset and demonstrates data analysis using SQL.  
The dataset includes tables for users, posts, likes, and comments. The goal is to explore user activity, engagement, and trends using SQL queries.

**Skills demonstrated:**
- SQL queries (JOINs, GROUP BY, HAVING, window functions)
- Aggregations
- Data analysis workflow
- Working with multiple tables and relationships

---

## Dataset

The project contains the following tables:

1. **users** – information about social media users
   - `user_id`
   - `name`
   - `signup_date`
   - `country`

2. **posts** – user posts
   - `post_id` 
   - `user_id` 
   - `category`
   - `post_date`

3. **likes** – likes on posts
   - `like_id`
   - `user_id`
   - `post_id` 
   - `like_date`

4. **comments** – comments on posts
   - `comment_id` 
   - `user_id`
   - `post_id` 
   - `comment_date`

---

## Database Setup

1. Open DataGrip (or your preferred SQL IDE) and connect to a local PostgreSQL database.
2. Create a database:

```sql
CREATE DATABASE social_media;
```

3. Change CSV's paths to you local machine.
