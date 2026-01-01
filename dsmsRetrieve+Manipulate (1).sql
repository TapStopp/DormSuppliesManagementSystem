use dsms;

insert into student (studentID, firstName, lastName)
values (1, 'John', 'Doe');

insert into studentlist (studentID, listName)
values (79, 'Wishlist');

insert into admin (email)
values ('Cassandra.Dawson1@marist.edu');

insert into item (itemName, quantity)
values ('desk', 'ten');

select * from admin;
select * from adminlog;
select * from dormbuilding;
select * from item;
select * from orders;
select * from payments;
select * from room;
select * from student;
select * from studentlist;
select * from supplier;
select * from supplierlocation;

update item set price = 8.00 where itemID = 6;
insert into student (studentID, firstName, lastName)
values (5, 'John', 'Doe') on duplicate key update firstName = 'John', lastName = 'Doe';
alter table student add column timestamp datetime;
