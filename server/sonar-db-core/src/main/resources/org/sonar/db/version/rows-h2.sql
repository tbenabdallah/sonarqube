INSERT INTO USERS(ID, LOGIN, NAME, EMAIL, EXTERNAL_IDENTITY, EXTERNAL_IDENTITY_PROVIDER, USER_LOCAL, CRYPTED_PASSWORD, SALT, HASH_METHOD, IS_ROOT, ONBOARDED, CREATED_AT, UPDATED_AT) VALUES (1, 'admin', 'Administrator', '', 'admin', 'sonarqube', true, '$2a$12$uCkkXmhW5ThVK8mpBvnXOOJRLd64LJeHTeCkSuB3lfaR2N0AYBaSi', null, 'BCRYPT', false, false, '1418215735482', '1418215735482');
ALTER TABLE USERS ALTER COLUMN ID RESTART WITH 2;

INSERT INTO GROUPS(ID, ORGANIZATION_UUID, NAME, DESCRIPTION, CREATED_AT, UPDATED_AT) VALUES (1, 'AVdqnciQUUs7Zd3KPvFD', 'sonar-administrators', 'System administrators', '2011-09-26 22:27:51.0', '2011-09-26 22:27:51.0');
INSERT INTO GROUPS(ID, ORGANIZATION_UUID, NAME, DESCRIPTION, CREATED_AT, UPDATED_AT) VALUES (2, 'AVdqnciQUUs7Zd3KPvFD', 'sonar-users', 'Any new users created will automatically join this group', '2011-09-26 22:27:51.0', '2011-09-26 22:27:51.0');
ALTER TABLE GROUPS ALTER COLUMN ID RESTART WITH 3;

INSERT INTO QUALITY_GATES(ID, UUID, NAME, IS_BUILT_IN, CREATED_AT, UPDATED_AT) VALUES (1, 'AWASGWAKYOI_InFKS3UF', 'Sonar way', true, '2011-09-26 22:27:51.0', '2011-09-26 22:27:51.0');

INSERT INTO ORGANIZATIONS (UUID, KEE, NAME, GUARDED, NEW_PROJECT_PRIVATE, DEFAULT_GROUP_ID, DEFAULT_QUALITY_GATE_UUID, CREATED_AT, UPDATED_AT) VALUES ('AVdqnciQUUs7Zd3KPvFD', 'default-organization', 'Default Organization', true, false, 2, 'AWASGWAKYOI_InFKS3UF', '1474962596482', '1474962596482');
INSERT INTO ORG_QUALITY_GATES (UUID, ORGANIZATION_UUID, QUALITY_GATE_UUID) VALUES ('AWAwlGzz-5zzlJtFU9G5', 'AVdqnciQUUs7Zd3KPvFD', 'AWASGWAKYOI_InFKS3UF');

INSERT INTO INTERNAL_PROPERTIES (KEE, IS_EMPTY, TEXT_VALUE, CREATED_AT) VALUES ('organization.default', false, 'AVdqnciQUUs7Zd3KPvFD', '1474962596482');

INSERT INTO GROUP_ROLES(ID, ORGANIZATION_UUID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (1, 'AVdqnciQUUs7Zd3KPvFD', 1, null, 'admin');
INSERT INTO GROUP_ROLES(ID, ORGANIZATION_UUID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (2, 'AVdqnciQUUs7Zd3KPvFD', 1, null, 'profileadmin');
INSERT INTO GROUP_ROLES(ID, ORGANIZATION_UUID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (3, 'AVdqnciQUUs7Zd3KPvFD', 1, null, 'gateadmin');
INSERT INTO GROUP_ROLES(ID, ORGANIZATION_UUID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (4, 'AVdqnciQUUs7Zd3KPvFD', null, null, 'scan');
INSERT INTO GROUP_ROLES(ID, ORGANIZATION_UUID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (5, 'AVdqnciQUUs7Zd3KPvFD', null, null, 'provisioning');
INSERT INTO GROUP_ROLES(ID, ORGANIZATION_UUID, GROUP_ID, RESOURCE_ID, ROLE) VALUES (6, 'AVdqnciQUUs7Zd3KPvFD', 1, null, 'provisioning');
ALTER TABLE GROUP_ROLES ALTER COLUMN ID RESTART WITH 7;

INSERT INTO GROUPS_USERS(USER_ID, GROUP_ID) VALUES (1, 1);
INSERT INTO GROUPS_USERS(USER_ID, GROUP_ID) VALUES (1, 2);

INSERT INTO ORGANIZATION_MEMBERS(ORGANIZATION_UUID, USER_ID) VALUES ('AVdqnciQUUs7Zd3KPvFD', 1);
