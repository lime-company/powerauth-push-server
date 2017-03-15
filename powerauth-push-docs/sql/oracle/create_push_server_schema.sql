CREATE SEQUENCE PUSH_CREDENTIALS_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PUSH_REGISTRATION_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE PUSH_MESSAGE_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE PUSH_APP_CREDENTIALS
(
    ID NUMBER(19) PRIMARY KEY NOT NULL,
    APP_ID NUMBER(19) NOT NULL,
    IOS_KEY_ID VARCHAR2(255),
    IOS_PRIVATE_KEY BLOB,
    IOS_TEAM_ID VARCHAR2(255),
    IOS_BUNDLE VARCHAR2(255),
    ANDROID_SERVER_KEY VARCHAR2(2048),
    ANDROID_BUNDLE VARCHAR2(255)
);

CREATE TABLE PUSH_DEVICE_REGISTRATION
(
    ID NUMBER(19) PRIMARY KEY NOT NULL,
    ACTIVATION_ID VARCHAR2(37),
    USER_ID VARCHAR2(255),
    APP_ID NUMBER(19) NOT NULL,
    PLATFORM VARCHAR2(255) NOT NULL,
    PUSH_TOKEN VARCHAR2(255) NOT NULL,
    LAST_REGISTERED TIMESTAMP(6) NOT NULL,
    IS_ACTIVE NUMBER(1),
    ENCRYPTION_KEY VARCHAR2(255),
    ENCRYPTION_KEY_INDEX VARCHAR2(255)
);

CREATE TABLE PUSH_MESSAGE
(
    ID NUMBER(19) PRIMARY KEY NOT NULL,
    DEVICE_REGISTRATION_ID NUMBER(19) NOT NULL,
    USER_ID VARCHAR2(255) NOT NULL,
    ACTIVATION_ID VARCHAR2(37),
    SILENT NUMBER(1) NOT NULL,
    PERSONAL NUMBER(1) NOT NULL,
    ENCRYPTED NUMBER(1) NOT NULL,
    MESSAGE_BODY VARCHAR2(2048) NOT NULL,
    TIMESTAMP_CREATED TIMESTAMP(6) NOT NULL,
    STATUS NUMBER(10) NOT NULL
);
