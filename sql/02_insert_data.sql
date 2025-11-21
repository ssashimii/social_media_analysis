COPY users FROM 'data/users.csv' WITH (FORMAT csv, HEADER true);
COPY posts FROM 'data/posts.csv' WITH (FORMAT csv, HEADER true);
COPY likes FROM 'data/likes.csv' WITH (FORMAT csv, HEADER true);
COPY comments FROM 'data/comments.csv' WITH (FORMAT csv, HEADER true);
