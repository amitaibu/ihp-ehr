CREATE TABLE observation_devices (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    name TEXT NOT NULL
);
CREATE INDEX observation_devices_created_at_index ON observation_devices (created_at);
