--liquibase formatted sql

--changeset ryneballou:3
CREATE TABLE vehicles (
    vin VARCHAR(17) PRIMARY KEY,
    make VARCHAR(100),
    model VARCHAR(100),
    owner_id UUID REFERENCES parties(party_id)
);