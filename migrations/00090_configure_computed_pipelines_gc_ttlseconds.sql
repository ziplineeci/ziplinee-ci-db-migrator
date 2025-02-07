-- +goose Up
-- SQL in this section is executed when the migration is applied.
-- ALTER TABLE computed_pipelines CONFIGURE ZONE USING gc.ttlseconds = 3600;
SELECT id FROM builds LIMIT 1;

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
-- ALTER TABLE computed_pipelines CONFIGURE ZONE USING gc.ttlseconds = 90000;
SELECT id FROM builds LIMIT 1;