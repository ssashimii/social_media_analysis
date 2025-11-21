-- Total posts per user
SELECT user_id, COUNT(*) AS total_posts
FROM posts
GROUP BY user_id;

-- Most liked posts
SELECT p.post_id, COUNT(l.like_id) AS likes_count
FROM posts p
JOIN likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY likes_count DESC
LIMIT 10;

-- Example window function
SELECT user_id, post_id, COUNT(*) OVER (PARTITION BY user_id) AS user_post_count
FROM posts;

-- Engagement per user
SELECT
    p.user_id,
    COUNT(DISTINCT l.like_id) AS total_likes_received,
    COUNT(DISTINCT c.comment_id) AS total_comments_received
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.user_id
ORDER BY total_likes_received DESC;


-- Most active users (count of like and comments)
SELECT
    user_id,
    (SELECT COUNT(*) FROM likes WHERE user_id = u.user_id) +
    (SELECT COUNT(*) FROM comments WHERE user_id = u.user_id) AS activity_score
FROM users u
ORDER BY activity_score DESC
LIMIT 10;

-- Engagement per post
SELECT
    p.post_id,
    COALESCE(l.like_count, 0) AS likes,
    COALESCE(c.comment_count, 0) AS comments,
    (COALESCE(l.like_count, 0) + COALESCE(c.comment_count, 0)) AS engagement_score
FROM posts p
LEFT JOIN (
    SELECT post_id, COUNT(*) AS like_count
    FROM likes
    GROUP BY post_id
) l ON p.post_id = l.post_id
LEFT JOIN (
    SELECT post_id, COUNT(*) AS comment_count
    FROM comments
    GROUP BY post_id
) c ON p.post_id = c.post_id;

-- Correlation: activity and likes
WITH user_posts AS (
    SELECT user_id, COUNT(*) AS posts_count
    FROM posts
    GROUP BY user_id
),
user_likes AS (
    SELECT p.user_id, COUNT(l.like_id) AS likes_received
    FROM posts p
    LEFT JOIN likes l ON p.post_id = l.post_id
    GROUP BY p.user_id
)
SELECT
    u.user_id,
    u.posts_count,
    ul.likes_received
FROM user_posts u
JOIN user_likes ul ON u.user_id = ul.user_id
ORDER BY likes_received DESC;

-- Posts without engagement
SELECT p.post_id, p.user_id
FROM posts p
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
WHERE l.like_id IS NULL AND c.comment_id IS NULL;


-- Analysis: who likes whose posts
SELECT
    l.user_id AS liker,
    p.user_id AS post_owner,
    COUNT(*) AS interactions
FROM likes l
JOIN posts p ON l.post_id = p.post_id
GROUP BY liker, post_owner
ORDER BY interactions DESC;
