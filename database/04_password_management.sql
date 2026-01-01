use dsms;

-- Manage Passwords Stored Procedure
DELIMITER //
CREATE PROCEDURE manage_passwords(IN usernameInput varchar(255), IN passwordInput varchar(255), IN newPassword varchar(255))
BEGIN
	DECLARE KnowsOldPassword int;
    
    SELECT COUNT(*) INTO KnowsOldPassword
    FROM student
    WHERE username = usernameInput AND passwd = SHA2(passwordInput, 256);
    
    if KnowsOldPassword > 0 THEN
		UPDATE student 
		SET passwd = SHA2(newPassword, 256) WHERE username = usernameInput;
		SELECT 'Password updated successfully' AS Message;
	else
		SELECT 'Provided password is not valid' AS Message;
	END IF;
END //
DELIMITER ;