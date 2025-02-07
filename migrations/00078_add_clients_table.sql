-- +goose Up
-- SQL in this section is executed when the migration is applied.
CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  client_data JSONB,
  inserted_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
CREATE INDEX clients_client_data ON clients USING GIN (client_data);

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.
DROP TABLE IF EXISTS clients;