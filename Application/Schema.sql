-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE adult_relation_to_child AS ENUM ('mother', 'father', 'chaperon');
CREATE TABLE authorities (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
CREATE INDEX authorities_created_at_index ON authorities (created_at);
CREATE TABLE person_child (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    date_of_birth DATE NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL
);
CREATE TABLE observation_child_height (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    person_child_id UUID NOT NULL
);
CREATE INDEX observation_child_height_created_at_index ON observation_child_height (created_at);
CREATE TABLE person_adult (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);
CREATE INDEX observation_child_height_person_child_id_index ON observation_child_height (person_child_id);
CREATE TABLE relation_person_child_person_adult (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    person_child_id UUID NOT NULL,
    person_adult_id UUID NOT NULL,
    adult_relation_to_child adult_relation_to_child NOT NULL
);
CREATE INDEX relation_person_child_person_adult_created_at_index ON relation_person_child_person_adult (created_at);
CREATE INDEX relation_person_child_person_adult_person_child_id_index ON relation_person_child_person_adult (person_child_id);
CREATE INDEX relation_person_child_person_adult_person_adult_id_index ON relation_person_child_person_adult (person_adult_id);
ALTER TABLE observation_child_height ADD CONSTRAINT observation_child_height_ref_person_child_id FOREIGN KEY (person_child_id) REFERENCES person_child (id) ON DELETE NO ACTION;
ALTER TABLE relation_person_child_person_adult ADD CONSTRAINT relation_person_child_person_adult_ref_person_adult_id FOREIGN KEY (person_adult_id) REFERENCES person_adult (id) ON DELETE NO ACTION;
ALTER TABLE relation_person_child_person_adult ADD CONSTRAINT relation_person_child_person_adult_ref_person_child_id FOREIGN KEY (person_child_id) REFERENCES person_child (id) ON DELETE NO ACTION;
