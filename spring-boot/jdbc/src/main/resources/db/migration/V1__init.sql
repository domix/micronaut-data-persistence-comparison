CREATE TABLE people
(
    id                  VARCHAR(255) PRIMARY KEY,
    version             BIGINT                   NOT NULL,
    created_at          TIMESTAMP WITH TIME ZONE NULL     DEFAULT now(),
    last_modified_at    TIMESTAMP WITH TIME ZONE NULL     DEFAULT now(),

    username            VARCHAR(255) UNIQUE      NOT NULL,
    email               VARCHAR(255) UNIQUE      NOT NULL,
    password            VARCHAR(255)             NOT NULL,
    first_name          VARCHAR(255)             NOT NULL,
    last_name           VARCHAR(255)             NOT NULL,
    enabled             BOOLEAN                  NOT NULL DEFAULT TRUE,
    account_expired     BOOLEAN                  NOT NULL DEFAULT FALSE,
    credentials_expired BOOLEAN                  NOT NULL DEFAULT FALSE,
    account_locked      BOOLEAN                  NOT NULL DEFAULT FALSE,
    confirmed_account   BOOLEAN                  NOT NULL DEFAULT FALSE,

    created_by          VARCHAR(255)             NULL,
    last_modified_by    VARCHAR(255)             NULL
);

CREATE TABLE user_roles
(
    id               VARCHAR(255) PRIMARY KEY,
    version          BIGINT                   NOT NULL,
    created_at       TIMESTAMP WITH TIME ZONE NULL DEFAULT now(),
    last_modified_at TIMESTAMP WITH TIME ZONE NULL DEFAULT now(),

    name             VARCHAR(255) UNIQUE      NOT NULL,
    description      VARCHAR(255)             NOT NULL,

    person_id        VARCHAR(255)             NOT NULL REFERENCES people (id),

    created_by       VARCHAR(255)             NULL,
    last_modified_by VARCHAR(255)             NULL
);