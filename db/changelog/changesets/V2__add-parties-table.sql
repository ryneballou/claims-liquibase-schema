--liquibase formatted sql

--changeset ryneballou:2
CREATE TABLE parties (
    party_id UUID PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    type VARCHAR(20) CHECK (type IN ('claimant', 'insurer', 'witness'))
);