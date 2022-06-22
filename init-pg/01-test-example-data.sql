CREATE TABLE example.english (
    id character varying(40) NOT NULL,
    value character varying(100) NOT NULL
);
ALTER TABLE ONLY example.english
    ADD CONSTRAINT pk_english PRIMARY KEY (id);

CREATE TABLE example.french (
    id character varying(40) NOT NULL,
    value character varying(100) NOT NULL
);
ALTER TABLE ONLY example.french
    ADD CONSTRAINT pk_french PRIMARY KEY (id);
ALTER TABLE ONLY example.french
    ADD CONSTRAINT fk_french_english_id FOREIGN KEY (id) REFERENCES example.english(id);

SET SCHEMA 'example';

INSERT INTO english (id, value) VALUES ('1', 'one');
INSERT INTO english (id, value) VALUES ('2', 'two');
INSERT INTO english (id, value) VALUES ('3', 'three');

INSERT INTO french (id, value) VALUES ('1', 'un');
INSERT INTO french (id, value) VALUES ('2', 'deux');
INSERT INTO french (id, value) VALUES ('3', 'trois');
