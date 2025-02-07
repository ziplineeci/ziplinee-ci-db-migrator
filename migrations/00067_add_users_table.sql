-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_data JSONB,
  inserted_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
CREATE INDEX users_user_data ON users USING GIN (user_data);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS users;