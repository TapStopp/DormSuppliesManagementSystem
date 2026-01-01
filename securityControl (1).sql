use dsms;

-- Access Control
CREATE ROLE admin_role;
CREATE ROLE student_role;
CREATE USER 'regular_user'@'localhost' IDENTIFIED BY 'user1';
GRANT student_role TO 'regular_user'@localhost;
CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT admin_role TO 'admin'@'localhost';



-- Inference Control
CREATE VIEW summary_view AS
SELECT
	(SELECT COUNT(*) from student) as num_students,
    (SELECT COUNT(*) from orders) as num_orders,
    (SELECT COUNT(*) from item) as num_items,
    (SELECT COUNT(*) from supplier) as num_suppliers;
GRANT SELECT ON summary_view TO admin_role;
