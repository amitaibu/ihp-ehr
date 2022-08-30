-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE person_type AS ENUM ('child', 'mother');
CREATE TABLE authorities (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE INDEX authorities_created_at_index ON authorities (created_at);
CREATE TABLE persons (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL
);
