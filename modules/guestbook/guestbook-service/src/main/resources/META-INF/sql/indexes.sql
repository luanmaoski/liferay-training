create index IX_AFAAB241 on FOO_Entry (groupId, guestbookId);
create index IX_F15A671 on FOO_Entry (groupId, status);
create index IX_A7A4D0E5 on FOO_Entry (status);
create index IX_716DE133 on FOO_Entry (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_33531875 on FOO_Entry (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_CFFD06FF on FOO_Foo (field2);
create index IX_B2FCA947 on FOO_Foo (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_905CD589 on FOO_Foo (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_920D2542 on FOO_Guestbook (groupId, status);
create index IX_DAC932F4 on FOO_Guestbook (status);
create index IX_4D663C82 on FOO_Guestbook (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_E4F7FB84 on FOO_Guestbook (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_F5591FB6 on GB_Entry (groupId, guestbookId);
create index IX_B5EF5128 on GB_Entry (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_C1EA01AA on GB_Entry (uuid_[$COLUMN_LENGTH:75$], groupId);

create index IX_9294AD47 on GB_Guestbook (groupId);
create index IX_9314A9F7 on GB_Guestbook (uuid_[$COLUMN_LENGTH:75$], companyId);
create unique index IX_EDD4239 on GB_Guestbook (uuid_[$COLUMN_LENGTH:75$], groupId);