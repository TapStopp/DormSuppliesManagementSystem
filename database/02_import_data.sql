set foreign_key_checks=0;
use dsms;
show tables;

insert into admin (username, passwd, firstName, lastName, email)
values ('casdaw', 'root1', 'Cassandra', 'Dawson', 'Cassandra.Dawson1@marist.edu'),
('colboy', 'root2', 'Colin', 'Boykin', 'Colin.Boykin1@marist.edu'),
('prisat', 'root3', 'Prisha', 'Satish', 'Prisha.Satish1@marist.edu'),
('rezasadeghi', 'root4', 'Reza', 'Sadeghi', 'reza.sadeghi@marist.edu'),
('japple', 'root5', 'Johnny', 'Appleseed', 'johnny.appleseed1@marist.edu');

insert into student (username, passwd, firstName, lastName, classification)
values ('megcon', 'student', 'Megan', 'Connor', 'senior'),
('siemas', 'student', 'Sierra', 'Mason', 'senior'),
('kyltoo', 'student', 'Kylie', 'Toomes', 'junior'),
('gabgan', 'student', 'Gabby', 'Ganoe', 'senior'),
('samgug', 'student', 'Sam', 'Guggino', 'senior');

insert into item (itemName, category, price, quantity)
values ('microwave', 'kitchen', 50.00, 30),
('mini fridge', 'kitchen', 100.00, 20),
('keurig', 'kitchen', 50.00, 10),
('desk lamp', 'bed', 25.00, 20),
('desk organizer', 'bed', 10.00, 100),
('shower curtain', 'bath', 7.00, 50),
('bath mat', 'bath', 15.55, 21),
('blanket', 'bed', 13.99, 30),
('bed sheets', 'bed', 21.49, 50),
('duvet', 'bed', 28.69, 35),
('tv', 'bed', 79.99, 22);

insert into dormbuilding (dormName, location, numRooms, roomType, capacity)
values ('Lavelle', 'NorthEnd', 64, 'single', 256),
('Ward', 'NorthEnd', 100, 'single', 400),
('Upper Fulton', 'Fulton', 16, 'single', 128),
('Midrise', 'Student Center', 60, 'double', 360),
('Marion', 'Marion', 30, 'triple', 90);

insert into room (dormName, roomNum, roomType, numStudents, hasKitchen, hasBathroom)
values ('Lavelle', 3015, 'suite', 4, true, true),
('Ward', 2005, 'suite', 4, true, true),
('Upper Fulton', '06F', 'townhouse', 8, true, true),
('Midrise', 305, 'suite', 6, false, true),
('Marion', 10, 'traditional', 3, false, false);

insert into supplier (supplierName)
values ('Target'), ('Amazon'), ('Walmart'), ('DormCo'), ('Pottery Barn');

insert into supplierlocation (supplierID, location)
values (1, 'Poughkeepsie, NY'),
(1, 'Newburgh, NY'),
(3, 'Fishkill, NY'),
(3, 'Newburgh, NY'),
(5, 'Danbury, CT');

insert into studentlist (studentID, listName, dateCreated, lastUpdated)
values (1, 'Wishlist', '2025-08-22', '2025-09-22'),
(2, 'My List', '2025-09-21', '2025-09-22'),
(3, 'Supplies', '2025-09-20', '2025-09-22'),
(4, 'Dorm Wishlist', '2025-09-21', '2025-09-22'),
(5, 'Dorm Supplies', '2025-09-20', '2025-09-22');

insert into orders (orderDate, orderStatus, studentID, supplierID)
values ('2025-09-20', 'completed', 1, 2),
('2025-09-22', 'pending', 2, 1),
('2025-09-22', 'pending', 2, 5),
('2025-09-21', 'cancelled', 1, 1),
('2025-09-22', 'pending', 3, 4);

insert into payments (orderID, amount, paymentMethod, paymentStatus)
values (1, 35.65, 'credit', 'completed'),
(2, 20.97, 'credit', 'pending'),
(3, 107.39, 'credit', 'completed'),
(4, 23.45, 'debit', 'failed'),
(5, 49.36, 'credit', 'pending');

insert into adminlog (adminID, action, timestamp, IP_Address)
values (1, 'insert into item', '2025-09-22 17:42:33', '123.123.123.123');

set foreign_key_checks=1;