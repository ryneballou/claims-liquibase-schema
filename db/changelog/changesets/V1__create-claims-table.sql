--liquibase formatted sql

--changeset ryneballou:1
CREATE TABLE claims (
    claim_id UUID PRIMARY KEY,
    status VARCHAR(20) NOT NULL CHECK (status IN ('new', 'assigned', 'closed')),
    date_reported TIMESTAMP NOT NULL
);