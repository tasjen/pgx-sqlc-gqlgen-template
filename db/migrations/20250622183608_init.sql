-- +goose Up
CREATE TABLE users (
  id UUID NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE todos (
  id UUID NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  done BOOLEAN NOT NULL DEFAULT FALSE,
  user_id UUID REFERENCES users (id) ON DELETE CASCADE
);

-- +goose Down
DROP TABLE todos, users;
