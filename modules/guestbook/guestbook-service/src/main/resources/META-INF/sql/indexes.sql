create index IX_AFAAB241 on FOO_Entry (groupId, guestbookId);
create index IX_716DE133 on FOO_Entry (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_33531875 on FOO_Entry (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_CFFD06FF on FOO_Foo (field2);
create index IX_B2FCA947 on FOO_Foo (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_905CD589 on FOO_Foo (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_A159025C on FOO_Guestbook (groupId);
create index IX_4D663C82 on FOO_Guestbook (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_E4F7FB84 on FOO_Guestbook (uuid_[$COLUMN_LENGTH:75$], groupId);