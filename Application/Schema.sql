-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE categories (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL
);
CREATE TABLE questions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    category_id UUID NOT NULL
);
CREATE INDEX questions_category_id_index ON questions (category_id);
ALTER TABLE questions ADD CONSTRAINT questions_ref_category_id FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE NO ACTION;
