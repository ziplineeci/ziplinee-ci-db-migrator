-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE computed_pipelines (
	id SERIAL PRIMARY KEY,
	pipeline_id INT,
	repo_source VARCHAR(256),
	repo_owner VARCHAR(256),
	repo_name VARCHAR(256),
	repo_branch VARCHAR(256),
	repo_revision VARCHAR(256),
	build_version VARCHAR(256),
	build_status VARCHAR(256),
	labels JSONB,
	manifest TEXT,
	inserted_at TIMESTAMPTZ DEFAULT now(),
	updated_at TIMESTAMPTZ DEFAULT now(),
	commits JSONB,
	duration INTERVAL DEFAULT '0s',
	release_targets JSONB
);
CREATE INDEX computed_pipelines_build_status_idx ON computed_pipelines (build_status ASC);
CREATE INDEX computed_pipelines_inserted_at_idx ON computed_pipelines (inserted_at ASC);
CREATE INDEX computed_pipelines_pipeline_id_idx ON computed_pipelines (pipeline_id ASC);
CREATE UNIQUE INDEX computed_pipelines_order_by_idx ON computed_pipelines (repo_source ASC, repo_owner ASC, repo_name ASC);
CREATE INDEX computed_pipelines_labels_idx ON computed_pipelines USING GIN (labels);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS computed_pipelines;
