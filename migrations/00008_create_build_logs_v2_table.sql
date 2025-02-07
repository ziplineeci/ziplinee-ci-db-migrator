-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE build_logs_v2 (
  id SERIAL PRIMARY KEY,
  repo_source VARCHAR(256),
  repo_owner VARCHAR(256),
  repo_name VARCHAR(256),
  repo_branch VARCHAR(256),
  repo_revision VARCHAR(256),
  steps JSONB,
  inserted_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
CREATE UNIQUE INDEX build_logs_v2_repo_source_repo_owner_repo_name_repo_revision_idx ON build_logs_v2 (repo_source, repo_owner, repo_name, repo_revision);
CREATE INDEX build_logs_v2_steps ON build_logs_v2 USING GIN (steps);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS builds_logs_v2;