-- +goose Up
-- SQL in this section is executed when the migration is applied.
DROP TABLE IF EXISTS github_push_events;

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
