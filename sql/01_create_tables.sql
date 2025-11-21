CREATE TABLE users (
  user_id INTEGER PRIMARY KEY,
  name TEXT,
  signup_date DATE,
  country TEXT
);

CREATE TABLE posts (
  post_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  post_date DATE,
  category TEXT,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE likes (
  like_id INTEGER PRIMARY KEY,
  post_id INTEGER,
  user_id INTEGER,
  like_date DATE,
  FOREIGN KEY (post_id) REFERENCES posts(post_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
  comment_id INTEGER PRIMARY KEY,
  post_id INTEGER,
  user_id INTEGER,
  comment_date DATE,
  FOREIGN KEY (post_id) REFERENCES posts(post_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);






