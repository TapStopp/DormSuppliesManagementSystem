create database dsms;
use dsms;
create table intExample(
age tinyint,
birth_year smallint,
id_num int Primary Key
);
describe intExample;
insert into intExample
values (21,2004,123456789);
select * from intExample;