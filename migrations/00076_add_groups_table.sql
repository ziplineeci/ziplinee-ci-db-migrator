-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  group_data JSONB,
  inserted_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
CREATE INDEX groups_group_data ON groups USING GIN (group_data);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS groups;