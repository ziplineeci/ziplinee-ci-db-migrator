-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE build_logs (
  id SERIAL PRIMARY KEY,
  repo_full_name VARCHAR(256),
  repo_branch VARCHAR(256),
  repo_revision VARCHAR(256),
  repo_source VARCHAR(256),
  log_text TEXT
);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS build_logs;